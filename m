Return-Path: <kirgene@gmail.com>
Received: from mail-qa0-f52.google.com (mail-qa0-f52.google.com
	[209.85.216.52])
	by mail.openembedded.org (Postfix) with ESMTP id 74060608CC
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 19:40:10 +0000 (UTC)
Received: by mail-qa0-f52.google.com with SMTP id bv4so543390qab.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 12:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=kqWv3h92RQTw4ZATICYSanykY47hAR9IGkBI8wWKwis=;
	b=RUwY36yLPdbKk4JZW0uREGJeGX0iIQTXesNrATlICt7kwtE+zE+i5l/tBRBkomsnLn
	n5qYTTC3ro+DQ57Uy9/X0I/uUbFr+4tS7CVCIYexzphloG/Ga31AciQqeZu4/L5KS6Me
	Aq1yeEPRtgbdxu0E/M1tPs5Q56vQidhNx2v/O0UrHjbmIsXMrFNkk3pNum7ye6NG/qR7
	W3yLY+fhiaAt+C6bNWdwZC+HYSv+jElCYn2rFDG4xiW8a8iuvU9MYwJP6QVQgVgjsq98
	96LRKMglhwFpsFmMjgRq1SqNM6Nstqf1Bn8luaLr9P806VTugHdoe+1AS6+0KjVVF20u
	kbmQ==
MIME-Version: 1.0
X-Received: by 10.49.41.6 with SMTP id b6mr36832894qel.13.1373658010217; Fri,
	12 Jul 2013 12:40:10 -0700 (PDT)
Received: by 10.49.59.3 with HTTP; Fri, 12 Jul 2013 12:40:10 -0700 (PDT)
Date: Fri, 12 Jul 2013 22:40:10 +0300
Message-ID: <CADV-EXGAXwGEseoKW+sEz1PfdNpGNKw2kyi_ugB1RH7Xw-7xdw@mail.gmail.com>
From: Yevhen Kyriukha <kirgene@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Make package from initramfs image
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
X-List-Received-Date: Fri, 12 Jul 2013 19:40:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi!

I want to build package from initramfs image for putting it into /boot
directory and have ability of its upgrade.

The problem is do_install, do_package and other functions needed to
create package are not called.
How can I make it?

Best regards,
Yevhen

