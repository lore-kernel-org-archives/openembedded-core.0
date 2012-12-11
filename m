Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <niqingliang2003@gmail.com>) id 1TiLr0-0006Dw-J7
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 10:10:19 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so1412347dak.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 00:55:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id:organization:user-agent
	:mime-version:content-transfer-encoding:content-type;
	bh=InkUUy2945Fgq1cCC1lqIrfnO+hOlVSJly0C9NUsdYE=;
	b=uPfD7Yq+qnxrtTIj7bgmDo++6X7UFEqhHJgcdnAfhO+45d7gJ2CDD5f11mjRL1azlo
	ESySUeCNVi7n+WEtz/IpaIRi4E7ShnJxXJ63Zzx1zAeVWYL1XI99g4BX5D0qKY94/Go+
	vwsfIgLstSSLHkK4IsKON3zVEYqkO8CLgkRe59wf2ZKGUYjnuWKv0lMQ6Uuv6wzAuEj3
	uPF6f6mj6y9HyFAu5HBGGtGcXHN6KQXQMnoxOgX1B33sYu+Nmm61pRu8UnhDaBrGKJWx
	zwP+B1OhL6KHwhY/kUexIpkhcxa2piKgNWcCINzpJTPbNjgPRGKxslT4/YZXRDLpO3IH
	h7nw==
Received: by 10.68.223.131 with SMTP id qu3mr46414714pbc.89.1355216145885;
	Tue, 11 Dec 2012 00:55:45 -0800 (PST)
Received: from yiqingliang-pc.localnet ([117.89.76.27])
	by mx.google.com with ESMTPS id nv2sm13414189pbc.44.2012.12.11.00.55.43
	(version=SSLv3 cipher=OTHER); Tue, 11 Dec 2012 00:55:44 -0800 (PST)
From: Yi Qingliang <niqingliang2003@gmail.com>
To: openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2012 16:54:22 +0000
Message-ID: <1725092.zIXSmU5oUM@yiqingliang-pc>
Organization: Nanjing Jilong
User-Agent: KMail/4.9.3 (Linux/3.6.8-1-ARCH; KDE/4.9.3; x86_64; ; )
MIME-Version: 1.0
Subject: how to change the resolution of qemux86 machine to 320x240?
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
X-List-Received-Date: Tue, 11 Dec 2012 09:10:19 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"

Hi!

I have a s3c2442 system with 320x240 touch screen, and I want use qemux86 to 
simulate it on pc.

I googled, got "vga=xxx" in kernel arguments, but no success.
use "vga=ask" can select resolution, but no "320x240".
what's the right way?


Yi Qingliang
Nanjing Jilong


