Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1SqkG2-0008Kx-DP for openembedded-core@lists.openembedded.org;
	Mon, 16 Jul 2012 14:18:34 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6GC7E3K031377;
	Mon, 16 Jul 2012 13:07:14 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 30472-06; Mon, 16 Jul 2012 13:07:09 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q6GC73Vf031365
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Mon, 16 Jul 2012 13:07:04 +0100
Message-ID: <1342440426.5019.18.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Mon, 16 Jul 2012 13:07:06 +0100
In-Reply-To: <DF70393F-E648-48B8-98DA-ECFFDF724666@dominion.thruhere.net>
References: <1342259955-8875-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0Laa4jNytbBv1ozJWE9kf=-4hSE4_gsZN+VA2N5C1MJVeQ@mail.gmail.com>
	<8F9AE1A6-06B6-432B-B336-B8F72D3C2697@dominion.thruhere.net>
	<5766114.d2laZrfaXp@helios>
	<DF70393F-E648-48B8-98DA-ECFFDF724666@dominion.thruhere.net>
X-Mailer: Evolution 3.2.2- 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] powertop: update to 2.0+git
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
X-List-Received-Date: Mon, 16 Jul 2012 12:18:34 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2012-07-16 at 13:25 +0200, Koen Kooi wrote:
> Op 16 jul. 2012, om 12:36 heeft Paul Eggleton het volgende geschreven:
> 
> > On Monday 16 July 2012 12:33:00 Koen Kooi wrote:
> >> Op 16 jul. 2012, om 10:47 heeft Burton, Ross het volgende geschreven:
> >>> On 16 July 2012 07:11, Koen Kooi <koen@dominion.thruhere.net> wrote:
> >>>>> Please add proper Upstream-Status for the patches; it is nice to have
> >>>>> those to track the pending patches.
> >>>> 
> >>>> Isn't that field only used to put in "pending" and then backslap each
> >>>> other on doing such a good job?> 
> >>> Personally I find it incredibly useful to differentiate between
> >>> patches that should be going upstream and patches that are OE-specific
> >>> for various reasons.
> >> 
> >> I'm not debating the usefulness of the U-S field, I'm debating the
> >> usefulness of using 'Pending' as a catch-all. I can do:
> >> 
> >> for patch in *.patch ; do
> >> 	echo "Upstream-Status: Pending" >> $patch
> >> done
> >> 
> >> And it will get accepted, but is ultimately useless.
> > 
> > No, it is not. It signifies that the patch is considered appropriate by the 
> > submitter for upstreaming.
> 
> That's not true according to http://wiki.openembedded.org/index.php/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations :
> 
>   Pending
>   - No determination has been made yet or not yet submitted to upstream
> 
> I've argued before that 'Pending' should be renamed to 'Unknown' (as we already do in the meta-openembedded layers) to avoid exactly this confusion.

I think when this was originally discussed "Pending" was taken to mean
that it had not been submitted upstream but probably could be which ties
in with Paul's view of this too. When it was documented, it looks like
the meaning got changed slightly.

The idea was the totally inappropriate ones had been filtered out and we
could generate a list of patches where attention could be focused with
reference to upstreaming. This is different to "Unknown".

I'd therefore suggest we update the meaning of Pending in the
documentation.

Cheers,

Richard





