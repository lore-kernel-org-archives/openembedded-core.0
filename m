Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 1FBFC719E7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Jan 2017 07:42:46 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id j13so12281322iod.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 11 Jan 2017 23:42:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=NIycw8+9iA1ZeYsZlWWFMvBn8zFRNwadEfQGXVkKsdY=;
	b=rWKdzoBF7f8w0xSOn5EsYNBEkK+fqy+8BUr7tgss+XmvI4db/7+UpyddmowYxQA0ug
	0Ie6WEdDwL/QHtYjbuku7kc4yG01O9WVR7K9HSXiEg9gGWCR6vImS0AompvKQ14SfD4x
	3VIAW0mfYIARbzInGy67h/TTlnKybdt/9sRFk0efjQz7SdVCsi3DS4iWgqfvR5dFr+Mk
	V4P/Q7O4o+qxaSszW0Wo31424GmXD5De0/0DN8Xd5VoEpNhjWBXwNMJuS2CimW5qF7m4
	IugGBBMiB4MX4hP2dU8caFZ8nKIGLtkmRnQhP/Cxv61/ia3tQFY1HZubN2cUHCXq5OQz
	7Mvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=NIycw8+9iA1ZeYsZlWWFMvBn8zFRNwadEfQGXVkKsdY=;
	b=O40Tmp75xrN696o2flpnxqgv22UpamhVTv+MupYCpoDM+QJzTc5yKaRAn73Q98ECFc
	Hnu4DcseaUN++w37fJ+aoOxDCM436rRYojq06XkdUvY6X/I+BiR3FeigHcTJoiuMSYJj
	4614pcjwWs/gAdyC58Sla1vurFmRBZGdk+3nr4zcidySEk6aavgVGQAuUpX8Bb+WX/K3
	Nc4ykd00BcuHE3vzHnJlAWQ9mwnW1VpTi5Brc04kXy7oYDbZ5DrBWZDxFTe/UFRR1b9h
	HIYiC+3MiHuneKYnmP02ZOyZgxxQDAauLEZ5hMTnq9/EudCEDdKCAVzab9npwudC4T6D
	3y4w==
X-Gm-Message-State: AIkVDXKy0392SM1nBjvX8YbXi2qcYO+/Pfse//BfI7czy7aYJjzALinNckw5Cmd2+eBkqnpw
X-Received: by 10.107.84.2 with SMTP id i2mr13362207iob.176.1484206966986;
	Wed, 11 Jan 2017 23:42:46 -0800 (PST)
Received: from pohly-mobl1 (p5DE8F981.dip0.t-ipconnect.de. [93.232.249.129])
	by smtp.gmail.com with ESMTPSA id k6sm4450976ioe.1.2017.01.11.23.42.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 11 Jan 2017 23:42:45 -0800 (PST)
Message-ID: <1484206962.2137.129.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org
Date: Thu, 12 Jan 2017 08:42:42 +0100
In-Reply-To: <cb54fa727d09a3ae86d5205ed3b784cd69726ef3.1484063948.git.patrick.ohly@intel.com>
References: <cover.1484063948.git.patrick.ohly@intel.com>
	<cb54fa727d09a3ae86d5205ed3b784cd69726ef3.1484063948.git.patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [PATCH v2 09/11] runqemu: support UEFI with OVMF firmware
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
X-List-Received-Date: Thu, 12 Jan 2017 07:42:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-01-10 at 17:07 +0100, Patrick Ohly wrote:
> ovmf is not built by default. Either do it explicitly ("bitbake ovmf")
> or make it a part of the normal build
> ("MACHINE_ESSENTIAL_EXTRA_RDEPENDS_append = ' ovmf'").

Wrong advice in the commit message: MACHINE_ESSENTIAL_EXTRA_RDEPENDS
doesn't work (it tries to install a non-existent ovmf package into the
rootfs and fails), use EXTRA_IMAGEDEPENDS instead (same mechanism that
also triggers building qemu-native).

I'll fix this if a v3 of this series becomes necessary, but wouldn't do
that just for this fix alone.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




