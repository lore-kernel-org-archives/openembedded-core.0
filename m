Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 458776010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 13:58:03 +0000 (UTC)
Received: by ioir85 with SMTP id r85so18938730ioi.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 05:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel_com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=izY9moMcrNZT/qGKFgN3XN1f0ked2HFGBjt1xflexcY=;
	b=vbl6IWNC6VefQTP2HWt05KxlCJfJ9Tc5nYHDW6w5kF7wAFmR9LP8A34lJoJG8CQAlK
	vJtunnL8htYRHaB1h4y607+As5F69ZXb3qLSOy8C+VIqSBWDty5aX0aoBq1Af/8lhq/U
	iZ7zaSZuYOV21Mcc7ANbZggVOtCFNrBvVSkmzcKQiY/MihWmsaLNjwiouQ5kdaxYewgd
	pIObQo5DetyaC6I9iToR2/tbJ5OeCBnhAFyPXDP3VMqTY8wqVJTqIQOMEtV+pCGOyBHv
	QdYNsepOhzOrSwt9vc3HQuR0oNv0ocY8cxytBjx38AoYug8tYxgLu/W/zbxrc+Dy2xym
	ZbeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=izY9moMcrNZT/qGKFgN3XN1f0ked2HFGBjt1xflexcY=;
	b=GzgumxH4nzXNV4y2i7WBpIkiNgxxxEma+BAKsGI/OAJf/7xAEb5ka+3Fu8yMJy9CZY
	x2Uf/vOQZA+bH3E6Xvcsr5DdtRLK/R/OYMWxw1T33ctKMHv65/V1i1K++inNcsEGuU7V
	Crgf/ysXZAmViFUVxz1aRXi98XfKa686tE9qa+MY7uJ127AqhsrGwQkVFg/0zsvCfoUy
	xtDDWoMIc566mbCS3TIJUS+SPTwCIbEIUWCZYA8I7YKASvEylxOyorKILyy+TZHVsWgG
	aRAlPHlaVn6LLFOVinkwqQ+6vpRUlmX4U0MpNRc8FGFsV53iLpelTtbsbP3ZVmc/HrJc
	rMYA==
X-Gm-Message-State: ALoCoQmnWUaJAjmohHS9q+JN7OIG3MLuVhRRsk7aFEPngCs7lm3s4FfWaa6pdDM/bJpDbsxpd0eT
X-Received: by 10.107.130.155 with SMTP id m27mr42450763ioi.133.1447768684531; 
	Tue, 17 Nov 2015 05:58:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.136.141 with HTTP; Tue, 17 Nov 2015 05:57:45 -0800 (PST)
In-Reply-To: <1447739760-14395-1-git-send-email-armccurdy@gmail.com>
References: <1447739760-14395-1-git-send-email-armccurdy@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Nov 2015 13:57:45 +0000
Message-ID: <CAJTo0LZaOJmK=FGpW0TLHjHNrPCyk87AhB56KsbkfUMR1Yep2w@mail.gmail.com>
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] directfb.inc: force bfd linker for armv7a
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
X-List-Received-Date: Tue, 17 Nov 2015 13:58:05 -0000
Content-Type: multipart/alternative; boundary=001a113ecd9428bf650524bceaf9

--001a113ecd9428bf650524bceaf9
Content-Type: text/plain; charset=UTF-8

On 17 November 2015 at 05:56, Andre McCurdy <armccurdy@gmail.com> wrote:

>  |
> .../build/tmp/sysroots/x86_64-linux/usr/bin/arm-rdk-linux-gnueabi/../../libexec/arm-rdk-linux-gnueabi/gcc/arm-rdk-linux-gnueabi/5.2.0/ld:
> error: directfb-csource.o: requires unsupported dynamic reloc
> R_ARM_MOVW_ABS_NC; recompile with -fPIC
>

Martin just sent a patch to pass -fPIC, presumably that is preferable to
changing the linker?

Ross

--001a113ecd9428bf650524bceaf9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 November 2015 at 05:56, Andre McCurdy <span dir=3D"ltr">&lt;<a href=
=3D"mailto:armccurdy@gmail.com" target=3D"_blank">armccurdy@gmail.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":6ts" class=
=3D"a3s" style=3D"overflow:hidden">=C2=A0| .../build/tmp/sysroots/x86_64-li=
nux/usr/bin/arm-rdk-linux-gnueabi/../../libexec/arm-rdk-linux-gnueabi/gcc/a=
rm-rdk-linux-gnueabi/5.2.0/ld: error: <span class=3D"il">directfb</span>-cs=
ource.o: requires unsupported dynamic reloc R_ARM_MOVW_ABS_NC; recompile wi=
th -fPIC</div></blockquote></div><br>Martin just sent a patch to pass -fPIC=
, presumably that is preferable to changing the linker?</div><div class=3D"=
gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ecd9428bf650524bceaf9--
