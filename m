Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QNYgF-0000uW-O0 for openembedded-core@lists.openembedded.org;
	Sat, 21 May 2011 01:00:27 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KMvVWN030461
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 23:57:31 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 29888-09 for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 23:57:27 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p4KMvNIn030455
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 23:57:24 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <BANLkTi=rbaGo8DX1CzDmKfgWWsRd=gkm3Q@mail.gmail.com>
References: <cover.1305848960.git.raj.khem@gmail.com>
	<0a1ad440f372eec668b742c775188249c9609f11.1305848960.git.raj.khem@gmail.com>
	<1305892146.3424.595.camel@rex>
	<BANLkTi=rbaGo8DX1CzDmKfgWWsRd=gkm3Q@mail.gmail.com>
Date: Fri, 20 May 2011 23:57:16 +0100
Message-ID: <1305932236.3424.676.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [PATCHv2 1/2] opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
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
X-List-Received-Date: Fri, 20 May 2011 23:00:28 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2011-05-20 at 11:28 -0700, Khem Raj wrote:
> On Fri, May 20, 2011 at 4:49 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
> >
> > This needs to be $D, I didn't miss the brackets in my previous email :)
> >
> >
> 
> but that wont be relative right ? it will encode current builddir into
> sstate isnt it ?

No, that is what the ${D} you used will do.

$D gets set when we run the postinstall to the path to the rootfs (see
the rootfs bbclass files). We use $D deliberately so bitbake doesn't
expand it (as used elsewhere in postinstalls).

Cheers,

Richard





