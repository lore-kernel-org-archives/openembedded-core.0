Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f176.google.com (mail-io0-f176.google.com
	[209.85.223.176])
	by mail.openembedded.org (Postfix) with ESMTP id 733AA719B2
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Mar 2017 16:15:26 +0000 (UTC)
Received: by mail-io0-f176.google.com with SMTP id f84so99005266ioj.0
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Mar 2017 08:15:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:organization:mime-version:content-transfer-encoding;
	bh=UvvcZ1YCLjz8E+WdqXqZNmm4IWAN/scQ1RcPzTBbmAk=;
	b=KS2zo/jdorL1cjwg+mzYq8q60WiHAbB5EhD7uBfHRWtEi3ID/PR1j0L4wHJ0nYAz2j
	7nn7JV+NWW5KGn4OXbCtlSHAGCJNJ/yysKmTeik8PFSNk/naYte+qZBIqUNuAEh4klqG
	hLrbvl7dEQOAJ6EXKLhNEM9tQTSJOg+srRDNE2uSMEg32STb43OyCiOW91Oep4YxZALe
	0AghB2jx9Ee1cvfIpRm/1TAhiIR7gZiRge5WerFSHuq7M+UYBujn0MbWuCKUG+p8zbog
	tedk2rG38IJ1BrgyAeR4ix1/Y9Xrta9XdK/SGLKkuSX/j0Mg7hQholpnLqV/EEHYGRqY
	+VKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=UvvcZ1YCLjz8E+WdqXqZNmm4IWAN/scQ1RcPzTBbmAk=;
	b=gHKKlL1hylxU4pHml0pUti+wZSMWKvFC75z6oiSUHz/4Sn8PM72CTFXOdej4HxxKo0
	I8qN8pFrMlOXYMKPAT8BUNCC6v1XBr6bJ1YPuJqEmec1TJINEnzVL32UxOp+7ujWlRxX
	qMAUjHXTQfGo2ZuwtZDr4kzxihYvDZpmrGECDsUHSRLV/oDeLdmcyw91l+Wm+VMHdy50
	kvvzmsaRhEOStNctfHd9o844QlOCiqe2z1aLzl1L5/qMjM/MkSF+j6D2TDm5YLZVHyRB
	j8XC1BeCg16UaIT5l/0d3kePt0AiLQ5wYaxPjOiWqremmKVSMPU7+z3vnXg663ncnzYA
	FZWw==
X-Gm-Message-State: AMke39kcgRe/807fdvvUp2NW5vnUJ1XYpWB+bE+7Ohb5VPCVVKOXnmidsIlvZsX4KlnFjgeR
X-Received: by 10.107.143.131 with SMTP id r125mr4715007iod.148.1488730528111; 
	Sun, 05 Mar 2017 08:15:28 -0800 (PST)
Received: from pohly-mobl1 (p5DE8CB93.dip0.t-ipconnect.de. [93.232.203.147])
	by smtp.gmail.com with ESMTPSA id y7sm3390390itc.27.2017.03.05.08.15.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Mar 2017 08:15:26 -0800 (PST)
Message-ID: <1488730523.7785.290.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Date: Sun, 05 Mar 2017 17:15:23 +0100
In-Reply-To: <CAP71WjxRGB3L=iKN+LK2JTdO51oy10Vua-sg46E6MvOu+B52fQ@mail.gmail.com>
References: <CAP71WjxRGB3L=iKN+LK2JTdO51oy10Vua-sg46E6MvOu+B52fQ@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: systemd and /etc/machine-id
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
X-List-Received-Date: Sun, 05 Mar 2017 16:15:27 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2017-03-05 at 10:40 +0100, Nicolas Dechesne wrote:
> hi,
> 
> I am trying to understand why the systemd recipe creates an
> empty /etc/machine-id file:
> 
> # Create machine-id
>            
> # 20:12 < mezcalero> koen: you have three options: a) run
> systemd-machine-id-setup at install time, b) have / read-only and an
> empty file there (for stateless) and c) boot with / writable
> touch ${D}${sysconfdir}/machine-id

It's probably done for case b, the read-only rootfs (both when never
mounted read/write and when initially read-only until fsck completes).

systemd mounts a temporary machine-id over the empty file while the
rootfs is read-only. This is definitely needed for the permanently
read-only rootfs, because several services (for example, journald, if I
remember correctly) do not run without a valid machine-id.

I'm not 100% sure whether the "read-only initially" case also needs the
file. If not, then perhaps it can be limited to images with "read-only"
in IMAGE_FEATURES?

> Having an empty machine-id file seems to prevent the
> "ConditionFirstBoot" to be ever met, e.g. I have a service that tries
> to use it, and at first boot i am seeing in systemctl status:
> 
> ConditionFirstBoot=yes was not met

When the rootfs is read-only permanently, does this condition still make
sense? Probably not, because each boot would be considered a "first
boot". Just wondering how this condition could be handled better.



-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




