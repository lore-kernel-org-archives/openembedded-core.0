Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3CDE960232
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Feb 2016 02:56:51 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id 9so4971014iom.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 08 Feb 2016 18:56:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:from:message-id:date:user-agent:mime-version
	:in-reply-to:content-type:content-transfer-encoding;
	bh=HESU/qNBvg5HacbpsF1rH4JyErddJdRjNEDHeQzBL+o=;
	b=fxLw772qlD8+VeUASZj+DgsIbe2JvAAHlHauuWVS5yWTMNnhL8C9Rzun1EQrGTRX58
	RY3u3vT6Bzean5+Q2eV8BZLZT2yuF86KvnimDptIU/BPFb+DXbVhftLhbF8SFtt5flp7
	YlKzM157Yk8SeXHr6GX7xYTA+yxWse5g0Yy+/H5dTx/wrmDc59U/mWFpHQdhRLwUm5da
	Ocsr/yiEBtKkn3we3T3fVr/NU+aw3gq/INxOGHj2L0F9QDrQb06AP/fL6C6Ks5qcof30
	NJbt4b+ID7RDFNEBhkYyUJ7+As5kc9C9HFtc+lUJLCyvINOnRYgAj8+ZB9wPP++JEyVQ
	kjLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:to:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-type
	:content-transfer-encoding;
	bh=HESU/qNBvg5HacbpsF1rH4JyErddJdRjNEDHeQzBL+o=;
	b=LKLEghHQDNgG5tpG7LsWCLxoIUAth8TieNoKyP1j8emogs8wM69w1lBJ+e0RV1ZYqr
	kVXRPJ4p73HMU9KjBZWzChuxD9DIYNQl5sa0bSzcVcnX5JzDrlYQsHvPV2WuTjzbOmrL
	IQ8nRPgJyny7kc5Q+1StaEhhjbX1X97mzDKf8T7fr3aaDDVcYoMP8gBA7qQsj5wwRyOQ
	I/ixBeuEQEIDbkZ+EkOLTerwPh+HxCE1c30FkK8K3e8X49fUclSaYSuZgVUYkpZ3sUvy
	gmsmIeIM7plcmwyJewBBgp4c2CFMTyJd69cwKu5dk5HI9wqI38CXyaBR2m8QABiuwIxV
	OUJA==
X-Gm-Message-State: AG10YOSGJ49h/w+a1u3PqMgZjQauZJ5cNqOGWiS6jIlBElpsAcJXTLIy//EvdX5lJrdRQA==
X-Received: by 10.107.12.14 with SMTP id w14mr37264959ioi.8.1454986612743;
	Mon, 08 Feb 2016 18:56:52 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	j136sm13762625ioj.32.2016.02.08.18.56.51
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 08 Feb 2016 18:56:51 -0800 (PST)
To: OE Core mailing list <openembedded-core@lists.openembedded.org>
References: <56B922B3.9070604@gmail.com> <56B931EA.6060107@windriver.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <56B95575.7030505@gmail.com>
Date: Mon, 8 Feb 2016 21:56:53 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <56B931EA.6060107@windriver.com>
Subject: Re: noticeably longer build (link?) times with binutils 2.26
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
X-List-Received-Date: Tue, 09 Feb 2016 02:56:52 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 02/08/16 19:25, Mark Hatle wrote:
> Which arch/tune are you targeting?

Build Configuration:
BB_VERSION        = "1.28.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "openSUSE-project-13.2"
TARGET_SYS        = "x86_64-poky-linux"
MACHINE           = "qemux86-64"
DISTRO            = "poky"
DISTRO_VERSION    = "2.0+snapshot-20160208"
TUNE_FEATURES     = "m64 core2"
TARGET_FPU        = ""


Essentially: minnowboard max (turbot, specifically)

> It's possible you hit one of those cases, or it may simply be that much slower
> for some reason.  But worse then double the time is really terrible.

Yes, I had started to assume Jenkins had gone "off the deep end" ;-)

