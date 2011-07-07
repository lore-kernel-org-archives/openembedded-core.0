Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1Qey2m-0002M2-JL for openembedded-core@lists.openembedded.org;
	Fri, 08 Jul 2011 01:31:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67NRnid011648
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 00:27:49 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 11588-01-2 for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Jul 2011 00:27:38 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p67NLk8R011063
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 8 Jul 2011 00:21:46 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CAMKF1srLZ2XZxss7h_FAy3nkuBY29qL+K_S4nd2a0Ra-mzmyjg@mail.gmail.com>
References: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
	<24e836176430410a91d0c18fcef0854536798766.1310070283.git.nitin.a.kamble@intel.com>
	<1310071349.18564.2.camel@lenovo.internal.reciva.com>
	<CAMKF1srLZ2XZxss7h_FAy3nkuBY29qL+K_S4nd2a0Ra-mzmyjg@mail.gmail.com>
Date: Fri, 08 Jul 2011 00:11:39 +0100
Message-ID: <1310080299.20015.854.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCH 5/7] eglibc: fix installed but not packaged files
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 07 Jul 2011 23:31:40 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2011-07-07 at 14:41 -0700, Khem Raj wrote:
> On Thu, Jul 7, 2011 at 1:42 PM, Phil Blundell <pb@pbcl.net> wrote:
> > On Thu, 2011-07-07 at 13:25 -0700, nitin.a.kamble@intel.com wrote:
> >> -FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
> >> +FILES_${PN} = "${libc_baselibs} ${libexecdir}/* ${sysconfdir}/rpc ${@base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', '', d)}"
> >
> > I don't think we want /etc/rpc in libc6, it's just a waste of space if
> > you aren't using sunrpc.  Nobody has missed it thus far so I would be
> > inclined to delete it, but it could go in a package of its own if there
> > is a feeling that it's valuable.
> 
> Moreover sun rpc is now obsolete in glibc 2.14 onwards so probably
> removing it from package is right thing to do.

We have a line deleting this but the libc-locale split seems to have
wiped out a few packaging fixes including the one that unbreaks it. I
have a local patch pending to fix the deletion of this...

Cheers,

Richard





