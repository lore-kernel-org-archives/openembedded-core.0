Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.34700.1795575887040808270
 for <openembedded-core@lists.openembedded.org>;
 Tue, 24 Nov 2026 19:04:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=vKmuIx2U;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: bbnpreetsingh@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-3b41e627cadso3244190a91.1
        for <openembedded-core@lists.openembedded.org>; Tue, 24 Nov 2026 19:04:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795575886; x=1796180686; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pKFkOvIOXLCqmuZXTE2cxKIGhnFkSYxDeP3hOyeZGGA=;
        b=vKmuIx2U7VpjYXwyVcH1PEdpm2HpRGc4A6JFJWL5HJhuMn4B4GT2SMFi8AwHGZqcOX
         CBhIhzCvtTKPKyeQgTLRrYnfUZUq+cs3DEqqtPDjfJcIH4FzGU9ymOti3srdiIWDonoW
         rNPYSOxISMR0hoQXBVeRQQvAx/zwy/Lk4wtPy5RaaAlGq7b7j7bMs2Lkna4ctTN0HkJX
         HrmhDnsS+F2Vf/AZ2HKIcE4AldYK0vGY68Ga2R7wExu0pucOnAncJat1DCfNg8kfrY6J
         wpoCqvvWL+7sUhkBNSLHVA1xqwXxUYXt1Lu7cYrTFGBycc6PTYYtr6a39Ld7ie0Bjx1H
         kjlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795575886; x=1796180686;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pKFkOvIOXLCqmuZXTE2cxKIGhnFkSYxDeP3hOyeZGGA=;
        b=vCpOYRs3Rkk109zygbmqhCYsF7VUsa676SLFfKfUm2h9W1J+J43SrNmFLmMyEYODwd
         0fl5vfeQKlv/Mb8eMs7N3Vs/1rkcH6dcdd9ysrp5OcuTE1fYA4KnqA9gGav33OSpRYkb
         hvnWzkqVeU734KjvdDF5S4wY096Kmg/xwbSBKVvwSsR09YeFnV2u5bPmHMUzk6YddRWN
         yOPRN2UgEKV2Uui8jPbGwAvUMLrMYpD1A5Tg5npslIyZr6j0h2oStiQ3xs7h8igQsb19
         DiTxc4spPqBf5JYg9Nlxo33q0XNMC/umM92FUmnNoun8HD2zKJCQNxaNDJACHZ2lGNq2
         QfuQ==
X-Gm-Message-State: APuU4Z/ywEG0nrmCcya93hCA040MKiR2fi1qS7SJ2O0yurvWNsgrlXTS
	RdtPM1ZuT6g32nAAFe1Ke0iyKluKJzVgxslWnsja7jMGWK4NqBC+k2Lv
X-Gm-Gg: AZFdTZeTdBbTXbUnvON1kMz34AmDfgOXoP+H8aMS7HqfI7ijc+fAXB4jJoNpaaB0OsO
	qxtXYh8aCKgRtpRVTxLLNePMwVmecE4KsQd/rJad2mMycXxioeAOOU565xn+TEgr/NTRpgC+tsO
	I0dbX771Ma2gB8qd6DcvJPCaJRtKupGfQqr5tSDhNlxFdiNdLXV5hQnzWJO9XVu7oWWUo5e4u1G
	Ut8jAkUj8yhtGfVod+AttLWaV177M6uFg4AqyTUMzk69/Bvw8BeKL0cF8TV7+scQrar0BCMyk+a
	6MtqwdPBNEuMB6ZI8CTSmOTHakx3fY4EuTdUbpii4RGcKnsJ3jS6DENbpNn6W2R2hQ0hsRoQcqD
	J60p9Tw4NbnAfIBuSq9FiSMKPppWBXiXLKcNL4ar8ftS8uK4ATZ3dYj3a2KgJ0kOF2ey7nPc6Xr
	ZtxKp7oCSL/fhwb2JqUvJYIerH9iHnTkT4D798TB0VBxAjZrICyoy1fCbBYonoWLVMwoNMN0vpO
	vOwQFs2Z/TtumXgzL3BoqTwslqqX2NDT0jG1HxYsrW2KIA2wTP4u30/N23eNpieXL6XWK2al5hm
	CIRzH+z+cWvWoo84rismG1l8UsmKFzLVTJ6T0uE9tLW+6gujmw30VkOLLg==
X-Received: by 2002:a17:90b:2f8c:b0:3b4:10c3:c1b6 with SMTP id 98e67ed59e1d1-3b41c9286acmr16137557a91.25.1795575886371;
        Tue, 24 Nov 2026 19:04:46 -0800 (PST)
Return-Path: <bbnpreetsingh@gmail.com>
Received: from localhost.localdomain ([108.180.159.198])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b457a58d04sm10186229a91.0.2026.11.24.19.04.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:04:45 -0800 (PST)
From: Babanpreet Singh <bbnpreetsingh@gmail.com>
To: Paul Barker <paul@pbarker.dev>
Cc: openembedded-core@lists.openembedded.org,
	Ross Burton <ross.burton@arm.com>,
	Babanpreet Singh <bbnpreetsingh@gmail.com>
Subject: Re: [PATCH 2/2] recipetool: create: fix git URLs that only specify a tag
Date: Wed, 25 Nov 2026 03:04:45 +0000
Message-ID: <20261125030445.7-1-bbnpreetsingh@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <DN2HHOGYJB3B.1EWTJOMA10ROH@pbarker.dev>
References: <DN2HHOGYJB3B.1EWTJOMA10ROH@pbarker.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 25 Nov 2026 03:04:47 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/251129
Content-Type: text/plain; charset="utf-8"

On Mon Nov 23, 2026 at 9:30 AM GMT, Paul Barker wrote:
> The explanation in the commit message doesn't really make sense. The
> issue with the test recipe created for matchbox-keyboard is that the
> commit tagged as "0.1.1" isn't present on the default branch. This is
> not true for all git URLs with "tag=..." and no "branch=...".

Hi Paul,

Yes, the message is wrong. bitbake 2515fbd10 has nothing to do with
it, the fetcher gives the same error for a nobranch=1 URL with
${AUTOREV} before that commit too. The tag being off master isn't the
cause either, though. libfakekey's 0.3 tag is the tip of master, and
git://git.yoctoproject.org/libfakekey;protocol=https;tag=0.3 fails on
current master with the same "Unable to resolve ''". Where the tag
lives matters later, for the branch= written into the recipe, which is
what the matchbox-keyboard test checks.

> There is no situation where we are "without a branch". As the following
> comment says, we assume we're on the "master" branch if the branch is
> not specified.

The tag block just above sets nobranch=1, so that default is skipped
and ${AUTOREV} has no branch to resolve.

I'll send a v2 with a fixed message.
Thanks for the review.

Baban
