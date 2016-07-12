Return-Path: <akuster808@gmail.com>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id 7CC7F6067C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 23:34:52 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id h14so11707590pfe.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jul 2016 16:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=to:cc:from:subject:message-id:date:user-agent:mime-version
	:content-transfer-encoding;
	bh=X28zEchEbcgUpDGj3FkuKgSDkD0igjCowyMR042GQ7Q=;
	b=UfEZ0uHCvBGp6yP2cjROq7nqtz9K1jae1hpEhqY7uq2ZP215ZwEhGZiK0oPptf9C1M
	gpuzdDo7jz+coSPCBd1BnKH2jlYFn7yMeQcXJlBc25Uit34Ymy1a6h1NZpZeaGY9CgOe
	pPvys+90r4N1payNNASec2mFQCNnlv/4hzAAky3SIQKI9eotBhhao+R6bXSjSKHqSGI1
	Hgu4HNWIxWH4ll6qGZ1AFYjUJ3e2SSzf15cDjz+kb7/SdXtWSQ1mpdMFS2KT7Zx+8BVs
	C6r57MSZE1IGr0rsWGrkh2hm6SfyjELeopMB9Oy+C1GCcUllJ601KBmDLaNRfuBctns0
	WZuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:to:cc:from:subject:message-id:date:user-agent
	:mime-version:content-transfer-encoding;
	bh=X28zEchEbcgUpDGj3FkuKgSDkD0igjCowyMR042GQ7Q=;
	b=EqyUV2YR/tRgV8hGQIFJ7/iWf/7ra3GH9pZP9gQJHIQ+xyKBIHVWGP/T2C0PRF8+h5
	MTb/lS5n9q+5YmrvbAt22QVz5F4PBcHgvCl+Pct4Nb4yzPFCOrer020qeI2/FlIZ8Kw8
	4GG5PK3tn6bp/HBPozLUpj+q7ExD6Hrmufk8DMSEq3wGbkqBs4b5r1n6QGwJWZk67j2B
	yBJoIryixkFLBiOB+CNHdR8KNHCYKBr3RnqF1dglp9LyQwOehsX7dm3GfCdDXvRDBSpn
	tMvcsidBRNyS4H1xXXjt9jOI9Yala2Ihx6jl8e5q2v4hLSHMkqvcHQfuX2vBlLGs0peL
	/wIA==
X-Gm-Message-State: ALyK8tIpnPMImyL9qJXN7nyLRFF5NsdKF9//5qGgGpIUymQNyZY46OPqzpoZtcPt9vxqSA==
X-Received: by 10.98.0.83 with SMTP id 80mr49323855pfa.0.1468366493717;
	Tue, 12 Jul 2016 16:34:53 -0700 (PDT)
Received: from [10.43.100.29] ([50.233.148.158])
	by smtp.googlemail.com with ESMTPSA id
	ph12sm1995346pab.21.2016.07.12.16.34.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 12 Jul 2016 16:34:52 -0700 (PDT)
To: Khem Raj <raj.khem@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <57857E9B.2060607@gmail.com>
Date: Tue, 12 Jul 2016 16:34:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: musl 1.1.15 for krogoth?
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
X-List-Received-Date: Tue, 12 Jul 2016 23:34:54 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit


Khem,

would updating Krogoth musl to 1.1.15 be safe?

I already pulled in the other musl tip updates.

regards,
Armin

