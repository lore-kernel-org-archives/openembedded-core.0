Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.7238.1794234631996181948
 for <openembedded-core@lists.openembedded.org>;
 Mon, 09 Nov 2026 06:30:32 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=emq51FPK;
 spf=pass (domain: smile.fr, ip: 209.85.221.43, mailfrom: yoann.congal@smile.fr)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-48e1d0e5dafso637592f8f.1
        for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 06:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794234630; x=1794839430; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nFO+zgi5YViSmw+s/zohqUr6CGyaHlB3kZFTehjm9m0=;
        b=emq51FPK5dRkQGKhBOZ4IgrP0z4xj9lQnFTgV92EDfq/A3IEs3iW2Z1/v7FRt41N9j
         7WKtmLyruCoScv+DZa1rZKQDL63sBy75TgFERfeD1+H35fZ+vk7smjvTciUOYeBL8WyM
         8CSiPHfVybs8RiFAelJFOirXUSOEinCATQlrGf2a8rv5ZQra/NNdhL5P8cO8HOiO+din
         TEUCpSuk8r9qmwp1cIhRziEMlCQklDnQPGpp+sTPFZhVe3o7D99YBuWMeUAlPklhr4x4
         5rTEqDvSg1MG3Z2TJEwI9tU4ad9I4DsRiD5DFo10Zf9pYGIZCRrEKULCSbacgmp3XXRM
         lXNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794234630; x=1794839430;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nFO+zgi5YViSmw+s/zohqUr6CGyaHlB3kZFTehjm9m0=;
        b=iI3geUVgaM5bLrrA9ET3GY5YDMYzTvH+6Jg/IIB9hOLufXjlGY90vRYyaEtIDeohSk
         3hGVb/HBesybMOGsb+I5YCgn8HukoGs1dLHwr6GZ/ziLEABkLY+fzktUY6jYJuYydmOi
         rzEDDpuPCRM0cYmTScFVx70aHpcFcWeXCOUsWB4RrwiDeri2bWqZC/A/OrjhnA7lexNr
         y/d6+3WiXLIcAUhwEfGwZPYBdsMmSMNUQvr86Wo/dV7rWO9HP+B0yonrPFlf5aANmMdr
         eu/fjmpUdEke21gRxdvwXilIanUXfv6i8cVwdF8ckCmi0oeuouBppMrUL+XhsMMo5SSu
         Lvrw==
X-Forwarded-Encrypted: i=1; AL+hErF5WKHRD0++LUqMgUe57K/xPcYCkr5VrjD+vqmZWD7hgfqIag2xD4dNEfD/IxylcDOud9c9NDBKKDvm9JCP3ZexLg==@lists.openembedded.org
X-Gm-Message-State: APuU4Z+VmJ+fXuIZk+fhJ8AaTqRXYbQzLgiUYOqx+qsxtbyE1WZx58vo
	GDhHeAq71lMaL5xvXO3HVFiL4dM+Z7pK7CEJ5myF1LhTHZBNpszptrqjjAH1MSm0l5U=
X-Gm-Gg: AYBFou2tldQPzdR6FljdMt2uNhrt/gXuz2aQU0U/r9GHj3nPEziV7azyp3veDHDqCH5
	9wtny/GkFlCluB7ZHmait2H1oJBW1TygFIGcAyA+v+ILxPxKhRegVGOVyxCf6bc3oXM4URnSh0M
	w0QPwIRplH0KRIvw3lR8txdbvmAR+mkxF9830ijj69c+1x/EndR/VajCqN8KmoOsgx+AjcUYl56
	SZ7pbloBfyLl0ZAQQwPD78YKcd+7LXfLtFJ/GUOwnMwDUFgwx7/ZvFVeUwgGlXARvZio8ia6H7V
	lqMvZGnbnzNmp4XBnvpaOEjPYQB6PLk+FOFLWmgnAVPeRVF0XNSw1ucLXlM5SsuykRDE66RxfWD
	bJ6w6xKhJTY5fy17fHV5qGZdtT+tboAcGxCVK6vWsUCuylXT7F7bzzdxoZO4kNic7+35nEZfB49
	iX09ajSYfJk9cgchuf7Nio6CZW+2ZRDHyWyF9aOQjeT5neIlFakZ7kzAdmXgTgGy/ewJt4FjLJR
	4ksc2hIcjNs0tt49d9hO2OXnE/6InP/gKEov2rqJ0v7Nc8PhVppFwWzsFuz3BLxRqzyhb6UdK7J
	CE5DfbEORYaxudcnEiWkf5EPnN7k8A8MsN/EUEbZSl/KbI/X4+GxdXE1OOQ2RAEDEd3T7njeGxS
	RFW0s3z+jmxNjpg==
