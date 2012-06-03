Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sb4VL-0007Mk-DB
	for openembedded-core@lists.openembedded.org;
	Sun, 03 Jun 2012 08:41:35 +0200
Received: by werg55 with SMTP id g55so2212871wer.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 02 Jun 2012 23:31:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=rdLvivG+tcKkJhywaAtMomvzQbzYjnQcIaLsJlh12Lw=;
	b=I9g6H8XG7/b7oEyvj7FRUWaRUvxtX843hRsFSaqOu7xP07uCB4pRf9yvhzh1ikNk3/
	+rq72xXgNnvkc4l2bkQcuux5CIyD2G/PSqxcY6Mhcg0vQJ2IL7Ua+21MhOvKQJGGqDJ/
	Q4YAT/sYdKpqPaAorEMO9vnLquObU8OPiYDC2U3W5nF6iSPZGD/mp4IUK/bKkfM5s/fF
	7NpcK6XKZisoGwnRwzMnz6e2j9RuzFID6M7hbbqSUN8rRtaqh6DVIHeQaXnpsHvkRxHe
	Vw4bFJXAoetkUs0X6hYfDQxy2TwIevt2btYRb6VlJUYCa1uOcbwhBmfVLF4cmyOgE4r8
	tT/Q==
Received: by 10.216.211.19 with SMTP id v19mr7368868weo.89.1338705070616;
	Sat, 02 Jun 2012 23:31:10 -0700 (PDT)
Received: from [192.168.1.35] (197.Red-79-150-15.dynamicIP.rima-tde.net.
	[79.150.15.197])
	by mx.google.com with ESMTPS id fo7sm10282814wib.9.2012.06.02.23.31.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 02 Jun 2012 23:31:09 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <CAMKF1sowgNZZqCYgJMZv=czABU0r1J+8ELUDQQYY0THwef-QVQ@mail.gmail.com>
Date: Sun, 3 Jun 2012 08:31:07 +0200
Message-Id: <1161C4AE-EBFE-4E7E-871D-16DD313E16C7@gmail.com>
References: <56B3703F-09C3-4A9E-BF97-17DBBBE8C9AF@gmail.com>
	<A9C91AFD-F965-453F-A418-981EB6399247@gmail.com>
	<E100C99B-7213-4B02-A6FF-C9878DF57562@gmail.com>
	<CAMKF1sowgNZZqCYgJMZv=czABU0r1J+8ELUDQQYY0THwef-QVQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
Subject: Re: [meta-xilinx] How to debug the value of ${TARGET_ARCH} in meta-xilinx/classes/xilinx-boot.class
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
X-List-Received-Date: Sun, 03 Jun 2012 06:41:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Jun 3, 2012, at 2:48 AM, Khem Raj wrote:

> What's your default she I guess its not bash

I have left it as the default Dash shell, as indicated in the yocto 1.2 =
setup guidelines, for Ubuntu-12.04 LTS.

Best regards,

Elvis Dowson=


