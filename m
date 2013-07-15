Return-Path: <niqingliang2003@gmail.com>
Received: from mail-pd0-f171.google.com (mail-pd0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id CD0996A464
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jul 2013 02:50:55 +0000 (UTC)
Received: by mail-pd0-f171.google.com with SMTP id y14so10219861pdi.30
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jul 2013 19:50:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:user-agent:mime-version
	:content-transfer-encoding:content-type;
	bh=yAh2vxHjIAjzLjAN+GTZE6RFeYvNXokbarc7yG4k+SI=;
	b=TnMgyeLZmyU102VVvj7SVEGpXLyG47mJoMPWQEQcDgf9i760197OQ7EdQnOWIUdeuo
	g2w4aEyg8seqIgZ786bNs7pH+oAdo4t0uglfHLyfoVHS5DbLimSo/+C44G/zZ95dBrJx
	UcBAL1AsF+fhAz9ShC4GsW33jRM+icRT9m3wN7pzTTcOuOboOCWeAbksMw8r1E+gZ7yD
	YDmCAMXpS/klAXUpQ/T7gMt89CesiRMdE+Z/+/XbxgzsCq6mxiQDSXelzxKDZnfIepWU
	AfFpg3KNAvYkYhkhAmX73NKL09jrR8B1uApn8qtIL3EywFTQqf9hua2ZYx+X86tlwa48
	ANpQ==
X-Received: by 10.68.76.34 with SMTP id h2mr51809376pbw.20.1373856656417;
	Sun, 14 Jul 2013 19:50:56 -0700 (PDT)
Received: from yiqingliang-pc.localnet ([121.229.145.211])
	by mx.google.com with ESMTPSA id
	fl2sm61517077pab.23.2013.07.14.19.50.52
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Sun, 14 Jul 2013 19:50:55 -0700 (PDT)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Mon, 15 Jul 2013 10:46:15 +0800
Message-ID: <1859834.HWeIRUdFez@yiqingliang-pc>
User-Agent: KMail/4.10.4 (Linux/3.9.8-1-ARCH; KDE/4.10.4; x86_64; ; )
MIME-Version: 1.0
Subject: intercept script "update_font_cache" failed, falling back to running postinstalls at first boot
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
X-List-Received-Date: Mon, 15 Jul 2013 02:50:55 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

Hello,
	I'm building a readonly-rootfs, which contain ttf fonts wqy-zenhei, but 
fail with:

"
intercept script "update_font_cache" failed, falling back to running 
postinstalls at first boot
"

I found that:
http://lists.freedesktop.org/archives/fontconfig-bugs/2013-January/000452.html

it said that the fc-cache would have --sysroot option, maybe we can use it to 
avoid postintall?


-- 
Nanjing Jilong
Yi Qingliang
niqingliang2003@gmail.com

