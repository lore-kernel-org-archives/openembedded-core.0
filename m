Return-Path: <anders.darander@gmail.com>
Received: from mail-vb0-f50.google.com (mail-vb0-f50.google.com
	[209.85.212.50])
	by mail.openembedded.org (Postfix) with ESMTP id 818096C722
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Sep 2013 05:07:35 +0000 (UTC)
Received: by mail-vb0-f50.google.com with SMTP id x14so5031357vbb.9
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Sep 2013 22:07:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=7ojvMSD0RjJYpa6lrmCYtVFVrJnIOHZpqPZTDEWt7sM=;
	b=cnVU4YNflAf9fnB1DPIwNoiX4vOf6WE6EDT6hg8gqYIWqv/jFTrp5dszBiMWwvU+or
	guYbQbczrLbnHS8J6Pc16r46DBOX/qsYkhttdy20NAUIw/fQsDTIcU4KTlo701hCKgbB
	XCiXlg3V/sXOuOvQt+RCewRvvjybuYdwR0WE7xpuNQUiX/05cqnuwtmEGP1Cj6ZuIhxa
	ijhDzi4pApj00CHgob9EYpExvdo2isxq4V5rNPZah7/3HDhRAxwBqIbrMtrMXoutlJ0Y
	kpp4na5X4gB+aBqX5Nmm5zyko+4W1fEFg27cA/PO1XsZeN58NHad6wRuV7n6qWqDXFOu
	04Tg==
MIME-Version: 1.0
X-Received: by 10.52.113.99 with SMTP id ix3mr12245059vdb.22.1379480857325;
	Tue, 17 Sep 2013 22:07:37 -0700 (PDT)
Received: by 10.220.104.143 with HTTP; Tue, 17 Sep 2013 22:07:37 -0700 (PDT)
In-Reply-To: <1379475258-21205-1-git-send-email-otavio@ossystems.com.br>
References: <1379475258-21205-1-git-send-email-otavio@ossystems.com.br>
Date: Wed, 18 Sep 2013 07:07:37 +0200
Message-ID: <CAE4k23-9zpfexc+eeyLaEYyhm+Bfp-G5ZqQbb+pKi2RmqUFXmA@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot-fw-utils: Skip package if UBOOT_MACHINE is unset
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
X-List-Received-Date: Wed, 18 Sep 2013 05:07:35 -0000
Content-Type: multipart/alternative; boundary=bcaec54860f479b61804e6a16afa

--bcaec54860f479b61804e6a16afa
Content-Type: text/plain; charset=ISO-8859-1

On 18 September 2013 05:34, Otavio Salvador <otavio@ossystems.com.br> wrote:

> The UBOOT_MACHINE variable needs to be set so the firmware utils can
> know about some configuration settings which are board dependent. This
> patch ensures the package is skipped in case UBOOT_MACHINE is unset
> thus avoid its build in 'bitbake world' builds for incompatible
> machines.
>
> Fixes [YOCTO: #5223]
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>

Thanks for the quick fix!

Acked-by: Anders Darander <anders@chargestorm.se>

/Anders

--bcaec54860f479b61804e6a16afa
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><br><div class=3D"gmail=
_quote">On 18 September 2013 05:34, Otavio Salvador <span dir=3D"ltr">&lt;<=
a href=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystem=
s.com.br</a>&gt;</span> wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">The UBOOT_MACHINE variable needs to be set s=
o the firmware utils can<br>
know about some configuration settings which are board dependent. This<br>
patch ensures the package is skipped in case UBOOT_MACHINE is unset<br>
thus avoid its build in &#39;bitbake world&#39; builds for incompatible<br>
machines.<br>
<br>
Fixes [YOCTO: #5223]<br>
<br>
Signed-off-by: Otavio Salvador &lt;<a href=3D"mailto:otavio@ossystems.com.b=
r">otavio@ossystems.com.br</a>&gt;<br></blockquote><div><br></div><div>Than=
ks for the quick fix!</div><div><br></div><div>Acked-by: Anders Darander &l=
t;<a href=3D"mailto:anders@chargestorm.se">anders@chargestorm.se</a>&gt;</d=
iv>
<div><br></div><div>/Anders</div><div><br></div></div></div></div>

--bcaec54860f479b61804e6a16afa--
