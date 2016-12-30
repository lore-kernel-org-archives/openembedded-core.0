Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 45595601D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Dec 2016 10:09:32 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id t79so352190830wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Dec 2016 02:09:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=R5zmdVSfU/78+sbFRQqi5/xNAwBXjSikXnsvK6cZb84=;
	b=W5SYSDuz1irPI9TnZ7ZW4RBeQje5vmQgdvXUuD3w+GH41j2d6lFkkCTXr2x0ydbkm2
	NYEbZj2P4aEKlSEBma34h9MxYD3DxtB4i4BHeY6ez9+QgdAmzd9dQ7GxI58FQItUD41+
	LJnaLdhNbwkOsLsdl7+eVFoC2hm9VY3+AkuW9DXWPvz+r5W4SgG9TsIPwzotKr1N3TMZ
	2MshQIOE9yKM8XHB3GxT7d4Wnddg8V6/nJkVeUtX/Bck0XCrRtpAEm2kFCwfl1KKpq4n
	62YOP+e8ajt1znjzWSS+0qjkWXfom4NrtZpZ4+ygoYaMW+bPrT2cBF/5sEypx2Ej54aV
	6mxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=R5zmdVSfU/78+sbFRQqi5/xNAwBXjSikXnsvK6cZb84=;
	b=gEGAK9Bnbaqp31c9w8B5v5ijfNJBveOnT8zwWvKLrX/Q/TWsl6eSuazYZMMY9faY7Z
	9YJDamoKoHt/Pxe+y29PCfd1lN08pghaunn2hV6XnvdI3E/uciDR0oZx2SjZb8ZRLqXI
	8cv4fpYUvOHBNxGIhW6cfzk83AcEqWnocZmri9IeQ7uLr+cLhEUx5ex0ESrGfJsNgJhw
	kQwbACTduXDwf0B/GPCvJWIOk+sdN+UVSemIFJzCfPXBduQjjrExD3zsitA4a24LbadD
	SPf2TQLRDLv7CErkjRpLl5NIzt8/drhM+7qLLnIw+9WuKUgb8bOWdMW4pjk4O3K/JIFV
	09pA==
X-Gm-Message-State: AIkVDXIWNvOlJYIJVwdRxXcPNqIL/eCYsbDzLN9vxGC3gAzQtVTkIgmNhguBhfch6P8+/w==
X-Received: by 10.28.41.5 with SMTP id p5mr43413995wmp.38.1483092573445;
	Fri, 30 Dec 2016 02:09:33 -0800 (PST)
Received: from [192.168.2.176] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114]) by smtp.gmail.com with ESMTPSA id
	gj6sm72932031wjb.29.2016.12.30.02.09.32
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Dec 2016 02:09:33 -0800 (PST)
To: openembedded-core@lists.openembedded.org
From: Piotr Lewicki <piotr.lewicki@elfin.de>
Message-ID: <48290aa8-5fc0-097e-54b8-03bb6f97966b@elfin.de>
Date: Fri, 30 Dec 2016 11:09:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.1
MIME-Version: 1.0
Subject: [morty] apache2 does not build anymore
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
X-List-Received-Date: Fri, 30 Dec 2016 10:09:34 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi there,

I have noticed that apache2 recipe is not building anymore because of 
the wrong SRC_URI.

This is fixed by Derek Straka's patch sent to oe-devel in mail "[oe] 
[meta-webserver][PATCH] apache2: always use the archive.apache.org to 
ensure older releases are always available"


Whom should I contact to apply this patch to morty branch?


BR,

Piotr


