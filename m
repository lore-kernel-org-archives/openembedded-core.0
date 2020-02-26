Return-Path: <ticotimo@gmail.com>
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com
	[209.85.166.45])
	by mail.openembedded.org (Postfix) with ESMTP id 3EA7361879
	for <openembedded-core@lists.openembedded.org>;
	Wed, 26 Feb 2020 05:35:18 +0000 (UTC)
Received: by mail-io1-f45.google.com with SMTP id s24so1996109iog.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Feb 2020 21:35:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=LU1ho9M7adOVF6kBh8kPqNvQ89Fe4TPJwXgVf3kxj5M=;
	b=EHhX3W9dJ35Lt5jyySrwCq7Et6xCSX3dKuHhfEWWayqIMp3SKzbqdqNYhlIiWrdNMl
	tno+dfW8o58+yfpbrJL6sopQl5u2TzYX+Dj2U2QfJfAo/IWOp7r7PDoaVu/69t2UloLB
	OiZah1jmBRbztVxaC1t8GQpE4c8RJbdG9knW764lMELQUOXl+wBOwIp6qfCfc0i9oE/U
	fcMZAC7Yoxrm1L/aDlvO3mG7GYLmmYlnz1L6TrH6mifEni8Oms4Xd6rH/QYTK+7vByby
	fto2TdHSlGok3XqAiqSZu0Oi0ORxmQ4FLPZbhkS8YQ4M9EbsHW0WpgF/b5epMjftYdLM
	1YUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=LU1ho9M7adOVF6kBh8kPqNvQ89Fe4TPJwXgVf3kxj5M=;
	b=MltZV+xXf8jRhvG9R56yjKiHF/YadtXK3rEaWMOB2Dke7zxWaOwXT8tjkpHw4ZPd5C
	1dKM2/jubyjTxOA4oYDwfx3ze2jGLV28P0niLo4kMoUFXAwx6RWHU2HNj4k4GqD9EQgb
	VCE2M8KJD5Isl3CmTtA7L3/EujY2SbNvCYd4twxETPOgLoINCqoEjffpynUN4C2N35Le
	yOzbQ4m8V6uHkmsINR7eyNEbV/FegT3bUE1ObRvJ/k9pUA+1h2e+npipu5fAnPnaub9W
	okfvYMMN4l5NEAPRGisVJcyXMBIhtE5jwwT6MFAo5Z25vEYrSuE6AqC8UX2MvPyDMh1V
	RmKA==
X-Gm-Message-State: APjAAAX7qMHLwjXaenUe3m5s3qF2GLStfz5n6/egdakSZs0JlEWVvQoY
	bZCUS+vwug+i1/C9WJcRLV9lDa7bAJJ55T+SXQQ=
X-Google-Smtp-Source: APXvYqyhFucUirW7/0azr+2qAaUFHhYT4F1phniumKnQpe11I8+Q76DF2JJBm5vCsj3fawwWg2IUV3ZciJPXcKshV9A=
X-Received: by 2002:a6b:b594:: with SMTP id e142mr2503823iof.198.1582695319877;
	Tue, 25 Feb 2020 21:35:19 -0800 (PST)
MIME-Version: 1.0
From: Tim Orling <ticotimo@gmail.com>
Date: Tue, 25 Feb 2020 21:35:09 -0800
Message-ID: <CANx9H-DMHqy=c+UOa4HDzPrtCvhJavrZfD=42CMG8+L48HthOQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Atk, at-spi2-core, at-spi2-atk updates
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
X-List-Received-Date: Wed, 26 Feb 2020 05:35:19 -0000
Content-Type: multipart/alternative; boundary="000000000000543dce059f73f85d"

--000000000000543dce059f73f85d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I have the above recipes upgraded and build tested on qemux86-64. Runtime
testing is less obvious, although I have done some minor testing with
python3-dogtail [WIP] and python3-pyatspi [WIP] on core-image-sato-sdk.

Anuj mentioned he had seen issues with musl, so I=E2=80=99m waiting for cle=
an
build. Since they are all available on Alpine Linux, I=E2=80=99m not expect=
ing
issues.

I=E2=80=99ll send patches in the morning.

I have a strong desire to get these into 3.1.

Cheers

--000000000000543dce059f73f85d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div><div dir=3D"auto">I have the above recipes upgraded and build tes=
ted on qemux86-64. Runtime testing is less obvious, although I have done so=
me minor testing with python3-dogtail [WIP] and python3-pyatspi [WIP] on co=
re-image-sato-sdk.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Anuj =
mentioned he had seen issues with musl, so I=E2=80=99m waiting for clean bu=
ild. Since they are all available on Alpine Linux, I=E2=80=99m not expectin=
g issues.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I=E2=80=99ll s=
end patches in the morning.</div><div dir=3D"auto"><br></div><div dir=3D"au=
to">I have a strong desire to get these into 3.1.</div><div dir=3D"auto"><b=
r></div><div dir=3D"auto">Cheers</div>
</div>
</div>

--000000000000543dce059f73f85d--
