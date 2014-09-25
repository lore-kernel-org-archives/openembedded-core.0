Return-Path: <paul.eggleton@linux.intel.com>
Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	by mail.openembedded.org (Postfix) with ESMTP id E2A0665FFC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 11:18:08 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga102.fm.intel.com with ESMTP; 25 Sep 2014 04:18:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.04,596,1406617200"; d="scan'208";a="605184784"
Received: from svgunawa-mobl.gar.corp.intel.com (HELO
	peggleto-mobl5.ger.corp.intel.com) ([10.252.120.198])
	by fmsmga002.fm.intel.com with ESMTP; 25 Sep 2014 04:17:51 -0700
From: Paul Eggleton <paul.eggleton@linux.intel.com>
To: "Peter A. Bigot" <pab@pabigot.com>
Date: Thu, 25 Sep 2014 12:17:50 +0100
Message-ID: <1761684.on3aH1HNt7@peggleto-mobl5.ger.corp.intel.com>
Organization: Intel Corporation
User-Agent: KMail/4.14.1 (Linux/3.16.2-201.fc20.x86_64; KDE/4.14.1; x86_64; ; )
In-Reply-To: <5423F97B.6020705@pabigot.com>
References: <1411148655-5500-1-git-send-email-pab@pabigot.com>
	<CAJTo0LY0a9_Rb5Eyq3b20ML89YcVkNS0N=NnXL-zkUQescGu3Q@mail.gmail.com>
	<5423F97B.6020705@pabigot.com>
MIME-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] git: add Git perl module to perltools package
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
X-List-Received-Date: Thu, 25 Sep 2014 11:18:09 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Thursday 25 September 2014 06:16:11 Peter A. Bigot wrote:
> On 09/25/2014 05:49 AM, Burton, Ross wrote:
> > On 24 September 2014 11:32, Peter A. Bigot <pab@pabigot.com> wrote:
> >> Ping for this one too (it re-opened Yocto #3780 and has 1.7 as a due
> >> date).
> >> 
> >> That's all I expect to have for 1.7, unless u-boot 2014.07 gets in
> >> (there's
> >> a patch needed for BBB in that case, but it's already in meta-ti's
> >> version).> 
> > This produces errors for nativesdk builds:
> > 
> > ERROR: QA Issue: nativesdk-git: Files/directories were installed but not
> > shipped> 
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.
> >    20.0
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.
> >    20.0/Error.pm
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git.pm
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/perllocal.pod
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/auto
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/auto/Git
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/auto/Git/.packlist
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git/SVN.pm
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git/IndexInfo.pm
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git/I18N.pm
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git/SVN
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git/SVN/GlobSpec.pm
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git/SVN/Ra.pm
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git/SVN/Log.pm
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git/SVN/Prompt.pm
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git/SVN/Utils.pm
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git/SVN/Fetcher.pm
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git/SVN/Editor.pm
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git/SVN/Migration.pm
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git/SVN/Memoize
> >    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5
> >    .20.0/Git/SVN/Memoize/YAML.pm> 
> > [installed-vs-shipped]
> 
> I'm at a loss here.  The probable fix is clear and I can send it as V2,
> but I can't test it: no matter what I do, "bitbake git-nativesdk"
> succeeds after attemping 0 tasks of which 0 were required.  This with a
> completely clean build environment, no shared state enabled,
> uninstalling git from the development machine, and removing git-native
> from meta's ASSUME_PROVIDED (which allowed git-native to build, but then
> said nothing PROVIDES git-nativesdk).

Try: bitbake nativesdk-git

Cheers,
Paul

-- 

Paul Eggleton
Intel Open Source Technology Centre

