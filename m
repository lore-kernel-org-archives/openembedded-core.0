Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa06-01.prod.phx3.secureserver.net
	(p3plsmtpa06-01.prod.phx3.secureserver.net [173.201.192.102])
	by mail.openembedded.org (Postfix) with ESMTP id 1419C60144
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Sep 2014 11:16:11 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa06-01.prod.phx3.secureserver.net with 
	id vPGB1o00J0BVjqb01PGBim; Thu, 25 Sep 2014 04:16:12 -0700
Message-ID: <5423F97B.6020705@pabigot.com>
Date: Thu, 25 Sep 2014 06:16:11 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1411148655-5500-1-git-send-email-pab@pabigot.com>
	<54229DB5.90806@pabigot.com>
	<CAJTo0LY0a9_Rb5Eyq3b20ML89YcVkNS0N=NnXL-zkUQescGu3Q@mail.gmail.com>
In-Reply-To: <CAJTo0LY0a9_Rb5Eyq3b20ML89YcVkNS0N=NnXL-zkUQescGu3Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 25 Sep 2014 11:16:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

On 09/25/2014 05:49 AM, Burton, Ross wrote:
> On 24 September 2014 11:32, Peter A. Bigot <pab@pabigot.com> wrote:
>> Ping for this one too (it re-opened Yocto #3780 and has 1.7 as a due date).
>>
>> That's all I expect to have for 1.7, unless u-boot 2014.07 gets in (there's
>> a patch needed for BBB in that case, but it's already in meta-ti's version).
> This produces errors for nativesdk builds:
>
> ERROR: QA Issue: nativesdk-git: Files/directories were installed but not shipped
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Error.pm
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git.pm
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/perllocal.pod
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/auto
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/auto/Git
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/auto/Git/.packlist
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN.pm
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/IndexInfo.pm
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/I18N.pm
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/GlobSpec.pm
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Ra.pm
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Log.pm
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Prompt.pm
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Utils.pm
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Fetcher.pm
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Editor.pm
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Migration.pm
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Memoize
>    /opt/poky/1.7/sysroots/x86_64-pokysdk-linux/usr/lib/perl-native/perl/5.20.0/Git/SVN/Memoize/YAML.pm
> [installed-vs-shipped]

I'm at a loss here.  The probable fix is clear and I can send it as V2, 
but I can't test it: no matter what I do, "bitbake git-nativesdk" 
succeeds after attemping 0 tasks of which 0 were required.  This with a 
completely clean build environment, no shared state enabled, 
uninstalling git from the development machine, and removing git-native 
from meta's ASSUME_PROVIDED (which allowed git-native to build, but then 
said nothing PROVIDES git-nativesdk).

Can you suggest a way to reproduce the problem?  Or a pointer to the log 
where the errors above can be seen in context?

Peter

