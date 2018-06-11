Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 5F98378BE8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 14:42:32 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id h12-v6so10341834pfk.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2018 07:42:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:openpgp:autocrypt:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=nEq28hfgm1J/JXjaYiFbMvU4vvpfqI09C5p8PT+KUFU=;
	b=IubaarRfmf28FQAjSdzBJpv4jRhfMZ7ohucezqe56UCh8JTxguwsOzzIvh4Xam6/FP
	ATQq780mT44olckmWOwsTFRmwgmUgNKvszX3FNhcxn8OUfyLqmZNHp8JhZPwBveWDrAX
	wpvrM/gk72Gztr9/fiub1bSciy7SI/+uZYFF2YDZcRex4vvlcH+Eb9fbi2zl1ldtYz6S
	rg9zxwodbSt7pGp9jWM04SIjoqzZDXa1le6kK8kuS47Q2z4fB3nadPatfAVLSYla+8YT
	6V9mli32oshrsgFl+qYpYjbSTnnPYZh1s6iYO9fHtCnUnRZQZ5SYFQPA7HVPzo+TzK0p
	FRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:openpgp:autocrypt
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-transfer-encoding:content-language;
	bh=nEq28hfgm1J/JXjaYiFbMvU4vvpfqI09C5p8PT+KUFU=;
	b=il5tyLxjHYC9Qr4vcMRRyVn2pl2kUeqsebjGpXeWpfOENWn/6JIodxM0RHLG+E296c
	2QdWFVu6OdEeGRb13IaKKfu6kA5j67qtnZ9kzZjv1ntmvNtxPuzJaS0BFHiORU0VHmAu
	2cLBQh1obmMZE4tPfe9u1/QVrZ8SB0dAGqtn2NjIMcGDXT4C+GYRHQbsvgTBKu5zOGG6
	i5GzPCIOWTFnihgktHn6cF+0J1h4vUJREXPShkj5t/ZeSmYA3Uf5YMHCzSrTW3KFNE73
	qeR6PxpyedQiM2z2U79FTnIkK5Sy+KwQ1erbgmzzy2LSrWAfFzjsPSjMVpaZkBi+XcPc
	fGxg==
X-Gm-Message-State: APt69E1AcYtEtySfaGjzV3Qk2jXGeIAoIUgFt1xU+fB/EXXebajMgdIn
	7vdNmuEjxndEK87Gh9Est2B7Tw==
X-Google-Smtp-Source: ADUXVKKOUe09Qf4gckqz8M5pp5Ah2g2Uu/k442982g3uNZqGSIKyd7JZVDQp3A2UtmazVypr9x8Vuw==
X-Received: by 2002:a65:554b:: with SMTP id
	t11-v6mr15311638pgr.130.1528728153428; 
	Mon, 11 Jun 2018 07:42:33 -0700 (PDT)
Received: from ?IPv6:2601:202:4000:1184:3dc0:dfd2:694f:63cf?
	([2601:202:4000:1184:3dc0:dfd2:694f:63cf])
	by smtp.gmail.com with ESMTPSA id
	z192-v6sm37971500pgz.6.2018.06.11.07.42.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 11 Jun 2018 07:42:32 -0700 (PDT)
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <1528690704-338-1-git-send-email-akuster808@gmail.com>
	<9739bd9dd81149458033ba72cb7ce411@XBOX02.axis.com>
From: akuster808 <akuster808@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <bb38520f-85d7-9e63-83a6-76477073285a@gmail.com>
Date: Mon, 11 Jun 2018 07:42:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <9739bd9dd81149458033ba72cb7ce411@XBOX02.axis.com>
Subject: Re: [v5][PATCH] busybox: update to 1.28.4
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
X-List-Received-Date: Mon, 11 Jun 2018 14:42:32 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 06/11/2018 01:45 AM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Armin Kuster
>> Sent: den 11 juni 2018 06:18
>> To: akuster808@gmail.com; openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [v5][PATCH] busybox: update to 1.28.4
>>
>> refactored busybox-udhcpc-no_deconfig.patch for this update
>> updated 1.28.3
>>
>> [v1]
>> removed patches included in update:
>> busybox/CVE-2011-5325.patch
>> busybox/CVE-2017-15873.patch
>> busybox/busybox-CVE-2017-16544.patch
>>
>> [v2]
>> Add back busybox-udhcpc-no_deconfig.patch ti SRC_URI, missed earlier
>>
>> [v3]
>> Update defconfig based on feedback
>>
>> [v4]
>> Decided to update again.
>> 1.28.4
>>
>> [v5]
>> rebased change do to changes in master
>> squashed .cfg into defconfig and remove files
>> Delete busybox-fix-lzma-segfaults.patch which is included in updated.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> The commit message should be rewritten to document the final commit, 
> without any patch series references. They belong after --- below.

Done that before and folks complained so I started included with files
got removed. May I suggest updating the process so we can be consistent.

- armin
>
>> ---
>>  .../busybox/busybox/CVE-2011-5325.patch            | 481 ---------------------
>>  .../busybox/busybox/CVE-2017-15873.patch           |  95 ----
>>  .../busybox/busybox/busybox-CVE-2017-16544.patch   |  43 --
>>  .../busybox/busybox-fix-lzma-segfaults.patch       | 106 -----
>>  .../busybox/busybox-udhcpc-no_deconfig.patch       |  36 +-
>>  meta/recipes-core/busybox/busybox/defconfig        | 278 ++++++------
>>  meta/recipes-core/busybox/busybox/getopts.cfg      |   3 -
>>  .../busybox/busybox/login-utilities.cfg            |  13 -
>>  meta/recipes-core/busybox/busybox/mdev.cfg         |   2 -
>>  .../busybox/busybox/mount-via-label.cfg            |   9 -
>>  meta/recipes-core/busybox/busybox/resize.cfg       |   2 -
>>  meta/recipes-core/busybox/busybox/sha1sum.cfg      |   1 -
>>  meta/recipes-core/busybox/busybox/sha256sum.cfg    |   1 -
>>  meta/recipes-core/busybox/busybox/syslog.cfg       |  11 -
>>  .../{busybox_1.27.2.bb => busybox_1.28.4.bb}       |  15 +-
>>  15 files changed, 162 insertions(+), 934 deletions(-)
>>  delete mode 100755 meta/recipes-core/busybox/busybox/CVE-2011-5325.patch
>>  delete mode 100644 meta/recipes-core/busybox/busybox/CVE-2017-15873.patch
>>  delete mode 100644 meta/recipes-core/busybox/busybox/busybox-CVE-2017-16544.patch
>>  delete mode 100644 meta/recipes-core/busybox/busybox/busybox-fix-lzma-segfaults.patch
>>  delete mode 100644 meta/recipes-core/busybox/busybox/getopts.cfg
>>  delete mode 100644 meta/recipes-core/busybox/busybox/login-utilities.cfg
>>  delete mode 100644 meta/recipes-core/busybox/busybox/mount-via-label.cfg
>>  delete mode 100644 meta/recipes-core/busybox/busybox/resize.cfg
>>  delete mode 100644 meta/recipes-core/busybox/busybox/sha1sum.cfg
>>  delete mode 100644 meta/recipes-core/busybox/busybox/sha256sum.cfg
>>  delete mode 100644 meta/recipes-core/busybox/busybox/syslog.cfg
>>  rename meta/recipes-core/busybox/{busybox_1.27.2.bb => busybox_1.28.4.bb} (72%)
> //Peter
>


