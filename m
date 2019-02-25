Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id B1C9C7C8C8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 09:47:30 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id f14so9140917wrg.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2019 01:47:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=GOK16hzJqZEqpmzyHv3HKKqLQuE8JwrE+CQVKQJg8SI=;
	b=T5rQEDbrrTX+jTdWOzVsZIGyl8CJLeH5HEZ6qwfluVmNnjdr8N5CJ1AY8Lttv0PeEE
	k7AowZ/4BQTf2umLQBEV8NdAPgchovg6RbxXI1mU2g533wZOWSo+vCQplY2BK6YWFZLI
	c/8CL2Hl60UwMoLqxeCRrPDEEKVRem9N5CqBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=GOK16hzJqZEqpmzyHv3HKKqLQuE8JwrE+CQVKQJg8SI=;
	b=M3Znlr7CnzUSX3G+zR6BK0yxhP0N8EKxn2IaWdfzVHvVut9dekqKB7n5EGRnAMq2mC
	kui7fdp5cRgVKwawuET/PjjEDAeIX2OX/aVRsHxDA6YchSsx5CRqh41k8gKYKr/KDdO9
	BrfFUB7vwz6PbXx9JRvdbg0uNOsrOMVslC4gahgwMsndGemLG/FZ3Pv1DCpgirTjDo9w
	doqhoQyTxansXvcTNzqp78Iwo72HZ2O4UNuJXOjbKUCtei3loPuSc/EMgLO3HgqBGbOb
	6kgUGLObYZ91q7a1rINcQWc3bUY/SJTgL3wchtpTwG5KeCQb2kOsuHGsHwaamX6o/K6/
	4B3Q==
X-Gm-Message-State: AHQUAuYosj1nbnHK1KMU0aaRVJgHHSeagaGMgXw5KZdfHew/aUe6G6Hp
	saL+079Zg9bHmCN8PIKVMGWEvQ==
X-Google-Smtp-Source: AHgI3IbOQYoVQ00zbcgD1recLirOSSdDRKGrpyHnhctCVfDEjhglKcZ2wtJWT6Pk7iBbhlDZf70vBg==
X-Received: by 2002:a5d:4711:: with SMTP id y17mr12463359wrq.141.1551088051468;
	Mon, 25 Feb 2019 01:47:31 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	q5sm13895649wrn.43.2019.02.25.01.47.30
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 25 Feb 2019 01:47:30 -0800 (PST)
Message-ID: <f007360dde2152c7ea3fc754960f45d3dbfd63e9.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 25 Feb 2019 09:47:29 +0000
In-Reply-To: <cover.1550845989.git.alex.kanavin@gmail.com>
References: <cover.1550845989.git.alex.kanavin@gmail.com>
User-Agent: Evolution 3.31.90-1 
MIME-Version: 1.0
Subject: Re: [PATCH 00/12] Enable accelerated OpenGL in qemu
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
X-List-Received-Date: Mon, 25 Feb 2019 09:47:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2019-02-22 at 15:33 +0100, Alexander Kanavin wrote:
> V2 changes: addressed feedback from the first review round
> V3 changes:
> - better fix for missing qemu X11 include, as discussed with upstream
> - maintainers.inc entry for virglrenderer
> - egl-headless support (see below for details)
> - improvements to kmscube recipe
> - fix to vte-native to allow building it with gcc 4.8
> V4 changes
> - address failures uncovered by yocto autobuilder
> V5 changes
> - remove patches that have been merged to master
> - replace BBCLASSEXTEND_remove with PREFERRED_PROVIDER for mesa
> recipe variants
> V6 changes
> - again rebase to master
> - tweak oe-selftest to remove unnecessary re-builds of qemu-native
> V7 changes
> - rename virglrender_git.bb to virglrendender_0.7.0.bb
> - update the status of virglrenderer patches
> - further clarify the PACKAGECONFIG settings for qemu

There is a further problem somewhere. I ran more tests over the
weekend and fixed missing libEGL on ubuntu1604 for example. The 
debian8 worker is failing consistently:

https://autobuilder.yoctoproject.org/typhoon/#/builders/80/builds/91

The log output is useless (which is a separate concern). When I try and
launch qemu manually I get the output below:

pokybuild@debian8-ty-1:~/yocto-worker/oe-selftest-debian/build$
DISPLAY=:1 /home/pokybuild/yocto-worker/oe-selftest-
debian/build/build/tmp/work/x86_64-linux/qemu-helper-native/1.0-
r1/recipe-sysroot-native/usr/bin/qemu-system-x86_64 -device virtio-net-
pci,netdev=net0,mac=52:54:00:12:34:02 -netdev
tap,id=net0,ifname=tap0,script=no,downscript=no -drive
file=/home/pokybuild/yocto-worker/oe-selftest-
debian/build/build/tmp/deploy/images/qemux86-64/core-image-minimal-
qemux86-64.ext4,if=virtio,format=raw -vga vmware -show-cursor -usb
-device usb-tablet -object rng-random,filename=/dev/urandom,id=rng0
-device virtio-rng-pci,rng=rng0  -vga virtio -display gtk,gl=on  -cpu
core2duo -enable-kvm -m 256 -serial tcp:127.0.0.1:51379  -serial
tcp:127.0.0.1:34855 -pidfile pidfile_9641 -snapshot -kernel
/home/pokybuild/yocto-worker/oe-selftest-
debian/build/build/tmp/deploy/images/qemux86-64/bzImage
--4.18.27+git0+9e348b6f9d_62f0a3acff-r0.2-qemux86-64-20190223080225.bin 
-append 'root=/dev/vda rw highres=off  mem=256M
ip=192.168.7.2::192.168.7.1:255.255.255.0 vga=0
uvesafb.mode_option=640x480-32 oprofile.timer=1 uvesafb.task_timeout=-1 
console=tty1 console=ttyS0,115200n8 printk.time=1'
libEGL warning: GLX/DRI2 is not supported

** (qemu-system-x86_64:10289): WARNING **: 09:43:00.199: Unknown X11
keycode mapping '<null>'.
Please report to qemu-devel@nongnu.org
including the following information:

  - Operating system
  - X11 Server
  - xprop -root
  - xdpyinfo

qemu-system-x86_64: -serial tcp:127.0.0.1:51379: Failed to connect
socket: Connection refused
qemu-system-x86_64: -serial tcp:127.0.0.1:51379: could not connect
serial device to character backend 'tcp:127.0.0.1:51379'

Any ideas why this works everywhere else but not on debian8?

Cheers,

Richard


