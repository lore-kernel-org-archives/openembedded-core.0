Received: from dan.rpsys.net ([93.97.175.187])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1UPEfO-0005S6-1d for openembedded-core@lists.openembedded.org;
	Mon, 08 Apr 2013 18:11:37 +0200
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r38G5GvS025417; Mon, 8 Apr 2013 17:05:16 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id n6iZXCrQ0Z-p; Mon,  8 Apr 2013 17:05:16 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	r38G5Bnt025408
	(version=TLSv1/SSLv3 cipher=DHE-RSA-CAMELLIA256-SHA bits=256
	verify=NOT); Mon, 8 Apr 2013 17:05:14 +0100
Message-ID: <1365436444.12407.48.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Khem Raj <raj.khem@gmail.com>
Date: Mon, 08 Apr 2013 16:54:04 +0100
In-Reply-To: <CAMKF1sp4L_N6NDG8=qeWTu4sewV2O8T9f7Xzt8s7xCBv_9MtjQ@mail.gmail.com>
References: <1365323007.6526.229.camel@ted>
	<CAMKF1sp4L_N6NDG8=qeWTu4sewV2O8T9f7Xzt8s7xCBv_9MtjQ@mail.gmail.com>
X-Mailer: Evolution 3.6.2-0ubuntu0.1 
Mime-Version: 1.0
X-MIME-Autoconverted: from 8bit to quoted-printable by dan.rpsys.net id
	r38G5GvS025417
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Sanity Failures - Segfaults in qemu images
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
X-List-Received-Date: Mon, 08 Apr 2013 16:11:42 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, 2013-04-07 at 15:32 -0700, Khem Raj wrote:
> On Sun, Apr 7, 2013 at 1:23 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>         http://autobuilder.yoctoproject.org:8011/builders/nightly-x86-6=
4-lsb/builds/87/steps/Running%20Sanity%20Tests/logs/stdio
>
>
> what does complete dmesg output looks like ? I have seen ld.so
> segfaults on real x86_64 hardware but havent narrowed it down since
> it does not seem to bother my testing.=E2=80=8B

I don't have the full dmesg output however I have put a wealth of info
about this into:

https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4216

Basically these do look like "random" segfaults happening any point on
the system and having a variety of effects. The double fault is
particularly worrying as it suggests the problem is kernel or qemu. I've
put a script which tends to reproduce the issue into the bugzilla.

When you say you've seen ld.so faults on real hardware, have you any
more details? Are they happening often? Just ld.so?

I need to know if this is a qemu issue or on real hardware too since the
latter is a release blocker and extremely serious.

Cheers,

Richard



