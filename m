Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f171.google.com (mail-io0-f171.google.com
	[209.85.223.171])
	by mail.openembedded.org (Postfix) with ESMTP id E06DD771C9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Aug 2016 20:21:51 +0000 (UTC)
Received: by mail-io0-f171.google.com with SMTP id 38so368589589iol.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Aug 2016 13:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=lxSM3SyWg34z43vEEYZ1UzfUjPNiIL0GUng91GaF2y0=;
	b=b9xFzw82yxicx2f2Ku9AZONWaqxXqdTpa+TJiSTZ7dzz6boFgJB7Sr3AgaTZW2/Lvo
	nwhKexqNa+axCW186b9WLKqGKbYLmUY0xulDH7rQS1SLn6wzmc7HQYuyFfcxiW0iVo2U
	gu1cXuJz8EHQkyhBTUrPaekmu3xDblAZajOfHOy2qCp7rEhn1CNSwl0YJgBBvaEqHjvO
	/iFQqwcjmZnFHJY/fUoV+Syl8LYIIFcEU6sO3TcXE9XXLfFFCqk+e9+QkGjgetaJ/oXH
	05F6917jjGgSafE6R5GQCTRhPs1w8xL3oWZV4VSJTDk99JXMpSO/X80TOCCnRg4eZbxe
	0BEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=lxSM3SyWg34z43vEEYZ1UzfUjPNiIL0GUng91GaF2y0=;
	b=ljBWDAoVMJAXGeyQ+laFP3Ben+ThRweBszTqqyTLl/WT0T5i/4IyuxpfxS4EUcRLb8
	JUNzUxxQ/Ly5byUzxwUAiDd45s86mkaP03DPLKOf6Qh8m6JzFiY8jKTVjBzkIp3PxGE7
	V+CGcpjgNSYKeyI8vC4aafMPI52yOyqOcHAVDOiKIAEKZy/psLz8QMX8f9l9uKzBQ5vq
	6b4ZHVc7mA0vsgW9r0996LUpuPVphPNvz02Gl/k6zxOwuECBZ9lKRB6c2mFLBfVMezCP
	xKhlLu8Shb4+d1c+H8ehIaRsQ8VDj9kGP+1P5XjCi0GfDXwXZbvuHIKrzv8fsQiPKGtg
	jVUw==
X-Gm-Message-State: AEkoouvMMqKYTAGwXNydGCyTK+OJdt3wr79wkHkc4GHMbAMrAhXuJlavzUdRULhsuZ7jn0HdEP12t1H8vSMhgf5B
X-Received: by 10.107.135.142 with SMTP id r14mr106006389ioi.133.1470687712260;
	Mon, 08 Aug 2016 13:21:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.18.17 with HTTP; Mon, 8 Aug 2016 13:21:31 -0700 (PDT)
In-Reply-To: <CAFSKS=M=upTtm_zeHwVAvoka7JQm5h3oDxt1E5Odt6+7xe1CEg@mail.gmail.com>
References: <cover.1470672689.git.george.mccollister@gmail.com>
	<20160808180536.GP8521@denix.org>
	<CAFSKS=M=upTtm_zeHwVAvoka7JQm5h3oDxt1E5Odt6+7xe1CEg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 8 Aug 2016 21:21:31 +0100
Message-ID: <CAJTo0LZBUsQ4qagTYWRwRAKoEoiH44-wGe4NBQFWBsEGOPRRmA@mail.gmail.com>
To: George McCollister <george.mccollister@gmail.com>
Cc: =?UTF-8?B?TWFyZWsgVmHFoXV0?= <marex@denx.de>, Tom Rini <trini@konsulko.com>,
	OE-core <openembedded-core@lists.openembedded.org>,
	Andrew Bradford <andrew.bradford@kodakalaris.com>, "Dmytriyenko,
	Denys" <denys@ti.com>
Subject: Re: [PATCH v2 0/5] kernel-fitimage: Add initramfs, x86 support
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
X-List-Received-Date: Mon, 08 Aug 2016 20:21:52 -0000
Content-Type: multipart/alternative; boundary=001a113eccbcaa47850539952ae7

--001a113eccbcaa47850539952ae7
Content-Type: text/plain; charset=UTF-8

On 8 August 2016 at 21:16, George McCollister <george.mccollister@gmail.com>
wrote:

> I'm surprised it wasn't accepted when it was a single patch. At this
> point I don't know what's keeping it from being accepted since I
> haven't received any feedback. I suspect whoever is maintaining OE
> core doesn't have time to look at it.
>

Yeah that's pretty much the case.  It's now in my staging - thanks for
rebasing and incorporating - so assuming the reviews from Denys etc are
good then it should be in master soon.

Ross

--001a113eccbcaa47850539952ae7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 8 August 2016 at 21:16, George McCollister <span dir=3D"ltr">&lt;<a href=
=3D"mailto:george.mccollister@gmail.com" target=3D"_blank">george.mccollist=
er@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":1sx" class=3D"a3s aXjCH m1566bcd67462def5">I&#39;m surprised it wasn&=
#39;t accepted when it was a single patch. At this<br>
point I don&#39;t know what&#39;s keeping it from being accepted since I<br=
>
haven&#39;t received any feedback. I suspect whoever is maintaining OE<br>
core doesn&#39;t have time to look at it.</div></blockquote></div><br>Yeah =
that&#39;s pretty much the case.=C2=A0 It&#39;s now in my staging - thanks =
for rebasing and incorporating - so assuming the reviews from Denys etc are=
 good then it should be in master soon.</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a113eccbcaa47850539952ae7--
