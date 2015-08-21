Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id 6340960557
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 13:37:18 +0000 (UTC)
Received: by qkfh127 with SMTP id h127so31656004qkf.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Aug 2015 06:37:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=j/k+kyB9eeJ0LJEYxXWM8OXE4v8Wz+A84y+2IUEK59g=;
	b=Oy6e1ApN+e+MfpqY+fLDEEg498jfCcrNX7c6Ze3uVGnuqbJZDPApW4N3w55y6sTGxZ
	ePmXoAqzN7qZtYY/3zPnKkdcVQjEpg/evpdXNEcoOueAcZuNLqfrZaUxcTfa1D4Fq6qU
	JS8Qes7A6QBd0neIRxvmQ8JAijpPPB/0rGuXPVbI37w+xxXLEyDYaHR5axooDWdCRF/R
	3k3lbcF/R/rsil32o/GLrDB6JzokDWNbdYPXnGiwaGF9HfFu3oSFKbAP1NW7z+QC8Yxa
	FZvkdN6miPC8t/shcPxqi5t4bxAxSruaebcu6xDNIrlTSWt61V/oLPisdrSETvxEHoF7
	/WtA==
X-Gm-Message-State: ALoCoQkbLmCIaiRDqy32lNMW8SHgBl6mJykqUkRipok0TIqbthNDkjXSM8JvTrhxD9uyL4TXw8gg
X-Received: by 10.55.212.13 with SMTP id l13mr17572960qki.29.1440164239102;
	Fri, 21 Aug 2015 06:37:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Fri, 21 Aug 2015 06:36:59 -0700 (PDT)
In-Reply-To: <1440109450-9173-1-git-send-email-randy.e.witt@linux.intel.com>
References: <1440109450-9173-1-git-send-email-randy.e.witt@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 21 Aug 2015 14:36:59 +0100
Message-ID: <CAJTo0LaUCLZdZZU8R6qo6N=a3h2o2ZYbQB-c2P3DMS4en2+UMg@mail.gmail.com>
To: Randy Witt <randy.e.witt@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Try to fix qemu freezing due to full socket buffers
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
X-List-Received-Date: Fri, 21 Aug 2015 13:37:22 -0000
Content-Type: multipart/alternative; boundary=001a1147a520e404a8051dd25de0

--001a1147a520e404a8051dd25de0
Content-Type: text/plain; charset=UTF-8

On 20 August 2015 at 23:24, Randy Witt <randy.e.witt@linux.intel.com> wrote:

> Randy Witt (3):
>       qemurunner.py: Move some class variables that should only be local
>       qemurunner: Make create_socket() return data and use exceptions
>       qemurunner: Use two serial ports and log console with a thread


https://autobuilder.yoctoproject.org/main/builders/nightly-qa-systemd/builds/450/steps/Running%20Sanity%20Tests_2/logs/stdio

If this was meant to fix the ttyS1 hangs, I'm sorry :(

Ross

--001a1147a520e404a8051dd25de0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 August 2015 at 23:24, Randy Witt <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:randy.e.witt@linux.intel.com" target=3D"_blank">randy.e.witt@linux.inte=
l.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=
=3D"il">Randy</span> Witt (3):<br>
=C2=A0 =C2=A0 =C2=A0 qemurunner.py: Move some class variables that should o=
nly be local<br>
=C2=A0 =C2=A0 =C2=A0 qemurunner: Make create_socket() return data and use e=
xceptions<br>
=C2=A0 =C2=A0 =C2=A0 qemurunner: Use two serial ports and log console with =
a thread</blockquote></div><br><a href=3D"https://autobuilder.yoctoproject.=
org/main/builders/nightly-qa-systemd/builds/450/steps/Running%20Sanity%20Te=
sts_2/logs/stdio">https://autobuilder.yoctoproject.org/main/builders/nightl=
y-qa-systemd/builds/450/steps/Running%20Sanity%20Tests_2/logs/stdio</a><br>=
</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">If th=
is was meant to fix the ttyS1 hangs, I&#39;m sorry :(</div><div class=3D"gm=
ail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147a520e404a8051dd25de0--
