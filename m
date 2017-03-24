Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f54.google.com (mail-it0-f54.google.com
	[209.85.214.54])
	by mail.openembedded.org (Postfix) with ESMTP id D8B3F77C11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 21:43:18 +0000 (UTC)
Received: by mail-it0-f54.google.com with SMTP id y18so3151715itc.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 Mar 2017 14:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=uSJ0JsS+zjK7yBrQZzKNoQLH3hwnO+y4DaaqmAR9ap4=;
	b=A3dUeiUBTf1bA3pd/eWMrDNTGu7DlCxnRrWZlfGMEx8cB8HEVN6Pwc4ETAdFMYSpf7
	vHHtV1uTE8np1ZI7oIxcyoRFWLixiqhfZZxpP8xYKDiMrKukrg6G5bL0wGVnOkocgavR
	pc6hBXEQMBo79PjCUAPpgq2dGMHHlBPlGKELzEIO2wxxSvUOK8zYkYfpEBkJI3HGZsf4
	fn7d0DdaKZe+tF2N/+jDskLNRSsvvm0iiRmmy4VJLH2a/8C7DdkjWqIPMh3LlvJu9Xco
	9O5IqZfw5oc1+Y7rTPM1ZvfeH9vEWf0o+LQnqV6HiRZV6iEQaJygV+bQ7q5f7GCyziWg
	CmJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=uSJ0JsS+zjK7yBrQZzKNoQLH3hwnO+y4DaaqmAR9ap4=;
	b=lDusjYP5kBylWQVcayB+tKWhzSNpo3TKaslNhQ9PWXYv/GZN4NzIRgng1Tk8eQCqlu
	/LXbDT4YnSWW7e9IEjC3vWs/MPFIdAVbMid4mPQWyVsWGsbOABFwcta2oNv1P8hKWSj1
	FCwJtjizQrQtIwfm9Aaf+bhDXITXFRU5VWnf38nt4vqjpXKFOB909XSjOM0CXOsLmHMM
	JJbLYkY2GLeS5HqtA3O0MCRodP55uZizekmPZ7gmjFhmyHlxBUN6y3gTYJCjXGqeWHlz
	f1Ydig3MDvCC8LJdM3Ac6jCUpPdOzWIdYIP1AqQvyg88JhGDlMbUBKSTrnCkfDNUMbhq
	g33g==
X-Gm-Message-State: AFeK/H2XXrKBcQcUYB3mMUu+Lmc7vSgutHTK94ttYqSqwxTRSbjwvCyNJXt/7ODxyyYQFlmF
X-Received: by 10.107.147.67 with SMTP id v64mr11653691iod.120.1490391799761; 
	Fri, 24 Mar 2017 14:43:19 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8E2F9.dip0.t-ipconnect.de. [93.232.226.249])
	by smtp.gmail.com with ESMTPSA id s21sm1571003ite.0.2017.03.24.14.43.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 24 Mar 2017 14:43:18 -0700 (PDT)
Message-ID: <1490391796.6396.287.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Fri, 24 Mar 2017 22:43:16 +0100
In-Reply-To: <cover.1490343063.git.liezhi.yang@windriver.com>
References: <cover.1490343063.git.liezhi.yang@windriver.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4 V2] runqemu: add selftest
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
X-List-Received-Date: Fri, 24 Mar 2017 21:43:19 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-03-24 at 01:44 -0700, Robert Yang wrote:
> * V2
>   Add Qi's patch to fix hang of "oe-selftest -r wic.Wic.test_qemu_efi".

The test seems to be run correctly now:
runqemu - INFO -
Running .../core-image-minimal/1.0-r0/recipe-sysroot-native/usr/bin/qemu-system-x86_64 -device virtio-net-pci,netdev=net0,mac=52:54:00:12:34:02 -netdev tap,id=net0,ifname=tap0,script=no,downscript=no -drive if=virtio,file=.../core-image-minimal-intel-corei7-64.wic,format=raw -no-reboot -vga vmware -show-cursor -usb -usbdevice tablet -device virtio-rng-pci -drive if=pflash,format=qcow2,file=.../tmp-glibc/deploy/images/intel-corei7-64/ovmf.qcow2 -vga std  -serial tcp:127.0.0.1:46279  -cpu Nehalem -m 256 -serial tcp:127.0.0.1:35585 -snapshot

However, the EFI image was broken in my configuration
(MACHINE=intel-corei7-64, intel-iot-refkit + openembedded master-next),
it didn't have an efi/boot/bootx64.efi. That's an unrelated problem with
the original test.

I'm fine with merging this patch series.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




