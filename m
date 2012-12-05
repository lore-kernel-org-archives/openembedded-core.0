Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1Tg4mm-0005me-JW
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Dec 2012 03:32:34 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so2876260pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 18:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:organization:user-agent
	:mime-version:content-transfer-encoding:content-type;
	bh=0GrouUFvw8WsDtRiIoIE2Kx3dS98oLblM/C13hDVbMM=;
	b=buBE7yJ4kxmx0qHqcFyolSw55wvQxxSmi+lJ3pZnmSi+IIhD8tLe+aA1C/PWrTADeM
	o4yoM+hMHNMWGEiheTtuiaDD9Kp+iVphPza/rYt30VzSHrzFP/98NE7ZwJm6o+d15qPk
	bekivbcmJewQMjwqyHTB1Kd2VSOwifClQX+KQD0ccvzrqzFlKIshiCcKdUB5q7PNMW4h
	xKu0mxPPZ/X0+ZAfWvzG7xXSqTSFmr4635ZtoFG4Ecu42BoH0PFhg89R2IHo2yzeHaW7
	lBzKPW8QD6w2ygg281nUXbzl1iEV5a+jwOeU5O8QKClA2uL8uKiI4xkrEoiQdT1F56jY
	b2Cg==
Received: by 10.69.1.71 with SMTP id be7mr42859356pbd.45.1354673888390;
	Tue, 04 Dec 2012 18:18:08 -0800 (PST)
Received: from yiqingliang-pc.localnet ([121.237.170.22])
	by mx.google.com with ESMTPS id j9sm1778336paw.2.2012.12.04.18.18.06
	(version=SSLv3 cipher=OTHER); Tue, 04 Dec 2012 18:18:07 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Wed, 05 Dec 2012 10:16:50 +0000
Message-ID: <1370507.95j740KEpU@yiqingliang-pc>
Organization: Nanjing Jilong
User-Agent: KMail/4.9.3 (Linux/3.6.8-1-ARCH; KDE/4.9.3; x86_64; ; )
MIME-Version: 1.0
Subject: why recompile gcc-cross/eglibc when update linux package?
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
X-List-Received-Date: Wed, 05 Dec 2012 02:32:34 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

I update the kernel from 3.6.6 to 3.6.9, and recompile it: bitbake linux

but it will recompile eglibc/gcc-cross first, so long time:( why?
the eglibc will use kernel header? if so, understand.
but what about gcc-cross?

Yi Qingliang
Nanjing Jilong


