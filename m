Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-yw0-f182.google.com (mail-yw0-f182.google.com
	[209.85.161.182])
	by mail.openembedded.org (Postfix) with ESMTP id CD510605BE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Sep 2017 00:58:59 +0000 (UTC)
Received: by mail-yw0-f182.google.com with SMTP id r85so2615075ywg.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 17:59:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=wuiCGSqeB3LVFx14RNI2/lY7z+bFit0kI8xpFd1AtKg=;
	b=KHlKm6GMmm87J7TJ0a8dpKOe7YR+/+rD5T5B6+9GXZcP+yYPhAuTdEiqVOY0zbbg4P
	pWXj5k0vaUWw7euhbiTqNGRq2ydiRkrLPGKET37lBONl8XMB6nogTQSALknv1T9t4j2g
	MRzKjPD5x4uK4s+znY5+q/ZFajFaSM4eidM3YcTf1Knj/tQzOg4GLRl8Sqgn70SM+nvB
	sn4/G2glKB9K4uAsNR9RF1ph+jdhh8+werzoVJLZBmOjG3NA4cnKLeOc8n9NGUMbjuQo
	0LNx7jC/dpUacw4PPXZm0GkzuOUNuXlQpVGB2UAgZ+IKrqhmTe9uCEoMSKgB0BlNV3am
	LcDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=wuiCGSqeB3LVFx14RNI2/lY7z+bFit0kI8xpFd1AtKg=;
	b=opcHGxzsHEcqd0WEXdCM0tfcEw/lZ5BdQgYr3I6pc8XDW2wEU4+QFWMdTfFqJqPFNy
	mynScuvXu+qzDJGc5ow2sem3QHbvwDi0CVkZ9woGhV7/Cne+wpSHZHnDZGGEVK9/c3YY
	6hSL5L8JEgYnmsYcpViYvlAz/FVZ3IH4xrbYDaeaRi7FrLdTV7bwMx56+KN0lUt92idq
	nhh4uFCH79FH9SjQ7pVtJwxVCH2i7P8MDuHzWnZnGUBC7dwbM5i80kcHKFzyEpmaXV6x
	gLQCfjz/1a0aJ0B7nRoQ16RilKyWcB/2iEK3mdYyu4wXa5L6ipW252f9zWaL7NbfZIVG
	vVgw==
X-Gm-Message-State: AHPjjUgpxSLi9lJyY39rG+ReGLUxyKxYa3f/hMDwiy3LQTEdsRto3NUv
	3CpX6CZcUfzkYSC+XI8=
X-Received: by 10.129.52.79 with SMTP id b76mr759052ywa.195.1504659540482;
	Tue, 05 Sep 2017 17:59:00 -0700 (PDT)
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com.
	[209.85.218.51])
	by smtp.gmail.com with ESMTPSA id j6sm703336ywg.31.2017.09.05.17.58.58
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 05 Sep 2017 17:58:58 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-oi0-f51.google.com with SMTP id n18so34089012oig.2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 Sep 2017 17:58:58 -0700 (PDT)
X-Google-Smtp-Source: ADKCNb4SoN5NfQomvmkFTYgwNn7+MYhd1kCIFd+dL2zLeNMSV3BDAF3OgLDFW4JMcz/nUVCEEkQd0Bh/tps8p62Bt7c=
X-Received: by 10.202.56.194 with SMTP id f185mr940356oia.249.1504659538137;
	Tue, 05 Sep 2017 17:58:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.157.0.69 with HTTP; Tue, 5 Sep 2017 17:58:57 -0700 (PDT)
In-Reply-To: <CAGgRHJok_8G901Y4psyDTx5=qv=+68PzZS1Au71QHnrJNpzKVw@mail.gmail.com>
References: <20170904210608.23764-1-otavio@ossystems.com.br>
	<20170904210608.23764-7-otavio@ossystems.com.br>
	<CAGgRHJq8yBn+wxaXOMXmc9jrOSODUFOUL=9RFLCFLm7z_o6V7g@mail.gmail.com>
	<CAP9ODKphOXXRrp=yE7CWSO2fpU2-Ekf7O7NmtD993UvzgcWT0Q@mail.gmail.com>
	<CAGgRHJok_8G901Y4psyDTx5=qv=+68PzZS1Au71QHnrJNpzKVw@mail.gmail.com>
Date: Tue, 5 Sep 2017 21:58:57 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqE11_+XWKhFv0PrOkKUn5q=sowco_STHhreN3n+bm+Ng@mail.gmail.com>
Message-ID: <CAP9ODKqE11_+XWKhFv0PrOkKUn5q=sowco_STHhreN3n+bm+Ng@mail.gmail.com>
To: Matt Madison <matt@madison.systems>
Cc: Otavio Salvador <otavio@ossystems.com.br>,
	OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] go.bbclass: Enable parallel build
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
X-List-Received-Date: Wed, 06 Sep 2017 00:59:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Sep 5, 2017 at 5:06 PM, Matt Madison <matt@madison.systems> wrote:
> I thought that GO_PARALLEL_BUILD still needs to be added to
> BB_HASHBASE_WHITELIST like PARALLEL_MAKE is,
> or the task signatures will be different between builds done on
> systems with different CPU counts?

You're right. Added it to v3 but will wait until tomorrow to see if
someone provides any more feedback before sending the changes.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

