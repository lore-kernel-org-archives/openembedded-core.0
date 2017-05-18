Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 29CFF7807B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 18:58:02 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id d127so13220654wmf.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 May 2017 11:58:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=wrzqfpGuo276JsvdF6uiS82FKV1C93ql92wQaqCJK7k=;
	b=MChytpGCEZkfUnkzVO6YIDLgjFR4xDknkpli7i+Px7Z9zqHd5u5bCjLSNB9MNZxtTZ
	14VX9B9UfgxMo6GjCK3/OuCWOaVrkyEZwim6NA3nI5ReEeT/H8CGas/8BqTITLDMNlCN
	8dReNkPPEVaZ0ITv4dqC75ifr3CqmefGL6BxIJcYIUblo5o5bLnvXc9nb9fRVRzEfH9F
	DnqPigsQCe9cORzcXuVakJPjAleEQ2T1ghM1ZOsA+LS5GfmRSLRDSN5i+dZqzVJlYBoa
	yklHAr5RNlYjya2qgk8XSY/xxP0PF55/N5zUyIdOXfuZ8qUSexOH8JqtO3R2QOWBHHK7
	o1wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=wrzqfpGuo276JsvdF6uiS82FKV1C93ql92wQaqCJK7k=;
	b=c3Opyl6Z2uZg7X3n/SyGdvbThCV4znGvtrAi3EHYG+vNMxBZ9ozC3fLOYaaBNPRyy0
	0tF9EsE1r7h+0+VNXqWhnEAx34wxZE6TsjxQCsrI5JA1E1LndqDUcFGc4moZ6SF28ZaL
	8H/ws1feZBwB6LIOTq4fF6sH78NB/MJZQG637Ow7/3+YCgybrPYYAmeIxto/pmLFZrYa
	0SGGkfMa6CtH+YQCtSnvo0+wDxptd5mSn791bqonQtolTEs5yjB0gQ5FLnI5qw0o5kMe
	6XanktyqxWIjHGT4+l3YGfetdcPsav+HNK10TWDhCb7tEx+3nex8ZkzSuE7Z55jxUiiZ
	gtrQ==
X-Gm-Message-State: AODbwcBeaHwZ/6UcFn/Va9QhKQBqv2laN338oqk7CZovpFv1oDBLfevy
	/Dqc8AifrFilA7GilOTeTZkTXTeaqQ==
X-Received: by 10.80.137.56 with SMTP id e53mr4398021ede.67.1495133883434;
	Thu, 18 May 2017 11:58:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.195.143 with HTTP; Thu, 18 May 2017 11:57:32 -0700 (PDT)
In-Reply-To: <20170518181957.GU28053@denix.org>
References: <20170518173423.28994-1-enrico.scholz@sigma-chemnitz.de>
	<20170518181957.GU28053@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 18 May 2017 11:57:32 -0700
Message-ID: <CAMKF1sp9VFkd5+4HcYpgnZ+HhOoarKJNrc=--DTsmGYJyps-2g@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tzcode-native: quote ${CC}
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
X-List-Received-Date: Thu, 18 May 2017 18:58:04 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, May 18, 2017 at 11:19 AM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Thu, May 18, 2017 at 07:34:23PM +0200, Enrico Scholz wrote:
>> build fails else with
>>
>> | + make -j 8 -l 6 cc=ccache gcc
>> | make: *** No rule to make target 'gcc'.  Stop.
>>
>> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
>> ---
>>  meta/recipes-extended/tzcode/tzcode-native_2017b.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb b/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
>> index 2084f79..165d2c6 100644
>> --- a/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
>> +++ b/meta/recipes-extended/tzcode/tzcode-native_2017b.bb
>> @@ -18,7 +18,7 @@ S = "${WORKDIR}"
>>
>>  inherit native
>>
>> -EXTRA_OEMAKE += "cc=${CC}"
>> +EXTRA_OEMAKE += "cc='${CC}'"
>
> Should these be double-quotes around ${CC}?

I think this should work as such.

>
>
>>  do_install () {
>>          install -d ${D}${bindir}/
>> --
>> 2.9.4
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

