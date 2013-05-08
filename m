Received: from mail-ob0-f173.google.com ([209.85.214.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <erik.boto@pelagicore.com>) id 1UZxb3-0003Gw-FZ
	for openembedded-core@lists.openembedded.org;
	Wed, 08 May 2013 08:12:39 +0200
Received: by mail-ob0-f173.google.com with SMTP id 6so1380340oba.18
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 22:53:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=p8iERp1k/GjBNwKsNjyckempWRla0bzoZBtJGu6IP4M=;
	b=IZ3Cb75/65eas6G1AxWBJFCWFTbQrn/YsUjKEj1HY7c3URmkV1TTG8EI4FqMvaJkWi
	UOTc0zSGqnO/gH3qYGLiS57X/Wb15HJBrTPXt6CaqyOFXyRCIPC/cyqWYH5V/BBtmgnk
	CbwmtdaX8wiRaa3VJsMsLyPheVFvrVTmpJmhz88fu3strf3vRr7l+IIW6d0HqwpayRUQ
	bw781zAGRSJaeyANwl7SzRREgnXWHt4pP2mg9/+WHUo8Iu1Gsq7FyNshFLxbTedXiWB+
	ZMxdfZ4Zor0MhQ91xsXAizBwHGR7J/NbGlL0P1nCcQybZAdwdvs3HJQXoGwD/UBKrpi5
	iM+A==
MIME-Version: 1.0
X-Received: by 10.182.129.230 with SMTP id nz6mr1556451obb.49.1367992402791;
	Tue, 07 May 2013 22:53:22 -0700 (PDT)
Received: by 10.76.141.6 with HTTP; Tue, 7 May 2013 22:53:22 -0700 (PDT)
Date: Wed, 8 May 2013 07:53:22 +0200
Message-ID: <CA+AhUGxD7Taf2RhuoAp7FF=wfWWJnPSi7_o6fSZZiNMq-u0vgA@mail.gmail.com>
From: =?ISO-8859-1?Q?Erik_Bot=F6?= <erik.boto@pelagicore.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQnG+3LN63j+HvkIlMCL3z/jmqasV7JwRT/ukaKJlIUB9AOFd5UwU01k7Y6OYK/H7upKJVJ/
Subject: [RFC] bbclass for automatic generation of binary recipes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 08 May 2013 06:12:50 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hi,

Background:
If you use OE to build software which includes e.g. a closed source
library, but still want to others to be able to build software based
on that library in a OE environment you would have to create recipes
that contains a binary version of your library + headers manually.
This would have to be done manually for each package, and as the
development of the library continues the binary recipes will have to
be manually updated to keep in sync.

Idea:
Create a new bbclass that handles this automatically as much as
possible. The basic idea is to:
- Create a tarball of ${WORKDIR}/image/ alternatively
  ${WORKDIR}/packages-split/
- By parsing the "source recipe", create a "binary recipe" that uses
that tarball

The binary recipe should work as a drop in replacement of the source
recipe. This means that the other recipes depending on the closed
source software shouldn't need to be adapted to work with one or the
other.

I'd like feedback on whether you think the idea is feasible, and if
you think it could be useful for others. And anything else you think
of.

Cheers,
Erik Bot=F6


