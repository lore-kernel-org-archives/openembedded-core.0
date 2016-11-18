Return-Path: <rpjday@crashcourse.ca>
Received: from smtp485.redcondor.net (smtp485.redcondor.net [208.80.204.85])
	by mail.openembedded.org (Postfix) with ESMTP id 7638D71A93
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Nov 2016 12:47:55 +0000 (UTC)
Received: from astoria.ccjclearline.com ([64.235.106.9])
	by smtp485.redcondor.net ({3be039ea-4351-44b0-a8af-642c38b25916})
	via TCP (outbound) with ESMTPS id 20161118124747289_0485;
	Fri, 18 Nov 2016 12:47:47 +0000
X-RC-FROM: <rpjday@crashcourse.ca>
Received: from [174.118.92.171] (port=54844 helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.80) (envelope-from <rpjday@crashcourse.ca>)
	id 1c7iZr-0003u3-Lg; Fri, 18 Nov 2016 07:47:35 -0500
Date: Fri, 18 Nov 2016 07:46:28 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: =?ISO-8859-15?Q?Andr=E9_Draszik?= <git@andred.net>
In-Reply-To: <1479472068.27546.12.camel@andred.net>
Message-ID: <alpine.LFD.2.20.1611180742360.16475@localhost.localdomain>
References: <alpine.LFD.2.20.1611180634400.3556@localhost.localdomain>
	<1479472068.27546.12.camel@andred.net>
User-Agent: Alpine 2.20 (LFD 67 2015-01-07)
MIME-Version: 1.0
X-MAG-OUTBOUND: ccj.redcondor.net@64.235.106.9/32
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: small number of perl modules that can't be cross-compiled
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
X-List-Received-Date: Fri, 18 Nov 2016 12:47:57 -0000
Content-Type: multipart/mixed; BOUNDARY="8323328-1995416444-1479473191=:16475"

--8323328-1995416444-1479473191=:16475
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Fri, 18 Nov 2016, André Draszik wrote:

> On Fri, 2016-11-18 at 06:41 -0500, Robert P. J. Day wrote:
> >   after OE recipfying over 100 perl modules from CPAN, i'm down to
> > less than a dozen that are going to take more work, and a small number
> > of those seem to be simply badly written in that they don't support
> > cross-compilation for my target choice of "qemuppc". example
> > boilerplate recipe i put together produces this:
> >
> > $ make libauthen-pam-perl
> > ... snip ...
> > Checking if your kit is complete...
> > Looks good
> > checking for gcc... powerpc-wrs-linux-gcc -m32 -mhard-float -mcpu=7400
> > --
> > sysroot=/home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/qemup
> > pc
> > checking for C compiler default output file name... a.out
> > checking whether the C compiler works... configure: error: cannot run
> > C compiled programs.
> > If you meant to cross compile, use `--host'.
> > See `config.log' for more details.
>
> It'd be useful to see config.log, ...

  see bottom.

> > Error in configuring the Authen::PAM module.
> > ... snip ...
> >
> >   so i'm assuming the source itself for Authen::PAM:
> >
> > https://metacpan.org/pod/Authen::PAM
> >
> > is somehow flawed in that it doesn't properly recognize
> > cross-compilation, would that be it?
>
> ... there is at least one issue in Authen-PAM-0.16/configure.ac, I would
> say, in that it tries to detect RTLD_GLOBAL support based on the host's
> perl. So it's likely there are more flaws.

  that's pretty much all i wanted to confirm at this point -- that it
wasn't something stupid i was doing; rather, the source itself is
flawed, and that's not the only example.

rday

DEBUG: Executing python function sysroot_cleansstate
DEBUG: Python function sysroot_cleansstate finished
DEBUG: Executing shell function do_configure
*** Module name IN: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/qemuppc/usr/lib/perl/5.22.0/Cwd.pm
*** p1: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/qemuppc/usr/lib/  p3: perl/5.22.0/  p5: Cwd.pm
*** Module name OUT: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.22.0/Cwd.pm
*** Module name IN: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/qemuppc/usr/lib/perl/5.22.0/Encode.pm
*** p1: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/qemuppc/usr/lib/  p3: perl/5.22.0/  p5: Encode.pm
*** Module name OUT: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.22.0/Encode.pm
*** Module name IN: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/qemuppc/usr/lib/perl/5.22.0/I18N/Langinfo.pm
*** p1: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/qemuppc/usr/lib/  p3: perl/5.22.0/  p5: I18N/Langinfo.pm
*** Module name OUT: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.22.0/I18N/Langinfo.pm
*** Module name IN: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/qemuppc/usr/lib/perl/5.22.0/B.pm
*** p1: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/qemuppc/usr/lib/  p3: perl/5.22.0/  p5: B.pm
*** Module name OUT: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.22.0/B.pm
*** Module name IN: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/qemuppc/usr/lib/perl/5.22.0/List/Util.pm
*** p1: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/qemuppc/usr/lib/  p3: perl/5.22.0/  p5: List/Util.pm
*** Module name OUT: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/x86_64-linux/usr/lib/perl-native/perl/5.22.0/List/Util.pm
Checking if your kit is complete...
Looks good
checking for gcc... powerpc-wrs-linux-gcc -m32 -mhard-float -mcpu=7400 --sysroot=/home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/sysroots/qemuppc
checking for C compiler default output file name... a.out
checking whether the C compiler works... configure: error: cannot run C compiled programs.
If you meant to cross compile, use `--host'.
See `config.log' for more details.
Error in configuring the Authen::PAM module.
WARNING: /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/work/ppc7400-wrs-linux/libauthen-pam-perl/0.16-r0/temp/do_configure/run.do_configure.16119:1 exit 25 from
  perl Makefile.PL INSTALLDIRS=vendor
ERROR: Function failed: do_configure (log file is located at /home/rpjday/WRL/builds/msm/nov17/bitbake_build/tmp/work/ppc7400-wrs-linux/libauthen-pam-perl/0.16-r0/temp/do_configure/log.do_configure.16119)

--8323328-1995416444-1479473191=:16475--
