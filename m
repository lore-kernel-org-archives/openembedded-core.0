Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com [209.85.216.66])
 by mx.groups.io with SMTP id smtpd.web10.850.1607019485605171829
 for <openembedded-core@lists.openembedded.org>;
 Thu, 03 Dec 2020 10:18:05 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@broadcom.com header.s=google header.b=LaeZsUrq;
 spf=permerror, err=parse error for token &{10 18 %{i}._ip.%{h}._ehlo.%{d}._spf.vali.email}: invalid domain name (domain: broadcom.com, ip: 209.85.216.66, mailfrom: scott.branden@broadcom.com)
Received: by mail-pj1-f66.google.com with SMTP id b12so1598832pjl.0
        for <openembedded-core@lists.openembedded.org>; Thu, 03 Dec 2020 10:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to;
        bh=G0rQQGH+081m8Pw5ceMRf4sO6dxlFgHoOAVhgS7bYD8=;
        b=LaeZsUrqNDHp4ofsCGdeJV8yHHC5flPgeZSBaIxUOmy+aShDwHrJytlAhQwwLbpjMn
         HiMJtF37jGfxZpu7g9RVH8OIZqwDEM1IJ9MKTwNJi91s8fQC4tzxf3PVo6/+RzzBk39E
         n0MYve7qZTXq07HxwEExxMhYUPHBkUk/Pc2GE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to;
        bh=G0rQQGH+081m8Pw5ceMRf4sO6dxlFgHoOAVhgS7bYD8=;
        b=fGT0uDbCA3EF2oA6li/+QADOb2/07JLFyquK3SevNgqR38FW5A4G8DD/Kh0q4QN+tO
         pfChY8qyt4tvFvnq9MROeo9v1X7FgEcyyzClW7Gh544+wNwOQu0RPjKJtUU7AUo1z+BT
         M946K8jnZLgG8yV7gdwK727jYBPBaZx99KZRHi7MCmWyDhyDdFAmn8zkgvXJezq/U0q/
         6KqRTaQQD5FEOEbOC+QuP2TsJpOlXxk0KnRU8dZXILfP1wLsRi70NIYwixBgsMbA5xRi
         VCi2T8/3dWPyZq6Vf5+SiSV6gKUXm2yIPK7f9YAyuhiB+cBugm2OWwl8KYTjSt1h3Qe4
         Ww8Q==
X-Gm-Message-State: AOAM531awzRVBrKLO7F7NjBT3h7F4aGo4ZaSHhmDZSeFJfW2kk59GKZi
	dV5xzkosFxDmu2KglOhzDjXqyw==
X-Google-Smtp-Source: ABdhPJyQBDuUXPc7XxTNuXRxY7GhKwvxAdr5MIeyVnzUOg1zc3+YqEnhlrIvufNbPyj9GCTa1RTI0w==
X-Received: by 2002:a17:90a:3e05:: with SMTP id j5mr333442pjc.91.1607019485001;
        Thu, 03 Dec 2020 10:18:05 -0800 (PST)
Return-Path: <scott.branden@broadcom.com>
Received: from [10.136.13.65] ([192.19.228.250])
        by smtp.gmail.com with ESMTPSA id s21sm1673758pgk.52.2020.12.03.10.18.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Dec 2020 10:18:04 -0800 (PST)
Subject: Re: commit breaks menuconfig on upstream kernel "cml1.bbclass: Handle ncurses-native being available via pkg-config"
To: Nathan Rossi <nathan@nathanrossi.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <bb945efa-f12d-6ff6-a783-8010269c9931@broadcom.com>
 <CA+aJhH20y3q84WkxfAb_-Dj2fpaankFD9VbskhyV8uPrQauPFQ@mail.gmail.com>
From: "Scott Branden" <scott.branden@broadcom.com>
Message-ID: <baf9a93e-188c-4c45-9ba5-b4d08a655564@broadcom.com>
Date: Thu, 3 Dec 2020 10:18:02 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <CA+aJhH20y3q84WkxfAb_-Dj2fpaankFD9VbskhyV8uPrQauPFQ@mail.gmail.com>
X-Groupsio-MsgNum: 145245
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000926b5605b59361d6"

--000000000000926b5605b59361d6
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-CA



On 2020-12-02 4:19 p.m., Nathan Rossi wrote:
> On Thu, 3 Dec 2020 at 05:17, Scott Branden <scott.branden@broadcom.com> wrote:
>> Hi Nathan,
>>
>> Your commit:
>> "cml1.bbclass: Handle ncurses-native being available via pkg-config"
>> https://git.yoctoproject.org/cgit/cgit.cgi/poky/commit/?h=master-next&id=ce447d70df386ca55ce1672478b245851556374e
>>
>> breaks bitbake menuconfig when using the upstream kernel.
> Interesting. The purpose of the commit was to actually fix that exact
> use case since previously the mainline kernel menuconfig was relying
> on hardcoded paths to the host ncurses libraries.
>
> Would you be able to provide the error messages you are getting (and
> anything else that can help to reproduce the failure), because I am
> not able to reproduce any failures with a mainline kernel, linux-yocto
> (with and without the below mention patch) or with other projects that
> are using cml1 (e.g. u-boot).
>
>> It only works with the linux-yocto kernel due to this workaround which is not upstream.
>> If you revert this commit in linux-yocto menuconfig will not work in linux-yocto:
>> "menuconfig,mconf-cfg: Allow specification of ncurses location"
>> https://git.yoctoproject.org/cgit/cgit.cgi/linux-yocto/commit/scripts/kconfig/mconf-cfg.sh?h=v5.8/standard/base&id=1714a5ad9cf61f4d0f4b8432f327cca2998aba77
> This change should not be required to have menuconfig working when
> pkg-config is used.
>
>>
>> Seems like your commit needs to be reverted or a change made to work with the upstream kernel.
>> Or, the linux-yocto change needs to actually be upstreamed.  I submitted it and the upstream maintainer questioned why the change is needed:
>> https://lore.kernel.org/lkml/CAK7LNATD0J3C_mFrXAju8-WmdCmrPmRFn7Um0yebnfL-_zcu8w@mail.gmail.com/
> The problem is if it was accepted, every kernel prior to its inclusion
> would need to be patched, as well as other projects (u-boot, busybox).
> This makes supporting menuconfig using that change for kconfig
> generically problematic. This is why the pkg-config solution is
> preferable.
The kernel works with menuconfig without your yocto change today.
Only linux-yocto (with the patch mentioned above) works with your yocto change.
>
> Regards,
> Nathan


