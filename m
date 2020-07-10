Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
 by mx.groups.io with SMTP id smtpd.web12.2836.1594407279983004450
 for <openembedded-core@lists.openembedded.org>;
 Fri, 10 Jul 2020 11:54:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@code-house-org.20150623.gappssmtp.com header.s=20150623 header.b=uAIh+RYZ;
 spf=none, err=permanent DNS error (domain: code-house.org, ip: 209.85.128.52, mailfrom: luke@code-house.org)
Received: by mail-wm1-f52.google.com with SMTP id f18so6889043wml.3
        for <openembedded-core@lists.openembedded.org>; Fri, 10 Jul 2020 11:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=code-house-org.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:autocrypt:message-id:date:user-agent
         :mime-version:in-reply-to:content-language;
        bh=YQG5FtSF5Ay15p2WYueuKGql3bScUndp5YjBifTav3I=;
        b=uAIh+RYZdv+8oWMXvN1yoEXzW+8ebmsJIm4O1eVp4TGbiRIsgsrCiUkyjs14adV+2k
         F7n/1ETsRIdyUnFxReQA83UbHz4Yyp7KfsX+UcUUoxJLZE5nd+Kg2Eg42BBybvIPM85o
         lEPejxMxaCyz024ak1DWdDj4fq2EcuH1pPhNeUvyh3EhcmuXWSqSrLnnM0ESs1KwaDL2
         EuewoL52uvxIdFLQL6SPTVdxkROl4ury1OMt+iTAPWEYyzDF9sEU2SjzYCEQbT6Ds+F1
         DUblGEMlcEfA451HfC8p1Tb78TreG9GeAEYKB0j2ETmCm7j7CR+EJ3Ol/+4JNBwSBFJj
         bCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:autocrypt
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language;
        bh=YQG5FtSF5Ay15p2WYueuKGql3bScUndp5YjBifTav3I=;
        b=oPAtrnXArymB3J5dmXRw9EYR5MTlXVZ9z65szS3uNv6E6e5ICSq3pmNLcVz73Aotpl
         6I97LiKSD9rNahwHu2RUAu8vAKuFQXW2b820xwXtcGoYPw16ieOojbT/Y1P6vFWnOZ1M
         gHP4MXYCQP5wqJTcS44+hpELYpBG/+UVuZwI/RdBCLENAzwn3p/BPDJVhQvxwe2HfY1r
         yvyfhJuBx5zii3naZ1cIiHBEgdfUM/IgF2tNivs1WsLQ+ovlsHtLtRGgmNb0CUxHnM0z
         oWsbKp3HkaEoUWMuQTBTYzMtPILoiJNb7Jia/x6J2z+lAUHjXlZ9GX1SyvY5Lv1uk/qd
         NPhw==
X-Gm-Message-State: AOAM530QXyyX7WGPT2FxuUNZA4EqImxkW1StQVKmkOXNYLAzN3k2lTsf
	fN85vZZBB0QuysloGXe/+mlCgE4m4/BGlg==
X-Google-Smtp-Source: ABdhPJzdFKRKxQc+ksbwnyseMHxn4rToSk2E5nY8DtrPkzAZlB1RoCk9m0IQizYWXdclFWTKkf1DoQ==
X-Received: by 2002:a1c:5a41:: with SMTP id o62mr6551491wmb.16.1594407278074;
        Fri, 10 Jul 2020 11:54:38 -0700 (PDT)
Return-Path: <luke@code-house.org>
Received: from [192.168.2.106] ([185.142.162.13])
        by smtp.gmail.com with ESMTPSA id z1sm11512579wru.30.2020.07.10.11.54.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2020 11:54:37 -0700 (PDT)
Subject: Re: [OE-core] Wireguard and wg-quick systemd unit location
From: =?UTF-8?B?xYF1a2FzeiBEeXdpY2tp?= <luke@code-house.org>
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
Cc: openembedded-core@lists.openembedded.org
References: <096144b2-ab6d-9abc-ca9d-0ada7b52237c@code-house.org>
 <20200710130131.qlmwqq4hwrrnsbeq@qschulz>
 <357f8b8e-ac96-fbf1-a728-fd25f1dcb3b5@code-house.org>
Autocrypt: addr=luke@code-house.org; prefer-encrypt=mutual; keydata=
 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
 pH+7poausqhBcWxxEgtym5iI
