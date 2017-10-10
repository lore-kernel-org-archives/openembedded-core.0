Return-Path: <ross.burton@intel.com>
Received: from mail-it0-f42.google.com (mail-it0-f42.google.com
	[209.85.214.42])
	by mail.openembedded.org (Postfix) with ESMTP id 74CF5607A5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 16:28:46 +0000 (UTC)
Received: by mail-it0-f42.google.com with SMTP id 72so3256048itk.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 09:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=uOC79otZxuOt8enI0/q6kbSplW46URzeN8yErAuW3aQ=;
	b=w7E7vdF1dzmq/Dq+SeJGfSek6IL9Nf0lW7duxn6ZCNiiFqsU8sNUf8PS7KVpbUOmDQ
	DkF+RpynH2hl9boJrI1FO7NQVFTnJnvKeVqX4OiHJmaSHkOMHH81EFZSL9i8bG7sk/XF
	wBMiiL/WuxlpE46xTTWLjdcddDP2wFUAZ2HCs+tRlTycCkIzjyN3itKZG2bk2HScYxgY
	yz41A4/gZpbZmIqeLWFqsisorhbPnKND6I8s8prUGDeTbP4rp4VKqTDKPN5OUCQmIwSi
	N1nJK9aFQ0hfkd6xaYY9R19M55WcbpVeF3uwkwmGPKinZcO4h44oNeSDZzQEO4QlHNoa
	bW8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=uOC79otZxuOt8enI0/q6kbSplW46URzeN8yErAuW3aQ=;
	b=kT9IXK9/i6nQ015H+PBKxmnF3H3o+syNu4vMPAgMqj1G209+UPLNb0VKQY7mCXtW/Z
	pcC0S9GXBj8b269EV0PFgYSy8Y25OVF4y7qe97TjrkyI5npWxEPy0K0kM50/FAXJ5224
	N98706VoQj31D8pKK4SpE4ukzMpwpj1Cc/m6tPIMxpSRSfu0FBF7V32IICTjnsxF4qSl
	+FScuw1sVdeNdGDEaQlY7UOgDDKmJUPmGnwZwmGa7f7fT9mPH+PBlWI6VH/TUMxlt4v3
	+RdbSMd2vC1/Kazi58p+KfESaMjsmZ5S0DszDJwjw/j05YfMPl73kw53y7XzytxCd5aT
	YtWw==
X-Gm-Message-State: AMCzsaWPow7uhW+dR+o5YzhtuXRhyO0IV6hQeTNEDFxDGt2JUFd8wxLn
	omBF9JGSV92Mkx78Ye+2T6vCFLGr4NahfOZonB2A6g==
X-Google-Smtp-Source: AOwi7QB7Kj0CtgfXYslNDiWfJTBgzbWRQjydts6yFfcV7xJXL6x01BDOH9TqpU1eAWyDl94gxMEj6o3yFv2DjkifO0g=
X-Received: by 10.36.150.4 with SMTP id z4mr20316499itd.48.1507652928352; Tue,
	10 Oct 2017 09:28:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.205 with HTTP; Tue, 10 Oct 2017 09:28:27 -0700 (PDT)
In-Reply-To: <1507633512-30719-1-git-send-email-matt@madison.systems>
References: <1507633512-30719-1-git-send-email-matt@madison.systems>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 10 Oct 2017 17:28:27 +0100
Message-ID: <CAJTo0LagJFdtet2W7QGyGUcr19=z+q2mk4yNY64QNuCZDmcFaQ@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] go: update to go1.9.1
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
X-List-Received-Date: Tue, 10 Oct 2017 16:28:47 -0000
Content-Type: multipart/alternative; boundary="94eb2c07ea983d83da055b33cd1e"

--94eb2c07ea983d83da055b33cd1e
Content-Type: text/plain; charset="UTF-8"

On 10 October 2017 at 12:05, Matt Madison <matt@madison.systems> wrote:

> +PV = "1.9.1"
>

Surely having a go-1.9.bb which then sets PV=1.9.1 is confusing at best?
Why not just update the checksums and rename the files?

Ross

--94eb2c07ea983d83da055b33cd1e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 10 October 2017 at 12:05, Matt Madison <span dir=3D"ltr=
">&lt;<a href=3D"mailto:matt@madison.systems" target=3D"_blank">matt@madiso=
n.systems</a>&gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D=
"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;=
border-left:1px #ccc solid;padding-left:1ex">+PV =3D &quot;1.9.1&quot;<br><=
/blockquote><div><br></div><div>Surely having a <a href=3D"http://go-1.9.bb=
">go-1.9.bb</a> which then sets PV=3D1.9.1 is confusing at best?=C2=A0 Why =
not just update the checksums and rename the files?</div><div><br></div><di=
v>Ross=C2=A0</div></div></div></div>

--94eb2c07ea983d83da055b33cd1e--
