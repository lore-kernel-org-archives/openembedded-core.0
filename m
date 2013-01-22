Received: from mail-qe0-f41.google.com ([209.85.128.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1TxeYF-0007fk-5u
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 15:10:27 +0100
Received: by mail-qe0-f41.google.com with SMTP id 7so329199qeb.14
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 05:54:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=1txCPQVwfaJQbQ2fJ+GA4pbed2fedJqOIFx0YvBP/ek=;
	b=Fp5CeYKY266GvM+/WcsZ41PU8vN8kTdHuP+PZhh4Hfu+eox7bA9qE5ci7ed0LQfAyQ
	cbTjz9XLC7VlctO3KWlSx5STQKVARC26psGK8V3Xd4Fh6KhrbP+Xk1Xd5r7sP6dVTq3g
	IwSY+RD6TmQLcQO/lA1o56VBkb2laVmDIVtt1JkW6JK/mWnT0YpH2An7L2HQSDrKCEz2
	wAurdrKQL6Gz4E63hHL00t9UzzVlfcAXg6cue2kUAiWn1AOy0qO1SgPEgHfAarWhQAbn
	GN9EspLW2Qa00OcrnKKbnv9EcMGM/R1+gIYVHSYRGyUaoB9skqmrYFw27uZTYct+VMrE
	Ykrg==
MIME-Version: 1.0
X-Received: by 10.224.101.74 with SMTP id b10mr23266934qao.0.1358862880877;
	Tue, 22 Jan 2013 05:54:40 -0800 (PST)
Received: by 10.49.106.5 with HTTP; Tue, 22 Jan 2013 05:54:40 -0800 (PST)
Date: Tue, 22 Jan 2013 15:54:40 +0200
Message-ID: <CADV-EXEe9gpnm9jNUZujd8-XJuEaHHHzW=he7uOY_USbCzMMxw@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Can't build Intel Cedartrail Linux kernel
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jan 2013 14:10:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi!

When building kernel for cedartrail, I'm getting numerous warnings:
SSE instruction set disabled, using 387 arithmetics [enabled by default]

How can I fix it?

P.S.
I'm using following revisions of meta packages:
meta              = "master:751c11e998431613389f094264f096fac5a1c1ae"
meta-cedartrail   = "master:d92dd091397b4c77000c2db152bb621a62b76cf9"

Best regards,
Yevhen


