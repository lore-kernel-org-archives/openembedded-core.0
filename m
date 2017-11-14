Return-Path: <patrick.ohly@intel.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 94C0178429
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 12:06:06 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id u97so17314873wrc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Nov 2017 04:06:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=UCgr4itYriclr98YrUv56aAp1bh+dLlLGB5dKasyEf8=;
	b=i+8mhKTHrom1RgMhLSA8ajaKq2fmWEEIcbjcUmxb/Cuh5txPPZxG453jSrR2n18HKe
	AWWeNUzScDPA+gf+DSFQr4HePdI3VH2IAhD55bH9fDnnLEgdOk2HGwuwol7hBc+8lSs+
	BkZZxatNX7UdtXpQoEHqI3UkQSO4Qd36uU3NiVOVj0CBMzzUVED1+ENYOECsjqp1vCBx
	0FWYR53f1YVkvyzA9W5PSPwQdvVXLyJ4NMolwQCaxxyH33oPNd4lVfJ/odmPzpC8rksQ
	Mex+oYZBGXpz20Uj0WglGWxB/1hUPLqyVdZU+6rK3T24WEWcQL/z31Zc3aP5bBOSfGhi
	Z42w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=UCgr4itYriclr98YrUv56aAp1bh+dLlLGB5dKasyEf8=;
	b=dkjpfVr00jsc7uprNqeUBk9+HcBuItzqxNa22GNPdujJuVB5R/+HE9wIOh1Tc43IQy
	h6u3zdeE62dvraMRGXUT0h6Bqfv8AOm1euntGuK5iOYxbbGp/G6lSKHtkwhC5vOBc+VE
	/v2PalPEhmkFvzxzoYbb6P7Rvk6YBryaKxpyoLPy88fszE8snngkzsJIvTE83VcEjejc
	LdgDWcHSD7CtAUbZ/vCV5QY+6P21XPELv7KhR3R18OSEwTRy+yFaCeSsv8HrVvdmZoCg
	XZDUMXCwHRh7g2W9+8Rp/qQdXmt1YDDvC17cDQvmySYusU3Z7cgsigfPY0hYlSAFGuUq
	krYw==
X-Gm-Message-State: AJaThX7WpMEuhNAy8dL2K5mzo/p2HWUBrKjK7sRk5v5iMej4hhH/a9f9
	bH1enkejQKDPF7obYVwqDWBW
X-Google-Smtp-Source: AGs4zMatzwpTB7ybWDW00QvBzuOpxD/MFgAMQ3XPrZ2T3zCkpdJdxLll0VZ5XkLitwLX/NJfFBA9Ig==
X-Received: by 10.223.182.3 with SMTP id f3mr10630736wre.127.1510661167416;
	Tue, 14 Nov 2017 04:06:07 -0800 (PST)
Received: from pohly-mobl1 (p54BD5874.dip0.t-ipconnect.de. [84.189.88.116])
	by smtp.gmail.com with ESMTPSA id
	x63sm13567532wma.39.2017.11.14.04.06.06
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 14 Nov 2017 04:06:06 -0800 (PST)
Message-ID: <1510661165.5979.6.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 14 Nov 2017 13:06:05 +0100
In-Reply-To: <20171106175558.24581-1-ross.burton@intel.com>
References: <20171106175558.24581-1-ross.burton@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.22.6-1+deb9u1 
Mime-Version: 1.0
Subject: Re: [PATCH] oeqa/selftest/runtime_test: fix postinst_rootfs_and_boot
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
X-List-Received-Date: Tue, 14 Nov 2017 12:06:07 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2017-11-06 at 17:55 +0000, Ross Burton wrote:
>                     testcommand = 'ls /etc/' + fileboot_name

Can't this be removed?

>                      with runqemu('core-image-minimal') as qemu:
> -                        ssh = SSHControl(ip=qemu.ip, logfile=qemu.sshlog)
> -                        status, output = ssh.run(testcommand)
> +                        status, output = qemu.run_serial("-f /etc/" + fileboot_name)

Did you mean "test -f"?

>                          self.assertEqual(status, 0, 'File %s was not created at first boot (%s)' % (fileboot_name, output))

run_serial has the quirk that status == 1 on *success*. Yes, weird.

The test probably passed because it was testing for failure, and the
missing "test" ensured that the command failed.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.



