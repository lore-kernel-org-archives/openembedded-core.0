Return-Path: <rehsack@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id E1CA274A13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 20:30:42 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id r1-v6so11431983wmh.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 13:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=JIg1AWq/8d5ar3C0CBgRkg9FEqHgy7As32fMMGp+FHc=;
	b=m2erNabbNJ0c1d78kyflBgu0Kzxr/dY34Y2UksHfCKiUpm2fCtDMz2iULBTWuE074r
	hUXG3fuGgnwNjpDwuAqPvjPizpbck16CYBdXbR7f0vkVDuO9hwbuqOOpMvsw2Gsckb5c
	hvN3VwmwflWkwXrZnZx+V0s/pk/V7ItZk6mGMnUlxubOFrlyL9at7ITxUonSCiuHFF5E
	duRb/CYa+zmBd0zJe2oTImJ93rcgzy33XdUJxp/PNtaT73XbFX5ET3Z/cY8t+F64ar5r
	pHoen2CvagqU/BUrD/FYAfD1s6IU7TQWnL0paiUv2X59Jt23EYAuvNn96gbH0pAgnGIf
	35sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=JIg1AWq/8d5ar3C0CBgRkg9FEqHgy7As32fMMGp+FHc=;
	b=LrXeEX5aWxI3ciJfSA9zj9fkLWYIh8UESO+spebttGkurLiaERs/sSxjgObq9NHXjp
	nqDCm1x7Tl50bLzCIdzZL1DZ3Qj5ijJhenBhcA6fKiEjLMDhuV39bb8EneGFzJ3xxyCe
	lk7VwpThkLgsWcedKH+0dVQGx3z3OZGpCgoD+zks81E+hBpHPVBTtSodq4XZqSv/KDiu
	nKyvT+MGHzlf7nkKcpIQ4XuoljpqXnpwtXhenrOShdiLSUBJ0xpDRR4ISdQfO+rBuzu1
	7dqOejaozuoMCdkem1jDy54b5ooc+329R+w4fbX+TBSKN3S/Y5FAKjrEIyT5amx+DUbe
	4pNA==
X-Gm-Message-State: APzg51ByJIf1Z0jj648m5CgP/692cujRbE7QCjNu//L4XVygnVDGEwnN
	UdPTXIfFsRrz1xu0C7gZ5iRhZvu9S1idhXt0uyA=
X-Google-Smtp-Source: ANB0VdZW+Ii8/aGv7vTXzhHwCtMNdzc/udTf5m1ME8ATerXZ5yO9OP7AZcwAb/VHjIRWTx2kVNXQXD2hBzzMqDkivbo=
X-Received: by 2002:a1c:70b:: with SMTP id 11-v6mr2818797wmh.151.1536784243420;
	Wed, 12 Sep 2018 13:30:43 -0700 (PDT)
MIME-Version: 1.0
Sender: rehsack@gmail.com
Received: by 2002:a5d:6511:0:0:0:0:0 with HTTP; Wed, 12 Sep 2018 13:30:42
	-0700 (PDT)
In-Reply-To: <CA+chaQeiPiEKH7adkDTbDL3hP3Vo=2edSHM=eOM4mvh3O0udZA@mail.gmail.com>
References: <20180912120215.2371-1-sno@netbsd.org>
	<CA+chaQeiPiEKH7adkDTbDL3hP3Vo=2edSHM=eOM4mvh3O0udZA@mail.gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Date: Wed, 12 Sep 2018 22:30:42 +0200
X-Google-Sender-Auth: 2OAgVUNToiy0_sXE2pQMfO1jaVE
Message-ID: <CAANR1XH73HYOJOG8WACZu32_TEjXF+B8bJUqS9LiMJCyVOq5zw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Igor Kreps <igork@miltenyibiotec.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] coreutils: add alternative target for nice
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
X-List-Received-Date: Wed, 12 Sep 2018 20:30:43 -0000
Content-Type: text/plain; charset="UTF-8"

Tomorrow morning as first :)

2018-09-12 17:54 GMT+02:00 Martin Jansa <martin.jansa@gmail.com>:
> Still worn't work IMHO because you forgot to add nice.1 to
> ALTERNATIVE_${PN}-doc.
>
> Also the comment above bindir_progs:
> # [ df mktemp base64 gets a special treatment and is not included in this
> should probably be updated to include nice and remove nice from bindir_progs
>
> On Wed, Sep 12, 2018 at 2:02 PM Jens Rehsack <sno@netbsd.org> wrote:
>>
>> Avoid coreutils conflicts with nice from other recipes, like
>> busybox - even if that's not enabled by default.
>> In situations, where coreutils is a dependency for -dev images
>> and small busybox nice is available always, it avoids extra
>> effort for coreutils for those users.
>>
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>>  meta/recipes-core/coreutils/coreutils_8.30.bb | 6 +++++-
>>  1 file changed, 5 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-core/coreutils/coreutils_8.30.bb
>> b/meta/recipes-core/coreutils/coreutils_8.30.bb
>> index 053891f6ea..5ebd36026e 100644
>> --- a/meta/recipes-core/coreutils/coreutils_8.30.bb
>> +++ b/meta/recipes-core/coreutils/coreutils_8.30.bb
>> @@ -77,7 +77,7 @@ do_install_class-native() {
>>  }
>>
>>  do_install_append() {
>> -       for i in df mktemp base64; do mv ${D}${bindir}/$i
>> ${D}${bindir}/$i.${BPN}; done
>> +       for i in df mktemp nice base64; do mv ${D}${bindir}/$i
>> ${D}${bindir}/$i.${BPN}; done
>>
>>         install -d ${D}${base_bindir}
>>         [ "${base_bindir}" != "${bindir}" ] && for i in
>> ${base_bindir_progs}; do mv ${D}${bindir}/$i ${D}${base_bindir}/$i.${BPN};
>> done
>> @@ -113,6 +113,10 @@ ALTERNATIVE_LINK_NAME[df] = "${base_bindir}/df"
>>  ALTERNATIVE_TARGET[df] = "${bindir}/df.${BPN}"
>>  ALTERNATIVE_LINK_NAME[df.1] = "${mandir}/man1/df.1"
>>
>> +ALTERNATIVE_LINK_NAME[nice] = "${base_bindir}/nice"
>> +ALTERNATIVE_TARGET[nice] = "${bindir}/nice.${BPN}"
>> +ALTERNATIVE_LINK_NAME[nice.1] = "${mandir}/man1/nice.1"
>> +
>>  ALTERNATIVE_LINK_NAME[lbracket] = "${bindir}/["
>>  ALTERNATIVE_TARGET[lbracket] = "${bindir}/lbracket.${BPN}"
>>
>> --
>> 2.17.1
>>
>

