Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f180.google.com (mail-ig0-f180.google.com
	[209.85.213.180])
	by mail.openembedded.org (Postfix) with ESMTP id D4E97737F4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 21:41:42 +0000 (UTC)
Received: by igfj19 with SMTP id j19so1233807igf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Aug 2015 14:41:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eJkeUOTY8JAQANbSnFi0GCFzTPL3bNDkFdVBWQ0BadM=;
	b=VUPEQtmYcxvrt2ZkItJ9inB92/K9IbyW6cK/k/OL9C2ENt6An2wLjHCimhYchax2qK
	x4tKTGxTD7k9kLx71YAABK/seyH8AE/qDrAVydjsAkSUfocITp9sp1MZFKLNEWmjByJ8
	6XnXbD5bGBNe4ELEgee8Tr144uFY4A/HbBBQVxMFwg/vrguTgiXtajvkwM0QGxrH7uKT
	qJxFGbh2PsPsFZxOJ9BwOOmCKkc3dw9PovxO380E5GqE0J62skzYu3CofwhD4h6xpkMn
	odL8PTKvtHmT+J0ijwVc0m75M0xQQfxrGrh9z/UHflNEfokLy2H8HrmByKgWJ6gFi0en
	8Idw==
X-Received: by 10.50.93.102 with SMTP id ct6mr165401igb.75.1440106902659; Thu,
	20 Aug 2015 14:41:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.38.79 with HTTP; Thu, 20 Aug 2015 14:41:13 -0700 (PDT)
In-Reply-To: <CAJTo0LZJv5pJv+x46LjMa_NzT3hppzfUewHNBZjPa-i_owDdNQ@mail.gmail.com>
References: <cover.1439471616.git.jussi.kukkonen@intel.com>
	<10269744a7e91ddf317b041f70d5810ae5c94c36.1439471616.git.jussi.kukkonen@intel.com>
	<20150818083635.GE2458@jama>
	<CAHiDW_EKTkPcQ+NVP9AocSfvpusiBtwp25rpkTDr5Zn0Ut=A4Q@mail.gmail.com>
	<tor.121455D5F425.1070308@windriver.com>
	<33006C99F5A5194A9B7A7715DFA3E383DC174C19@ALA-MBB.corp.ad.wrs.com>
	<CAJTo0LZJv5pJv+x46LjMa_NzT3hppzfUewHNBZjPa-i_owDdNQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Aug 2015 14:41:13 -0700
Message-ID: <CAMKF1sonYtB4VySwxO5r8Fkw4JBC+hQjZEF5ENcHHx1TmLPDsA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/1] screen: Upgrade 4.0.3 -> 4.3.1
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
X-List-Received-Date: Thu, 20 Aug 2015 21:41:44 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 20, 2015 at 2:34 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Basically you need to have a good reason why oe-core should invest the time
> maintaining both modern screen and ancient screen (4.0.3 was released in
> 2008).   The easiest solution would be for your distro to maintain a copy of
> ancient screen for people who want screen but also don't want GPLv3.  Or,
> switch to tmux which is BSD licensed.

I think this will be common interest for more than one distro or
person. It will be good to start moving them into a new layer under
meta-openembedded repo, something like meta-gplv2-pinned or
somethings, then users who are interested can prioritize this layer
over oe-core and there by use these versions easily instead of what
comes from oe-core.