Message-ID: <6ac87daa-ebc3-42ef-d7f3-30253f721618@code-house.org>
Date: Fri, 10 Jul 2020 20:54:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <357f8b8e-ac96-fbf1-a728-fd25f1dcb3b5@code-house.org>
X-Groupsio-MsgNum: 140535
Content-Type: multipart/mixed;
 boundary="------------1F307491F76A6CC387ACF7D7"
Content-Language: en-US

--------------1F307491F76A6CC387ACF7D7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

Given basic nature of the issue I was able to patch it quickly. It works
as expected. Thank you very much for the pointer.

I am not quite sure which channel is intended for sending patches. Shall
I create bugzilla entry for this one liner?

Cheers,
Łukasz

On 10.07.2020 15:04, Łukasz Dywicki wrote:
> Hi Quentin,
> Indeed that looks like a valid root cause. I been looking on this make
> call for two days and didn't notice the typo. Nice spot!
> 
> I will test patch to see if it helps. Expect patch for review. :-)
> 
> Best,
> Łukasz
> 
> On 10.07.2020 15:01, Quentin Schulz wrote:
>> Hi Łukasz,
>>
>> On Fri, Jul 10, 2020 at 02:11:51PM +0200, Łukasz Dywicki wrote:
>>> Hi all,
>>> I been learning how to run things lately and I think I've found a bug or
>>> at least an unintended trap for new comers.
>>>
>>> I've ran into exactly same issue as described here:
>>> https://stackoverflow.com/questions/54197951/yocto-systemd-service-to-install-a-parameterized-service-service
>>>
>>> After looking on how to work around the problem I also looked why it
>>> given answer fails and why the heck it works for openvpn. The answer is
>>> simple - wireguard leaves wq-quick@.service in /lib/systemd and not in
>>> /lib/systemd/system. The end result is that any service which uses
>>> SYSTEMD_SERVICE_${PN}=wireguard-tools + wg-quick@aaa.service doesn't work.
>>>
>>
>> Can't comment on that, not familiar with systemd and the recipes
>> providing service units.
>>
>>> I've looked at other distros. In ubuntu and arch unit file is
>>> /usr/lib/systemd/system hence it works as expected there. I've checked
>>> rpm spec and unit is placed in invalid place:
>>> %dir "/lib/systemd"
>>> "/lib/systemd/wg-quick@.service"
>>>
>>> I had a look on the wireguard makefile and it seems fine. Can someone
>>> point me where issue comes from and give a tip how to patch this issue?
>>>
>>
>> If the path is the only issue
>> http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-kernel/wireguard/wireguard-tools_1.0.20200319.bb?h=master#n12
>> should probably be systemd_system_unitdir instead, c.f.:
>> http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/conf/bitbake.conf#n39
>>
>> If this fixes it and there's no better answer in the next days, please
>> send a patch for that :)
>>
>> Thanks,
>>
>> Quentin
>>

--------------1F307491F76A6CC387ACF7D7
Content-Type: text/x-patch; charset=UTF-8;
 name="0003-fix-wrong-wgquick-systemd-unit-path.patch"
Content-Transfer-Encoding: 8bit
Content-Disposition: attachment;
 filename="0003-fix-wrong-wgquick-systemd-unit-path.patch"

From beaa3dd63269e6f480a1df30d4129031d886c355 Mon Sep 17 00:00:00 2001
From: =?UTF-8?q?=C5=81ukasz=20Dywicki?= <luke@code-house.org>
Date: Fri, 10 Jul 2020 17:13:55 +0200
Subject: [PATCH] Fix location for wq-quick@.service systemd unit.
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

By default systemd looks for units in {etc,lib}/systemd/system.

Signed-off-by: Łukasz Dywicki <luke@code-house.org>
---
 .../recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb
index c4ddbcb0e..02dc145c0 100644
--- a/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb
+++ b/meta-networking/recipes-kernel/wireguard/wireguard-tools_0.0.20190123.bb
@@ -11,7 +11,7 @@ do_compile_prepend () {
 do_install () {
     cd ${S}/tools
     oe_runmake DESTDIR="${D}" PREFIX="${prefix}" SYSCONFDIR="${sysconfdir}" \
-        SYSTEMDUNITDIR="${systemd_unitdir}" \
+        SYSTEMDUNITDIR="${systemd_system_unitdir}" \
         WITH_SYSTEMDUNITS=${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'yes', '', d)} \
         WITH_BASHCOMPLETION=yes \
         WITH_WGQUICK=yes \
-- 
2.27.0


--------------1F307491F76A6CC387ACF7D7--
