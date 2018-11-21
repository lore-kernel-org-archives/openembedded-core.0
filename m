Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 3E9F060234
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2018 10:35:17 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wALAZGEB005896
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Wed, 21 Nov 2018 10:35:17 GMT
Message-ID: <5d065b2ee6f9f619ae3537eb58e5e18117fefd0a.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>, openembedded-core@lists.openembedded.org
Date: Wed, 21 Nov 2018 10:35:16 +0000
In-Reply-To: <1a6d8097cc8ed3b4a8916632e247f79d2d6689d9.camel@linuxfoundation.org>
References: <20181119172726.23571-1-raj.khem@gmail.com>
	<1a6d8097cc8ed3b4a8916632e247f79d2d6689d9.camel@linuxfoundation.org>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH] musl: Update to latest trunk
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2018 10:35:18 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Wed, 2018-11-21 at 09:32 +0000, Richard Purdie wrote:
> On Mon, 2018-11-19 at 09:27 -0800, Khem Raj wrote:
> > Complete changelogs are here
> > 
> 
> 
https://git.musl-libc.org/cgit/musl/log/?qt=range&q=c50985d5c8e316c5c464f352e79eeebfed1121a9..79f653c6bc2881dd6855299c908a442f56cb7c2b
> > 
> > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > ---
> >  meta/recipes-core/musl/musl_git.bb | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> This seemed to have a segfault in exportfs:
> 
> 
https://autobuilder.yoctoproject.org/typhoon/#/builders/27/builds/231/steps/7/logs/step1c
> 
> Will rerun and see if it reproduces...

It reproduces:


https://autobuilder.yoctoproject.org/typhoon/#/builders/27/builds/232/steps/7/logs/step1c

(which is good and bad!)

Cheers,

Richard


