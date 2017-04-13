Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id D748F77E02
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Apr 2017 16:23:15 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	v3DGNBSW031551
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 13 Apr 2017 17:23:12 +0100
Message-ID: <1492100590.19076.5.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: "Burton, Ross" <ross.burton@intel.com>, Rebecca Chang Swee Fun
	<rebecca.swee.fun.chang@intel.com>
Date: Thu, 13 Apr 2017 17:23:10 +0100
In-Reply-To: <CAJTo0LYjwh8KD-h+gXpVkqm4utT6i2_TBZdEaTCeLF5xN_cm3Q@mail.gmail.com>
References: <1492074678-128188-1-git-send-email-rebecca.swee.fun.chang@intel.com>
	<CAJTo0LYjwh8KD-h+gXpVkqm4utT6i2_TBZdEaTCeLF5xN_cm3Q@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.1 
Mime-Version: 1.0
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.11
	(dan.rpsys.net [192.168.3.1]);
	Thu, 13 Apr 2017 17:23:12 +0100 (BST)
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ghostscript: separate objarch.h based on architecture
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
X-List-Received-Date: Thu, 13 Apr 2017 16:23:16 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-04-13 at 15:06 +0100, Burton, Ross wrote:
> 
> On 13 April 2017 at 10:11, Rebecca Chang Swee Fun <rebecca.swee.fun.c
> hang@intel.com> wrote:
> > +ARCHFILE ?= ""
> > +
> > +ARCHFILE_aarch64 = "file://objarch.h"
> > +
> > +ARCHFILE_arm = "file://objarch.h"
> > +
> > +ARCHFILE_armeb = "file://objarch.h"
> > +
> > +ARCHFILE_i586 = "file://objarch.h"
> > +
> > +ARCHFILE_i686 = "file://objarch.h"
> > +
> > +ARCHFILE_microblazeeb = "file://objarch.h"
> > +
> > +ARCHFILE_microblazeel = "file://objarch.h"
> > +
> > +ARCHFILE_mipsarchn32eb = "file://objarch.h"
> > +
> > +ARCHFILE_mipsarchn32el = "file://objarch.h"
> > +
> > +ARCHFILE_mipsarchn64eb = "file://objarch.h"
> > +
> > +ARCHFILE_mipsarchn64el = "file://objarch.h"
> > +
> > +ARCHFILE_mipsarcho32eb = "file://objarch.h"
> > +
> > +ARCHFILE_mipsarcho32el = "file://objarch.h"
> > +
> > +ARCHFILE_nios2 = "file://objarch.h"
> > +
> > +ARCHFILE_powerpc = "file://objarch.h"
> > +
> > +ARCHFILE_powerpc64 = "file://objarch.h"
> > +
> > +ARCHFILE_x86-64 = "file://objarch.h"
> > 
> That's a very long list, would it be easier to set it to objarch.h
> and then use select overrides to clear it?

Its basically copying the structure from the disk which we don't want
to do.

I think what this recipe needs to do is raise a SkipRecipe exception if
it not one of the supported architectures. This would then only display
an error if someone specifically tries to build the recipe.

Cheers,

Richard

