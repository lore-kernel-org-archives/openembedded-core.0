Return-Path: <piotr.lewicki@elfin.de>
Received: from mail-wm0-f54.google.com (mail-wm0-f54.google.com [74.125.82.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0C9B1601D4
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Dec 2016 10:10:04 +0000 (UTC)
Received: by mail-wm0-f54.google.com with SMTP id k184so156438775wme.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Dec 2016 02:10:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=elfin.de; s=google;
	h=to:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=R5zmdVSfU/78+sbFRQqi5/xNAwBXjSikXnsvK6cZb84=;
	b=NvH1iNOp3+8PjxlM63Mp5SPV7sbluNOh+uj9IO3G5+5omN3tdNUL3pXeZYrjN4ty1p
	qk9QClWjD1KjdWKHrdIwYdAYZRdVCsk2VNP1oHUylrw9zSslQmwOKRMUV8ybSmW9gRsJ
	+1aX+ktl5kuIPN+URWolvXP2ndjoLULLUW0bx8x32n7kkk0/GN/Gdbidiw48jsA1OAFF
	x5RST2iTlC71VAhzhXchf/7HuU+nRhEOAWkWzMtdVkc03Eg7a24N3+tGSXXaxRZeHgEx
	A5bmZxqeAT6v1CSZ8ycT4OpsGSPREKnjNX6YCbE+wJapgmaYlE2IxbBCTBWZNGTdb2qI
	Fkog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:to:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=R5zmdVSfU/78+sbFRQqi5/xNAwBXjSikXnsvK6cZb84=;
	b=oDOhDEtrUX0zCzN8t+qWBaBJW7yRlumBwavwqdcDkyVDhF2i+gk2BWkuooICGJDPMJ
	vvZ6zPIncKo3Ow180iFupbKFREEEHEpSVLREXcOFt0zhc+1XO5Y1gDvyv90EtA/3mW3p
	yyrFwWjZRaLQD3OXw41GBLbKwTtkBn2uwGLFTBS0D2Rvw/TR+jr6TIYu4g2uKcWIsAZN
	ikSj0mltEOXQw7cVB7oOPh2P72pxlEl90GrfpJbGT59hRPWXfXFv+3NnMN2wjsb6+MSS
	9gJqEAwpcaptNyq4Cobb2qoKOjQajx/t6l9e7o1YgoGIW3eSC3NUZ6VDV5J+rw6NAB4r
	gIsQ==
X-Gm-Message-State: AIkVDXKqEv6l3z6lh7Mqf1c3KW77139bhve2nxfurKhYCu8ZRcdPuAS3uSE3dEXe3R4CAw==
X-Received: by 10.28.189.136 with SMTP id n130mr43093832wmf.133.1483092605047; 
	Fri, 30 Dec 2016 02:10:05 -0800 (PST)
Received: from [192.168.2.176] (b2b-94-79-174-114.unitymedia.biz.
	[94.79.174.114])
	by smtp.gmail.com with ESMTPSA id y4sm72827270wjp.0.2016.12.30.02.10.04
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Dec 2016 02:10:04 -0800 (PST)
To: openembedded-core@lists.openembedded.org
From: Piotr Lewicki <piotr.lewicki@elfin.de>
Message-ID: <6d31bd50-dac1-5064-1c7d-cd45fa471cf8@elfin.de>
Date: Fri, 30 Dec 2016 11:10:04 +0100
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
X-List-Received-Date: Fri, 30 Dec 2016 10:10:05 -0000
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


