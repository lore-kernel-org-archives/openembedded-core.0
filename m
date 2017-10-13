Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 47F3D78215
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 11:33:54 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id h70so8650665ioi.4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Oct 2017 04:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=a58XmyujhsUKU/UXK+skUCgkHW1vkmZtUiytfFIGL7k=;
	b=0298mIVNFf5+PaTJb0rf3fl4AqBVqN5YAAZt2lBelpiiN51tk8z3JhCdNKMdu0yHmr
	1Ygd7GdsiyV+jFHOoOTyz/9MujCsSGqpFqqGMbz22ub4HBqYUrnT1xRBTWx6P2sO56il
	5oIJz/da56kcT3KTxbbGGKXy5WH/Ts2lnpLNGWttGr2RhQtTEm5Vtg/m5J9rh+4bbG/w
	1LIq+lHCfkhopFmxwBlDY+VcQgARo/+xYdm1oNjF0NA0M025W9kR5XuR+uNxD2D+GWnB
	J+HwYUPvFJcN9FH0j7/cR+RGc3iPJLT8cNb8pewglJdZVpms+ikenZVdWP9/rvwRNnXs
	qEcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=a58XmyujhsUKU/UXK+skUCgkHW1vkmZtUiytfFIGL7k=;
	b=YyUdwqVipfY7fy1eHEdJ3AsmmRdNF+ZGwpCVdLEmeexF1bGvtexR5cNI2vJU8NSDA1
	yPWbm0AIy0dpej3esrmxsmzfc6Fu3b4a38XHwaJmuicdVCH7jd4wgsvI8urbCMBXVNC0
	MWSwbRT1R5ojpL0nAndbCTVkUlZpfZgTCLJl8sDHw7ExNELdV+bwL+dGiA48v1Yy/w0M
	facVgjXJC34v/WbmHsuSNHv5zfC8722gkaqWZACpgtZqOSFaNEGziaV9Avf5nsnZBUkz
	SNZ/EcIceICcVFtrbFfEHRAm+oPX6pbhDiJBd6PeANwFahm8E0wdGFgDm5c0+XI2Gg4p
	LhTg==
X-Gm-Message-State: AMCzsaV1nqRxW3UR+tGONHGz3/BMNPVB8B+uk06RjIT3UlkWnM0bvo3q
	uCWXlPQWRs4AdyjO8+UBDmwH2j7zD6UgCGRcEhz8Nw==
X-Google-Smtp-Source: ABhQp+T/SDPl8ZMnUiS8K1awo+MhtqOJZH0xlVSMC2DflqzRtvgd/c+YuAarRFnsn6pWUJE+GI7e0C/9cd+rLNZwk1M=
X-Received: by 10.107.18.67 with SMTP id a64mr1356494ioj.165.1507894436285;
	Fri, 13 Oct 2017 04:33:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.205 with HTTP; Fri, 13 Oct 2017 04:33:35 -0700 (PDT)
In-Reply-To: <1507836933-142066-1-git-send-email-denis@denix.org>
References: <1507836933-142066-1-git-send-email-denis@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 13 Oct 2017 12:33:35 +0100
Message-ID: <CAJTo0LZOauk809g+8dCqk2t0sp24v6HJA6fGSQtYH0On1mC6Kg@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wayland-protocols: upgrade to 1.11
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
X-List-Received-Date: Fri, 13 Oct 2017 11:33:55 -0000
Content-Type: multipart/alternative; boundary="001a113ee9b23be24f055b6c082d"

--001a113ee9b23be24f055b6c082d
Content-Type: text/plain; charset="UTF-8"

On 12 October 2017 at 20:35, Denys Dmytriyenko <denis@denix.org> wrote:

> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>

One day I'll figure out why quilt appears to be non-deterministic about
this but:

ERROR: wayland-protocols-1.11-r0 do_patch: Command Error: 'quilt --quiltrc
/data/poky-tmp/master/build/work/all-poky-linux/wayland-protocols/1.11-r0/recipe-sysroot-native/etc/quiltrc
push' exited with 0  Output:
Applying patch usesysrootprefixforpkgdatadirvariable.patch
patching file wayland-protocols.pc.in
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file wayland-protocols.pc.in
Patch usesysrootprefixforpkgdatadirvariable.patch can be reverse-applied

Ross

--001a113ee9b23be24f055b6c082d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 12 October 2017 at 20:35, Denys Dmytriyenko <span dir=
=3D"ltr">&lt;<a href=3D"mailto:denis@denix.org" target=3D"_blank">denis@den=
ix.org</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left-width:1px;border-left-style:solid;border-left-color:rgb(204=
,204,204);padding-left:1ex">From: Denys Dmytriyenko &lt;<a href=3D"mailto:d=
enys@ti.com">denys@ti.com</a>&gt;<br>
<br>
Signed-off-by: Denys Dmytriyenko &lt;<a href=3D"mailto:denys@ti.com">denys@=
ti.com</a>&gt;<br></blockquote><div><br></div><div>One day I&#39;ll figure =
out why quilt appears to be non-deterministic about this but:</div><div><br=
></div><div>ERROR: wayland-protocols-1.11-r0 do_patch: Command Error: &#39;=
quilt --quiltrc /data/poky-tmp/master/build/work/all-poky-linux/wayland-pro=
tocols/1.11-r0/recipe-sysroot-native/etc/quiltrc push&#39; exited with 0 =
=C2=A0Output:</div><div>Applying patch usesysrootprefixforpkgdatadirvariabl=
e.patch</div><div>patching file <a href=3D"http://wayland-protocols.pc.in">=
wayland-protocols.pc.in</a></div><div>Hunk #1 FAILED at 1.</div><div>1 out =
of 1 hunk FAILED -- rejects in file <a href=3D"http://wayland-protocols.pc.=
in">wayland-protocols.pc.in</a></div><div>Patch usesysrootprefixforpkgdatad=
irvariable.patch can be reverse-applied</div><div><br></div><div>Ross=C2=A0=
</div></div></div></div>

--001a113ee9b23be24f055b6c082d--
