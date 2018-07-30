Return-Path: <armccurdy@gmail.com>
Received: from mail-ua0-f174.google.com (mail-ua0-f174.google.com
	[209.85.217.174])
	by mail.openembedded.org (Postfix) with ESMTP id 22AF378993
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 21:44:10 +0000 (UTC)
Received: by mail-ua0-f174.google.com with SMTP id k25-v6so8890762uao.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 30 Jul 2018 14:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ESUkG/O9xtYr/Cx0yJ5R185p7AqQEbXlEyhGWJ0ZVXM=;
	b=PWye4SYQflTtFbVuweVV4wcPsY2dMX6TO4kJzTejAFZJAq6jjJJsr7z+By7i0JfE2y
	MXtLPlT8uAwS1yNp5MPXXD8Zlc3R9vvnDXowB4DXNXUa+GZoSQsgjndEYp8pH5poEpPP
	9Z/W56X6DLpQWBCGlS87E/TyiV7sco/IJaCJZ1UdU6wSEXYN6B9SGsCO9LpVCX/0dXQf
	+EKZqOPbDCIL9V8JAJp+ptbzmYekB89+MT8jSWQ6n4eYmeSbfxBRjTkJQM5PpEnj77AZ
	EjujuM/YEu2/3dBz17/4G/ZwR5MY34rlk7TwyLIrCtmbvf+b8XoAq623p5LSGknCuJoq
	Neug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ESUkG/O9xtYr/Cx0yJ5R185p7AqQEbXlEyhGWJ0ZVXM=;
	b=M21LY0mQeBgghgIPqewkt9+R7MTkBwQ/gS3NypzaKxgp2O742AbmwiZz/HZWPPGA+7
	Er8YAwvJ9CjBr7XYUYIzsz4xj+nRWPzBc2R64DHWt1XYF556SuY+bl+Hi1DrcXvhvapS
	Mtds5X9ShhK52ij6fstkNUZ7YOh/NJeSdGetsVFolsPZFhqhXdekxzkJi+HXKrR6v7Kh
	Bmv6S4mP3rIlCZrfk0iYxav4k6/ST4bQTaMdht9tCvsibin9gsiDdinir/TIXleLkw+x
	Tp6Y6Lkd7GRtD82oYS7LmMCqADgjwsmsN284uOo2opK3Wthpv1TVffGdJP5gWnQUSkV4
	v6Dg==
X-Gm-Message-State: AOUpUlGL7Zvz+j4wgglwL3J3HadkD5elLrn9+z2MbqvLEiiPg7xcISMf
	xXol1CnUk5cCP7Pi353x1FM4G98JCf7jWberfRqaw41V
X-Google-Smtp-Source: AAOMgpfqzdKvq71MMfxoQZlGHMhnCNvfL+SRZcOI1uMVzITdz2Qm6Fqu7pJ7IKDZy5EVolfToBPnqTkEwqvh7NHVL0o=
X-Received: by 2002:ab0:6654:: with SMTP id
	b20-v6mr14179232uaq.193.1532987050783; 
	Mon, 30 Jul 2018 14:44:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2a5:0:0:0:0:0 with HTTP;
	Mon, 30 Jul 2018 14:44:10 -0700 (PDT)
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 30 Jul 2018 14:44:10 -0700
Message-ID: <CAJ86T=WuVBc-WEE4+fKSd_qeTKJmd1VTmRGvB03KXqTZvB031Q@mail.gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Is a dependency on hostperl-runtime-native actually useful?
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
X-List-Received-Date: Mon, 30 Jul 2018 21:44:10 -0000
Content-Type: text/plain; charset="UTF-8"

Currently the openssl 1.0 recipe defines a dependency on
hostperl-runtime-native and the openssl 1.1 recipe does not. Both run
"perl ./Configure ..." as part of do_configure().

Since hostperl-runtime-native is included in ASSUME_PROVIDED, is it
really useful for the openssl 1.0 recipe to list it in DEPENDS?

ie is the openssl 1.0 recipe being unnecessarily complex or is the
openssl 1.1 recipe being too simplistic?

