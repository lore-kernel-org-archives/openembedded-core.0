Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7471.1795216090983263922
 for <openembedded-core@lists.openembedded.org>;
 Fri, 20 Nov 2026 15:08:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=Ku6lJOun;
 spf=pass (domain: smile.fr, ip: 209.85.221.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-4a357b1c649so842360f8f.3
        for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 15:08:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1795216089; x=1795820889; darn=lists.openembedded.org;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=URCkpYBNN0mgpLOQ5lguOnQI/Ty2dWY7WYDviP4RbpM=;
        b=Ku6lJOun6aNMJVrTpaSg8Uj3Vf28qTB0hQxRtk7AhWZGjAee72/LAdUpQXCMoYJ6BQ
         kJ03EQINdK3gy9c7UstIdAA13wDE6XMSlx9kuL3bDyD7idEBf5WlZc9TDOEtDSmZwkPu
         Z0yiVzdww4ZKD0/QdixZALlnF6w6eHsNMXOZ3D901NTvxuAPCnKbhkyauJCpN/Mra4Ik
         vebrkEfwzwmY87OXXVjAEo2VFqqx5wXCWTCOrXSQUeivDKsjshsnSNn8V0AMMcGhJWnR
         zn/qoZmwGvvBuUlBVeFAMdtxP4Zh2XQMDSmh4cEwCnR/bl87u9ALXVo9HXVaka+qS0fU
         i+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795216089; x=1795820889;
        h=in-reply-to:references:from:subject:to:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=URCkpYBNN0mgpLOQ5lguOnQI/Ty2dWY7WYDviP4RbpM=;
        b=AIsUgc3xZ2/2zdL6W4BaaY8nygzN95G9igrs18nyv+/mTfDtSPbQxnaRIhzlsJolD7
         Lcwz9jTL7XZMmQl7J12nrfE+clrxpS6ALRPtZpdCdFH9/70u4pmSigp9AGDC1ObxGeCV
         95ubL1hXUCvzQOIf42A9WIan9kxLwiIItkuc7R+qz6jGLSetf+bd66Wq4gbONibLJ44x
         Tqq6rkeqq6hl4Ju5VrjDkbBerOyFhkVBongKuysxPQU45pZf6nV32C7P5YpeEzAAdqNR
         GdtSGu5FfEPDkNTcrszLdR/mZfVT9kdBkNQ0nCt83h6lmQb5DqBuEc56h4gxC0dzHlxW
         s9dA==
X-Forwarded-Encrypted: i=1; AL+hErGC+5muAx5DmepTSYWFoX11kEtt9PmdWNHRz6zkdlaykcdk7n1vhkiVwA1G5uLRl4L5VCuT7RvcUA8bHJPI4cKyqw==@lists.openembedded.org
X-Gm-Message-State: APuU4Z8tsjjUhHYhXA646AqXZRVtm4A7Vj+DlO/il74ug42giuOY4rPY
	u7P6hV+qdu01Bk5y+JNw2TaU2YiYUiV1KS1EOyp8kE7vM8ahFTSKTCSMKqmhaad6OHc=
X-Gm-Gg: AZFdTZep4wjrVUVS0WkymUlI+42pfW4axrBuV7AputT+KXU0Ydd+3b6oqQTFfBQo0Jr
	suGW7NWN9bvBGRvNq0rFHPyr0YAVMx/BaihNQYrWLJp2GZxd6NzyWW7swBceVz3KESHGRhvpaPP
	MAVJnuIiKSvBVxbIkiQlz74LEeKhg56188DljVZR0IXi1XLY6HObMCgQZF64INYJh8MXy8oxki5
	Nlo7klcjxqOAS331JZxv4PI7dhlKGSvjoY9n9xj8I+9aBtUopXPNvxyH1aCkzsGTKMldsOR9M7D
	3XIMj/nHjtz8TvZL9HcrLovEHkvhuGjSYeKA5F/ipWbksCGptE3N8qhyhl/J+YjCqTwCAhrNDv1
	KRVE0tUfG7g/y2vtsdIN2GkWTDDUX+JrFV5t3fH10UA/adAOhBRYJ9au1jLCy0hcZfmzJnHqlyo
	lEY/Hvg/+Vxz5nWLIFADOREe5YpuBvgCxY2khxuAXsrZg5jOINnmXTrXVSUyE4yqxmqL++LlyDs
	2OwS8yrJE/5SMDePj6K8ntag6D2N15vTPcNO9LVT8CYL8VnZRPTN3BGpCjLuPen4DdNYnfQuV6h
	lgtCFMFGh75GxJ+N8YUqZBioGh5H3Q6WLTwXGqvf3LL9F4aFeqKCnotH0vDNIEmid7HE+s0lNf1
	Pi5mTnJvcVYcA3HB/
X-Received: by 2002:a05:6000:4808:b0:4a9:760f:1843 with SMTP id ffacd0b85a97d-4abb0d51e12mr10265569f8f.27.1795216089197;
        Fri, 20 Nov 2026 15:08:09 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00b03901bd7f693780.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:b039:1bd:7f69:3780])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6ae2dcf9sm7949238f8f.32.2026.11.20.15.08.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 15:08:08 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Nov 2026 00:08:08 +0100
Message-Id: <DN0EZPT21YQ7.72UEI7OFXYMK@smile.fr>
Cc: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
To: "Yoann Congal" <yoann.congal@smile.fr>, "Hetvi Thakar -X (hthakar - E
 INFOCHIPS PRIVATE LIMITED at Cisco)" <hthakar@cisco.com>,
 "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
Subject: Re: [OE-core][wrynose][PATCH 01/10] openssh: Fix CVE-2026-106584
From: "Yoann Congal" <yoann.congal@smile.fr>
X-Mailer: aerc 0.20.0
References: <20261016035236.442896-1-hthakar@cisco.com>
 <20261016035236.442896-2-hthakar@cisco.com>
 <DM91CIFZHG6C.1EYHKXIN5ULNT@smile.fr>
 <PH7PR11MB8598B4AAA920FDDFE1174602AD762@PH7PR11MB8598.namprd11.prod.outlook.com> <DMQR3DP72ES8.3KANJDXOTSO63@smile.fr>
In-Reply-To: <DMQR3DP72ES8.3KANJDXOTSO63@smile.fr>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Fri, 20 Nov 2026 23:08:13 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250826

On Mon Nov 9, 2026 at 3:30 PM CET, Yoann Congal wrote:
> On Fri Nov 6, 2026 at 12:00 PM CET, Hetvi Thakar -X (hthakar - E INFOCHIP=
S PRIVATE LIMITED at Cisco) wrote:
>> Hi Yoann,
>
> Hello,
>
>> I have submitted the corresponding OpenSSH backport patches for
>> blacksail upstream [1] .
>> Could you please review  the wrynose series when you have a chance?
>> [1] [blacksail] openssh: Upgrade 10.5p1 -> 10.6p1 -
>> Patchwork<https://patchwork.yoctoproject.org/project/oe-core/patch/20261=
105042209.1168511-1-hthakar@cisco.com/>
>
> I had to reject this blacksail patch. This mean that I can't
> review/accept this wrynose series until equivalent fixes are sent to
> blacksail by backports.

Hello,

I will now drop this series. Please send a new submission if the above
situation changes.

Regards,
--=20
Yoann Congal
Smile ECS

