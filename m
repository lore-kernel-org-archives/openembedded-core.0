Return-Path: <joaohf@gmail.com>
Received: from mail-qc0-f170.google.com (mail-qc0-f170.google.com
	[209.85.216.170])
	by mail.openembedded.org (Postfix) with ESMTP id 3450765C97
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 May 2015 04:05:06 +0000 (UTC)
Received: by qcyk17 with SMTP id k17so31897450qcy.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 May 2015 21:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type; bh=3QBR4T7nHHvrO0lWL3ZydpfEYU6TWuqwQhd5PbvWPrw=;
	b=HpYb+FmHfxmtOSHUdrpnYOxWD2pOSj0Gd/wFbiu7w3u7E86yFjdGFZMaaWpPcuGrAD
	N++cAaRZwr2xHmzsqc6kKgnDevp9X/LMduwd4I+luP+s/iYfGEwxwJlKly5Lf28deJrV
	BH1oFllVviiCp5sFcqogV9MxarwqbxCWs8O8nix6ZLFSpGBzUGVkLu6oQzH6otRFucca
	2uNSM5T4EKgFLmjXBxx1g74zmrHJQrSNd641+AyzjBRr98h1A2cV3zjbzlnr6tYG0iFC
	yjEirbcTUl3ffVzJ574bFtsak71anV1lhVLUFIDW8gW9bRzFiKsXH0iGO/hRetNpqz3F
	CcJw==
X-Received: by 10.55.21.166 with SMTP id 38mr4030650qkv.88.1431057907569;
	Thu, 07 May 2015 21:05:07 -0700 (PDT)
Received: from [192.168.0.16] ([187.106.6.68])
	by mx.google.com with ESMTPSA id 189sm2854360qhh.31.2015.05.07.21.05.05
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 07 May 2015 21:05:06 -0700 (PDT)
Message-ID: <554C35F0.5000306@gmail.com>
Date: Fri, 08 May 2015 01:05:04 -0300
From: =?UTF-8?B?Sm/Do28gSGVucmlxdWUgRmVycmVpcmEgZGUgRnJlaXRhcw==?=
	<joaohf@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: Dropping bash and update-alternatives-opkg dependency
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
X-List-Received-Date: Fri, 08 May 2015 04:05:09 -0000
Content-Type: multipart/alternative;
	boundary="------------080500080102030800050302"

--------------080500080102030800050302
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit


Hi,

I am using meta-erlang (https://github.com/joaohf/meta-erlang) to build 
a so called erlang-embedded image. The file 
tmp/deploy/images/wandboard-dual/erlang-embedded-image-minimal-wandboard-dual.manifest 
tells:

base-files wandboard_dual 3.0.14
bash cortexa9hf-vfp-neon 4.3
erlang cortexa9hf-vfp-neon 17.5
erlang-erts cortexa9hf-vfp-neon 17.5
erlang-kernel cortexa9hf-vfp-neon 17.5
erlang-sasl cortexa9hf-vfp-neon 17.5
erlang-stdlib cortexa9hf-vfp-neon 17.5
erlang-tools cortexa9hf-vfp-neon 17.5
erlinit cortexa9hf-vfp-neon 0.6.0+git0+0a3b5c4c5b
libc6 cortexa9hf-vfp-neon 2.21
libtinfo5 cortexa9hf-vfp-neon 5.9
libz1 cortexa9hf-vfp-neon 1.2.8
ncurses-terminfo-base cortexa9hf-vfp-neon 5.9yy.
packagegroup-erlang-embedded all 1.0
packagegroup-erlang-embedded-erlang all 1.0
packagegroup-erlang-embedded-initscripts all 1.0
update-alternatives-opkg cortexa9hf-vfp-neon 0.1.8+git0+53274f0875

I've tried using poky and poky-tiny but I unable to figure out how to 
drop bash and update-alternatives-opkg.

This image provides erlinit that calls erlang VM and this is all that I 
need to run my application.

I think that postinstall scripts are responsible by depend of bash 
package. But I don't know how to remove this dependency.

Any suggestion?

Thanks.


--------------080500080102030800050302
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: 7bit

<html>
  <head>

    <meta http-equiv="content-type" content="text/html; charset=utf-8">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    <br>
    Hi,<br>
    <br>
    I am using meta-erlang (<a class="moz-txt-link-freetext" href="https://github.com/joaohf/meta-erlang">https://github.com/joaohf/meta-erlang</a>) to
    build a so called erlang-embedded image. The file
tmp/deploy/images/wandboard-dual/erlang-embedded-image-minimal-wandboard-dual.manifest
    tells:<br>
    <br>
    <meta http-equiv="content-type" content="text/html; charset=utf-8">
    <span style="color: rgb(51, 51, 51); font-family: arial, sans-serif;
      font-size: 13px; font-style: normal; font-variant: normal;
      font-weight: normal; letter-spacing: normal; line-height: 17px;
      orphans: auto; text-align: start; text-indent: 0px;
      text-transform: none; white-space: normal; widows: 1;
      word-spacing: 0px; -webkit-text-stroke-width: 0px; display: inline
      !important; float: none; background-color: rgb(255, 255, 255);"></span>base-files
    wandboard_dual 3.0.14<br>
    bash cortexa9hf-vfp-neon 4.3<br>
    erlang cortexa9hf-vfp-neon 17.5<br>
    erlang-erts cortexa9hf-vfp-neon 17.5<br>
    erlang-kernel cortexa9hf-vfp-neon 17.5<br>
    erlang-sasl cortexa9hf-vfp-neon 17.5<br>
    erlang-stdlib cortexa9hf-vfp-neon 17.5<br>
    erlang-tools cortexa9hf-vfp-neon 17.5<br>
    erlinit cortexa9hf-vfp-neon 0.6.0+git0+0a3b5c4c5b<br>
    libc6 cortexa9hf-vfp-neon 2.21<br>
    libtinfo5 cortexa9hf-vfp-neon 5.9<br>
    libz1 cortexa9hf-vfp-neon 1.2.8<br>
    ncurses-terminfo-base cortexa9hf-vfp-neon 5.9yy.<br>
    packagegroup-erlang-embedded all 1.0<br>
    packagegroup-erlang-embedded-erlang all 1.0<br>
    packagegroup-erlang-embedded-initscripts all 1.0<br>
    update-alternatives-opkg cortexa9hf-vfp-neon 0.1.8+git0+53274f0875<br>
    <br>
    I've tried using poky and poky-tiny but I unable to figure out how
    to drop bash and update-alternatives-opkg.<br>
    <br>
    This image provides erlinit that calls erlang VM and this is all
    that I need to run my application.<br>
    <br>
    I think that postinstall scripts are responsible by depend of bash
    package. But I don't know how to remove this dependency.<br>
    <br>
    Any suggestion?<br>
    <br>
    Thanks.<br>
    <br>
  </body>
</html>

--------------080500080102030800050302--
