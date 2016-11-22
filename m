Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f175.google.com (mail-qt0-f175.google.com
	[209.85.216.175])
	by mail.openembedded.org (Postfix) with ESMTP id AE61860125
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 11:42:51 +0000 (UTC)
Received: by mail-qt0-f175.google.com with SMTP id w33so8788609qtc.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Nov 2016 03:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Jx9Tn5DsnIaz/pSJTRO6S0VAPOx+c6JqVTFuVsVzaEc=;
	b=u5vCjN1SuCaJlPhSHuhB6FEFShWDrHU8Q9f9/nPANDSt33F4Gg3hp494jkIpPr1TPn
	U+6Zk0NKnRc6/xS1ZQIOrY7OadpZ3eiH11bPIs2sgcp5ggI06q/XEk8hKrIz5TX+uMLc
	c2GRQrBEg4rFeS5dB9sgRTAZUsS5eamGAeMy96s5esvq8byoF4LHeXizC5a+H1u5pKJc
	VuM17w5hrBLRzHmNBpySZFVUeTaLwwqLz/J10oGitOlnUrR3k6HJVnPzL0JqeCX+bvDy
	Fww5pKBHnG12+F+T2IBARfGpIeaH/nKKAPPuEoQGr9RIkhdavCjazkcpeOyPG7l/FZHL
	bxDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Jx9Tn5DsnIaz/pSJTRO6S0VAPOx+c6JqVTFuVsVzaEc=;
	b=c0yHJjNSx1BuJbPvuGs0YYSS2D8XWqw5GJhYF1DWd31Ex0aVBQm+zcdPYPs0d7ps9c
	cxu76uow3j2qDSZpx29lvDb9vKpssEPL7wsmE+2r1KzwPeP2u7E5YCF3uDc5FHY+yOWE
	stcDZbY33sgdDWV2OFo85IqyGoJPtVe+OgVO/0Y/Dt2898/vkySrjE1tBLyeU2lfHjKm
	zSUqcO6vHq2nC29dz5AP6DKVnEZ1heAKQ2hTZX4GGM/V6Cu3SfPd7zkVOF2lW1g3u1dh
	waHDOMz0I/xPV8/dyMj/2MAMmPHGN7ncYJeCUhoADj1C+yAou3J8qZ+UiexaUPzGRD+Z
	JpWQ==
X-Gm-Message-State: AKaTC03fgPVGWFUn74NRDkgyZILnBguDgFHpzGjwrrewOlmAEO/94UC42cG2+vR9h5Zi44Go8YP6Zc2TfI+n2zEo
X-Received: by 10.237.49.230 with SMTP id 93mr10871194qth.109.1479814972621;
	Tue, 22 Nov 2016 03:42:52 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.85.136 with HTTP; Tue, 22 Nov 2016 03:42:32 -0800 (PST)
In-Reply-To: <CABcZANmqH9gEhO67-9_0fEinU6FhMxRsgaC0hcVrkxd9_cH1HA@mail.gmail.com>
References: <1479296396-724-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
	<CABcZANmqH9gEhO67-9_0fEinU6FhMxRsgaC0hcVrkxd9_cH1HA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 22 Nov 2016 11:42:32 +0000
Message-ID: <CAJTo0Lb9cJk5Qos0CLkvvrW0QCecVY-0io9rnp1rkHfCZpQrdg@mail.gmail.com>
To: Christopher Larson <clarson@kergoth.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Enrico Scholz <enrico.scholz@ensc.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sanity: removed broken compiler check
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
X-List-Received-Date: Tue, 22 Nov 2016 11:42:52 -0000
Content-Type: multipart/alternative; boundary=94eb2c1251e2c6e09a0541e2458d

--94eb2c1251e2c6e09a0541e2458d
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 22 November 2016 at 03:22, Christopher Larson <clarson@kergoth.com>
wrote:

> Is there a reason check_app_exists() wasn=E2=80=99t fixed to handle symli=
nks
> instead?
>

Agreed, the check should handle splitting the argument and links, instead
of removing a key sanity check.

Ross

--94eb2c1251e2c6e09a0541e2458d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 22 November 2016 at 03:22, Christopher Larson <span dir=3D"ltr">&lt;<a h=
ref=3D"mailto:clarson@kergoth.com" target=3D"_blank">clarson@kergoth.com</a=
>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"gmail_e=
xtra">Is there a reason check_app_exists() wasn=E2=80=99t fixed to handle s=
ymlinks instead?<span class=3D"HOEnZb"><font color=3D"#888888"><br></font><=
/span></div></blockquote></div><br>Agreed, the check should handle splittin=
g the argument and links, instead of removing a key sanity check.</div><div=
 class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div=
>

--94eb2c1251e2c6e09a0541e2458d--
