Return-Path: <tomasz.dziendzielski@gmail.com>
Received: from mail-io1-f52.google.com (mail-io1-f52.google.com
	[209.85.166.52])
	by mail.openembedded.org (Postfix) with ESMTP id 03D507C3EC
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 11:40:24 +0000 (UTC)
Received: by mail-io1-f52.google.com with SMTP id r200so9799403iod.11
	for <openembedded-core@lists.openembedded.org>;
	Sat, 26 Jan 2019 03:40:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=o5D/ddGXbawxd3Iz5aFfyukZGUsEdBbLlioeCu8eOAg=;
	b=ghzdEPmFlfwNl6839PG99m2Q/i83Pe8xoFeozjhA3NZaS/m29r98eVLSV9pRUmdAB0
	SurYLbE7/HXSr0UboN/mG73O510saaS58iuhpJLBdpblwHS40QMNvxI1ypOzyQr3TOGE
	d7LziI4ftfLTsQjk+JokxxM0asrH+Y0duoFlHC2a4un3hcFxqjWwvN0tzupVwQ7zUs3S
	sulvaMoaUBVL4aoq4AA579CSsxEM1B3wzrty+xR2XXOjBP3d1OnsmD10wpRUs4M1Udhu
	DYTwL0ML6WYFthYBmj6+5KsrUqfDex30dcb9jVo8QdfTIadl7gKUJf7Lo6Ug/lumTSm8
	ao7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=o5D/ddGXbawxd3Iz5aFfyukZGUsEdBbLlioeCu8eOAg=;
	b=WF/RHQ/GC925eggWL5nNbmQGIZrpx92HPA23+t1ArcEHZ+oUX7XAPhGvUy4Dzmlts0
	uT/ENNs+dJ2G9ZQejx5J1fgEOOCHPDClX+d7O1AzYP5CWYvaNP3lFmgPeXJpsDbl129V
	TafIHVt+e1KWjiJocPZhf2AbVKY8h95klGdGSGlVH1IHiLhsY96uLfb2ApKx8Chq30xT
	zgOeG4/aJrFHc07/0yp2jNohzxkxqoRIVblyZlTDfxhrqUDVOqnPOIyys+5ezayMSWoj
	oCpfBNnyqWyQqg7q+tosCsfcNeaX684WNWDVsJ3w2rDKTXoIFiVcHQVoHfGRPryWnlr8
	ryEQ==
X-Gm-Message-State: AHQUAuZuKi+tFyEz3diJpCIzYpcPE4TtfmLZ6IxvWiWE6puhy6f6ADao
	3zIgJxaodcIKWtoU5+5LsfNI5+0nKKCSZSoMdU3gDWac0i8=
X-Google-Smtp-Source: AHgI3IbDWK+TCOxsuoRcMVQ3ACUk85s2XUuPkX0VvzqGc52/7kZnWJTFMSKLU/HXjrUjdWDD0rrKWtFejopQpcrvYQA=
X-Received: by 2002:a5d:9ad8:: with SMTP id x24mr8451917ion.19.1548502825634; 
	Sat, 26 Jan 2019 03:40:25 -0800 (PST)
MIME-Version: 1.0
From: Tomasz Dziendzielski <tomasz.dziendzielski@gmail.com>
Date: Sat, 26 Jan 2019 12:36:08 +0100
Message-ID: <CAJkqNs1wo=3DUzUhFx34HoLKwJAdn_9=AQANohVVB84CsAHyYg@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: [PATCH 0/1] lib/oe/patch.py Fix the function comment
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
X-List-Received-Date: Sat, 26 Jan 2019 11:40:25 -0000
Content-Type: text/plain; charset="UTF-8"

This function use 'return' instead of 'return None', so I updated a comment.
The following changes since commit 1979d9162a335b7d4718a6697ca57bfa16237f0e:

  bitbake: gitsmy.py: Fix unpack of submodules of submodules
(2019-01-24 17:45:49 +0000)

are available in the Git repository at:

  git://push.yoctoproject.org/poky-contrib dziendzi/patch-comment

Tomasz Dziendzielski (1):
  lib/oe/patch.py: Fix the function comment

 meta/lib/oe/patch.py | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

-- 
2.20.1

