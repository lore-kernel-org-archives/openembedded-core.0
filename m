Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com
	[74.125.82.182])
	by mail.openembedded.org (Postfix) with ESMTP id 25A14786E7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 11:28:03 +0000 (UTC)
Received: by mail-ot0-f182.google.com with SMTP id b54so3039710otd.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 03:28:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:date:message-id:subject:to;
	bh=bXYttPR+Ltty5b9gGTB5LjlUlAKpsaaQkME35xKwfnM=;
	b=Sy0M/wnGqMQHtHIPX4v8za2SOVP4sL2yF4eXkkcjMZfXOzLVA/C672CM8wu8rqJOBU
	BCzMLyJuvY7AUGkt4NKyJ/MtMYii+CjpVxQ4P0KjKI2W+3Um7vS4NaVO9/n+AvvTai8R
	xL7FbLBr9LZ3TBqLHFvYSuYWjXsoLRF0tJul0E1u5SfS7eWSKThHj/5Wl1OvGMGbhld7
	CY4U+VoD4kS+xBECk0e7Fc0enJ0VWW+p+6sUvjsekgWgd0zlMQblW/WsiiSxyJFeh7iA
	lJ7SY9Mm63ia5cpip/EYwYXXeTYp2dX0REP2xpjQL2/B8K33WZtnrBROqWBeVBbzZr5D
	o8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:mime-version:date:message-id:subject:to;
	bh=bXYttPR+Ltty5b9gGTB5LjlUlAKpsaaQkME35xKwfnM=;
	b=W7cPl+DKyuZQ0Wf4jfWSy6eGEQA/psZDjnuflri7yYHPZG3bSCTgWoSd7Ab5Si8EAJ
	TvNy0KxL+9RPewTh9wS8ZdxThnboHQc02x8YFhKH0YRg9BqPUUUD5AOChu7KqrluZzw7
	kZSJfk8AkG/tH+WqYI0XPya8y6M1vFV2C7xiyloCWN5tDoVtaKtJKy+0LAlBlMb9PwfH
	IvkDbX7+SOccIIyJ/Vdro1SioDgRKNaiOrBXYHme2J++JLeRaC9SNes4TaemIi5g6IJp
	8VwLHK8HVm0lAQ1kkOCTqSH65ffuKTR1mW6Q0o7Nax7z0KrwinyNdLBfr0TU7QpSL20/
	lsSQ==
X-Gm-Message-State: AJaThX4/J4iRP0HWnOdiLUf6xECrfY6j8XBIQOJtygflVzzi5/GOYRHM
	wZ7LPVYsYUYmd0GkKJBr2JcybRDM
X-Google-Smtp-Source: AGs4zMaLIq1msqxVxoiPGyYJkQ2zJHdbXaW58Oxv4Zjvu6MnqAhwMTCm426JnPDgyQbnsDx2Mmc24A==
X-Received: by 10.157.1.17 with SMTP id 17mr21748691otu.272.1512559684769;
	Wed, 06 Dec 2017 03:28:04 -0800 (PST)
Received: from mail-ot0-f182.google.com (mail-ot0-f182.google.com.
	[74.125.82.182]) by smtp.gmail.com with ESMTPSA id
	l12sm1141451otd.34.2017.12.06.03.28.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 06 Dec 2017 03:28:03 -0800 (PST)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-ot0-f182.google.com with SMTP id 103so3030614otj.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Dec 2017 03:28:03 -0800 (PST)
X-Received: by 10.157.36.18 with SMTP id p18mr22445280ota.191.1512559683142;
	Wed, 06 Dec 2017 03:28:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.17.210 with HTTP; Wed, 6 Dec 2017 03:28:02 -0800 (PST)
Date: Wed, 6 Dec 2017 09:28:02 -0200
X-Gmail-Original-Message-ID: <CAP9ODKq14eNanqVJpXDyRdtr=fd_W5_7r6MhjAztVmg5FGbn7g@mail.gmail.com>
Message-ID: <CAP9ODKq14eNanqVJpXDyRdtr=fd_W5_7r6MhjAztVmg5FGbn7g@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	akuster808 <akuster808@gmail.com>
Subject: [rocko] Go fixups
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
X-List-Received-Date: Wed, 06 Dec 2017 11:28:04 -0000
Content-Type: text/plain; charset="UTF-8"

Hello Armin,

There was one patch which was mistakenly forgotten on rocko-next, and
ended being merged. It ended being reworked in master and I did the
needed backports/revert in our repo[1].

1. https://github.com/OSSystems/oe-core/compare/rocko...rocko-next

Please consider applying those soon as rocko is currently with a
broken Go toolchain.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

