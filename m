Return-Path: <goodoldbasil@gmail.com>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 1D9EC6013D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Jul 2016 20:42:42 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id q132so19005169lfe.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2016 13:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=nnFCI6qPy1gXe1/NHgADIEXveW7ck4JOX/o7a4QddeQ=;
	b=ntMMovsru9uD/TyFhp23oKM3+CxRXs7P4FgzkKLJY5WVThWWevjHYbaiaWYnjrn0JJ
	d6xfWOqNm0efVOB6JXelVI4h/4qYI+V4wNiNaka35X1sbDZdZOpFBAcJSroln7ESujzS
	fitJ0qEtgUZZ7Za/i6hbWQeS6lbtt/GyTauxBeFCcwNXSt2kDormd+j3HLjlwc1BNvNa
	z5YlzHdPUw9kTuROcEbFOtHpteRHnsCG32phwdrB0QRr/MDHqkggnZovFIB+jOrfFZad
	2Pe180KEoWSGTE/GRmbm1kfzDQtHm1X1mOKeifiqbFy4zOdxCTYryqq0exOUloft5vTI
	rg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=nnFCI6qPy1gXe1/NHgADIEXveW7ck4JOX/o7a4QddeQ=;
	b=aZdi2neeeeZvOXDmauVRppInCI6WSLvTgwCLlkm1dlz3Oe8rp4HB2Nu8nfCtV9XWpM
	3ukpvzCB2zd8C30kBH8HhawtW7hY4wxf2dfJFvVWvTixL7T84Lbx9DfjROuo/KftaICf
	n4MAW4n1LqPYWBJgB8/NVmT30gbteAu3KAo0d3GuuypR25ngesShvpcGEajhpR0wEGcZ
	RjhN71mNndl4VR1/ItFRnlXd7Q4OyiVJKDM2GzPjVezCuW6/1A0pwzs+wYhm6y6M3ZUp
	G3WEifjG1LTGgYhE6F+o+n2+q3VYAFeBmTa7dZvj+DYhGvAmwCQdeLLQmk3rUK5h+DAF
	qasw==
X-Gm-Message-State: ALyK8tLUGJhnsEeND7XG3ekluEbVNXtlNUWgV8v3EmvsGpu0m36W14GV7f9kLxcqvz31UcrkVLVm0BHHO7b5BQ==
X-Received: by 10.25.139.135 with SMTP id n129mr524547lfd.209.1467924161946;
	Thu, 07 Jul 2016 13:42:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.143.2 with HTTP; Thu, 7 Jul 2016 13:42:02 -0700 (PDT)
From: Basil Varghese <goodoldbasil@gmail.com>
Date: Thu, 7 Jul 2016 13:42:02 -0700
Message-ID: <CACzhctu+ihWvbeUSCo75sEz1Thhoh3eEDXB_+Q=QaD3zNUvHAQ@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: How do I configure OpenBMC kernel boot logs to be displayed on a specific UART?
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
X-List-Received-Date: Thu, 07 Jul 2016 20:42:44 -0000
Content-Type: multipart/alternative; boundary=001a113fc2f63aeae4053711ba01

--001a113fc2f63aeae4053711ba01
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,
I am using OpenBMC-1.0 (phosphor).
On an AST2500-based board, the boot-logs get stuck at
*           Uncompressing Linux=E2=80=A6 done, booting the kernel.*

The u-boot uses the correct UART console because its logs are displayed.
But after that, the kernel boot logs are not seen. I am sure it is booting,
but the problem is that the kernel seems to be configured to use the wrong
serial console.
I tried changing the *'device' *variable in obmc-console.conf from
*device=3DttyS5 * to different values, but it's no use.
Could someone please suggest how to make the kernel boot logs be displayed
on the correct UART?

------------------------------------------- FYI the boot logs:
 -----------------------------------------

DRAM Init-V0B-DDR4
0abc1-4Gb-Done
Read margin-DL:0.3509/DH:0.3803 CK (min:0.35)


U-Boot 2016.05 (Jul 06 2016 - 17:22:40 +0100)

DRAM:  496 MiB
Flash: 32 MiB
*** Warning - bad CRC, using default environment

In:    serial
Out:   serial
Err:   serial
Net:   MAC0 : RGMII
MAC1 : RGMII
FTGMAC100#0
Error: FTGMAC100#0 address not set.
, FTGMAC100#1
Error: FTGMAC100#1 address not set.

