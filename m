Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-wm0-f41.google.com (mail-wm0-f41.google.com [74.125.82.41])
	by mail.openembedded.org (Postfix) with ESMTP id 4D2F877F76
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Jun 2017 15:02:34 +0000 (UTC)
Received: by mail-wm0-f41.google.com with SMTP id d73so26465421wma.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 08:02:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=5HACKaJ/83Zdn6dgtg5SCqw1Qt98M+qg3VvIWka/Y+s=;
	b=QV6GsPzAT7T62sCTutPM/C4cpFYzUBtGWDNtjaoRPxcawu0R0qYNGIHcrTv7Gsg3b1
	sDcPefrij9/pQ3JEthnj45nNqyy4uQZ12aKSKVTbvYxL7HMAHIvxSTps7niZpG/lSyrk
	LLK/4nlMJw+S+sAYnVbZKaKYBhMxDcNbsmwfYNcKRykv2tI/CQz7ml/6DghS13si+z4e
	4R2erUBaVe61z2DaEEpRyWINcnMKi2yWIB+pi3ncvfKNuZAbNiJbmrLJhZG2IZrUXwqY
	qbi/GC8JN8nwySpYr543B8DviFN2xU6FWV9taemX2WSe+H7AfPM6R2xjQP5xK5gvqwhT
	7SJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=5HACKaJ/83Zdn6dgtg5SCqw1Qt98M+qg3VvIWka/Y+s=;
	b=jB490LyHxSQ7ehjtcxe4Rqcay5Cssf9zz1e1ZkLbkITNCoqjtBiHif+ppGXIO8ZZFq
	bxSCUj+lTURadMlJ3N+h2tq2g7TXkuV1yWgB2bjrNFJ+wCW6Tn+RWyq63gDV5SLfaCgw
	zvN5jeRYqG4c1BY6zHjMLbu8RAOJbRLUj+4UsB37C5ilx1ihv6jA/8IzUAL1k28DFmDW
	IAmFFpjVIVa53o8d07QEbCrFtAvwAiqatmypLmSqmo56qGKppr27Gtj4flOndm8BG0nA
	iBPpSNAkApC+NyS7pJSajet2f9MyhGdql7ziOtKp5TeLKRdDU9xcSopYjl/+xIvFNIKp
	74cg==
X-Gm-Message-State: AODbwcAkYa7X4+adbmZhH8ZtA93Qmp80Jdh6ieUyfahe9proEuEPy/OI
	Xag0TN8cMXiX3D9F2Js=
X-Received: by 10.28.214.211 with SMTP id n202mr8025270wmg.105.1496674955759; 
	Mon, 05 Jun 2017 08:02:35 -0700 (PDT)
Received: from mail-wr0-f171.google.com (mail-wr0-f171.google.com.
	[209.85.128.171]) by smtp.gmail.com with ESMTPSA id
	p139sm14549029wmg.14.2017.06.05.08.02.34
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 05 Jun 2017 08:02:34 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-wr0-f171.google.com with SMTP id v104so39844627wrb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 05 Jun 2017 08:02:34 -0700 (PDT)
X-Received: by 10.223.164.137 with SMTP id g9mr13501126wrb.128.1496674954482; 
	Mon, 05 Jun 2017 08:02:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.236.75 with HTTP; Mon, 5 Jun 2017 08:02:33 -0700 (PDT)
In-Reply-To: <20170531031904.7439-1-otavio@ossystems.com.br>
References: <20170531031904.7439-1-otavio@ossystems.com.br>
Date: Mon, 5 Jun 2017 12:02:33 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqFLeaUgCYuKJc5q1yUW_3qX_-ACveggfTWp=-JwX3L1Q@mail.gmail.com>
Message-ID: <CAP9ODKqFLeaUgCYuKJc5q1yUW_3qX_-ACveggfTWp=-JwX3L1Q@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] u-boot: Update to 2017.05 release
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
X-List-Received-Date: Mon, 05 Jun 2017 15:02:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, May 31, 2017 at 12:19 AM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
> This 2017.05 release is out since May 08th, 2017.
>
> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>


Ping?

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

