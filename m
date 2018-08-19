Return-Path: <nickaein.i@gmail.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 9672C65CE8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 11:56:36 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id t5-v6so13436499qtn.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Aug 2018 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=GWodbSxYwb/LfCkvjegym9AhxiaxN10xlaGHv9Qh6q0=;
	b=CaA6DG/Us1420potqaInLmeilJnF8uTsdc25crLYVcgtEi5Aajjil5sG+w7nNjwSvX
	htoEJ+KYgVcp2xiKaoZjmSD5i+WElhsItjmzCquR6hzx+TvLn+r2FKwxfIjXitqvIvsX
	Ol8yoRJYdUWr5xi3heuXBm9K9Y01xMjsRq40MlD0vJaHqmRVAFuJ61w3NAadX7HQgfrq
	P8WQquaMp2l/zQ1s6GSjUy4L8u5kGr856h0dAmDPM+xyBuSPHIc3PtWPcKNfCqUXz0NP
	BojpYd9BaE0pvK2p40FUX0tPWBd4Ch0Zs2nUxiQr8KE8SpIG+sgTGRbNe+6wEMVCOtoz
	G/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=GWodbSxYwb/LfCkvjegym9AhxiaxN10xlaGHv9Qh6q0=;
	b=UQHlDtVEdzwc0te7CntJBW0wZbfc/dVeJTpAfDhWqN1BSdZC5il4fA+SSpf/194T2r
	vkbah6vop83HwACu+ftfum1ALEgS4FP9XKkXdKkHNJaanCPDT5YXFPcDJoHzSBTxUC5H
	sYuCb3jgqWku03aCIUNiTZTVYswO/W+OE7eNwCgI663yRSE0V7mc64SUAfi6TNqN4DzY
	HeZ6jYTYAH+3/SuscPKEhGJOQ16p7POQaCDLprNgooHxAdyXrgzwlHf4qQCG6QlK/+n5
	UqUIV75F3wKeGhRVKGZhsRKvOuEh9qLzUo8g4Z+wP0ugFJHSFYFlKlK0bJMYWw4/CWXt
	csVg==
X-Gm-Message-State: AOUpUlFdrtepiGX2cSWvet2cYXQp3KnXq7x6+7rob7FRk7pYWR/U2rK1
	SHalWay2mc+OKDuyrNUgTN/yrYfZU4hpVGlmrnhZxM3dXIA=
X-Google-Smtp-Source: AA+uWPxyeivVkf+gCul1IBr5TpxrjeqOZPqrKpcdS0rDWePL1mQM+royPQtde2SQt6777u/im+VVrZIAjMnQHwKGRtk=
X-Received: by 2002:ad4:40d2:: with SMTP id
	x18-v6mr19078436qvp.232.1534679797170; 
	Sun, 19 Aug 2018 04:56:37 -0700 (PDT)
MIME-Version: 1.0
From: Isaac Nickaein <nickaein.i@gmail.com>
Date: Sun, 19 Aug 2018 16:24:40 +0430
Message-ID: <CA+NJmkd2gUD6mgzOruaqN8y-upO9BVqt8bKbAd-nzKL4dnJbaQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Specifying incorrect license in recipe
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
X-List-Received-Date: Sun, 19 Aug 2018 11:56:36 -0000
Content-Type: text/plain; charset="UTF-8"

I was in middle of writing a recipe for a library which I wasn't sure
about its licensing. I wondered what if somebody get the licensing
incorrect and submit the recipe to open-embedded upstream.

Since Yocto doesn't enforce the presence of license text inside the
source code (which would be crippling as not all source codes contains
their license), a careless submitter can specify an incorrect license
inside the recipe and just set LIC_FILES_CHKSUM to a README file.

How such issues is prevented in openembedded (e.g. throughout review
of new recipes)?
Who is responsible in the cases that license is violated?

