Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f53.google.com (mail-pg0-f53.google.com [74.125.83.53])
	by mail.openembedded.org (Postfix) with ESMTP id B8C6671B31
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 15:54:52 +0000 (UTC)
Received: by mail-pg0-f53.google.com with SMTP id b11so7140077pgn.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Oct 2017 08:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zSuAJFWjKtIlU2n/hAIBxsr6U/4NaxCXsW2l2ihMlNU=;
	b=HVz8bJgBFamEpHKy52c/PfJIxRy93iazdfFrk5S6zvbZs41imzIkj/7+7Z+Qp7H6VZ
	SFr1UA6SgxwfL1eStnS98pRQsNX/vH36mEwUQozWYajev8H5lvWYGtVsNMptee/nb/1U
	BqeIq6GggO8ZwJy3jEOWKy+mY2tl7VdaFhOAB6j8XRMH2h5DJyog0MFgYbB6djV1c77w
	n68tzv4ZUyd4eV5+4czpGHOlTvsk6CX5gf2AXsfAsZFY5mk+ruvy96PECHN0HmiLTmRC
	rwXuDI5ybwYWrj0JlIEp6bx10FVFQdvCRmvPxjvSa3E4v1wqijmaWDXuMdHRyOLCzgTU
	AqLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zSuAJFWjKtIlU2n/hAIBxsr6U/4NaxCXsW2l2ihMlNU=;
	b=kMIMyDczWED0xA+XFWoa/OwoXu4oioUJKWaAv3syqMnHSRl4ScdqtMrwJVH3MpMWVa
	nk0/mta610eJprL1exKh92g2OyJzzzbvCwLYg5/67qC/9VQlaAO7ojlv+B+OB/5TQKYL
	w4pIJ9DKtCwwmywpkqJ0rvO2AjPwIYMyZRoObKDlC6SAa1dDeJ5+I2IpytQII4rEulYI
	Rjy1Ae0bJQn8uskrNYVXxyKRgDmv20boC5kb34ZKhMF8SIBDuyIGUCzUl1VP72S13LZk
	IWGrg/WX/jjgCRyyL3YHC1s/nIyNTIGMtK/aRv6DctcyZ9OOv+cJQaciCKbVKdqpK2yJ
	IfYg==
X-Gm-Message-State: AMCzsaUxqZdY+13sjN2agnFQtGG9tPm0LguDgaSvbKiiWC6rzjRHMuTh
	ObeSZFJAqR/zn6UccXj71ifa6Y/nv2a5Cw5ZXi8=
X-Google-Smtp-Source: AOwi7QA5r+Pt6MN9qzHAGRtjGBLc7RCSOkvPF4rclXlVMgsQiiNXNX2qE0d9T0aVtZ+fp8NpA1QvRngcVW2qqNyYVfA=
X-Received: by 10.98.150.149 with SMTP id s21mr9067801pfk.151.1508169293352;
	Mon, 16 Oct 2017 08:54:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.100.187.66 with HTTP; Mon, 16 Oct 2017 08:54:22 -0700 (PDT)
In-Reply-To: <6E51916E4A1F32428260031F4C7CD2B611A2BC51@ORSMSX112.amr.corp.intel.com>
References: <1507922643-81187-1-git-send-email-juro.bystricky@intel.com>
	<CAMKF1sq-CjSGt36V=B5yjg+diaAMFkH8h-N29t4uMuXNV8_qyA@mail.gmail.com>
	<6E51916E4A1F32428260031F4C7CD2B611A2BC51@ORSMSX112.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 16 Oct 2017 08:54:22 -0700
Message-ID: <CAMKF1sps3+LLw9=rcxM1xNAgvQsd-VJcS4sJ98BVaZ=QYUH=qg@mail.gmail.com>
To: "Bystricky, Juro" <juro.bystricky@intel.com>
Cc: "jurobystricky@hotmail.com" <jurobystricky@hotmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] nettle-ptest: fix a failing test
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
X-List-Received-Date: Mon, 16 Oct 2017 15:54:52 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 16, 2017 at 8:48 AM, Bystricky, Juro
<juro.bystricky@intel.com> wrote:
> I don=E2=80=99t think you can use LD_LIBRARY_PATH due to the hardcoded re=
lative path
> in "../libnettle.so=E2=80=9D.

It should look in paths relative to LD_LIBRARY_PATH, do you see it
doesn't happen ?

>
> I could, however, change the  patch from "/usr/lib/libnettle.so" to
> =E2=80=9Clibnettle.so=E2=80=9D, removing any paths.
>
> That way LD_LIBRARY_PATH can be used if needed. But in the end it will lo=
ad
> the library from /usr/lib/nettle.so anyway.
>
>
>
>
>
>
>
> I think it would be preferred if you could use LD_LIBRARY_PATH to search =
for
> it
>
>
>

