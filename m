Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81626C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 06:40:48 +0000 (UTC)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com [209.85.166.43])
 by mx.groups.io with SMTP id smtpd.web11.3860.1749796842951236138
 for <openembedded-core@lists.openembedded.org>;
 Thu, 12 Jun 2025 23:40:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Uy1IZhNl;
 spf=pass (domain: gmail.com, ip: 209.85.166.43, mailfrom: zboszor@gmail.com)
Received: by mail-io1-f43.google.com with SMTP id ca18e2360f4ac-86a052d7897so151026439f.0
        for <openembedded-core@lists.openembedded.org>; Thu, 12 Jun 2025 23:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749796842; x=1750401642; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YsEW60iFSLVRgn1fQArY9rrKJAfiJqurY01MTSiDa9I=;
        b=Uy1IZhNlRI8rms7FUiQ54gXs6wWtwrH6baarP9OTGw9rQe9TGIT/WM/+mKxQqB5WYK
         YlVTM8DIQYrpUtELwL6n6aSpwtzNmIjCSQwG6hzucQwsgkgAmC3xwvkrqiNhmzEs6Dct
         b6X6TX6p9Ur20UMt0p2E6NTHHOQ/nRumhQn3XuRKkJXIrCrNncEH9iPqe3vfwwISdR/P
         cJ5pPtSrv3LJtVCV6iZSGKisBH3WfuhVekhAEx5i20ZrWVQRN33dgSFOE1rNPZbeQlR+
         2B3LIVG7u6yYPRba6ch4nwk7Bnsvw7uyW/TuatCzWq+QRNmUlN6o9uOAlmTcz4sLQZet
         eZDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749796842; x=1750401642;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YsEW60iFSLVRgn1fQArY9rrKJAfiJqurY01MTSiDa9I=;
        b=Jife3PVvsGX/ZfmwJeNvNh5fPpcYK8L0nO7QjOxnlLX5pdrzuHLoPTZOKBah49a3RY
         m9MIcJPvdApC9fbSeSDpD907thuTrPqZBS5Ymg6E/GWf/15vrUxpGENXQEXF4LtXfEJd
         KeF4zdY0L2lj08BFs/JhVvWagADIKd7/cZwtMxG2PtVgJKjKBvmb0McSE9grDGsbwcBy
         M1SvEXLqnutxHs1l/v5IqVRzdOkKFv1oCMxf7leTxBM8463+ZuuIdGdqf+1kNgGMP1lX
         Cke1kpLI29osWhSMDqusM+GrbqLx3f1/81eaT9+GxpM2V7WMHDlt9KRt6KomfTGysLBr
         LDow==
X-Forwarded-Encrypted: i=1; AJvYcCX1gy1LlInD5p5EHKWUxUp9KS+PGDPI2SdL+neUXVlcIETk9AFR1qRBKc+8RBMLcNmTXmEANyT88YUvWDbrn+6K7Q==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzsFWHaSr8avOxCnQhYR85OkAewApKI5EPDLyFhjA0yHf3rkzfK
	VxFYZO8EvvmRZyyD6Pxgokwp15B17+X+E8YsNfb2YwUma1qnOoAks+Mw
X-Gm-Gg: ASbGnctsVLw1k4giyTQYD2DU7xJxVUZ1VlNpwF19Iu80cMCbcqV6H/BJt6GxSN7/1Wq
	PXMYJ03BDu7Ti8gmu7tHWmjtH3Qkh2TAuLuvfwKRxJP86jumg+DYn3fjN5z9exN8+n8z49n/ony
	wbA7KhCxrvxUV4xNeHZWERwiUHRJOO39ea6Sz0RVuHxVaDvUt0BlM3WC7Bggp9B58CYnq45dzbO
	hMcqRFnSca/ZGp+Pldst8n3dnjKg5FxOvQnTnQhjRRa9l4TzMGPmlidnpLGOhTKwN0b/ufljo5w
	G4nJ+jplhnNHubc5iNTSUsdukk6Tk0ORvYHFMk8tXTqifPV/LL7KjuIpm15t6Ak0bdeL5DvaLSe
	ZwkOFeKr5YH8xEpy+Af8=
X-Google-Smtp-Source: AGHT+IFh2ZtOgvGjadXgIf/6luR4ednxOUzCcD2U7MH9CGkz2Mc3MHPoqeaVbJFQ125xKZXiBzz1vw==
X-Received: by 2002:a05:6602:3688:b0:864:48d3:a5cf with SMTP id ca18e2360f4ac-875d3d1a4femr229746539f.12.1749796841953;
        Thu, 12 Jun 2025 23:40:41 -0700 (PDT)
Received: from [192.168.2.143] (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-5014e0df9adsm8474173.37.2025.06.12.23.40.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Jun 2025 23:40:41 -0700 (PDT)
Message-ID: <7277bf5b-1140-4d1c-8e89-168ce6cbd873@gmail.com>
Date: Fri, 13 Jun 2025 08:40:37 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core] [PATCH 0/2] mesa: disable building nouveau/r300 on
 non-x86/i686 machines by default
To: foss@0leil.net, openembedded-core@lists.openembedded.org
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Quentin Schulz <quentin.schulz@cherry.de>
References: <20250612-mesa-pkgconfig-no-hardcode-llvm-v1-0-479632e13175@cherry.de>
Content-Language: en-US
From: =?UTF-8?B?QsO2c3rDtnJtw6lueWkgWm9sdMOhbg==?= <zboszor@gmail.com>
In-Reply-To: <20250612-mesa-pkgconfig-no-hardcode-llvm-v1-0-479632e13175@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 06:40:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218585

2025. 06. 12. 14:14 keltezéssel, Quentin Schulz via lists.openembedded.org írta:
> Whenever building gallium-llvm drivers on non-x86/i686 machines, we
> currently always build r300 and nouveau drivers but they aren't
> necessarily needed.

How about r600?


