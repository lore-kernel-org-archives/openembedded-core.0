Return-Path: <andrey.konovalov@linaro.org>
Received: from mail-lf0-f41.google.com (mail-lf0-f41.google.com
	[209.85.215.41])
	by mail.openembedded.org (Postfix) with ESMTP id 9F30077D16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Nov 2017 19:59:37 +0000 (UTC)
Received: by mail-lf0-f41.google.com with SMTP id w23so28611728lfd.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 25 Nov 2017 11:59:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=erhNDVJhGyN5YSZncYrGNYi9YcksusviIP040rm/0wo=;
	b=GCAHyjrRhdeDIKcRJpWFgAPxj6forWXyBakXb4kY5EswNOs5/btPF8d8znMxn6KH4b
	gq6gLHuoLvfU5QE3pb4DDajKVS2YdH7jlVKqi6lnVeufMG43htAAG9ffxCE5Ik10rgCT
	BuKsouRrR3/3iwbT9pFZkW16Sz4i2PRCp5CsE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=erhNDVJhGyN5YSZncYrGNYi9YcksusviIP040rm/0wo=;
	b=cqITRkO4SCl6YkDPL0rKq/7T4E6YPxOZDmbjGHE0UfsA8A5ju4xS+lDDlQWO9ajF0M
	uJn7ORT4GEh+Etm29yvqA4RgWhS5bSn+y112czVYJL5OBosYMp84f934xjxYl6Tfk5Jk
	AwwMdvK1m/gGiMDdo3dfWtR25gngAKQLjIWVmmLG7sbyHEBqpDGWtK7jpL8YuMuWzRP6
	fYtLdxvbS28G7/hrOIWwyc/iF+gxhuTUjui1FyRWlDSWRNxuJgsbDzVfvICidwiUn8+w
	EVERnFlrbicJv39hw27xbylWzWmayugn1+50zt5HOc3hEDU1DdeC04jkrXzGL7RWhoNw
	UYtw==
X-Gm-Message-State: AJaThX66VOHkY9MOSPmTTP0YkyrjluHNkx/Ru0tvsYLhjx4PRbHLG2IY
	PECAVzld9sdNSMN8qvw7lxt5qA==
X-Google-Smtp-Source: AGs4zMY7+mP63UM7UMwsVC7oFeVRVYYDL1DEoEq0ZOhM8kZ9CnzPkTq8u8hW8V89DAJdvpfRJcN0Pg==
X-Received: by 10.46.117.28 with SMTP id q28mr11386089ljc.14.1511639977991;
	Sat, 25 Nov 2017 11:59:37 -0800 (PST)
Received: from [192.168.118.253] (95-28-65-22.broadband.corbina.ru.
	[95.28.65.22]) by smtp.googlemail.com with ESMTPSA id
	c1sm1458290ljb.78.2017.11.25.11.59.36
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 25 Nov 2017 11:59:37 -0800 (PST)
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
References: <1511552846-1887-1-git-send-email-andrey.konovalov@linaro.org>
	<3c7c379d-44d8-162a-d941-a7d13ba48460@linaro.org>
	<20171124143425.2751a5e3@lsandov1-mobl2.zpn.intel.com>
From: Andrey Konovalov <andrey.konovalov@linaro.org>
Message-ID: <5352b394-5e08-2bec-2248-3b4ba7ea85b9@linaro.org>
Date: Sat, 25 Nov 2017 22:59:36 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171124143425.2751a5e3@lsandov1-mobl2.zpn.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [rocko][PATCH] weston: add patch to set pitch correctly for subsampled textures
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
X-List-Received-Date: Sat, 25 Nov 2017 19:59:38 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 24.11.2017 23:34, Leonardo Sandoval wrote:
> On Fri, 24 Nov 2017 22:58:20 +0300
> Andrey Konovalov <andrey.konovalov@linaro.org> wrote:
> 
>> This exact patch also applies to pyro.
>> Should I send the separate "[OE-core][pyro][PATCH] weston: add patch to set pitch correctly for subsampled textures" email,
>> or just asking to merge it into pyro as well is enough?
> 
> better if you send another patch with that subject so the non-master maintainer can pick it up.

OK, have just sent the pyro version of this patch.

Looks like it confuses the patchwork system a bit:
> This is a system generated Comment: Patch 146165 was automatically marked as superseded by patch 146166.
To be clear: the same patch should be applied to both pyro and rocko. Patch 146165 was posted for rocko (with [rocko] in the subject line),
and patch 146166 is for pyro (has [pyro] in the subject line).

Thanks,
Andrey


