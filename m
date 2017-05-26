Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 178A97827A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 14:12:12 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id d127so22089599wmf.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 May 2017 07:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=MtKlCSR1gPjr7ON0V2LkClWYuIBQZs06SZGMclremUg=;
	b=Xys5L82lAp3NNQp5feuQu6w7mSGNrvCDgSLQMMFZfYCNafLsNb9TgJ9Z8MmTVK1oy4
	ahjR41Bt43KaUd91L3TBj17Q49OXEuPoQBI0tsY8Fmfp8025J+Gn/5GNBJWTjTaxxvCv
	HP6fpcw93vkILq+Une3mEZ0yr9EAx6HnR5zbHrY/I/XHWq+Z4iup4QoT1yp7DpESSiKy
	SacEGUgoWaYy5I9aysRtq0VGQ/o6oD91z4VL+r+quYCSPFIm5aFIZfPzKEDemMjR5hMd
	SygWCZaDffFqq5haUSm2wEo7+2Qtcs/fR6phAKTPdV7xXi2P3L8tliPF24mLrDJxmhwF
	xWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=MtKlCSR1gPjr7ON0V2LkClWYuIBQZs06SZGMclremUg=;
	b=Tj7y31cLKdwwANcXD0lzuQpud2t5pf344Vx6S2PfKg5CDEJajcsmJngJK3kMp9c4IG
	//yESarAIwgHyJ27d2Jo8GzxYml3WWVlJqN/eiD5rB0RcdZMDrTD06f+6Cle1OJPPoQW
	OR+f0e6k6VXTBpLmE8J05ahg7XiXAU2LmgmFeP1WB7gAy1Slkxv7U0w8DhdEiMnoePYK
	o3+RLDVtISObXCWBOaSplgF4cV1afpCuQriJpBSYrLChHApKJV1j8PM+KlbTOSBmkvki
	5QSQ+YCgUW6MEgtgyGI4HO37+G7TTy7b93WOMNwhlZYDh5qFTR8jhxwUe7c3mdJIzo3u
	lSuw==
X-Gm-Message-State: AODbwcBjKEBwQ0z6XKInurS4mr4VgiAoeaSbU0TWf28ERaLTB0HhoJMT
	BPr/xGX3TaRVr6/ROXw7pQxAIDH7lw==
X-Received: by 10.80.147.195 with SMTP id o61mr2570556eda.178.1495807933818;
	Fri, 26 May 2017 07:12:13 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Fri, 26 May 2017 07:12:13 -0700 (PDT)
In-Reply-To: <CAJTo0Lbhw_Rmds0A636rBwxgy1Gzj7=9AWk2ks+7T1-5Jou8bQ@mail.gmail.com>
References: <20170525144732.15447-1-raj.khem@gmail.com>
	<CAJTo0Lbhw_Rmds0A636rBwxgy1Gzj7=9AWk2ks+7T1-5Jou8bQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 26 May 2017 07:12:13 -0700
Message-ID: <CAMKF1srF24xs81YzedkuNTkv+RY7sem5oaeDfek_caYgvvNxGg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-perl][PATCH] meta-perl: Make glibc-gconv deps apply for glibc based systems alone
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
X-List-Received-Date: Fri, 26 May 2017 14:12:13 -0000
Content-Type: multipart/alternative; boundary="f403045c8ff08c2e3d05506decd5"

--f403045c8ff08c2e3d05506decd5
Content-Type: text/plain; charset="UTF-8"

On Friday, May 26, 2017, Burton, Ross <ross.burton@intel.com> wrote:

>
> On 25 May 2017 at 15:47, Khem Raj <raj.khem@gmail.com
> <javascript:_e(%7B%7D,'cvml','raj.khem@gmail.com');>> wrote:
>
>> musl does not provide separate gconv packages
>>
>
> Wrong list :)
>

Ah


>
> Ross
>

--f403045c8ff08c2e3d05506decd5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<br><br>On Friday, May 26, 2017, Burton, Ross &lt;<a href=3D"mailto:ross.bu=
rton@intel.com">ross.burton@intel.com</a>&gt; wrote:<br><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D=
"gmail_quote">On 25 May 2017 at 15:47, Khem Raj <span dir=3D"ltr">&lt;<a hr=
ef=3D"javascript:_e(%7B%7D,&#39;cvml&#39;,&#39;raj.khem@gmail.com&#39;);" t=
arget=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div>musl does not provide separate gconv packages<br></di=
v></blockquote></div><br>Wrong list :)</div></div></blockquote><div><br></d=
iv><div>Ah</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D=
"ltr"><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross<=
/div></div>
</blockquote>

--f403045c8ff08c2e3d05506decd5--
