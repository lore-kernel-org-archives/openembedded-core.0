Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1R0fBk-0002sD-VG for openembedded-core@lists.openembedded.org;
	Mon, 05 Sep 2011 21:50:37 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85Jjaex001166;
	Mon, 5 Sep 2011 20:45:36 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 00973-05; Mon,  5 Sep 2011 20:45:32 +0100 (BST)
Received: from [192.168.1.40] (dynamic10.rpnet.com [192.168.1.40])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p85JjVpS001159
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 5 Sep 2011 20:45:31 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Gary Thomas <gary@mlbassoc.com>
In-Reply-To: <4E4BE1DA.1030109@mlbassoc.com>
References: <1312912632.14274.312.camel@rex>
	<C10D3FB0CD45994C8A51FEC1227CE22F2FA76750B1@shsmsx502.ccr.corp.intel.com>
	<27DA7A3C-0FE9-43CA-963C-F6217A1D2C9F@kernel.crashing.org>
	<1312981676.14274.376.camel@rex> <1312982631.14274.379.camel@rex>
	<4E4288F0.2010904@mlbassoc.com> <1312983621.14274.383.camel@rex>
	<4E428C20.5030809@mlbassoc.com>  <4E4BE1DA.1030109@mlbassoc.com>
Date: Mon, 05 Sep 2011 20:45:30 +0100
Message-ID: <1315251930.1243.20.camel@ted>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: populate_sdk: We need to ensure that the SDK sysroot reflects PACKAGE_ARCH
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
X-List-Received-Date: Mon, 05 Sep 2011 19:50:37 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2011-08-17 at 09:44 -0600, Gary Thomas wrote:
> On 2011-08-10 07:48, Gary Thomas wrote:
> > On 2011-08-10 07:40, Richard Purdie wrote:
> >> On Wed, 2011-08-10 at 07:34 -0600, Gary Thomas wrote:
> >>> On a related thought to these changes - how does this play if
> >>> you use multiple SDKs for different, but somewhat related, architectures?
> >>> I'd like to create a simple SDK (just toolchain mostly) using 'meta-toolchain'
> >>> for both armv5te and armv7a and install them simultaneously on the same
> >>> host. My previous attempts at this fell flat as there were a number of
> >>> files marked as "arm" (i.e. not armv5te or arvm7a) that were common between
> >>> the two SDK packages, but they didn't seem to be identical.
> >>
> >> This is supposed to work but wouldn't due to the issue and the patch
> >> I've proposed. Whether that is the only issue I don't know.
> >
> > I'll be glad to test this once you've worked it out.
> 
> Any progress on this yet?  The discussion seems to have died down...

I merged the patch in question so I'm open to feedback on whether this
works better now...

Cheers,

Richard





