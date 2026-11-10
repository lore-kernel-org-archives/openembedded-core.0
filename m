Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.14554.1794292250665552825
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 22:30:51 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=GpobjR77;
 spf=pass (domain: smile.fr, ip: 209.85.221.42, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-491846221ffso1128497f8f.3
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 22:30:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794292249; x=1794897049; darn=lists.openembedded.org;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=afnXHMgXH2+rC5dZXHiQb5tC5oPXU8K/FNwo7XLitHA=;
        b=GpobjR7744hHNsvwSTJucPGIQhl0LvD7zlG/eAM1KLJAKuyNzqJByOGOjGorCbvSB0
         ug9HY2svnddNxNPnrJ+zUpwR+etBKC8wmB/WBcMF/uO/WJpP9P4Lm3GbuMtiRqyrCyTu
         vmeX9AUGeGHYZ+aWIp4zwnHERo89938byf1bM8Q7+4LajuinEAEWxR1WmoO7j8YssHc+
         f47La2w7zXHD4NbuAp4cSfMMyLXYgndlac5sk8Cheog+4RpnF5beSKxi/VZE+emcSYUb
         StamokD1Rh4K9f+eOJJmTuJG5MxLI9ckZPe6cYjMXjzwXdfbBHk4EwiewVJFNMFj8g8S
         E8Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794292249; x=1794897049;
        h=in-reply-to:references:cc:from:subject:to:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=afnXHMgXH2+rC5dZXHiQb5tC5oPXU8K/FNwo7XLitHA=;
        b=FmMUuTBZUUMVOpKJpOiu6NVofSEYu3LG7LhyWEZjwocKFiWjNsIsFlrcPTcGX4ii/5
         NvpWmXruuh9aPDMbJEN3j+GGqnaQT56UC0PgCoFMKVgibz1BOGC1vAW5NN+GEbQwVswP
         XnB2q4LafkS6OnhSL5/L3gjmdG0F0loWD2Cfy5Chw/PhEMxPGYHfo32+1G/Zyp9Ihc7c
         UCbgpMRkLJASOTYhvVjKirfuXx/hGujsTZRns9G5+0Ia4+te9IgYEPJQZERbuSpW5ZRs
         biuzV3Cih5ZoChalznXiSfTd9jUPswC6w0+3vhAFeaaITE8o2Y72s5q5H5SnxIrKW4Rb
         rojQ==
X-Gm-Message-State: APuU4Z+Sffb7Jp/X4ERXwmknWrXgitkMgRqtsw9jeFrhHbLCblbDKr4W
	Vz3xMUdDmK+HCYRNNWSRVJ1yCRtdj74NA4ePD2RHje1Rx2R097bfilCw/uTY0jMUN4g=
X-Gm-Gg: AYBFou2RKBgfA+v0oix+0hUlcPDt76k62rQDs2xJhbNEtAz3A0NUhDaZbKTvADYULAE
	SLs26FqC1wPZum2CCn7HP79NDcqJZNzJ505txyzbe8bZsibtolrLzjPSJjkDw4lve5hX5N1btnu
	6vGIaHvVHYOPv51SJMVNKu5srpbs+0HZ8irDF28vSHzbuhRCwlBPbrAqUSxzGKE3idkgmViJzOO
	hyM+VAHJg6M2ZuGORZi4bgCET51u/nzdRJ6ktX6HqMgvyEpNz5RF3B2FGHOOCXgEBn2uWCOy78i
	iF7NatdwTQcBA67zscIabfpiXXXe8wrB6q9++6uqr18AFOOzWJBz5WE4NDeoVwgEA+yBKEM5FBg
	QWCtgoGP19sixT6nMxkHY4jMUat3Z9hIOX2qJCRfdwFR/iy7qIVbA4UjvVCZiK+4jjFcatr2Pxf
	ZtoBCxAK/uSmcfy+YiX83Cqxyt3zo7Ge5Sh/YJ5r/51zH5H27hQGmHT/WuH8GT9QgcNgLIMQ8nX
	a6sBcCz/epFloQxYIDB2d3792HX40x0QEF2hImaVjdlWo+JBN9le5BXmVqZWEJ7hnQfRujFz0KH
	tm3orodbsw/NSvLSdfReps0SEiT7UWAtjQAS9Bl0Xq5UVbyx99jfEbiFa7fLfcm7V0u7Rd9V6tc
	WgAUQ3eP7/plkhLP6
X-Received: by 2002:a05:6000:989:b0:48c:49bd:62df with SMTP id ffacd0b85a97d-4982b848b0emr2765888f8f.1.1794292248651;
        Mon, 09 Nov 2026 22:30:48 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-498357648f0sm3105289f8f.12.2026.11.09.22.30.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 22:30:48 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 10 Nov 2026 07:30:48 +0100
Message-Id: <DMRBINC7VJAE.2LSCUA7XP9O6B@smile.fr>
To: "Anuj Mittal" <anuj.mittal@oss.qualcomm.com>
Subject: Re: [OE-core] [wrynose][PATCH] recipe_sanity: Drop rename overwrite
 detection
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261028081905.1780834-1-anuj.mittal@oss.qualcomm.com>
 <DMQXXV4EAR2S.2L62KIFZJCR0@smile.fr>
 <CA+s=J=w-Phn9Nai+fgqjsP5sWRoxNAJTVTt2xeC+13FKmtSXeQ@mail.gmail.com>
In-Reply-To: <CA+s=J=w-Phn9Nai+fgqjsP5sWRoxNAJTVTt2xeC+13FKmtSXeQ@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 10 Nov 2026 06:30:53 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249904

On Tue Nov 10, 2026 at 1:31 AM CET, Anuj Mittal wrote:
> On Tue, Nov 10, 2026 at 3:52=E2=80=AFAM Yoann Congal <yoann.congal@smile.=
fr> wrote:
>>
>> On Wed Oct 28, 2026 at 9:19 AM CET, Anuj Mittal via lists.openembedded.o=
rg wrote:
>> > From: Richard Purdie <richard.purdie@linuxfoundation.org>
>> >
>> > Bitbake itself checks for probelmatic renames now during key expansion=
 so this
>> > check shouldn't be needed anymore (it dates from pre 2011).
>> >
>> > (https://git.openembedded.org/bitbake/tree/lib/bb/data.py#n96 in expan=
dKeys())
>> >
>> > Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> > (cherry picked from commit 7944665886cb0bf881807a5d849ebdf42a33d1bf)
>> > Signed-off-by: Anuj Mittal <anuj.mittal@oss.qualcomm.com>
>> > ---
>> >  meta/classes/recipe_sanity.bbclass | 21 ---------------------
>> >  1 file changed, 21 deletions(-)
>>
>> Hello,
>>
>> Is this a cleanup? ... in which case I can't take it as those are not
>> acceptable under stable policy.
>> Or does it fix a bug/error/failure of some kind? In that case, please ad=
d more
>> detail about it (like the error message, the condition to trigger it, ..=
.)
>>
>
> It's a bug fix. Please see:
> https://lists.openembedded.org/g/bitbake-devel/message/20382
>
> The corresponding bitbake change was merged in 2.18. This would need
> to be in wrynose as well so layers using this class work.

I forgot about that... thanks!

Can you send a v2 with this context info appended to the commit message?

Thanks!

>
> Thanks,
>
> Anuj


--=20
Yoann Congal
Smile ECS

