Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f180.google.com (mail-qk0-f180.google.com
	[209.85.220.180])
	by mail.openembedded.org (Postfix) with ESMTP id 228AC77DD7
	for <openembedded-core@lists.openembedded.org>;
	Tue,  4 Jul 2017 14:31:05 +0000 (UTC)
Received: by mail-qk0-f180.google.com with SMTP id p21so169796126qke.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Jul 2017 07:31:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=n2G99nX7AjqmGhNmRUrHVqQW6Omv/3rH5GRqw3ov2Ek=;
	b=eWblX7bcyThmVlnOoF9jaQLvHGM1pTmU86US1ALmKqK1qu1MJ3nERfewET7vGU4Fax
	f9xyC3f/V17LW8WNnwKgt87UIzJz/E56Yyml1tu1jyv7lfRL7aXdmscMDCAZvg9GTaEo
	tAz3YUIE4zE+W2TvEsBEGUmUrqs4J/0Lj7RjSBAWGPW/RnxW8tuMa6cKOUyZSuAPcuNc
	aC7QYHL6WnXMhINPZDMHk87EGh8EN3U430qJgXggVmYd88wyy7TjLAx3pMNIpfREJh/P
	m8gDayaPRVm0cytFHYDNgnbv7x6uZlwV3mmiurW5b1hR+OnPjhtX0A2ytA4G4QeapiOo
	CZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=n2G99nX7AjqmGhNmRUrHVqQW6Omv/3rH5GRqw3ov2Ek=;
	b=iY6Opz03Xa3gbzUhYpWJIs5stWISwqTKpYKdtkdfshCBZGdMqpxjllt1Cd2pJCOV0u
	VHNssKyrSZgNJtzAt1zMBP93/+juCst5CprxZHtrwM+UQrKhjMphVzTIK3xICSkkqV+5
	SERuN0cFXi9xlS2KXYy/ERKHQBRUiVpyUmV/47fSyzchgY/qbyNtiLc/hLOaeSfC7O1+
	QTyn+dcK6Rl2rETMPyrDY2hNU/0oKHap4zdm90hj6JuBsj3msH+0uC9LKgUIKsOJau4s
	Y0un7mgBMcaeukRd3UAIzg5ew9SQC+iW5coXLUI37jZQOkUrxr9+I05jNdYvYu5/4LZC
	jbeQ==
X-Gm-Message-State: AIVw110RMjJ9i+ITYykBylARc6UyMhwIoIxjsp/18cA3C21HV3WS+cOR
	ZDhMxWyWZcJC+dFFZHqoRLaGXAXWsicm
X-Received: by 10.55.120.134 with SMTP id t128mr18052018qkc.171.1499178667087; 
	Tue, 04 Jul 2017 07:31:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Tue, 4 Jul 2017 07:30:46 -0700 (PDT)
In-Reply-To: <7d41b13be32e4d29bf1a68190793f87c@XBOX02.axis.com>
References: <cover.1497534748.git.pkj@axis.com>
	<4b8a955e4779a8fc3a113947622d09f47e71b00e.1497534748.git.pkj@axis.com>
	<CAJTo0LZ3utZx6+rbKxs2RbjhEVHG1eGMGrX7qSf-s=TB6PwPmA@mail.gmail.com>
	<c1d410c6cb3d4e66bef8b80a78a07267@XBOX02.axis.com>
	<febb07f5-af96-82ba-69c1-46f9c7294b00@linux.intel.com>
	<8b3d9920b9bb447bb6c7574a7ae42b6e@XBOX02.axis.com>
	<55a5ee84-9b57-8f96-5a0f-fd66b495e42b@linux.intel.com>
	<e5fb0af1b0b3455b93562ef4ecc15f12@XBOX02.axis.com>
	<3d43fd13-b3c2-48cd-b8bf-e16ff8f7c9a8@linux.intel.com>
	<1efb5ad739604a94872885a72ec9b4b8@XBOX02.axis.com>
	<1c056ee5-a38f-b79c-1e2f-47bdf8be6fcd@linux.intel.com>
	<7d41b13be32e4d29bf1a68190793f87c@XBOX02.axis.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Jul 2017 15:30:46 +0100
Message-ID: <CAJTo0LYVyHsdR24Vt60U7QjMLmvT1JY1GsZA_tginDNk3LAj8A@mail.gmail.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/11] gtk+3: Update the patches to work without PATCHTOOL = "git"
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
X-List-Received-Date: Tue, 04 Jul 2017 14:31:06 -0000
Content-Type: multipart/alternative; boundary="94eb2c05e5d2e82e0405537ebbf5"

--94eb2c05e5d2e82e0405537ebbf5
Content-Type: text/plain; charset="UTF-8"

On 4 July 2017 at 00:56, Peter Kjellerstedt <peter.kjellerstedt@axis.com>
wrote:

> Ok, I have finally figured out what is going on. The problem is the
> version of patch that is installed on the host. Support for Git style
> patches was added to patch in version 2.7, but on the host where I
> failed to build gtk+3, the installed version of patch is 2.6.1...
>

Good to know!

Thanks,
Ross

--94eb2c05e5d2e82e0405537ebbf5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 July 2017 at 00:56, Peter Kjellerstedt <span dir=3D"ltr">&lt;<a href=
=3D"mailto:peter.kjellerstedt@axis.com" target=3D"_blank">peter.kjellersted=
t@axis.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":2sv" class=3D"a3s aXjCH m15d0ae2b6ba05cf7">Ok, I have finally figured =
out what is going on. The problem is the<br>
version of patch that is installed on the host. Support for Git style<br>
patches was added to patch in version 2.7, but on the host where I<br>
failed to build gtk+3, the installed version of patch is 2.6.1...</div></bl=
ockquote></div><br>Good to know!</div><div class=3D"gmail_extra"><br></div>=
<div class=3D"gmail_extra">Thanks,</div><div class=3D"gmail_extra">Ross</di=
v></div>

--94eb2c05e5d2e82e0405537ebbf5--
