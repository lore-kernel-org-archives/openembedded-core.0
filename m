Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 13A4277FC1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 11:19:39 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id d78so98767725qkb.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jul 2017 04:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vSP3HVN4WLyyncUsKtaDxRZmkFcD8WwYMVLVWeYWWnA=;
	b=Uhri/Y0bENH+Je0rNFZ5JDFBJobQjcqkJU50jNqKVgVflXI3y+nSse2/sumSZToCGu
	JpCIOgBQnhROR6pbgm/KGaitlgpM+tDlC5IMuXn/jpS+OwLPs6LDQGab3UXrZAmNoW8K
	rMcAunVdVCk/+CQeMRVMLjHi/VBnj3uTDgiWIY7Hfqv5MLmWsvrkqf8APQ+WjGK9baBg
	tXQ232WVMn9cL/woGyA8xLivWUF83ghZmCyD9XlAmPTjmYE02qy/dTMRBuHRcxVN4yLK
	u1d2oAPlJ/VH7CtMSud8lbvBUosalzR2JwnWRqedNZ6/i+OT5itpXBFCdFMDYTya7Lud
	sQlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vSP3HVN4WLyyncUsKtaDxRZmkFcD8WwYMVLVWeYWWnA=;
	b=Sar8tOylvxqHCGlkUpL4ZcQ0xUbeqAQqf3vHzadWuxxxLP9UECx9RD6tJrB4M4j44i
	fvL/b1ArWg+XhEEd30lkeCD9mQZaUnFKiSozLG6WClNh9pHrKM3KWzf1jJOLr8rW4u/V
	bR3oH42y6CqnVDk2d87jwWz2s1vB4qYcxd5u4JUsdO8Had2Yp5XK6NY9Eg/6v8LBnUKR
	opfEkR1eUmcHoij1+i9LgE0E2vG3oVNSR741DGqL972atmhuc9iOG+EUHLn0wK1BgC5Z
	kSEajxTyYZ6Ehhvj9vwLy/xGMrOCS0dlLhuEn0XmpK23OFUhyDKg325z+Cph1zd0eGFH
	ZXqg==
X-Gm-Message-State: AIVw1120A9tanKJsU07pJ9O2yhviDOgTqjHE2m7Dgac+K7jsRJyZCGfL
	ayt3FgBLG9h7dIZi66ivlCNA0QrjIxqO
X-Received: by 10.55.79.145 with SMTP id d139mr9630238qkb.32.1499771981078;
	Tue, 11 Jul 2017 04:19:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 11 Jul 2017 04:19:20 -0700 (PDT)
In-Reply-To: <1499760817-127823-1-git-send-email-hongxu.jia@windriver.com>
References: <1499760817-127823-1-git-send-email-hongxu.jia@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Jul 2017 12:19:20 +0100
Message-ID: <CAJTo0LasUeR3oPuGjD1G4KFJN3wZLScKWmY1v0DiJy1ds2vdEg@mail.gmail.com>
To: Hongxu Jia <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] dhcp: fix genetle shutdown not work while bind9 compile with --enable-threads
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
X-List-Received-Date: Tue, 11 Jul 2017 11:19:40 -0000
Content-Type: multipart/alternative; boundary="001a114a7efe2d366d055408e0c2"

--001a114a7efe2d366d055408e0c2
Content-Type: text/plain; charset="UTF-8"

On 11 July 2017 at 09:13, Hongxu Jia <hongxu.jia@windriver.com> wrote:

> +Upstream-Status: Inappropriate [OE specific]
>

This is not OE specific.  We enable a specific build combination, and it
breaks.

Have you reported this upstream?  Should we disable gentle shutdown as it's
clearly not being tested that much?

Ross

--001a114a7efe2d366d055408e0c2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 July 2017 at 09:13, Hongxu Jia <span dir=3D"ltr">&lt;<a href=3D"mailt=
o:hongxu.jia@windriver.com" target=3D"_blank">hongxu.jia@windriver.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":bp" class=
=3D"a3s aXjCH m15d30b6314b88378">+Upstream-Status: Inappropriate [OE specif=
ic]<br></div></blockquote></div><br>This is not OE specific.=C2=A0 We enabl=
e a specific build combination, and it breaks.</div><div class=3D"gmail_ext=
ra"><br></div><div class=3D"gmail_extra">Have you reported this upstream?=
=C2=A0 Should we disable gentle shutdown as it&#39;s clearly not being test=
ed that much?</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail=
_extra">Ross</div></div>

--001a114a7efe2d366d055408e0c2--
