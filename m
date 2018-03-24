Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f169.google.com (mail-io0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id 6EE3E7873C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 23:05:09 +0000 (UTC)
Received: by mail-io0-f169.google.com with SMTP id l3so19158015iog.0
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 16:05:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7r/97BSr0H4f4Jxj2u/Zp2eTaaCD8xNkRgAEdN3E+jA=;
	b=Iis7IfAZAlOfnT78ogW1E7kG1Ouh5aGTMrjDaMw/8Ykyc0iFPtT7buUMfv1kNabheE
	relczrOha2Z+FUJhau6HljJPaKO2r+GoyROaoFpnrZOw1u4Wtq9DdtX/WvKuanbffJKf
	4kOnR2IqjB3frb3PLumCWKyxhQ7fhJXDnChrqjETgAaabaW6nGVIc/LTMsJ3qucOXiZh
	/eqNK4Gr3lvEyGxZ/KCtwLKy5hxBCBUUYhemtgrkGbLNXxI7IXUHxdF6DUIzowZkTnvx
	zLb1mtc8LjHDk7JNmXatZJur/KA6kRgMnaqg6MFLlROwdMWiJxfZe9crAFA/KmaK9V/0
	XbsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7r/97BSr0H4f4Jxj2u/Zp2eTaaCD8xNkRgAEdN3E+jA=;
	b=W5IUJPIgYKysHwLG4ggv72Aisu/oH5u00yhVvnW191aFR4pNyU2R80z6nJFygDH3Fa
	jiuO7exIL+9T58Z9yREzhZfIH2+OSUagSyrzIfJ0HnSj7Pd+Hor0gKbZgJKXyWzKHrEd
	LveaJlz/tUcAYRWCj2NTM8OKI5yKlrCnopjj684m9sjjGOrdOIjN2jNCWrZHL5hOSY0N
	IJNlm1A3SQur+YOeI+3NJoqkwYrFnqvACRMPXLaminX3kluOiSQYMD9IJ4LhCHyp4tS2
	8v9VH0DLQ/17quqmxpiulKPbJafjcRfK+ZP9FzlolfFBTviw6EKKmNIxECS/qoX+mHco
	2aow==
X-Gm-Message-State: AElRT7Gny+FDpt+a1jBMB+O2TY8FeckssbIQi0t3efGzi5AhPdUU/Fr5
	ylWK40lkdMFOciRbnhUZNWuzxjoT0zGMjpLKjMQX4Q==
X-Google-Smtp-Source: AG47ELv/C4IOXXlxh+8FHHlWyzwNjBmLWQrmqh5pw9XWB33NHjixZAElMeQFHMRITxgiJ/X77wk5Yll7idjZA/KgUCo=
X-Received: by 10.107.7.68 with SMTP id 65mr35478344ioh.216.1521932711171;
	Sat, 24 Mar 2018 16:05:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.30.9 with HTTP; Sat, 24 Mar 2018 16:04:50 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.00.1803241306460.40806@sjc-ads-6991.cisco.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyk1u2re5q.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaU41nPj1U2puHTvW272u0skdFk-gkuz3_-hXWWbxEqAg@mail.gmail.com>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
	<1521894988.11431.42.camel@linuxfoundation.org>
	<CAJTo0LbahOFYjBjonmfn5on78fFinG1Vk7R4kKtKX2mpmriEMA@mail.gmail.com>
	<20180324122357.668e6afc@seebsdell>
	<CAJ86T=Xcee6ivhoSc0adMR2q95ozsMXwSYL41mK7O5PN4CsWqw@mail.gmail.com>
	<20180324132246.28c2f8cd@seebsdell>
	<CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
	<20180324142427.53da953d@seebsdell>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
	<20180324145044.168f7e3f@seebsdell>
	<alpine.LRH.2.00.1803241306460.40806@sjc-ads-6991.cisco.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 24 Mar 2018 23:04:50 +0000
Message-ID: <CAJTo0LbCLW+VH+hGz+D9GQZHZ5sb3NEiN6C-FmNBQHzHmddEeQ@mail.gmail.com>
To: Victor Kamensky <kamensky@cisco.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Sat, 24 Mar 2018 23:05:11 -0000
Content-Type: text/plain; charset="UTF-8"

On 24 March 2018 at 20:12, Victor Kamensky <kamensky@cisco.com> wrote:
> Here is another crazy idea how to deal with it, just
> brainstorming what options are on the table: disable
> renameat2 with help of seccomp and force coreutils to
> use other calls. Something along the lines that were
> suggested with intercept of syscall function call, but
> let kernel to do interception work.

Wow, that's impressively magic.  Does this depend on kernel options or
specific recent versions?

Ross

