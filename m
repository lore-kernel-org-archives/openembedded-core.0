Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1TQHnt-00011z-La
	for openembedded-core@lists.openembedded.org;
	Mon, 22 Oct 2012 15:12:25 +0200
Received: by mail-bk0-f47.google.com with SMTP id jk7so787740bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Oct 2012 05:59:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:x-enigmail-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=vDeWkT2i/+SAXqe7mTDqmfiYZ6Hy6I/Z18enfhImeAo=;
	b=kQdIoUwHZ113gWfjkQxYVS9dkIXIACXClUThIp6+1KMOJ6YNr5HIFitz+Ff3Lp0U6S
	EYbXJg3Fb9tqmu0Zh0Xvh0JJ7fk5Lb3V926nRRzi4yt6CiQ1WTV/MJOGZhuH5omEOACT
	QLP6VkRtvgdU2Pxd9z9fvwW7vIaNbGXZK1+nLVebgc/Wahno52TIQp1n448nNvXJbAtO
	cZumpEf6XkeB6gmStks5rTq4w9O6Fs1s4jxED98/yQvmXHAjP6aKUCpxFjctc4M7FACS
	c13Sm5+U0LLv1lsdxgNie5CON+8wNznlMnijuU3hmEq/99l0aGS3zaswbkvzbz6xX9B6
	litQ==
Received: by 10.205.130.148 with SMTP id hm20mr2610004bkc.71.1350910740741;
	Mon, 22 Oct 2012 05:59:00 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPS id g8sm3531570bkv.6.2012.10.22.05.58.59
	(version=SSLv3 cipher=OTHER); Mon, 22 Oct 2012 05:58:59 -0700 (PDT)
Message-ID: <50854312.5040502@dresearch-fe.de>
Date: Mon, 22 Oct 2012 14:58:58 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121010 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.4.5
X-Gm-Message-State: ALoCoQl2MZDQDwmXkhkFdLSyA2OiQEEu4XWMGNmfm3ySLvK/KKt0VVJftqOkDOPcpdOCDmzDTC0x
Subject: Profiling binaries?
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
X-List-Received-Date: Mon, 22 Oct 2012 13:12:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Just a short question: Does oe[-core] provide a generic method to create packages containing binaries/libraries with profiling support?

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


