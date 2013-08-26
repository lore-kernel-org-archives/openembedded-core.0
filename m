Return-Path: <elvis.dowson@gmail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 0D94B6A95B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Aug 2013 03:59:06 +0000 (UTC)
Received: by mail-pa0-f45.google.com with SMTP id bg4so2901024pad.4
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Aug 2013 20:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=bDsGibN+xwQRdiwvYNmjsdvKQVnxsqx7OR0SEU3cHmU=;
	b=Nr7D9GS+CLDlCWRn9zQxrLSFJcLntDXPS4He6VDKydBG8HN1RMiWmBinKF/ETsrmjU
	3WRm7EEv24D5J8Kb6M8IoLHPCTWclVp1EusQGyUoZoOu+JWlwNJWxb5inBRQ3dImJql7
	yN20759419E3qIrkEtBNXxuDUht1ODy1YNkD7HTTH720Bl9JlRgqQNubey9212TEg/p9
	oM0uRQlLR4paAO4pWGXn1xZepZ9sabQGEKqjuA+oWeXoVTf6dAmU3mTCPtq00YQOgeYh
	Ns4zDlc5ZK2LR+9EwoNEwuK0C+53cYBuoUQ4CLQiNv/5slOyl/Oh/Oqlv6kSXY1qOtOr
	i/FA==
X-Received: by 10.68.232.225 with SMTP id tr1mr987329pbc.143.1377489546184;
	Sun, 25 Aug 2013 20:59:06 -0700 (PDT)
Received: from [192.168.1.106] ([94.205.106.26])
	by mx.google.com with ESMTPSA id yo2sm17084617pab.8.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 25 Aug 2013 20:59:04 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <521AA95A.8000803@windriver.com>
Date: Mon, 26 Aug 2013 07:58:57 +0400
Message-Id: <7DBFB4EE-4727-422F-8815-D801827A37C9@gmail.com>
References: <20130825104341.a5c5c4a29245e5c988b774ab8f895ac5.305c945aa2.wbe@email15.secureserver.net>
	<835D4942-DCEA-4634-9822-24ADDCAD8DF7@gmail.com>
	<092BF80A-B02A-4506-840E-2EEEE48CE298@gmail.com>
	<4AC41A5E-073D-4973-82BD-F94A8B168F34@gmail.com>
	<521AA95A.8000803@windriver.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
X-Mailer: Apple Mail (2.1498)
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: QEMU with ARM Cortex A9 with hard float configuration - Kernel panic
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
X-List-Received-Date: Mon, 26 Aug 2013 03:59:06 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable

Hi Bruce,

On Aug 26, 2013, at 5:03 AM, Bruce Ashfield =
<bruce.ashfield@windriver.com> wrote:

> On 13-08-25 3:09 PM, Elvis Dowson wrote:
>> I noticed that you've committed the changes for qemuarma9 KMACHINE =
configuration to the linux-yocto kernel.
>>=20
>> =
http://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto-3.8/tree/meta/cfg/ke=
rnel-cache/bsp?h=3Dmeta
>>=20
>> I adapted the qemuarm.conf configuration and booted it up, but =
nothing shows up in the QEMU window, I just get a black screen.
>>=20
>> Has qemu with the qemuarma9 configuration been successfully built and =
tested before?
>=20
> It has been, but not with a machine definition that is part of oe-core
> or Yocto.
>=20
> It was contributed as the output from some cortexA9 testing, and I've
> been carrying the kernel parts ever since.

Can you share the qemucortexa9.conf machine definition please?

>=20
>>=20
>> This is how my qemuarm.conf looks like, locally at the moment:
>>=20
>> #@TYPE: Machine
>> #@NAME: qemuarmhf
>> #@DESCRIPTION: Machine configuration for QEMU ARM Cortex A9 hard =
float.
>>=20
>> # Specify the default tune.
>> DEFAULTTUNE =3D "armv7a-neon"
>>=20
>> require conf/machine/include/qemu.inc
>> require conf/machine/include/tune-cortexa9.inc
>>=20
>> # Specify the machine name used by the kernel.
>> KMACHINE_qemuarm =3D "qemuarma9"
>=20
> This is a default, so you don't need to set it.


The default for qemuarm, as documented in=20

=
http://www.yoctoproject.org/docs/1.5/ref-manual/ref-manual.html#var-KFEATU=
RE_DESCRIPTION

is arm_versatile926ejs.

So I had to modify it to force it to use qemuarma9.

>=20
>>=20
>> # Specify the kernel image type.
>> KERNEL_IMAGETYPE =3D "zImage"
>=20
> I recall booting it with a uImage, but maybe my memory is failing.
>=20
>>=20
>> # Specify the serial console parameters.
>> SERIAL_CONSOLE =3D "115200 ttyAMA0"
>=20
> All of the above looks reasonably sane, but it's more about how you
> launch qemu than the kernel build that is probably resulting in your
> issues. What machine subtype did you use ?

I used -M versatilepb. I also passed the -cpu cortex-a9 parameter to =
qemu.

I just got a blank screen.=20

FYI, I was able to get the qemuzynq machine working with the meta-xilinx
layer, and in that, there was also a blank screen, but the QEMU output
and login prompt came on the console from where the rumqemu qemuzynq
command was run. A different type of behaviour from that of qemuarm =
running
arm_versatile926ejs.

The qemuzynq machine uses the linux-xlnx kernel.

I'd like to get a generic qemuarma9 machine configuration working with=20=

linux-yocto, if possible, and add it to the standard list of qemu =
targets.

Best regards,

Elvis Dowson=