Hit any key to stop autoboot:  0
## Booting kernel from Legacy Image at 20080000 ...
   Image Name:   Phosphor OpenBMC (Phosphor OpenB
   Image Type:   ARM Linux Kernel Image (uncompressed)
   Data Size:    2004098 Bytes =3D 1.9 MiB
   Load Address: 80001000
   Entry Point:  80001000
   Verifying Checksum ... OK
## Loading init Ramdisk from Legacy Image at 20300000 ...
   Image Name:   obmc-phosphor-image
   Image Type:   ARM Linux RAMDisk Image (lzma compressed)
   Data Size:    1670931 Bytes =3D 1.6 MiB
   Load Address: 81000000
   Entry Point:  81000000
   Verifying Checksum ... OK
   Loading Kernel Image ... OK

Starting kernel ...

Uncompressing Linux... done, booting the kernel.
---------------------------------------------------------------------------=
----------------------------

Thanks,
*Basil Varghese*
*______________________________________*

--001a113fc2f63aeae4053711ba01
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div>I am using OpenBMC-1.0 (phosphor).<br>On an AST250=
0-based board, the boot-logs get stuck at=C2=A0</div><div><b><span style=3D=
"font-size:11pt;font-family:Calibri,sans-serif">=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0Uncompressing Linux=E2=80=A6 done, booting the kernel.</span>=
</b></div><div><font face=3D"Calibri, sans-serif"><span style=3D"font-size:=
14.6667px"><b><br clear=3D"all"></b></span></font><div><div data-smartmail=
=3D"gmail_signature"><div dir=3D"ltr">The u-boot uses the correct UART cons=
ole because its logs are displayed.<br>But after that, the kernel boot logs=
 are not seen. I am sure it is booting, but the problem is that the kernel =
seems to be configured to use the wrong serial console.<br>I tried changing=
 the=C2=A0<i>&#39;device&#39;=C2=A0</i>variable in obmc-console.conf from=
=C2=A0<i>device=3DttyS5=C2=A0</i>=C2=A0to different values, but it&#39;s no=
 use.<br>Could someone please suggest how to make the kernel boot logs be d=
isplayed on the correct UART?</div><div dir=3D"ltr"><br></div><div dir=3D"l=
tr">------------------------------------------- FYI the boot logs: =C2=A0--=
---------------------------------------</div><div><br><div>DRAM Init-V0B-DD=
R4</div><div>0abc1-4Gb-Done</div><div>Read margin-DL:0.3509/DH:0.3803 CK (m=
in:0.35)</div><div><br></div><div><br></div><div>U-Boot 2016.05 (Jul 06 201=
6 - 17:22:40 +0100)</div><div><br></div><div>DRAM: =C2=A0496 MiB</div><div>=
Flash: 32 MiB</div><div>*** Warning - bad CRC, using default environment</d=
iv><div><br></div><div>In: =C2=A0 =C2=A0serial</div><div>Out: =C2=A0 serial=
</div><div>Err: =C2=A0 serial</div><div>Net: =C2=A0 MAC0 : RGMII=C2=A0</div=
><div>MAC1 : RGMII=C2=A0</div><div>FTGMAC100#0</div><div>Error: FTGMAC100#0=
 address not set.</div><div>, FTGMAC100#1</div><div>Error: FTGMAC100#1 addr=
ess not set.</div><div><br></div><div>Hit any key to stop autoboot: =C2=A00=
=C2=A0</div><div>## Booting kernel from Legacy Image at 20080000 ...</div><=
div>=C2=A0 =C2=A0Image Name: =C2=A0 Phosphor OpenBMC (Phosphor OpenB</div><=
div>=C2=A0 =C2=A0Image Type: =C2=A0 ARM Linux Kernel Image (uncompressed)</=
div><div>=C2=A0 =C2=A0Data Size: =C2=A0 =C2=A02004098 Bytes =3D 1.9 MiB</di=
v><div>=C2=A0 =C2=A0Load Address: 80001000</div><div>=C2=A0 =C2=A0Entry Poi=
nt: =C2=A080001000</div><div>=C2=A0 =C2=A0Verifying Checksum ... OK</div><d=
iv>## Loading init Ramdisk from Legacy Image at 20300000 ...</div><div>=C2=
=A0 =C2=A0Image Name: =C2=A0 obmc-phosphor-image</div><div>=C2=A0 =C2=A0Ima=
ge Type: =C2=A0 ARM Linux RAMDisk Image (lzma compressed)</div><div>=C2=A0 =
=C2=A0Data Size: =C2=A0 =C2=A01670931 Bytes =3D 1.6 MiB</div><div>=C2=A0 =
=C2=A0Load Address: 81000000</div><div>=C2=A0 =C2=A0Entry Point: =C2=A08100=
0000</div><div>=C2=A0 =C2=A0Verifying Checksum ... OK</div><div>=C2=A0 =C2=
=A0Loading Kernel Image ... OK</div><div><br></div><div>Starting kernel ...=
</div><div><br></div><div>Uncompressing Linux... done, booting the kernel.<=
/div><div>-----------------------------------------------------------------=
--------------------------------------</div><br></div><div>Thanks,<br><i><b=
>Basil Varghese</b></i><br></div></div></div></div><div><div class=3D"gmail=
_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div><div d=
ir=3D"ltr"><div><div dir=3D"ltr"><div><i>__________________________________=
____</i></div></div></div></div></div></div></div></div>
</div>

--001a113fc2f63aeae4053711ba01--
