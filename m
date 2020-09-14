Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.54084.1600061186599448631
 for <openembedded-core@lists.openembedded.org>;
 Sun, 13 Sep 2020 22:26:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=lNjMWhEm;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id f18so11607822pfa.10
        for <openembedded-core@lists.openembedded.org>; Sun, 13 Sep 2020 22:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language;
        bh=Y/uxGlXpajAVNpDJq5NkfAnDuzOIavP4x4oVMXyAA4g=;
        b=lNjMWhEm7UdMJnmm1L3gCDY9MBjVifxcIVElGLYUwqu3LI+TexQliNkMzt5ZrFIzBr
         xxVtyevKfMkbh3TwrHcEfvzo8xdaK17vreU43Tqofoj/hySOqEdIL73yEij0CBimNHwO
         iReOLTVSKQTo5YcBCmIe5/xEY/Ae7r6i36hfN/kGqUYALBRda+4v/TVlcJvqGidHFHBv
         8W1ND/K5gWuZ5G+y+Pjt4b3DY4EI6NH0DN2A7sjSgkmLjnCd9LU5/Skf9MD16UMD4cSw
         zUL3CsCBOzaPAVLtk42GEBty2kSbzYE4rIYjVhZBnYHp5G/BQwxetC0wQFz+clLul0QM
         QbcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=Y/uxGlXpajAVNpDJq5NkfAnDuzOIavP4x4oVMXyAA4g=;
        b=Qo/2z+SN5Rux5iJcRR8V5Jin3FvzeriSmQxlrBAwYaSOzAxi8ZSqaQCelL3fu9hYIr
         nWvtxV0ayjC5d7u3H580S7cGb0ib4vALKYSWmljQl5+MGlGB/yRSYSRteArwi+Y9FQ2B
         FxS1CYn+cKIQWDU6ANjDD0SCiDvB+TsCsN1aShlJCdFyDfZB5OVK5ivdwDKRiYVz8LpE
         HigTNcWw6ZFa9Lr/P3altIPRiQBq7Dr4bgeTJ7Fr76kRY0r+kmWkYS2pb0LSF+dJpJ56
         C//626VCBiM6nPq6B0vbbtoG9Ix2QrxmwHf0/DIaHtblgMQe8V749f93pDaUywsV/aro
         7Z1g==
X-Gm-Message-State: AOAM532NjWQQSrEd67maieCfyuj4rfKByCR01Xgr760PXt8QottGep3V
	4C7Qfd1i9jtQKqzHnTR60f7a+qZrU1EeWQ==
X-Google-Smtp-Source: ABdhPJw4quXSXb5m9vPpkudSTAqdXtYcHS1JaFcRCrlN9e7c1sexlXiVjJ7WDlyA9ZWA2lbe9zRNNA==
X-Received: by 2002:a63:a4d:: with SMTP id z13mr3078422pgk.247.1600061185834;
        Sun, 13 Sep 2020 22:26:25 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0::cafc? ([2601:646:9200:4e0::cafc])
        by smtp.gmail.com with ESMTPSA id h6sm9069387pfb.217.2020.09.13.22.26.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Sep 2020 22:26:25 -0700 (PDT)
Subject: Re: [OE-core] [PATCH] qemu: always define unknown_lock_type
To: "Yu, Mingli" <mingli.yu@windriver.com>, Ross Burton <ross@burtonini.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
References: <20200910025728.3868717-1-mingli.yu@windriver.com>
 <CAAnfSTsTmAE5fbvTck6m9rsQGa_FebUMWmAXEvKkCfq2TWjiZw@mail.gmail.com>
 <26851540-6c95-c58e-7ae9-87d2ba546478@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
X-Pep-Version: 2.0
Organization: HIMVIS LLC
Message-ID: <236780a1-589b-589e-3e76-00d829868a0a@gmail.com>
Date: Sun, 13 Sep 2020 22:26:24 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <26851540-6c95-c58e-7ae9-87d2ba546478@windriver.com>
X-Groupsio-MsgNum: 142491
Content-Type: multipart/mixed;
 boundary="------------882F1AA8BA93BB28E04B6553"
Content-Language: en-US

--------------882F1AA8BA93BB28E04B6553
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 9/13/20 6:50 PM, Yu, Mingli wrote:
>=20
>=20
> On 9/10/20 6:41 PM, Ross Burton wrote:
>> On Thu, 10 Sep 2020 at 04:03, Yu, Mingli <mingli.yu@windriver.com> wrot=
e:
>>> +Upstream-Status: Submitted [qemu-devel mailing list]
>>
>> https://lists.nongnu.org/archive/cgi-bin/namazu.cgi?query=3Dunknown_loc=
k_type&submit=3DSearch%21&idxname=3Dqemu-devel&max=3D20&result=3Dnormal&sor=
t=3Dscore
>>
>> doesn't find this patch, can you link to it please?
>>
>=20
> Hi Ross,
>=20
> The link is
> https://lists.nongnu.org/archive/html/qemu-devel/2020-09/msg03873.html,
> will include the link in V2.

are you compiling without __OPTIMIZE__ defined ? qemu may not work
without it.

>=20
> Thanks,
>=20
>> Ross
>>
>=20
>=20
>=20

--------------882F1AA8BA93BB28E04B6553
Content-Type: application/pgp-keys;
 name="pEpkey.asc"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: attachment;
 filename="pEpkey.asc"

-----BEGIN PGP PUBLIC KEY BLOCK-----

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
=3Dsj8j
-----END PGP PUBLIC KEY BLOCK-----

--------------882F1AA8BA93BB28E04B6553--
