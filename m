Return-Path: <anders@chargestorm.se>
Received: from mail-lf0-f52.google.com (mail-lf0-f52.google.com
	[209.85.215.52])
	by mail.openembedded.org (Postfix) with ESMTP id 9323565CB6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 08:17:34 +0000 (UTC)
Received: by mail-lf0-f52.google.com with SMTP id v186so77431315lfa.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Feb 2017 00:17:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=chargestorm-se.20150623.gappssmtp.com; s=20150623;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-disposition:in-reply-to:organization
	:user-agent; bh=QgQopkYbwJTfmwBKv0vLPRNh9MU9hGn9w9zqct+XJZQ=;
	b=ZWFHDMY55auBISb3bpckaRkN2oSzTw77kr7XHN92fo5ZJYRRJxgeh2gva+vATu9UhL
	vPv3S9BB4b18+TTAgNyy/0zuaB1X9IdOdpi16UxLye2oXzzWdHqdLFfqWgS5Rygxr03g
	dBYeMKOok/t7SDOeTNsG3FMBYH0HWe+FJh8fCz6cZZCKUMJeCJU647cGsfb3C1f/KipT
	FzakG+d1lUXpePSPxhSyh74LRTuDsntOxzEyDbAv+OHKeGe5woH8UxBdHxAJbPBQiK67
	GumnKJNHeFfmvrm4LcaJHTmGcCIO0Tq7h588VP5sAVkZeVuW2wQdwzUImWD3ATi3rvbC
	lBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:subject:message-id:mail-followup-to
	:references:mime-version:content-disposition:in-reply-to
	:organization:user-agent;
	bh=QgQopkYbwJTfmwBKv0vLPRNh9MU9hGn9w9zqct+XJZQ=;
	b=rQjPzpDQYvlLhQOyT4hD3bheK2+DVSpTdZwWRtrAmILLQHy+CGtXeQ0Wq6Vnkus9/4
	FLM2rRLzFnhIw5VejbirEsZ8jd9ifD5YZHyImZqq+VfNq1L7qH3DWCxP5NisHXF0ZRq+
	eLV7dkSI1P18K7Sk9hCJyTToAcoFjNIiR7SJIbKENGTUziYm6dmpqqFqQMQMEDkNZOtf
	nZGdWX2i4/F5nAvSYulOxfRyVH7xqksm50ucA8wp0ixzkzrX719RrSHF6zCA/+bluhoj
	HzAdyOkJ/GjuTGj5OGFSoT4YTTCbDBrUZzwmoZlhKXHLdW6FZoqW5giuMsjRzTMlaen7
	rNFA==
X-Gm-Message-State: AMke39mfUSVS1H3pjpC9Vxv9fmzBnHqP4Wj1mUlNMSvkpXSXgiik5D4MMZzX7PcB4ebbrg==
X-Received: by 10.25.215.136 with SMTP id q8mr9039566lfi.57.1487146654003;
	Wed, 15 Feb 2017 00:17:34 -0800 (PST)
Received: from ad.chargestorm.se (194-237-220-218.customer.telia.com.
	[194.237.220.218])
	by smtp.gmail.com with ESMTPSA id s28sm741826ljd.6.2017.02.15.00.17.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 15 Feb 2017 00:17:32 -0800 (PST)
Date: Wed, 15 Feb 2017 09:17:31 +0100
From: Anders Darander <anders@chargestorm.se>
To: openembedded-core@lists.openembedded.org
Message-ID: <20170215081731.lf5vtdcbong4xsyq@ad.chargestorm.se>
Mail-Followup-To: openembedded-core@lists.openembedded.org
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
	<e1b1c67d691fd317bf6c11d570ef5d261029f38b.1486997986.git.alexander.kanavin@linux.intel.com>
MIME-Version: 1.0
In-Reply-To: <e1b1c67d691fd317bf6c11d570ef5d261029f38b.1486997986.git.alexander.kanavin@linux.intel.com>
X-Accept-Language: sv, en, de
X-GPG-Fingerprint: 5AF0 B2E9 78FE 9D75 D110  6F8F 3E31 84D7 920E 938C
X-GPG-Key-Id: 0x920E938C
X-GPG-Keyserver: hkp://keys.gnupg.net
Organization: ChargeStorm AB
User-Agent: NeoMutt/20170113 (1.7.2)
Subject: Re: [PATCH 22/36] package.bbclass: add support for pkg_postinst_ontarget()
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
X-List-Received-Date: Wed, 15 Feb 2017 08:17:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

* Alexander Kanavin <alexander.kanavin@linux.intel.com> [170213 16:08]:

> All commands that cannot be executed during cross-install and can only be run on target
> should go into this function. They will only be executed on first boot (if package was
> cross-installed) or immediately during package installation on target.

How will this be handled when using ro-rootfs?

We don't need to make it easier to write on-first-boot only post_install
scripts, rather, the goal has to be to be able to run all post_install
scripts during rootfs creation...

Cheers,
Anders

-- 
Anders Darander, Senior System Architect
ChargeStorm AB / eStorm AB

