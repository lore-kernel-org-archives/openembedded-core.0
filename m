Return-Path: <sakoman@gmail.com>
Received: from mail-ob0-f179.google.com (mail-ob0-f179.google.com
	[209.85.214.179])
	by mail.openembedded.org (Postfix) with ESMTP id D4D10621CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Jun 2013 03:19:51 +0000 (UTC)
Received: by mail-ob0-f179.google.com with SMTP id xk17so9368728obc.10
	for <openembedded-core@lists.openembedded.org>;
	Sun, 09 Jun 2013 20:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=ikpgthgs0i178EcS9PuoEobQGhwD48bzHXjsdNeEEVE=;
	b=bghR94hLw1jPROYv2Tgb9ZnWEnlTYTBnipResS/d1Vsd5JVgCkoJjYv7UR8LIcMj/9
	jCN9FlFpM41N+C844W9zJmRY3HfOwI+KVi149olOrRroPzOkkmHXwNYggCxB7XFXiuOm
	LbieIAlS4ALTZ+TZV4WRFouiw5gvGR3NZFpqtiQedtbj/cf9d6VQZkZGmEfTJhEYZqfZ
	P+j4glpmZ/GhGyu+FD/Rqm8iyAgtj46t/XgOVe/TSqYgAt/Qr3eEkzlN4nm/DtXWf7zL
	v3GzqUinKugaEXS5mVZpN3l+ejhsKqxCEpBM6wJLU69xpOPVt2KL9vcR1WBXNAgUNuc2
	EYLw==
MIME-Version: 1.0
X-Received: by 10.60.40.36 with SMTP id u4mr6287285oek.93.1370834392484; Sun,
	09 Jun 2013 20:19:52 -0700 (PDT)
Received: by 10.182.213.130 with HTTP; Sun, 9 Jun 2013 20:19:52 -0700 (PDT)
Date: Sun, 9 Jun 2013 20:19:52 -0700
Message-ID: <CAGDS+nnQjF9P9s61--FW+_1gs_-qbcugmKt7-xd2i6gwkVFpRw@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: qt4e-demo-image with meta-fsl-arm: successful build?
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
X-List-Received-Date: Mon, 10 Jun 2013 03:19:52 -0000
Content-Type: text/plain; charset=ISO-8859-1

Has anyone successfully built (and run!) the qt4e-demo-image with meta-fsl-arm?

I tried a build for a machine based on imx28evk and get a broken image
(i.e. demo fails to start at boot):

QIconvCodec::convertFromUnicode: using Latin-1 for conversion, iconv_open failed
QIconvCodec::convertToUnicode: using Latin-1 for conversion, iconv_open failed
Unable to load library icui18n "Cannot load library icui18n:
(libicui18n.so.36: cannot open shared object file: No such file or
directory)"
qtdemo: cannot connect to X server

Before I dig in and start debugging I thought I would check to see if
anyone else has had success with this layer/machine combo.

Thanks!

Steve

