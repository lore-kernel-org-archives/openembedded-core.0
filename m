Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1TLZoF-0001tO-Sj
	for openembedded-core@lists.openembedded.org;
	Tue, 09 Oct 2012 15:25:19 +0200
Received: by mail-bk0-f47.google.com with SMTP id jk7so2480285bkc.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Oct 2012 06:12:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:x-enigmail-version:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=rJLgAbiPdgDyT9jmJU1qx+mQhtjjs+jxVisDfR5RhA0=;
	b=cfTnwRAMIDvEUYbxoN0j6EEG88LvmNNw5xeYJXv9NpJb707KjW0S21mlGmZJ+RzyNi
	65VJ2V6xChC23fFDJ9m3Fdm4ta5fWM/bmA7+FjPrcM7vmHJjqSZMVRfWLiKK20lgMZwG
	Om8ugjQGX3CyUchCX92piNJx9otICUTTjEatIYuv5cBSTq7yYK6L2u5ep1Ejry3o94eW
	t32nTBiivQdwzvT7BLl0ji+RMymqcEdcF5ipq0QKhxq1KPEK95iPX5X2pUOyIHikJAux
	57v50IWJ8Cc1XV2a3aDik0z5l+x42txw+6g2RAMaNLI+T/H5s0klhQuKLjJREKUB+t2M
	H2Ng==
Received: by 10.204.148.202 with SMTP id q10mr6327521bkv.55.1349788332257;
	Tue, 09 Oct 2012 06:12:12 -0700 (PDT)
Received: from [172.29.23.6] (zk223.dresearch-fe.de. [217.92.177.116])
	by mx.google.com with ESMTPS id m19sm14704727bkm.8.2012.10.09.06.12.11
	(version=SSLv3 cipher=OTHER); Tue, 09 Oct 2012 06:12:11 -0700 (PDT)
Message-ID: <507422A9.9040505@dresearch-fe.de>
Date: Tue, 09 Oct 2012 15:12:09 +0200
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120825 Thunderbird/15.0
MIME-Version: 1.0
To: openembedded-core <openembedded-core@lists.openembedded.org>
X-Enigmail-Version: 1.4.4
X-Gm-Message-State: ALoCoQl7yYYq1jp6/bvSGrz04Mbe8h0s1F3y3mW19JJgMYINEBHV0frLDL0V48yDovxjTsGqeRn+
Subject: inc and bb vs. layers
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
X-List-Received-Date: Tue, 09 Oct 2012 13:25:20 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Given to files

  foo.inc
  foo.bb (which requires foo.inc)

in layer Foo. Now i want to write a new

  bar.bb (which requires foo.inc too)

in layer Bar. Is this possible without keeping a copy of foo.inc in Bar?

Steffen

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


