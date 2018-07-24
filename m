Return-Path: <alex.kanavin@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id CC92360197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 08:37:54 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id y207-v6so6070014oie.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Jul 2018 01:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=2mo0WJ2gfd7vl6EdxKsf4NErfYU86dQZImbLK98abuk=;
	b=CGbBvo4nlL0yD6ZtRo6eVBh8g4ZsssXsP2U+7LgiWhYy0YvGtKTjJxsIaZS2IRY1y7
	2cyx9wqydEcrhPeOxd66tcaxyD7SO0vQ0k1CNT2LaVAKohSzqd6rfuWe7bfspI94BMPd
	KUs7aQ3tlOn3qxFWBO7nuXgfEn5gFXKpuBoXCb/QCj5ehio0WTBSfx1qTeeiI5NbBZU5
	hDhlIFZd7hWftxAPgDa4KpfUmeBhIgAABh8XhHUuPLSHrgZ8Ndg8h4MLBrxCaJj5h7Ox
	rs3NngdTDZx04ZWtinYHTAW9qhbOPO5M7s4UNz1VMx8GmiVM5+AYViVYUdj/rWbWQrBX
	fAsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=2mo0WJ2gfd7vl6EdxKsf4NErfYU86dQZImbLK98abuk=;
	b=KmhIOE80PNZkf/meIX7u4pVIsfz+CKxjglDyrh7IfuV9AOSJRmfkHdjPmrY6cPK4p4
	XzGf7HJgNiWUIRHRIjqfU7sjgdc8ZYp0Jijqd5vV4TqieXusHqNnA6sx4rT8ag/ts8aA
	ROhdRA0WIFoWNkPlU7Hu5v4rgh2KcZ50rZh2HasCNO4RR+FGXvhjk/2YGs6nmHjTXTYB
	LsLSiiXQhsIcIwv8znBF8cM9RDdDG6xYw458EwpyGTZsdJUcLvWvmym/wFBpePbWOOSj
	sCkuZpwuSbTBlBd96BGyG/fUbgPEMqB4/s+tRtl0P2mfwxdMOREOI/sHzC8YNCEwBv3z
	vTug==
X-Gm-Message-State: AOUpUlGQuvNLRJZQd22hxxBjtdgC7YuJuX1fFFIdliGTxOVzA+7UhqoT
	xYUGemTsYjdjsqUDKgezvProtI7xjHKFa697HDE=
X-Google-Smtp-Source: AAOMgpfUw6yRRbpdvm1G1rgvuOAz8f3ujT0NsxHp1pBcndG4nPRxSSpSmuy3xjugFYug6kNLuw9+7qfs1KclE+9kuFQ=
X-Received: by 2002:aca:4fcf:: with SMTP id
	d198-v6mr2010662oib.51.1532421475752; 
	Tue, 24 Jul 2018 01:37:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4a:90c5:0:0:0:0:0 with HTTP; Tue, 24 Jul 2018 01:37:55
	-0700 (PDT)
In-Reply-To: <CAJTo0LaFai2biC-973Da-o7NMFwYkMWRTa4F5O+prseWFNwW4A@mail.gmail.com>
References: <1532418493-21449-1-git-send-email-ovidiu.panait@windriver.com>
	<CAJTo0LaFai2biC-973Da-o7NMFwYkMWRTa4F5O+prseWFNwW4A@mail.gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Tue, 24 Jul 2018 10:37:55 +0200
Message-ID: <CANNYZj-FSOW33dXtdmo=467nktA_W8oXWknzUOURKWWb331tEQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] lsof: Update SRC_URI
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
X-List-Received-Date: Tue, 24 Jul 2018 08:37:55 -0000
Content-Type: text/plain; charset="UTF-8"

Also, if an upgrade is undesirable for some reason, then such changes
need UPSTREAM_CHECK_URI, or we'll be missing new upstream releases.

Alex

2018-07-24 10:07 GMT+02:00 Burton, Ross <ross.burton@intel.com>:
> Well for master if there's a new version then a better fix would be to
> upgrade, but we do need to make sure the previous releases are using
> mirrors.
>
> On 24 July 2018 at 08:48, Ovidiu Panait <ovidiu.panait@windriver.com> wrote:
>> lsof 4.89 archive has been moved to OLD directory and turned into tar.gz,
>> so update SRC_URI and checksums.
>>
>> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
>> ---
>>  meta/recipes-extended/lsof/lsof_4.89.bb | 6 +++---
>>  1 file changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-extended/lsof/lsof_4.89.bb b/meta/recipes-extended/lsof/lsof_4.89.bb
>> index 14546db23c..b58b8281f9 100644
>> --- a/meta/recipes-extended/lsof/lsof_4.89.bb
>> +++ b/meta/recipes-extended/lsof/lsof_4.89.bb
>> @@ -11,12 +11,12 @@ LIC_FILES_CHKSUM = "file://00README;beginline=645;endline=679;md5=964df275d26429
>>  # https://people.freebsd.org/~abe/ ). http://www.mirrorservice.org seems to be
>>  # the most commonly used alternative.
>>
>> -SRC_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/lsof_${PV}.tar.bz2 \
>> +SRC_URI = "http://www.mirrorservice.org/sites/lsof.itap.purdue.edu/pub/tools/unix/lsof/OLD/lsof_${PV}.tar.gz \
>>             file://lsof-remove-host-information.patch \
>>            "
>>
>> -SRC_URI[md5sum] = "1b9cd34f3fb86856a125abbf2be3a386"
>> -SRC_URI[sha256sum] = "81ac2fc5fdc944793baf41a14002b6deb5a29096b387744e28f8c30a360a3718"
>> +SRC_URI[md5sum] = "8afbaff3ee308edc130bdc5df0801c8f"
>> +SRC_URI[sha256sum] = "5d08da7ebe049c9d9a6472d6afb81aa5af54c4733a3f8822cbc22b57867633c9"
>>
>>  LOCALSRC = "file://${WORKDIR}/lsof_${PV}/lsof_${PV}_src.tar"
>>
>> --
>> 2.17.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

