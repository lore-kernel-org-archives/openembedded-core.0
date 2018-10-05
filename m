Return-Path: <ferlandm@amotus.ca>
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com
	[209.85.221.176])
	by mail.openembedded.org (Postfix) with ESMTP id A327A79A55
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Oct 2018 14:49:03 +0000 (UTC)
Received: by mail-vk1-f176.google.com with SMTP id b2-v6so3040377vkd.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2018 07:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=amotus-ca.20150623.gappssmtp.com; s=20150623;
	h=mime-version:from:date:message-id:subject:to;
	bh=Ub1yMr/0kLZLYhny+UGgmLHuGtbCvxHTIpsC24/lZIo=;
	b=i7GZHy+ynW18e8tRv+7QpeSeGfEfANg/+GBsXVc/qqQAXwheGiW18z3cHrLAbosA9f
	a2GE2zBUGY62UNUpzlTIkfQNjzooWc6LazoaVp7hnIEsQKdLyXU4OVXqiVmJEZgQ3CcX
	Xs7PXdTPYCOCyeaptdRduOfDvRkz0qXxAUYPZhgf4POXcxQEL/8JVofgK7Ehyzm1POUY
	r4BjriG0SC0PeNlmTHBz8H1qF3zXmbOmcMMwHzWubk1h/6gUkgfey3YeOl9oCT+jR+21
	m3x7Td2ObQ05ZzZyaJSmg3t0kJiNK8fQpm6GGwt46VPujRIXdEHAmBSnqzxwzEIk8s0A
	CquQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=Ub1yMr/0kLZLYhny+UGgmLHuGtbCvxHTIpsC24/lZIo=;
	b=YRu5rIl6bjkQdmeJfqW1pPpMYXX9C/gokOjimX8g3AhN+K9Ye9nnif9d5fc3FL9D9N
	3ZHGmz9mC08BGHP9l4QNS5Yp2C5BH8U9olH5SijTb8x29xM4C6nZwuHgvXxmapBmE11I
	Y3/j/9pnBhXKsWiLUBab3o9klnrV+urfzf34QTIF5StV0mjLe62cr2P8SfT43+GAQVlm
	9KKVOZGPaCXIw8xQ+TCu2GaoHRIbLPjYnGMcbOWT2flXcrdV5/Crf6XWn46hWW+b5Jta
	tPSHVLPQDr+vuSwNdwz0DSWgM+5u/ETlQOoURiXiEceWp9wDY3/sD4E4JUGlLSSP2I3R
	7A8g==
X-Gm-Message-State: ABuFfohsn7OOO6pcUqz1TtEGdoVPg1GZy0gmYfGBCdUdj+BkRHs+MbhU
	ZLT5SCvdiv6FrB9OUAWK4K+gqSgSQd0=
X-Google-Smtp-Source: ACcGV62+R0XgM+Fd9cnFOUdUMOCtgKvRIQRf1bloJQiK3nc77ntDKoLTVmwOTdpIlSpA0/DLTorBpw==
X-Received: by 2002:a1f:8907:: with SMTP id l7-v6mr4462884vkd.60.1538750944327;
	Fri, 05 Oct 2018 07:49:04 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com.
	[209.85.217.48]) by smtp.gmail.com with ESMTPSA id
	v85-v6sm1079359vkd.18.2018.10.05.07.49.03
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 05 Oct 2018 07:49:03 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id e206so7638019vsd.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Oct 2018 07:49:03 -0700 (PDT)
X-Received: by 2002:a67:384:: with SMTP id
	126-v6mr3995303vsd.132.1538750943656; 
	Fri, 05 Oct 2018 07:49:03 -0700 (PDT)
MIME-Version: 1.0
From: Marc Ferland <ferlandm@amotus.ca>
Date: Fri, 5 Oct 2018 10:48:52 -0400
X-Gmail-Original-Message-ID: <CAMRMzCDLn8_0sh+PqoC=FnpspLm4o3gx=UULsRZiExOL7_YhMQ@mail.gmail.com>
Message-ID: <CAMRMzCDLn8_0sh+PqoC=FnpspLm4o3gx=UULsRZiExOL7_YhMQ@mail.gmail.com>
To: OE-core <openembedded-core@lists.openembedded.org>
Subject: Python3 and HTTPS issue
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
X-List-Received-Date: Fri, 05 Oct 2018 14:49:03 -0000
Content-Type: text/plain; charset="UTF-8"

Hi everyone,

I'm currently having a strange issue with python3 and https (using
sumo branch, commit 161eaa28ed16f93d57f3d1c4be84f894e99ab72e). Whenever
I try to connect to an https server I get:

ssl.SSLError: [SSL: CERTIFICATE_VERIFY_FAILED] certificate verify
failed (_ssl.c:719)

The following python script reproduces the issue:

>>> import http.client
>>> conn = http.client.HTTPSConnection('www.python.org')
>>> conn.request('GET', '/')

Any idea? python3-certifi is correctly installed.

Marc

