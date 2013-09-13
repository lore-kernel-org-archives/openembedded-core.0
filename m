Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ie0-f178.google.com (mail-ie0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 950F460FD5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 20:46:54 +0000 (UTC)
Received: by mail-ie0-f178.google.com with SMTP id to1so3675329ieb.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Sep 2013 13:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type:content-transfer-encoding;
	bh=jiCwZHj9qvTKVJivQtlEHq4t9P/Az1KUD5LTIpzs8dE=;
	b=ezJi2ILY6ZbNKkkEE+z5vCaQ0Vlvs+D1Y/R7WzdJ9hQ5od8iHhmygCv48qMQu4BiCu
	bfX3zqZ+TityDHtBhRem/KNL+uJ2mUWy7406zIi7RCbVWYwizEeHsQcHPkkUbS0OxeB7
	8yLAjV7+ITc6jqnedR8/bAQRtjKPQPdIsKS2gkseIo9v2/A8Z6PIaA0TiVitF5jYMbig
	e3v4i4K5liWJMEOUgTbNuWfAZd3NoEq+2CadO8Td22Mp9IAhm0DzyvhghdUuIyjDwshN
	KAMyimNeYD7H5FORSK9Pqj2lXFvV803Gf7xfDIrAX/0fJZm0iAf+BNZ40J71aawQ9Zk4
	vVSA==
MIME-Version: 1.0
X-Received: by 10.50.114.168 with SMTP id jh8mr2044256igb.6.1379105216437;
	Fri, 13 Sep 2013 13:46:56 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.64.20.229 with HTTP; Fri, 13 Sep 2013 13:46:56 -0700 (PDT)
In-Reply-To: <a8748357e163efb38b354d4142293393c2a2cc9a.1379100075.git.anders@chargestorm.se>
References: <cover.1379100075.git.anders@chargestorm.se>
	<a8748357e163efb38b354d4142293393c2a2cc9a.1379100075.git.anders@chargestorm.se>
Date: Fri, 13 Sep 2013 17:46:56 -0300
X-Google-Sender-Auth: Q1EeTUHDbxQzAAenlD8Qwg1Duok
Message-ID: <CAP9ODKoNGpYvW6zyzSA3gtF8cbbP7p9DmJcmmqppv4y4s6=5YA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Anders Darander <anders@chargestorm.se>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] u-boot-fw-utils: reinstate target recipe for fw_printenv
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
X-List-Received-Date: Fri, 13 Sep 2013 20:46:55 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 13, 2013 at 4:21 PM, Anders Darander <anders@chargestorm.se> wr=
ote:
> The latest upgrade changed u-boot-fw-utils to u-boot-fw-utils-cross, whic=
h
> removed the on-target fw_printenv (and fw_setenv).
>
> Re-create the updated version of the u-boot-fw-utils recipe.
>
> U-Boot does try to strip the fw_printenv binary by default now. To avoid
> this, without patching the Makefile, we add HOSTSTRIP=3Dtrue to EXTRA_OEM=
AKE.
>
> The new U-Boot do also require us to configure the build for a specific
> machine, thus we change the package arch.=A7
>
> Signed-off-by: Anders Darander <anders@chargestorm.se>

I think this is the best way to handle this for Dora; for 1.6 (I will
prepare the patches when updating to 2013.10) I think we ought to
squash this into u-boot build so it is done all in same build process.

Thanks for fixing a regression introduced by me.

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

--=20
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

