Return-Path: <ed.bartosh@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id E5BDA6093E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Oct 2016 10:42:02 +0000 (UTC)
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga101.jf.intel.com with ESMTP; 03 Oct 2016 03:42:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.31,289,1473145200"; d="scan'208";a="768322543"
Received: from linux.intel.com ([10.54.29.200])
	by FMSMGA003.fm.intel.com with ESMTP; 03 Oct 2016 03:42:03 -0700
Received: from linux.intel.com (vmed.fi.intel.com [10.237.72.68])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by linux.intel.com (Postfix) with ESMTP id 4324B6A4080;
	Mon,  3 Oct 2016 03:41:33 -0700 (PDT)
Date: Mon, 3 Oct 2016 13:31:08 +0300
From: Ed Bartosh <ed.bartosh@linux.intel.com>
To: Ulf Magnusson <ulfalizer@gmail.com>
Message-ID: <20161003103108.GA5762@linux.intel.com>
Reply-To: ed.bartosh@linux.intel.com
References: <CABcZAN=WpicbLyg-sc=GDiMS81iwsGe1m+NE-fUfw2tniWpWXA@mail.gmail.com>
	<1475247756-32008-1-git-send-email-ed.bartosh@linux.intel.com>
	<a1d1262b-1ecf-933a-f3b6-01234c95c31e@smile.fr>
	<CAFkk2KR5AB_gjq5XKFBJjOaaRHJ3DzJdCqS5H1Kq=m35xZ3jTQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAFkk2KR5AB_gjq5XKFBJjOaaRHJ3DzJdCqS5H1Kq=m35xZ3jTQ@mail.gmail.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] scripts: add new script 'native'
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
X-List-Received-Date: Mon, 03 Oct 2016 10:42:03 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Oct 02, 2016 at 04:30:58PM +0200, Ulf Magnusson wrote:
> On Sun, Oct 2, 2016 at 4:15 PM, Jérémy Rosen <jeremy.rosen@smile.fr> wrote:
> > "native" might be a bit too generic...
> >
> > could I suggest oe_native-run or bitbake-native ?
> >
> > something that says it's yocto-galaxy specific and can be autocompleted with
> > a reasonable prefix...
> >
> >
> > Jérémy Rosen
> 
> I think overly namespacing things that aren't likely to clash in
> practice gets annoying. I would've gone for "run-native" (more
> descriptive and English-like, less generic), but how about something
> simple and easy to type like "oe-native" or "oe-run-native" if a
> prefix is added? That's consistent with the naming scheme used for
> many other scripts in scripts/ too.
> 

I'm ok to rename it. I agree that 'native' may look too generic, but
I don't know about any existing tool with this name.

Anyway, let me know which name I should rename it to. Feel free to send a
patch too. I personally like 'oe-native' more than other proposals.

--
Regards,
Ed

