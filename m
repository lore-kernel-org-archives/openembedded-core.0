Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1T2EfG-0001tM-Bl; Fri, 17 Aug 2012 07:00:06 +0200
Received: by eekb57 with SMTP id b57so825775eek.6
	for <multiple recipients>; Thu, 16 Aug 2012 21:48:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=JhI6KXoGqqSHiy8Q1A9piiQlZIeavBePzZbY3p2Ngcs=;
	b=hBbDfCtb6riywe1KcbIg1Nu7MT1wI0usL0CN9FlxfhMACnO475ceILx4ECqEGxvbd3
	YlnbDzGrxbCbgNBsF/5ZCj+woBd7rzPUhFRzTOn8J2lz4E6IeosqcZDN5gYrzFMue8rW
	FrldlQyNRczYv2J5hAGDAkfXDAyhDGaNeKdgsxYQ9cL7eaJHDwD00ASMub2MhjNu/R24
	ebtPMzA01aYnOMhkvHRGOMnD6qJl+nMRODPFJsTRyGSU9UVhAyq30OjZYFWdibtUFsnz
	uH8YxIJuBJiZeH3V33MKs07ZoZUugZsK/9B63qH3sGQcsnkBDCOr+XMHYCcRVeJGNFtF
	2RTQ==
Received: by 10.14.5.67 with SMTP id 43mr4699819eek.15.1345178888123; Thu, 16
	Aug 2012 21:48:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Thu, 16 Aug 2012 21:47:37 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 16 Aug 2012 21:47:37 -0700
Message-ID: <CAMKF1srjqDsesRcWP7oGzouPj9aOt_Ln0aOWE9cEQwpUQ7Unuw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	yocto@yoctoproject.org
Subject: Toolchain rework, call for testing
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 17 Aug 2012 05:00:06 -0000
Content-Type: text/plain; charset=UTF-8

Hi All

Recently glibc build has been simplified upstream. It has dropped the
dependency on libgcc_s and libgcc_eh for building glibc itself.
This means that we can simplify our toolchain bootstrap a bit by
dropping 1 of the 3 cross gcc build stages. We do not need
gcc-cross-intermediate
anymore. This should bring some build time reduction and simplify the
bootstrap. I have a series of patches which I have tested
by building core-image-minimal and meta-toolchain for all supported
qemu architectures and also uclibc/eglibc both
but it needs a lot more testing therefore I am calling out wider
audience for help in testing it out.

The branch is

http://git.openembedded.org/openembedded-core-contrib/log/?h=kraj/toolchain-rework

Thanks

-Khem


