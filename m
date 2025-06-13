Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49587C61DB2
	for <webhook@archiver.kernel.org>; Fri, 13 Jun 2025 11:56:41 +0000 (UTC)
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
 by mx.groups.io with SMTP id smtpd.web11.8660.1749815796401927135
 for <openembedded-core@lists.openembedded.org>;
 Fri, 13 Jun 2025 04:56:36 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=ZlnO6npy;
 spf=pass (domain: gmail.com, ip: 209.85.218.53, mailfrom: skandigraun@gmail.com)
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ad8826c05f2so373958966b.3
        for <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 04:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749815795; x=1750420595; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MziZNmyE46WejPb4dNxtuj3gWwl/sdI0m2ePC4F9zEQ=;
        b=ZlnO6npyGs6DGAxlMMaFjzQoB+7YcD/nUmWHQnB+K8gVqwNw69oFP8DitVbKStDPFU
         M7ConMrd9MLrCBMnooe/5+xEXuy82JaBAvuHi0ThC98a9ZeYnmc7IRCjmGUvtqmSlaJd
         hbPS2vmriEHQ/9W4DrVw44YBWUBSCp+lczg+L9fULK+CZwukL1zW0GBhhapJh7HIXlki
         o2K6DKRJ/FfHGu7OTSfQS1KXGM6xTpxjVBBqX0M9bmFqFeP76GaVepAFgsCaRw5GmIVQ
         xFjUVCY9Nhueg+kDmqycvIE3Rwm3t5oGddcQqjFFYBB95VQ8w6fuqoFz8AWHnXGhgNe4
         0CiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749815795; x=1750420595;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MziZNmyE46WejPb4dNxtuj3gWwl/sdI0m2ePC4F9zEQ=;
        b=i2zbnRZVYY6hWzgQmVWo6an2zKhu1L9lWGdZqscKO+Y9cy299FpiU9KBspKDecgQT/
         NGZFYlDlAmUjIAeTy7PN+zPhs6a6mHoZw66bHKz1D/qCU7cpANDMmOaUrYe1ZiEYxFB7
         XCBNtVT0wIbV0XBpwTNEf22HBBL4Gr0WMpAIt1REMxrQnhkQooMnhkuZgwNMvylLY+sA
         sJ0umP95O3tXp7Annv3ZtRYLevUV1TYIekHmPBDdJGDUMHsHFHxA4GvhmPtJvKky9DPh
         WiHv8N9+CGdguuAzTrvE68/IbRX6K+YoXANKugEg71HLeuhnSeIb2byrSUz6wzH2dKvm
         QU9Q==
X-Forwarded-Encrypted: i=1; AJvYcCXiSfot2JTBdVBkHYwK6UKsWwTbf/whW6aPn8OAKjnUWemCAIoox/iGbFBa3+Z4HKCWoW/IuOm2izxIK1IShpn7xw==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzwiCNTcbdLo+fjkkO7gm55bqAAwlKsi99wRpCnLs1H7M+3fvbP
	WOzF1ewMaODqlP014U9a5oRlf5gTh7JejIOshp0JASoldt1cNswkprovIi9Tqg==
X-Gm-Gg: ASbGncvD4eE/3sIRxysenOqEhu6ySWQCLqOM3nmdY4FUYYdxP69xsoGSSar1P/CsjnN
	/knb7aN4w4Iv4cityecXj89u6xaYtD/vuO7vQdiOyTKzr4VbbVHmLw7UhfzCyKT01AklfP0lMMW
	aXciGS6Uo+q1MsVgW04RTYBCxs8d9BNZTtfv5h4pqt37/ZxCNH3ln7YtEybD4nVbhPi8o+ib2Vo
	0XxuBFNJoUojEw+qljS0+DATFkdrg5hSlwfwKgf94J0bttG/VjjrWbL8Puq9obW8dQcBvoRvitX
	cCBZff/++uKp+lEC593zhgyHXnLF5ydhCNBO0dlA3cLFe3+Mg31Gh3YNH0JVWp3WehHKsL1hYGF
	x0IGI
X-Google-Smtp-Source: AGHT+IEKHcPV5NF8zgypjXSf/6uqHXqv9os/mnsm4Psp+liaB53g5HxD5E0AosQtvnkqLuqK2dLV9g==
X-Received: by 2002:a17:907:7283:b0:ad5:4a43:5ae8 with SMTP id a640c23a62f3a-adec5596fe7mr295735866b.12.1749815794369;
        Fri, 13 Jun 2025 04:56:34 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b4a604d9sm1082751a12.39.2025.06.13.04.56.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 04:56:33 -0700 (PDT)
Message-ID: <ac6f29e2-36f7-497b-a733-c892cae2fa2f@gmail.com>
Date: Fri, 13 Jun 2025 13:56:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [OE-core][scarthgap][PATCH] python3-requests: upgrade 2.32.3 ->
 2.32.4
To: vanusuri@mvista.com, openembedded-core@lists.openembedded.org
References: <20250613110126.187329-1-vanusuri@mvista.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20250613110126.187329-1-vanusuri@mvista.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 13 Jun 2025 11:56:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/218594

There seem to be some duplication in your and Wind River's contributions
today - this, and some of the libsoup CVE fixes in Kirkstone are also
duped only with a few hours of difference.

It's mostly an observation, rather than anything else.

