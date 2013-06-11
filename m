Return-Path: <tasskjapp@gmail.com>
Received: from mail-lb0-f170.google.com (mail-lb0-f170.google.com
	[209.85.217.170])
	by mail.openembedded.org (Postfix) with ESMTP id 194786A998
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 09:35:28 +0000 (UTC)
Received: by mail-lb0-f170.google.com with SMTP id t13so2280807lbd.29
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Jun 2013 02:35:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	bh=LbH3wwP5c2wrCwomXZJxQl/XDGdMp5OzsMpigNv2WEU=;
	b=gd7Vt19kJKbL07lMMCK1RjiRk7CaleKO7mPtAf4gDHLqqpEy/yCvkVpco13jbe8VWp
	ixQ/GhuqVd4/EsKBe/YhBx284f5K8tNynxpJcK70m3gj89ksbOzP7yvvCwjHIVKqVwcG
	v7Px2x7JnNQMvrg0i2uk2000zC7LoXGFE0Xv625wS0ZOIYYFVCn79PIzkgA0wi8Vk4mn
	8HCl+zzRSEBUS6ka6YcSCDhYVorsKOnUBnCkTP+GjOqUuHrCdXEMi+rhAz3fbey1vHrL
	QM8u6nHBrYkxLJ/bNKIRN2rvBCMrwq97HlMhBKuI1p2VjhGk6Yx9S9y8dP0dpa5p3ETf
	VEWA==
X-Received: by 10.152.44.170 with SMTP id f10mr6841966lam.68.1370943329203;
	Tue, 11 Jun 2013 02:35:29 -0700 (PDT)
Received: from [192.168.0.209] ([77.40.182.98])
	by mx.google.com with ESMTPSA id a3sm7102877lbg.2.2013.06.11.02.35.27
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 11 Jun 2013 02:35:28 -0700 (PDT)
Message-ID: <51B6EF5E.1020404@gmail.com>
Date: Tue, 11 Jun 2013 11:35:26 +0200
From: Tasslehoff Kjappfot <tasskjapp@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
Subject: SDK relocation issues
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
X-List-Received-Date: Tue, 11 Jun 2013 09:35:29 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

I compiled an SDK and extracted/installed it to my source tree instead 
of /usr/local/. I have made /usr/local/oecore-i686 a symlink to the 
actual location. With the latest Dylan this broke.

Denzil:
❯❯❯ ldd arm-angstrom-linux-gnueabi-gcc
     linux-gate.so.1 =>  (0xf771d000)
     libc.so.6 => /lib/i386-linux-gnu/libc.so.6 (0xf7544000) 
/usr/local/oecore-i686/sysroots/i686-angstromsdk-linux/lib/ld-linux.so.2 
=> /lib/ld-linux.so.2 (0xf771e000)

Dylan:
Original location:
❯❯❯ ldd arm-angstrom-linux-gnueabi-gcc
     linux-gate.so.1 =>  (0xf77c4000)
     libc.so.6 => 
/home/tasslehoff/src/pdrepos01/toolchains/oecore-i686/sysroots/i686-angstromsdk-linux/usr/bin/armv7a-vfp-neon-angstrom-linux-gnueabi/./../../../lib/libc.so.6 
(0xf7610000)
 
/home/tasslehoff/src/oe/toolchains/oecore-i686/sysroots/i686-angstromsdk-linux/lib/ld-linux.so.2 
=> /lib/ld-linux.so.2 (0xf77c5000)

If I try to run the toolchain from Dylan on a system where 
/home/tasslehoff/src/oe/toolchains/oecore-i686/sysroots/i686-angstromsdk-linux/lib/ld-linux.so.2 
does not exist, it fails.

Regards,
Tasslehoff

