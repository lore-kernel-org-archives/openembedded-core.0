Return-Path: <schnitzeltony@gmail.com>
Received: from mail-ot0-f181.google.com (mail-ot0-f181.google.com
	[74.125.82.181])
	by mail.openembedded.org (Postfix) with ESMTP id 6BB34744E4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 11:05:53 +0000 (UTC)
Received: by mail-ot0-f181.google.com with SMTP id m22-v6so16860037otf.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Apr 2018 04:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=rowEOqbLNnBzIrkfVzi5PT0hwEMdF+7W6FaNrsjW50A=;
	b=gy+ym644nfNMl5y00wPxr1aPOUKvoPoiige1xN77BtplvsoKZ2TaWOQ8CozBEhXfhB
	fx4Q3+0UdLz58bG88kZb3ZVSvUWSX9Z6qJEj70IumaOWjzHxslwgge2nYF64JuzhmcOK
	mKw+KMUAZwvZgb37ajaIxQ5e0nBM7rGDveMfOSV1Gxq21Cmt8vFlXv1WwznpA98TP8Zp
	s9lPK+R+aa1mlkNuzKyN+IXDcAN+I8w1+mqEkusEKLAiGmPGHQnRU+RzObLhpSXGEpr0
	PM4Hk/tWA7OSzOK6bL/lguRzs89XGtyG0SgsVBNZgw2W6Pguz8dCLOJdaH7tvYHH2mMZ
	MLUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=rowEOqbLNnBzIrkfVzi5PT0hwEMdF+7W6FaNrsjW50A=;
	b=qMhkCLeWvAgu9LshVA3OOwqudMR09D9eY9LB+ykxbBE8c/rKmYLd+FtOtX2nASxVg8
	+kqo5FuKnQA7nIytFx3UTANe5WoFM7YKzvF4eR9eFB2jr6r2NwMGAFJwCJS5w/PGvM35
	aY1i7/yQJqdsq5rupQ6h1RjysDGnCd2Dsm9QHv5b1s/C+6IQ4toX/3LcQ9mSCD3HY+6P
	kFMEMVLnKLpvEo5Eed+SLo7jfhGJl0bs1Mq9S/CgIbzY6QQQuOKnSukjlkGhFOppO7cS
	5yjEhAJMEV2GFLGUE0ozAecvp/w+7X6Zw69cwb90R4TgYlA1Qqpcn5koQizYNGYHUY68
	sXHg==
X-Gm-Message-State: ALQs6tCrEAkkO64yD+D+r2shEXlyxvgftxOVSYedwMZdBCA1KrN/qTD2
	2LY963qdte/r9xi5Hx92vncpuQCpwmZt8r5uyXE3pg==
X-Google-Smtp-Source: AIpwx48CVUC74jcoCKa+gGJZMs7khazk3MZ7z0xM1lW5j3bXI4PSOV+kLO9+h92xTivPJ7T9uM3vTr76yzl+xzGlifM=
X-Received: by 2002:a9d:7247:: with SMTP id
	a7-v6mr10766552otk.220.1523876753795; 
	Mon, 16 Apr 2018 04:05:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.201.25.81 with HTTP; Mon, 16 Apr 2018 04:05:52 -0700 (PDT)
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Mon, 16 Apr 2018 13:05:52 +0200
Message-ID: <CALbNGRQ6Av0QFfDdiAk7Hc+9Tqoa7Zz0CTu-uigtfa=MLk93CA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: musl patches
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
X-List-Received-Date: Mon, 16 Apr 2018 11:05:53 -0000
Content-Type: text/plain; charset="UTF-8"

Hi,

I am not happy plastering patches around for musl. This gets even
worse when I see patches like this [1]: Just wipe away security checks
unconditionally - the developers did introduce this check not just for
fun I guess...

I have seen this already elsewhere so: musl maintainers please take
care not to modify code for glibc!

[1] https://github.com/openembedded/openembedded-core/blob/master/meta/recipes-core/systemd/systemd/0001-Use-getenv-when-secure-versions-are-not-available.patch

Andreas

