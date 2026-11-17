Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.3309.1794950089930235268
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2026 13:14:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@smile.fr header.s=google2 header.b=iRVk4E+2;
 spf=pass (domain: smile.fr, ip: 209.85.128.51, mailfrom: yoann.congal@smile.fr)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so3259885e9.0
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 13:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile.fr; s=google2; t=1794950088; x=1795554888; darn=lists.openembedded.org;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=gV29TH6iqodTJSvOoX+psaa/oVdGlSipjKSmp5+h/MM=;
        b=iRVk4E+2rHtLljV/wnO74O+y2/IMknJPXvzUD3Rn6FhMxrmvnsMzKp/m0Ki8caEMCc
         2j/UzpL0k7zZJBbJyYEzYGDWyztoLDFWDsEpYfvcEgi0lF2p4glag9GdJSXUv/Gze496
         QdP0mAjJLjOoUnSgk2UipMxib+FyJ57ipt0AF1+Ws1jJTUEX2fv1ZaWFaSjk0vEbbv/D
         aVPmxTEyKeip/QPMEhZmhqEUvWh5MTg393EQyztDJ1TjEul21j2c3KFgK/hKBHx5OR8e
         V5NCOn/1KUIOkdgAynep0qobtKju8Nd/7QFyJimhJPTlg5zv/QTXET4+xFRJaEsRkSoY
         EUqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794950088; x=1795554888;
        h=in-reply-to:references:to:cc:from:subject:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gV29TH6iqodTJSvOoX+psaa/oVdGlSipjKSmp5+h/MM=;
        b=YTjD6iDypYfRV8g+eZGfeL9Im1xHDITW1dyZmv6J1MCEHaEvQXyTT3TngGqE9MGM/c
         rOA3yN0db/WiFZ2rTfPz8XMV1AtvqkD953Q6PaTO2oJl+1fKwHYylxCOnA7OA/1aJlXm
         r9Gp82RLxFtCDPhngpSPs+ZiIzagxqDpU/mG9J6odRKrOCNoL07qijxvwgG1z3sZ31oK
         5D+rAmg1SBm+q48RRn9M7NBdQqW4Mw7QB8tMG0KlUjbCRMODj3Q62GwCw4OFG6kS52IO
         jaoPJXNlm+W9S6SfVUTYgc3Pli+porZYdP/6/DYzn2ybI0bOIFlX4tubxGAft9eju/Kf
         kLaA==
X-Gm-Message-State: APuU4Z/U1jek6B5y8TrEoYEO/PmGodsUNznVZHiNjLBkXPPJ3GqLVWSs
	AgUSrk3DUv3MnvjMVTvaErNEX9rzT/BI8ticyBgnnOm0XbmgGyvU/NsI/jxrZrJ/07c=
X-Gm-Gg: AYBFou2Bgkk97vzTxB3H2BR9L+tws9YSVDsYzYwHVT60CmpI0SM4IeRK4pNfgH6mF8r
	SjK418mfIFhBgx91Y/EYNG9rlRvAaR86xWBuTmRhTCcbK0ZIXYo1AO71XaP9rguZVZkuRN+u/eA
	tvO2PUOeA+kt74gMKPT7sxV+vMQHD3q9DyNRPlXWeM2oBIy/IzfEGvKqmLLlno0hVTPI5dUl3fa
	lJZAD/mvMZSJKijiHKPim14jTV0c2WVCZAWdXABe53GlmBT8ccOK1G2Qt0PKMg5oVKD9DJWI9oB
	CAiLTAZE59TIl/H2pRMEpmKibLcbHxFmmI+x/tUKg6NaL9+5Xp8AGfiBbER3iY43ijh721KPU/w
	q2v4SdAuy/qJUiVE/9rKZwHJDwsgC7u3a89fW0RXK59ak/ayX91uiW/SfACbzecYPGh3rB6VA9K
	HKmQiVicHDobSUI5/yUqaM0IPCJJdo6zRL2gERu6tqKNeXvVT8iq2o+Xo5DXB0+IexUN3yl8VJX
	Fs+vvGjrCe6kYIbPYadIKU+DSFoq9CyNoHeaOEXwcMtu6Ke+Q+NWRIjUayfkLGvbpGo8THpOawe
	Ih4PpaR41/hn9STbAL7M5lI8ofJGjrQhe7bzYs09mKu9hL7l0obLYOsS9W6yKSD7LmIHkBgCtuL
	GkRTd8PI/qqqcNZ39Yg==