X-Received: by 2002:a05:6000:454c:b0:498:9a2:f613 with SMTP id ffacd0b85a97d-49809a2f65amr61248f8f.3.1794234630062;
        Mon, 09 Nov 2026 06:30:30 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (static-css-ccs-204145.business.bouyguestelecom.com. [176.157.204.145])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959765218asm10800547f8f.42.2026.11.09.06.30.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 06:30:29 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 15:30:29 +0100
Message-Id: <DMQR3DP72ES8.3KANJDXOTSO63@smile.fr>
Subject: Re: [OE-core][wrynose][PATCH 01/10] openssh: Fix CVE-2026-106584
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: "xe-linux-external (Internal Group)" <xe-linux-external@cisco.com>
To: "Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco)"
 <hthakar@cisco.com>, "openembedded-core@lists.openembedded.org"
 <openembedded-core@lists.openembedded.org>
X-Mailer: aerc 0.20.0
References: <20261016035236.442896-1-hthakar@cisco.com>
 <20261016035236.442896-2-hthakar@cisco.com>
 <DM91CIFZHG6C.1EYHKXIN5ULNT@smile.fr>
 <PH7PR11MB8598B4AAA920FDDFE1174602AD762@PH7PR11MB8598.namprd11.prod.outlook.com>
In-Reply-To: <PH7PR11MB8598B4AAA920FDDFE1174602AD762@PH7PR11MB8598.namprd11.prod.outlook.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Mon, 09 Nov 2026 14:30:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/249851

On Fri Nov 6, 2026 at 12:00 PM CET, Hetvi Thakar -X (hthakar - E INFOCHIPS =
PRIVATE LIMITED at Cisco) wrote:
> Hi Yoann,

Hello,

> I have submitted the corresponding OpenSSH backport patches for
> blacksail upstream [1] .
> Could you please review  the wrynose series when you have a chance?
> [1] [blacksail] openssh: Upgrade 10.5p1 -> 10.6p1 -
> Patchwork<https://patchwork.yoctoproject.org/project/oe-core/patch/202611=
05042209.1168511-1-hthakar@cisco.com/>

I had to reject this blacksail patch. This mean that I can't
review/accept this wrynose series until equivalent fixes are sent to
blacksail by backports.

Regards,

> Regards,
> Hetvi
>
> ________________________________
> From: Yoann Congal <yoann.congal@smile.fr>
> Sent: 20 October 2026 00:14
> To: Hetvi Thakar -X (hthakar - E INFOCHIPS PRIVATE LIMITED at Cisco) <hth=
akar@cisco.com>; openembedded-core@lists.openembedded.org <openembedded-cor=
e@lists.openembedded.org>
> Cc: xe-linux-external (Internal Group) <xe-linux-external@cisco.com>
> Subject: Re: [OE-core][wrynose][PATCH 01/10] openssh: Fix CVE-2026-106584
>
> On Fri Oct 16, 2026 at 5:52 AM CEST, Hetvi Thakar -X (hthakar - E INFOCHI=
PS PRIVATE LIMITED at Cisco) via lists.openembedded.org wrote:
>> From: Hetvi Thakar <hthakar@cisco.com>
>>
>> This patch applies the upstream fix as referenced in [2], using the
>> commit shown in [1].
>>
>> [1] https://github.com/openssh/openssh-portable/commit/aef20dfe30e68a469=
911a229b9117e7134766311
>> [2] https://ubuntu.com/security/CVE-2026-106584
>>
>> Signed-off-by: Hetvi Thakar <hthakar@cisco.com>
>> ---
>>  .../openssh/openssh/CVE-2026-106584.patch     | 39 +++++++++++++++++++
>>  .../openssh/openssh_10.3p1.bb                 |  1 +
>>  2 files changed, 40 insertions(+)
>>  create mode 100644 meta/recipes-connectivity/openssh/openssh/CVE-2026-1=
06584.patch
>
> Hello,
>
> This patch (and a few others in the series) are included in openssh 10.6
> but blacksail only has 10.5. Can you send the backports for blacksail so
> I can merge this series for wrynose?
>
> Thanks!
> --
> Yoann Congal
> Smile ECS


--=20
Yoann Congal
Smile ECS

