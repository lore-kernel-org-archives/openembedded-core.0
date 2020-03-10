Return-Path: <jupiter.hce@gmail.com>
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
	[209.85.166.52])
	by mail.openembedded.org (Postfix) with ESMTP id DC01661B2C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 09:23:36 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id s24so12030961iog.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Mar 2020 02:23:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=tY8xCJQeIENbkpKdIf8UwhqFnHgMMsqgv87Gi9Vs3vk=;
	b=GUx9Iaya7NnEkngdimgjFjn2SeZJilW1QOXCJ4rL6gVLfhKP8tW1rjEjt+nq4zajYk
	iBd44g4mhcL+Br6zFQcBwh/qdT+4DeD/lXr/HSF9TxS/EJHgnr9PnfrauB4oKZ50gfQh
	1TCkaltJODDSrgH7rnif2W6C2vJxyOYgfbtmDADi6Zf6obV41n5AaYx4ABOOztCymHcr
	EkJ2ooU1WceO6LRnfCjnRjpfH4lYrbRUjZMQKkEvc6a1hN0V9G1Mm0DqSkFOkx/ik+Ac
	W/GtKXdpmL4FjgssrJFw6LItM0XfoM7O2cDVoz+wu5edkKWsbLUah7QmfsD9ZK/9Uk3Z
	pt5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=tY8xCJQeIENbkpKdIf8UwhqFnHgMMsqgv87Gi9Vs3vk=;
	b=mtTrItgKljriva5lADCkkmb2aL5bPgfa3GXpWCyDBAy37+E/KI0VevuchsTBwhwE0g
	t6PowIo+jjCL7zkDIwXbOPhoa8b0zSsyWaYOQne98gkGsFdHBUdfE+/KZfJ0KeeqlR37
	K6i1DvkJ/8NWKS7sqYVSXaF+XwMYHFqpNDxTNOV19tyfemMlW+4QFZa6xcN9e1SA3KUM
	SRBKKPZwoG4YNmgblsE+Oim4ddELbpcwkB7M4MGm3dEBujwj3ObFiU8Ft1vMH51+MpuS
	fud4KdKDjrRuOU7edJV6fzPC3zn2hUcIQpMqpDkA52QWzLFNEAr5Ao2DHB3WU0vl3jTE
	phcg==
X-Gm-Message-State: ANhLgQ3cwiyJSXEe4j/YZXsB5uucnZRoS1OKFxN+zMQzDiF/Ln9sD55d
	qeBXlSlVN8lCkWX/t39kutlVIFxVu1Do3D8477M=
X-Google-Smtp-Source: ADFU+vvEuW/KgMRHhGKD4y9Pld/6VmutvYASZPmYWowCNiMzeaDavIDDSed6TGmd2KZVzZb3C2kTne5iDjqQzWSZXOw=
X-Received: by 2002:a6b:5406:: with SMTP id i6mr11105310iob.188.1583832217860; 
	Tue, 10 Mar 2020 02:23:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac0:ed34:0:0:0:0:0 with HTTP; Tue, 10 Mar 2020 02:23:37
	-0700 (PDT)
From: JH <jupiter.hce@gmail.com>
Date: Tue, 10 Mar 2020 20:23:37 +1100
Message-ID: <CAA=hcWTpbcM=_WCD6eRfD8jbq520R4jo++b=wC0m12d0cEJtQw@mail.gmail.com>
To: Yocto discussion list <yocto@yoctoproject.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: What is the Yocto / OE recipe for u-boot-fw-utils how can append it?
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
X-List-Received-Date: Tue, 10 Mar 2020 09:23:37 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I could not find u-boot-fw-utils recipe from OE git repository, when I
added it to build package, it did build u-boot-fw-utils/1_2019.07-r0
from git://git.denx.de/u-boot.git, but I could not make a bbapend to
it as I don't know what is the bb name.

Appreciate your help and advice.

Thank you.

Kind regards,

- jh

