Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id C83046FFED
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 May 2016 07:49:22 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id f89so14968177ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 03 May 2016 00:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=4kZAn72QbQy5RGRtar6a4o+rehiii2OurhO8RGgixh8=;
	b=E2c5Ixjp25cwmiOPnGxzGJPzj0E76+mLwSZ9pnL4w3dPKlPCReScb3PY1W8Cj2SgC7
	iRXuIpwhndU9lHLdOyvC7kkqaUCFsBBHsSztnZeyoXUHwCOQhTkrIgLfsDazOFlFMZTa
	nv9n+nd2HRKG7GnJXpr53oW4pOrxHiwcUOuhFaT+guzGRYF3POGZwaQk4mFe9iIO+uc/
	P910HndoBuGth1W6Z+99+qh2VN78c120KBsY43LgSjiv6Bv+/+H4U1Q1HQssrc3lnn9M
	22HyYcuuihHR+28fJqvDP2bgh1J6bA8TuZXz4s1B0mi7+wwyTXw+LnOt/vYSZsv7UKvc
	sYaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=4kZAn72QbQy5RGRtar6a4o+rehiii2OurhO8RGgixh8=;
	b=P+FmbNBa12kJRECsii0Q3y93AHm+wXKreVte0Fz/y9qV9CZlifonljBTGIgMUXDIhU
	TbJhMJarhG/dEf22UhZOYDWNSgurw+KMfO0NHh9/c48UoQBNDYGay7UlEVrWszm785E3
	3v8XTFK04m8mmKUPWRTnRRzIhgZ/ZVYgueEENnBJy56BThj2FYUZvVmxF2HQCasB+rr4
	Hg9IuRaghXQGX0SVtlJebTKilwBpGl1+/S+lo+goB9h7PYKvTmipLhvZYIPMe/uTwYTQ
	eKGWcj2Ec2hjdvzHZWO+qFTnALt+h3jFgsLPP/Ue9Kuq69s+Tiq7cobrot4Smd1JUClK
	ioNw==
X-Gm-Message-State: AOPr4FUUTf5HGFcO/z9kFZszmg/UXn/GibXxpHHCewo5rnJzRxBX/kg6g2AiqQzhzOXJMyPQ
X-Received: by 10.107.128.159 with SMTP id k31mr1723311ioi.65.1462261763376;
	Tue, 03 May 2016 00:49:23 -0700 (PDT)
Received: from pohly-mobl1 (p57A57FE5.dip0.t-ipconnect.de. [87.165.127.229])
	by smtp.gmail.com with ESMTPSA id k4sm1467868igf.11.2016.05.03.00.49.21
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 03 May 2016 00:49:21 -0700 (PDT)
Message-ID: <1462261759.23261.18.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
Date: Tue, 03 May 2016 09:49:19 +0200
In-Reply-To: <57277D25.2080309@ni.com>
References: <1461333082.31320.121.camel@linuxfoundation.org>
	<1462196370.30857.70.camel@intel.com> <57277D25.2080309@ni.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lib/oe/rootfs: Fix DEBUGFS generation when using opkg
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
X-List-Received-Date: Tue, 03 May 2016 07:49:25 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-05-02 at 11:15 -0500, Alejandro del Castillo wrote:
> 
> On 05/02/2016 08:39 AM, Patrick Ohly wrote:
> > On Fri, 2016-04-22 at 14:51 +0100, Richard Purdie wrote:
> >> When enabling extra DEBUGFS image generation with opkg, errors are seen like:
> >>
> >> ERROR: core-image-minimal-1.0-r0 do_rootfs: Cannot get the installed packages list. Command '/media/build1/poky/build/tmp/sysroots/x86_64-linux/usr/bin/opkg -f /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/opkg.conf -o /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs  --force_postinstall --prefer-arch-to-version   status' returned 0 and stderr:
> >> Collected errors:
> >>  * file_md5sum_alloc: Failed to open
> >> file /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/syslog-startup.conf.busybox: No such file or directory.
> >>  * file_md5sum_alloc: Failed to open
> >> file /media/build1/poky/build/tmp/work/qemux86_64-poky-linux/core-image-minimal/1.0-r0/rootfs/etc/fstab: No such file or directory.
> >>
> >> basically for all CONFFILES in the image. This is due to the file
> >> rearranging
> >> the rootfs generation code does. If we preserve the /etc directory,
> >> the avoids the problem.
> > 
> > It avoids the problem, but it does not address the root cause (IMHO).
> > Should opkg really complain about missing configuration files? It is
> > perhaps an edge case, but besides editing a configuration file
> > *removing* it entirely may also be a valid user modification.
> > 
> > The usage of opkg here is during image building, but the operation
> > itself (opkg status) is not specific to image creation and thus should
> > be able to handle arbitrary states of /etc and the config files in
> > general.
> 
> Opkg status is supposed to give you the state of all your installed packages.
> Currently is pretty rough data: it dumps into stdout the internal metadata that
> tracks package info and promotes to error any inconsistency, like conffiles not
> being present.

But how does opkg know that "config file not present" is an error? It
depends on the the semantic of the file and thus the package providing
the file. It's not declared explicitly, so it is a fairly arbitrary
judgment call to treat "missing" as error.

> Looking at pacakge_manager.py, opkg status is being called on OpkgPkgsList.
> Seems to me that if the purpose is to get all installed packages, then "opkg
> list-installed" is the correct command. Looking at dpkg (DpkgPkgsList),
> "dpkg-query -W" is being called, which I think maps to opkg list-installed, not
> to opkg status.

That indeed seems better: output should be smaller, faster to run and it
avoids the ambiguity about missing config files.



-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




