Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f65.google.com (mail-oi0-f65.google.com
	[209.85.218.65])
	by mail.openembedded.org (Postfix) with ESMTP id 9EDF8798C2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 13:20:36 +0000 (UTC)
Received: by mail-oi0-f65.google.com with SMTP id r69-v6so11368897oie.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Sep 2018 06:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=957iwyj8/dq6dmf9Mk7GHYiV4fvKOjs4Xs1H1v5OQik=;
	b=M93JcX5squa/iB4ttZu0e0rVvzC0M7cWVLgWi/ZrExCkZCPFy0obksjEi9gnmYPHPW
	ZZ57SzyVXIhE1y3RitTXG4hh6tTk7eW1DVpgVFnH6vlF9cL5ixZIJOidw78J2ihs76xJ
	d8oRiSazEIeyTfcX9rrHRwcHtrD20lrVib//yAgtDvPiPGG5LIGTcOvnXFVx0WzaA62N
	2n90H8swkFHolpa7e7isLeH+oEfEprZ+biWQ65fiETCIwAFopsFrLmx2OjNMuIlrZuY9
	PDk9CuyqajxjSla6o6UGshH/xQQCqqarG9t+mmMLd/idmBecuzdEqotXzL4wqoeeRJH3
	n+Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=957iwyj8/dq6dmf9Mk7GHYiV4fvKOjs4Xs1H1v5OQik=;
	b=MI6/tYOZaUc0x4vEqnT/iJbCwjWhNxHGrZeLOFllR8mrUbMpKKBIRE1DPMvaRzqw1M
	w0d34st/WGvSZ3SYLvDaONIqxmdXFjToB3pcal7cBvi7XJRUWIdDHz3EuhaVGSwHZPWh
	baQn5HZ5JDK3o4swvaTyhPy/pQg+oL3vddX2aboVA6suoRasLOYTGdCrQ+oIWd2SBr2T
	ckcJWXCIUzeloJnU/stdEyCCwjqNPIzMn4zNcSqQ+jW8MXtHWG7m/+3MofPMT2zLmnMh
	707W209Gt2lo8Lbnf/K66CG52aybCsVOg4HFpyaVsrCAr3QjzZB26GDkMbI/if8dsA1I
	LFDg==
X-Gm-Message-State: APzg51Cx8lmcQrj5QsWuj5l6PRnLYyFem6eNuDVaez22VWUUQgCxDz2A
	WYJksAEHQM0zezzDM4puHJCgjFF1+bi/Q+ZGJRoTBw==
X-Google-Smtp-Source: ANB0VdZq/jcWGQWdonmctTyP2XOoPIc5DmifQLtFDwn8ZNx0Zipujnrf1PbjyxIP3WXgwhC9LgcY75dpF9rbf4pS9Wg=
X-Received: by 2002:aca:6849:: with SMTP id
	d70-v6mr1520872oic.103.1537536037330; 
	Fri, 21 Sep 2018 06:20:37 -0700 (PDT)
MIME-Version: 1.0
References: <20180920204232.10583-1-abrodkin@synopsys.com>
	<20180920204232.10583-6-abrodkin@synopsys.com>
	<CAJTo0LbYHuG6E4LgQpZCDQ+XaM+rt0N683cP3nuPu-DojFEmSg@mail.gmail.com>
	<9bb4d4d54024982cb3a0b02222a45e12845cba85.camel@synopsys.com>
	<bb6c7d725f34a4bb5b08164268db7a2863aa1cf3.camel@synopsys.com>
	<CAJTo0La_MuDqcdy4brMRkiprQzAnAwo1omdGzz_=kDjgc1Hsvg@mail.gmail.com>
	<27a89d5d978dbe51cd05d7c68c067d46dcdde71e.camel@synopsys.com>
In-Reply-To: <27a89d5d978dbe51cd05d7c68c067d46dcdde71e.camel@synopsys.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Sep 2018 14:20:25 +0100
Message-ID: <CAJTo0Lak_--ZguDpPhdD_jMcwaoOVejfTqkNqYAjB+FwG_O1JA@mail.gmail.com>
To: Alexey.Brodkin@synopsys.com
Cc: wk@gnupg.org, linux-snps-arc@lists.infradead.org,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 5/9] libgpg-error: Add ARC support
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
X-List-Received-Date: Fri, 21 Sep 2018 13:20:36 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, that fixes it.

Ross
On Fri, 21 Sep 2018 at 14:08, Alexey Brodkin
<Alexey.Brodkin@synopsys.com> wrote:
>
> Hi Ross,
>
> On Fri, 2018-09-21 at 13:53 +0100, Burton, Ross wrote:
> > Can you check that v3 works with x86-64 targets?
> >
> > ERROR: libgpg-error-1.32-r0 do_compile: Function failed: do_compile
> > (log file is located at
> > /data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/temp/log.do_compile.13345)
> > ERROR: Logfile of failure stored in:
> > /data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/temp/log.do_compile.13345
> > Log data follows:
> > > DEBUG: SITE files ['endian-little', 'common-linux', 'common-glibc',
> >
> > 'bit-64', 'x86_64-linux', 'common']
> > > DEBUG: Executing shell function do_compile
> > > cp: cannot stat
> >
> > '/data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/libgpg-error-1.32/src/syscfg/lock-obj-pub.x86_64-pc-linux-gnu.h':
> > No such file or directory
> > > WARNING: exit code 1 from a shell command.
> > > ERROR: Function failed: do_compile (log file is located at
> >
> > /data/poky-tmp/master/work/corei7-64-poky-linux/libgpg-error/1.32-r0/temp/log.do_compile.13345)
>
> Yeah that's pretty unfortunate that "simple addition of ARC"
> broke anther arch :(
>
> What happened is in the same one commit that adds ARC quite a few
> headers for other arches get renamed, see:
> http://git.gnupg.org/cgi-bin/gitweb.cgi?p=libgpg-error.git;a=commit;h=48c8f8ddfc80551db7615e1eb3555c1dc3f6a657
>
> And "lock-obj-pub.x86_64-pc-linux-gnu.h" is one of them.
> So I'll update libgpg-error_1.32.bb with:
> -------------------------->8-----------------------
> --- a/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
> +++ b/meta/recipes-support/libgpg-error/libgpg-error_1.32.bb
> @@ -44,7 +44,7 @@ do_compile_prepend() {
>           mips64*)    TUPLE=mips64el-unknown-linux-gnuabi64 ;;
>           mips*el)    TUPLE=mipsel-unknown-linux-gnu ;;
>           mips*)      TUPLE=mips-unknown-linux-gnu ;;
> -         x86_64)     TUPLE=x86_64-pc-linux-gnu ;;
> +         x86_64)     TUPLE=x86_64-unknown-linux-gnu ;;
>           *)          TUPLE=${TARGET_ARCH}-unknown-linux-gnu ;;
>         esac
> -------------------------->8-----------------------
>
> Care to try that change in your setup once you have eveything else built for x86_64?
>
> -Alexey

