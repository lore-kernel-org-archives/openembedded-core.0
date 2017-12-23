Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-oi0-f66.google.com (mail-oi0-f66.google.com
	[209.85.218.66])
	by mail.openembedded.org (Postfix) with ESMTP id BD3EE785EE
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Dec 2017 13:28:56 +0000 (UTC)
Received: by mail-oi0-f66.google.com with SMTP id 184so20568646oii.2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Dec 2017 05:28:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=h8vTVTP5qqfCTw6DwKfeSnJcCWOu3NFA/2TixbC4RIk=;
	b=MbdEJ13cBhfbhXy8N7EWhPqg7B8DdjbtWm94Q9I4iP4imI8P2TULENzXOix3rv64tw
	mRt97lfgv0n6HZpoRXPxGBPTAgICc8eJ26gRyohov6irkK6NXTkehw6uEBWK1iRTBrwq
	Opr17ZaI9N00FIlm5HBRZ1rRmSTSDzifYBvapzFZS/X9LJNXRw6Kl1tiHbE8SyX3C5gQ
	61pPRMlu35+junbEhUwHMJwg1prfLoYdq7C1KYSNAzlw1EXFc4lN43Kki9JiSvjK3ad2
	r0s0FoBcHvlG9KVTvrwgfS/xEi8yO8lutWPFHt/k7V5RRiK/3pLGwEYDIdOsfMTqbeWK
	ijuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=h8vTVTP5qqfCTw6DwKfeSnJcCWOu3NFA/2TixbC4RIk=;
	b=V3n0vLcTD8BTcg/mlle6XDrKaqNnH3QoA43SUYj2FbXerwEWTDu5bdL9B3A9jomOSd
	PI7fZMCt98Yhh8M02W6xu6VDLMOqAqE7TlxK30yQMM0H2Hzif9IZvb7uCeXhaI52CB74
	bcvO+S9TigYKeeGBGkxLZj5vtPm/CefUkNs7eFFx3PIJdHUpyDAv8AzeeIzlp/GyGEVs
	jgNkrxLdoMwOZqapnu2iLsnIe6kmfjUyHyhh1IYeEtOhNmkvaZRJ00fqK3dVuN+PcXeW
	zOTIjEg6kCOyewHHLhSG1Ffgj0niOHF5XDLkpbGuU5V327Sj5z7l3KQnQKbRpxtXGvD8
	3GZQ==
X-Gm-Message-State: AKGB3mKmwC1XNBW7GtaVFgqCg8HrMQIV0Q+n1/uLw31QLVoWc7MRW+ML
	O2gDBS6W2rxL5Y4pNQvi7Eae5ZtL
X-Google-Smtp-Source: ACJfBotm3bQjoN6wZB1RwavyJ2NdawA+xH8zAT0lfcUJ3Y7wYObU5yUHhBTNqtjS4BobpZqaFRQztg==
X-Received: by 10.202.197.133 with SMTP id v127mr12145661oif.224.1514035737294;
	Sat, 23 Dec 2017 05:28:57 -0800 (PST)
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com.
	[74.125.82.182])
	by smtp.gmail.com with ESMTPSA id g3sm255390otc.34.2017.12.23.05.28.54
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 23 Dec 2017 05:28:55 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f182.google.com with SMTP id o39so7703050otd.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Dec 2017 05:28:54 -0800 (PST)
X-Received: by 10.157.80.12 with SMTP id a12mr12606764oth.370.1514035734573;
	Sat, 23 Dec 2017 05:28:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.41.233 with HTTP; Sat, 23 Dec 2017 05:28:53 -0800 (PST)
In-Reply-To: <CAP9ODKqWMkofCJ3UrnBCRjYbVLBreVw1cm=o_NbGi1oAD3Rfdw@mail.gmail.com>
References: <20171219181423.32539-1-otavio@ossystems.com.br>
	<CAP9ODKqWMkofCJ3UrnBCRjYbVLBreVw1cm=o_NbGi1oAD3Rfdw@mail.gmail.com>
Date: Sat, 23 Dec 2017 11:28:53 -0200
X-Gmail-Original-Message-ID: <CAP9ODKqfvMa9JvKVuhmEmQ2aoZWh8Ps6+mN_DaYac-6YsBVw7w@mail.gmail.com>
Message-ID: <CAP9ODKqfvMa9JvKVuhmEmQ2aoZWh8Ps6+mN_DaYac-6YsBVw7w@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>, 
	Richard Purdie <richard.purdie@linuxfoundation.org>, "Burton,
	Ross" <ross.burton@intel.com>, akuster808 <akuster808@gmail.com>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] image_types_wic.bbclass: Ensure '-c image_wic' works
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Dec 2017 13:28:56 -0000
Content-Type: text/plain; charset="UTF-8"

Hello folks,

On Tue, Dec 19, 2017 at 4:20 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> On Tue, Dec 19, 2017 at 4:14 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>> The 'wic' image may use files which has been deployed (e.g in
>> do_deploy) for some partitions that may need to be copied in a
>> specific partition or filesystem (e.g a bootloader).
>>
>> When using 'bitbake <image> -c image_wic', from a clean build, the
>> contents of do_deploy must also be available so we need to ensure all
>> do_deploy of the image dependencies has been complete.
>>
>> Reported-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> This patch needs to be applied on:
>
>  - master
>  - rocko
>  - pyro
>  - morty
>  - krogoth
>
> It is an annoying bug that has a simple fix.

This has been applied to master, now it is time to backport it to the
stable releases that has the same error.

I made branches for rocko[1] and pyro[2]

1. https://github.com/OSSystems/oe-core/tree/rocko-next
2. https://github.com/OSSystems/oe-core/tree/pyro-next

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