--000000000000926b5605b59361d6
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

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
I/3RRboOeC9M13VNr5feU91O0iDoMreAgPQJ0Lo7YrodKYug0Tt/fFDjkW3v3VIbEr2liUN69U0C
AwEAAaOCAdEwggHNMA4GA1UdDwEB/wQEAwIFoDCBngYIKwYBBQUHAQEEgZEwgY4wTQYIKwYBBQUH
MAKGQWh0dHA6Ly9zZWN1cmUuZ2xvYmFsc2lnbi5jb20vY2FjZXJ0L2dzcGVyc29uYWxzaWduMnNo
YTJnM29jc3AuY3J0MD0GCCsGAQUFBzABhjFodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vZ3Nw
ZXJzb25hbHNpZ24yc2hhMmczME0GA1UdIARGMEQwQgYKKwYBBAGgMgEoCjA0MDIGCCsGAQUFBwIB
FiZodHRwczovL3d3dy5nbG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzAJBgNVHRMEAjAAMEQGA1Ud
HwQ9MDswOaA3oDWGM2h0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20vZ3NwZXJzb25hbHNpZ24yc2hh
MmczLmNybDAlBgNVHREEHjAcgRpzY290dC5icmFuZGVuQGJyb2FkY29tLmNvbTATBgNVHSUEDDAK
BggrBgEFBQcDBDAfBgNVHSMEGDAWgBRpcoJiMWeVRIV3kYDEBDZJnXsLYTAdBgNVHQ4EFgQUWOK7
qiyDSt/IDm/SRcNi/sTEiyswDQYJKoZIhvcNAQELBQADggEBAEe2edd4F9tpp0GPmrFrQ+xp9kY7
uxBzPdCw588bgVrPemjLwiwV37XTT4iWJtNhPfEpaguM6jeLm58LCvHq5/IBjcyHyf4URQVwAg7B
pqkH8/M+IBstu4/D+znPHB59X+c+au3Q8D+xoNFd7I30kaE+oJuBuFsGXRBc0Ci+FM86x9k7SF8U
aui1E7Y9wDfsRSCL2TSwU773f09WkrvVdlKxNqQZj2z7bQUUn+yfXdFfBz0LqlYNfn7xJOpQE3HI
H4jq6U9+b0Qf+J0n0wyysjXPSeQ7EKXVkT8dM2KSpIN86v5dd9LkAz3C1dmjuPRGEC8ZhI1IjMBt
0itrn6C23NsxggJvMIICawIBATBtMF0xCzAJBgNVBAYTAkJFMRkwFwYDVQQKExBHbG9iYWxTaWdu
IG52LXNhMTMwMQYDVQQDEypHbG9iYWxTaWduIFBlcnNvbmFsU2lnbiAyIENBIC0gU0hBMjU2IC0g
RzMCDFtD165RQeUC8DvoCDANBglghkgBZQMEAgEFAKCB1DAvBgkqhkiG9w0BCQQxIgQg8e0EaHnI
gdfcuvKJnnzKB1GsRE0LcnjEjwz6Qa2joVUwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkq
hkiG9w0BCQUxDxcNMjAxMjAzMTgxODA1WjBpBgkqhkiG9w0BCQ8xXDBaMAsGCWCGSAFlAwQBKjAL
BglghkgBZQMEARYwCwYJYIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBCjALBgkqhkiG
9w0BAQcwCwYJYIZIAWUDBAIBMA0GCSqGSIb3DQEBAQUABIIBADMM4D88+8GoFnBFsu3Z/nwGPiXB
4mJNacNH5S9VimSYL52j05ICSucguFabXCpmdj5IEW6PMQ6igRT3rPKOHzXuUPdcnlT6/5KrsROq
iQ1nfpPQcwWt5QxgnjKzs34y9RDraLYGIPUJ0CV6RchFmTUrZCIWdIYPSBFgKsMF4mJzAbDdt4Gs
qe/mZC9xxH5jqIGyVRvIlWKSwrK6L8ObjGy/Gkc8jZfZwIGMpEsRtnfw5davfgK7LRHKsM5gpq8u
wpyaX55syifrozXA/OYiic6MUyyF/EBliGcblK4fVW1NthlY5gz+dkgp5SJQGSrFmqnHcYJZDZbt
yAnRtRXNKIo=

--000000000000926b5605b59361d6--
