Return-Path: <vladzouth@gmail.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8ADC26011A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 16:32:53 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id l7-v6so28799104ioj.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jul 2018 09:32:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=lrGxvrGBwSmlNpbwuKIj4JUm8ZRXDyUkwcufjrWtu2s=;
	b=dQNq8kHJt9YIAeC7GO29KLtsLyGXGzqqO8iLafX7Vjccr89t5aunBd09/8i/h8DynR
	SjY6ZzCcBGNsDzNJk8n/QK6ZDraVSkP4VkXB67qhbMtBx8APdjnLDzhiL950YJXFcqGu
	0DdgNKUjBqcFc3u7qXb/WVrq6klzyGKlk7EzUDJd3xf1UYNnZi/HkDfs/0hiumfDn47N
	3kUqx5i82pWDTR5kl/Y/rE3AouwV187sjRsQbJtLYQbVEM/VHGC1gZbDv6YK2C3rzFTn
	MSFIi2P9X7npnXb+8CIGzsYeDlWiclVwSBJ4qsxKgDUFhdHzp0ktHHWf7ESc2Q1XZKRu
	cWjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=lrGxvrGBwSmlNpbwuKIj4JUm8ZRXDyUkwcufjrWtu2s=;
	b=IKX5SMfGgI05064oPgdQG2CYcSYgm4O2oC/69zPC8BWh5BiPMHDrQnnITIvJDnfQNN
	epbv4qWZevEljweIcg5HT38iCn2zEyFe7z3SGULd4nhj9WUaCBJQ/kuP4y22AaVgKGyP
	PxkzJO1f77jB3gAcestRQBJu+ACSGFJ1J4//gLceTEv8vhzrFrww9dTGm9J6Z0cgDzLY
	Wxlppf8QK3SP9CNUo+6yykPnL4X2FuG6clJ3UUTP9Y2tOcIyOXjsw77fyhhKp5r1r/Rt
	aE1hNTQbgcksCPg6UmHdMuJvRnBO6dMq35D13DThdSo/br5QXMvoJStpqVYp9DlqcwBb
	9trA==
X-Gm-Message-State: APt69E2ine/CdtXrXRtdO3HjSK4tkWxIm/T9yc0VCdD9jK2ZrQ81HxkG
	3fFskXxOh5rsh2Ayxt8rWnf5TLmafNwDKgjSeHMV1A==
X-Google-Smtp-Source: AAOMgpeoRQpxw5/LC/W4IrM/Q80bFhwA49Nqsyc9ZkO4kZiQA1L9bX9fsdt6pXChFYHKLyvS6LWFn5H8DUDUwyfe+S0=
X-Received: by 2002:a6b:ed0:: with SMTP id
	199-v6mr28865376ioo.69.1531413174560; 
	Thu, 12 Jul 2018 09:32:54 -0700 (PDT)
MIME-Version: 1.0
From: vlad zouth <vladzouth@gmail.com>
Date: Thu, 12 Jul 2018 18:36:53 +0200
Message-ID: <CACoJdSaG3UefHMXmfOhe0f7-2rHyfr8B7k4-BZ2iG5uKY_5UBA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Building postgresql_9.4.5: Some Packages are missing in my rootfs
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
X-List-Received-Date: Thu, 12 Jul 2018 16:32:53 -0000
Content-Type: multipart/alternative; boundary="000000000000462f180570cfeab8"

--000000000000462f180570cfeab8
Content-Type: text/plain; charset="UTF-8"

Hi,
I am facing an issue about adding postgresql. Here is the recipe files:

   -
   http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/postgresql/postgresql_9.4.5.bb?h=krogoth
   -
   http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-support/postgresql/postgresql.inc?h=krogoth

In fact, when i build an image, all the packages included into this recipes
are present in the postgresql image directory but, for example all the
program added by the variable FILES_${PN}-client are not in my rootfs.
For more precision, i use fsl-community-bsp project and krogoth distro to
build an image for the tx6s-8035 karo board.

Anyone who has faced this king of issue?

Best regards,
Vlad

--000000000000462f180570cfeab8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I am facing an issue about adding postgresql. Here=
 is the recipe files:</div><div><ul><li><a href=3D"http://cgit.openembedded=
.org/meta-openembedded/tree/meta-oe/recipes-support/postgresql/postgresql_9=
.4.5.bb?h=3Dkrogoth">http://cgit.openembedded.org/meta-openembedded/tree/me=
ta-oe/recipes-support/postgresql/postgresql_9.4.5.bb?h=3Dkrogoth</a><br></l=
i><li><a href=3D"http://cgit.openembedded.org/meta-openembedded/tree/meta-o=
e/recipes-support/postgresql/postgresql.inc?h=3Dkrogoth">http://cgit.openem=
bedded.org/meta-openembedded/tree/meta-oe/recipes-support/postgresql/postgr=
esql.inc?h=3Dkrogoth</a></li></ul></div><div>In fact, when i build an image=
, all the packages included into this recipes are present in the postgresql=
 image directory but, for example all the program added by the variable FIL=
ES_${PN}-client are not in my rootfs.</div><div>For more precision, i use f=
sl-community-bsp project and krogoth distro to build an image for the tx6s-=
8035 karo board.</div><div><br></div><div>Anyone who has faced this king of=
 issue?</div><div><br></div><div>Best regards,</div><div>Vlad</div></div>

--000000000000462f180570cfeab8--