X-Received: by 2002:a05:600c:5491:b0:4bb:5e6b:49e with SMTP id 5b1f17b1804b1-4bb7d9fb0e0mr8677965e9.6.1794950088091;
        Tue, 17 Nov 2026 13:14:48 -0800 (PST)
Return-Path: <yoann.congal@smile.fr>
Received: from localhost (2a01cb001331aa00a2e4fb7b0d887544.ipv6.abo.wanadoo.fr. [2a01:cb00:1331:aa00:a2e4:fb7b:d88:7544])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d2abfc4sm13067625e9.7.2026.11.17.13.14.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 13:14:47 -0800 (PST)
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 17 Nov 2026 22:14:47 +0100
Message-Id: <DMXSPAJ5SNHR.3TU99Z61O328G@smile.fr>
Subject: Re: [OE-core] [PATCH 03/45] acl: upgrade 2.3.2 -> 2.4.0
From: "Yoann Congal" <yoann.congal@smile.fr>
Cc: <openembedded-core@lists.openembedded.org>, "Alexander Kanavin"
 <alex@linutronix.de>
To: "Alexander Kanavin" <alex.kanavin@gmail.com>
X-Mailer: aerc 0.20.0
References: <20260706171701.70536-1-alex.kanavin@gmail.com>
 <20260706171701.70536-3-alex.kanavin@gmail.com>
 <DMVU99KK0OIS.XC4NZF0E3TR8@smile.fr>
 <CANNYZj_ccwXceqk4qME9QhTQ35gstPvnYxWC_v8H5m9Hut1-Ow@mail.gmail.com>
In-Reply-To: <CANNYZj_ccwXceqk4qME9QhTQ35gstPvnYxWC_v8H5m9Hut1-Ow@mail.gmail.com>
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2026 21:14:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/250493

On Tue Nov 17, 2026 at 8:08 PM CET, Alexander Kanavin wrote:
> On Sun, 15 Nov 2026 at 15:02, Yoann Congal <yoann.congal@smile.fr> wrote:
>
>> I think this upgrade resulted in a silent ptest regression:
>>
>> Regression report for yocto-6.1_M2 (target master, base yocto-6.1_M1):
>>
>> https://downloads.yoctoproject.org/releases/yocto/milestones/yocto-6.1_M=
2/testresults/testresult-regressions-report.txt
>> |Regression:  runtime_core-image-ptest-acl_qemux86-64_20260609020141
>> |             runtime_core-image-ptest-acl_qemux86-64_20260723201535
>> |    Total: 9 new regression(s):
>> |    9 regression(s) for ptestresult.acl
>> |        ptestresult.acl.cp.test: PASSED -> No matching test result
>> |        ptestresult.acl.getfacl-lfs.test: PASSED -> No matching test
>> result
>> |        ptestresult.acl.getfacl-noacl.test: PASSED -> No matching test
>> result
>> |        ptestresult.acl.getfacl-recursive.test: PASSED -> No matching
>> test result
>> |        ptestresult.acl.malformed-restore.test: PASSED -> No matching
>> test result
>> |        ptestresult.acl.misc.test: PASSED -> No matching test result
>> |        ptestresult.acl.sbits-restore.test: PASSED -> No matching test
>> result
>> |        ptestresult.acl.setfacl-X.test: PASSED -> No matching test resu=
lt
>> |        ptestresult.acl.utf8-filenames.test: PASSED -> No matching test
>> result
>> |    Additionally, 1 new test(s) is/are present
>>
>> Because upstream commit f55ec6b "Use .run as the filename extension for
>> "run" test scripts" [0] changed tests filenames but our run-ptest calls:
>> | for f in *.test; do
>> |     LD_PRELOAD=3D$(pwd)/libtestlookup.so ./run $f
>> Which, in case of no file matching "*.test", will call literally "./run
>> '*.test'" and this succeed for having no failing tests (but no tests at
>> all).
>>
>> [0]:
>> https://github.com/sailfishos-mirror/acl/commit/f55ec6b2e6b9094414b41df6=
7bd19cbbfd48e8be
>> (random working mirror)
>
>
> Thanks, I just sent a patch for it.
>
> Alex

Awesome! Thanks Alex :)
--=20
Yoann Congal
Smile ECS

