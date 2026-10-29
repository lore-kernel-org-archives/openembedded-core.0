Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11582.1793279492280742181
 for <openembedded-core@lists.openembedded.org>;
 Thu, 29 Oct 2026 06:11:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NECxl34l;
 spf=pass (domain: gmail.com, ip: 209.85.219.52, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-917a707f37eso20468816d6.0
        for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 06:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793279491; x=1793884291; darn=lists.openembedded.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gpjkbrzSeFCXBOi1oK757rGF3OwgoIk22V/eEFuaEUw=;
        b=NECxl34lCQeY/p9EkqMXIIWj9q7NcmcjmI021LTi8NUNynFM94XTeR80XIvFeW5jpA
         3sVgXd5bLddXHb9E878Cgylcm2HnbWy5FE8qUmZNz0HuI1ve/H4MOMNahZ9dW6peomaF
         fVf78oyrmNjoj3XsVk3h2Rysa6yPhT/EoJWyCAJ1PGKGKRm2hADVjdvMTBwTYrGZgszV
         1G3bqB6alWVCr5wujGaXtPTyzUSA1/aLM4ehrWPgfJ8MK+qnB2OINgITjh0ov7Zo8oFY
         siR0Q1a/w5ptoI4K+cd/MlGhneLkNUUMlv0UebEyLUt8yF/BOVJGbWLZkvvnbOMm0DvC
         c5/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793279491; x=1793884291;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gpjkbrzSeFCXBOi1oK757rGF3OwgoIk22V/eEFuaEUw=;
        b=0TTm7HcFlf+b4wUcwCgCrYW4x3A9rQWZbsJCQonPNJOgOA9YJ037p+Z/AExFS+ydDr
         QKZD0K7VdEBJGDgw8FGAiyKTqhdaC5vvmFkYjD/dVTLb69PmC6TpHAKgcK/4CgQWfVG/
         N4/snycwCGSy9MOiH/adYHMUmUyE5zcTX33diLUhe4FroAv2XveXQeOjlqcz6jOy8RV6
         G3V0EUR8IeLMJIP/yTNiSVw/a2yAVzBOQKuGfTAtFx9HyCnHD5Y9WmWAvHZkpBZJOzXG
         VWx/g92VafmMbtmqcY0eG3bqCEXrv6kOc+5jvpJHN+L04ZN/QaJ0avUJpWnfKydIKJrs
         prLw==
X-Gm-Message-State: AFq9FYIqoXIyLlzg7PHoAMHy4OHTrJwMQiDlT5vhH2WNVbTXotniPb/c
	s2hqmlA1WdJ9VUwgqaFyXwt/ODhdfPL46yg82LhcqnPPPgEjSBF4fKSJ
X-Gm-Gg: AYBFou2AxH1Boa4cEhU69CV1+apyS22AKa2M7E/unepyz35fIdT3SXYB2F+OsMz8Ale
	x3x9U/8j+egfLUe+IiyZRA/QADQ0MK7pWN/KUxtS86ScJVwatLXd4R4jlHDsLyQ5rSiiOSGI5V1
	UW5MTFCh1UwTVZkxCTnhxP/rvYrfvw529drLRAyEjp7/B4h0WC8ZgaVMLXHKBgmijnZrdhVDsuX
	CYthyW9aFqlxbVsC34h/ags8YMyqHemU0BhbesQin8CopTzc2e8Ujb1l/9y5Rrcv4IkkCEDvURw
	Nc97455Ds4glVzlS3yXAR8JRQO5gIgYgoNXy04Pq25gxxuCT1l10aFICd/MpcpRWqZkOAOA+T82
	3MePgUM7LU9w0JLKeE9ygU3fQF02p7IWo0wUPXuTuUK06oXXZJ6iyGQc/B/Rv/UnkRINNO/WukP
	aUVDHW7xjlsiCsCUIYVJLWwiD2QFur1PED1TzWTITIOglctpUp27ksNStptiOlf3Ql0tTkxZEdx
	inf+aYfHO8L2JRatmn1Rsw4H0rdBGtoJDzC1+E0DBd/MI1OwOd08VobePpl40ap1KFgApAXSevK
	jGEdZzTkfawhlSOpA/yJEt6Uo5LRi7tm//hFpizdbIT+ipKTws4Zovsn0JyEf7IkiKs8Q4PQlIl
	Sd52XiqvKRWD/MSg/VhRn3lDHtk6W0yHI+/qFe7GjG7BpyI08bNvKiKkcyco8jUCVDnEh+Cb63Q
	w=
X-Received: by 2002:a05:6214:19c5:b0:91c:7330:216b with SMTP id 6a1803df08f44-91c7cf43484mr84473306d6.20.1793279490928;
        Thu, 29 Oct 2026 06:11:30 -0700 (PDT)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-35-248.cpe.net.cable.rogers.com. [174.112.35.248])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47c6f3bcsm163079546d6.29.2026.10.29.06.11.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 06:11:30 -0700 (PDT)
Message-ID: <6ae34602.7970f310.1bf361.c97c@mx.google.com>
Date: Thu, 29 Oct 2026 06:11:30 -0700 (PDT)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Prasanth R <ragaprasanth@gmail.com>
Cc: openembedded-core@lists.openembedded.org, prasanth.r@lineo.co.jp
Subject: Re: [PATCH v2] kernel.bbclass: fix -dev files when KERNEL_PACKAGE_NAME is PN
In-Reply-To: <20261029060834.1586465-1-ragaprasanth@gmail.com>
References: <20261029060834.1586465-1-ragaprasanth@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Thu, 29 Oct 2026 13:11:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248945

On Thu, Oct 29, 2026 at 2:08 AM Prasanth R <ragaprasanth@gmail.com> wrote:
>
> For a second kernel next to virtual/kernel needs its own package names, e.g.
>
>   KERNEL_PACKAGE_NAME:pn-linux-yocto-rt = "linux-yocto-rt"
>   PROVIDES:remove:pn-linux-yocto-rt = "virtual/kernel"
>
[...]

Thanks for the updates. That covers everything I asked for in v1.

Acked-by: Bruce Ashfield <bruce.ashfield@gmail.com>

Bruce
