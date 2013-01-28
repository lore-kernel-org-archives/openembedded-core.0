Received: from mail-qe0-f43.google.com ([209.85.128.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kirgene@gmail.com>) id 1TzrSN-0001EJ-6y
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 17:21:16 +0100
Received: by mail-qe0-f43.google.com with SMTP id b10so898636qen.16
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Jan 2013 08:05:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:date:message-id:subject:from:to
	:content-type; bh=doY+w7ECLJMhxNjlBCRTgiWkIdL5+soO2vfqIkZ69tY=;
	b=ywJxEWQwgRfBGXXaHzcoXFvg1A6fkIR6byk2BIISnFe8ujIkWSO8jjiyN12FGwuCp3
	Ad8gLSdoI1usoV07GYU3t4pKspKHRsPPe6hScrghgci90Kjrq9RURZy/cF4ZEl2iAsKF
	UUXlcHWgUhxF7E+AZ8EaL8aYKHnvgGKsEMsXnGKm7e+vrRMUVT0WjU0VavtCA6wR1QOW
	cBp8mWwP2L2Ha7gbXwERvXkJpn/kAd29SadhcsyyhoyQ/VJA8Dx19LcAvYPUlR2X6n3i
	6VF8L8Q57/o6sIPSfSpJGBka6LuQu+eT9dxD8C+GkNUrC9ZVfvp+aEJdgozQtRYfQInw
	Cexg==
MIME-Version: 1.0
X-Received: by 10.229.178.232 with SMTP id bn40mr4001660qcb.44.1359389135821; 
	Mon, 28 Jan 2013 08:05:35 -0800 (PST)
Received: by 10.49.106.5 with HTTP; Mon, 28 Jan 2013 08:05:35 -0800 (PST)
Date: Mon, 28 Jan 2013 18:05:35 +0200
Message-ID: <CADV-EXF+r-Bj08253OJ+Dga5TfgSS7CrLQtAeaTDVc5hSxZbWg@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: openembedded-core@lists.openembedded.org
Subject: Do not build initramfs
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
X-List-Received-Date: Mon, 28 Jan 2013 16:21:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

I want to build an image ("core-image-minimal" for example) without
initramfs support.
How can I do it?

When I run "bibake core-image-minimal" I'm getting 2 image types: the
actual image with needed packages and initramfs image.


