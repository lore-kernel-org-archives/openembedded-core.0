Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id C151F6FEFE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Nov 2016 11:35:17 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id p16so124515553qta.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Nov 2016 03:35:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=IY/7mMF9x5783BRrx5kIMDA9GVneyFaMqZvqIHmBcN8=;
	b=ytDsT0aSdz2fHD+NztG4o2tsDThDvbsuY1nyDMAK/Vrd+oZe3h4D9Y6WRXJn0y4HVG
	BlH7+RLUEt68DtVnrgnPaQ0G/uzZbBbK7QKl+VC7yu0okjPiMa4tc4yC2VmUbtFcLbKt
	k0732sGUiCvXSbsKUCZjIJduDcfLpLToxU6XXlRczBB63fnxSS3JNoYVW+u6Lr+wjPQ9
	x8c3EsS05hivZtpYoiJ/m0dn47Qfy0SBYwgA4S2Q/dsQRYCAjuXn21xdWtDoPI08ymTz
	WLRLskc7ucksTqEtF4fU1RCHyqIpJN6MzRY7kgzdb5ABewPCA9NxHvXk2nhzRiC42EUc
	ZPWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=IY/7mMF9x5783BRrx5kIMDA9GVneyFaMqZvqIHmBcN8=;
	b=ZA6uVfFssLBrOU8CAwulOdpWfNfiV+2Ev93NTQfF1sM0e+VCKCLnt+B8TNllPCTrWW
	5r/MNAyDGGTzXzlyJ6oUI6cP1LyV25GVMhiAMG/WoBU4uaKOa+eDYbp+9M/oWhEhKnUL
	gjUJJPw0fV0FTGRRBQcw69Ot4ATAVfcKk3ueLTCV0cuhQU7LIwshevp0pe8qJA2ynbLv
	DWVtyZbfodntLGGQiYL05WBxWPXU9XJal+dHuVWgx5mW96bC75DOkZivkrVQrk/DxoIO
	Lpd+W798E+k+EX/L2Qc0Wsl14c3xPavTdFYQWLIf1xdW5u43d2BFuu1+2PzKMOKktiVB
	hJfQ==
X-Gm-Message-State: ABUngvfkQG3DcywdvPGdhqSpoZTsHmddIX6xpmN4GSfnuboToc8GTaVGZp9ymdUEvNArSEIZAcxJJwm+jgC6aTFn
X-Received: by 10.237.61.210 with SMTP id j18mr17477419qtf.137.1478691319286; 
	Wed, 09 Nov 2016 03:35:19 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Wed, 9 Nov 2016 03:34:58 -0800 (PST)
In-Reply-To: <CAJTo0LZxGYzpjUetPspX6mKktoL_XnDqfncyHFWN5Kzfij8-UQ@mail.gmail.com>
References: <1477161480-20271-1-git-send-email-paul@paulbarker.me.uk>
	<20161105101438.1ef1f627@nuc.betafive.co.uk>
	<CAJTo0LbB0eGStoFbyinDYP0zzEJ27BL0eDyGKFkjdh=AaWBPVA@mail.gmail.com>
	<CADkTA4OaRgUJwFwT=S_h41EW4OO_Koa+QQr=t3t+X+6pszrzBQ@mail.gmail.com>
	<CAJTo0LZxGYzpjUetPspX6mKktoL_XnDqfncyHFWN5Kzfij8-UQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 9 Nov 2016 11:34:58 +0000
Message-ID: <CAJTo0LZdAJk0pKHhrh1ktud-GmxQ=RVgs7z+TNNKGmHHbws5Kw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: OpenEmbedded Core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: Allow ${S} to be overridden
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
X-List-Received-Date: Wed, 09 Nov 2016 11:35:22 -0000
Content-Type: multipart/alternative; boundary=001a11401094d19f0d0540dca6dc

--001a11401094d19f0d0540dca6dc
Content-Type: text/plain; charset=UTF-8

On 9 November 2016 at 10:04, Burton, Ross <ross.burton@intel.com> wrote:

> Saying that of course doomed the patch:
>

Double doomed, perf can't build either.

ERROR: perf-1.0-r9 do_configure: Function failed: do_configure (log file is
located at
/data/poky-master/tmp-glibc/work/intel_corei7_64-poky-linux/perf/1.0-r9/temp/log.do_configure.23322)
ERROR: Logfile of failure stored in:
/data/poky-master/tmp-glibc/work/intel_corei7_64-poky-linux/perf/1.0-r9/temp/log.do_configure.23322
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function do_configure
| sed: can't read
/data/poky-master/tmp-glibc/work-shared/intel-corei7-64/kernel-source/tools/perf/Makefile*:
No such file or directory
| WARNING: exit code 2 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/data/poky-master/tmp-glibc/work/intel_corei7_64-poky-linux/perf/1.0-r9/temp/log.do_configure.23322)

Ross

--001a11401094d19f0d0540dca6dc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 9 November 2016 at 10:04, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0=
px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);borde=
r-left-style:solid;padding-left:1ex"><div class=3D"gmail_extra">Saying that=
 of course doomed the patch:</div></blockquote></div><br>Double doomed, per=
f can&#39;t build either.</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra"><div class=3D"gmail_extra">ERROR: perf-1.0-r9 do_config=
ure: Function failed: do_configure (log file is located at /data/poky-maste=
r/tmp-glibc/work/intel_corei7_64-poky-linux/perf/1.0-r9/temp/log.do_configu=
re.23322)</div><div class=3D"gmail_extra">ERROR: Logfile of failure stored =
in: /data/poky-master/tmp-glibc/work/intel_corei7_64-poky-linux/perf/1.0-r9=
/temp/log.do_configure.23322</div><div class=3D"gmail_extra">Log data follo=
ws:</div><div class=3D"gmail_extra">| DEBUG: Executing python function sysr=
oot_cleansstate</div><div class=3D"gmail_extra">| DEBUG: Python function sy=
sroot_cleansstate finished</div><div class=3D"gmail_extra">| DEBUG: Executi=
ng shell function do_configure</div><div class=3D"gmail_extra">| sed: can&#=
39;t read /data/poky-master/tmp-glibc/work-shared/intel-corei7-64/kernel-so=
urce/tools/perf/Makefile*: No such file or directory</div><div class=3D"gma=
il_extra">| WARNING: exit code 2 from a shell command.</div><div class=3D"g=
mail_extra">| ERROR: Function failed: do_configure (log file is located at =
/data/poky-master/tmp-glibc/work/intel_corei7_64-poky-linux/perf/1.0-r9/tem=
p/log.do_configure.23322)</div><div class=3D"gmail_extra"><br></div><div cl=
ass=3D"gmail_extra">Ross</div></div></div>

--001a11401094d19f0d0540dca6dc--
