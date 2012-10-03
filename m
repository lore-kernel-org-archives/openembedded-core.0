Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1TJMhn-0005c7-K6 for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 13:01:31 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q93AmU2j026617;
	Wed, 3 Oct 2012 11:48:30 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 25642-06; Wed,  3 Oct 2012 11:48:26 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id q93AmKde026611
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=NO);
	Wed, 3 Oct 2012 11:48:21 +0100
Message-ID: <1349261304.18301.24.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 03 Oct 2012 11:48:24 +0100
In-Reply-To: <CAJTo0LYh7yqpN5gyfvfpNxoBVOP_jG0cjm8UHcYRT874=8B7yg@mail.gmail.com>
References: <1349086731-2818-1-git-send-email-ross.burton@intel.com>
	<1349255253.18301.23.camel@ted>
	<CAJTo0LbGDt_dKSgL+Ms0M9QAB7d+nBVCuV0-WuNKuGDy-t19fQ@mail.gmail.com>
	<CAJTo0LYh7yqpN5gyfvfpNxoBVOP_jG0cjm8UHcYRT874=8B7yg@mail.gmail.com>
X-Mailer: Evolution 3.2.3-0ubuntu6 
Mime-Version: 1.0
X-Virus-Scanned: amavisd-new at rpsys.net
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xf86-video-intel: drop libxvmc dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 11:01:31 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2012-10-03 at 10:57 +0100, Burton, Ross wrote:
> On 3 October 2012 10:39, Burton, Ross <ross.burton@intel.com> wrote:
> > On 3 October 2012 10:07, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> >> On Mon, 2012-10-01 at 11:18 +0100, Ross Burton wrote:
> >>> xvmc is explicitly disabled, so remove the dependency.
> >>
> >> and also add some new dependencies. I'm left wondering if that was
> >> intentional?
> >
> > No, that's fallout from cherry-picking.  I'll re-send.
> 
> Actually I mis-read the diff - there is no delta apart from the removal of xvmc.

Sorry, yes, I'm misreading it :/

My other question was whether we need any m4 macros from xvmc to
reautoconf it?

Cheers,

Richard



