Received: from mail-pa0-f44.google.com ([209.85.220.44])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>)
	id 1UcTFN-00007n-I7; Wed, 15 May 2013 06:23:26 +0200
Received: by mail-pa0-f44.google.com with SMTP id jh10so1125565pab.3
	for <multiple recipients>; Tue, 14 May 2013 21:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:content-type:content-transfer-encoding:subject
	:message-id:date:to:mime-version:x-mailer;
	bh=Ing8Lj6VjMIaf6s9qOHAlwEH+Ad1l2XwLHBv5rAM97Q=;
	b=gWjrOMQilYdbU07HBEU5pxum5H7p79f/nRzZ0v2qeXqbLRa8/3MCGQEEHm8ELl0Sx4
	+utAMZTmLE0tlhD31Pk0n3v6PEzcw2kZshOg8dDSbfThEHG0ATaSd1wa7CQwU8DEhh0u
	a7u+UAsgo2Kq3b3jPpcoPLNteCQ4xccKhbUtv0jqv2U45PEbqcLpUaRkgtQ0RkEuN7Qd
	6N/ImC2yzj2hEhO1jkJHTatM/mG9BjLVFJMU2n1xEe4CduE7R80nLZikKN/vAWR95Qtr
	R6+EqUKKPr+ord//UqZIx0FWokSQNyhBf/pLjDKbyQ41ygMC/hT7z3sFDOW+WDNQDSHU
	uz8g==
X-Received: by 10.66.148.132 with SMTP id ts4mr38172909pab.19.1368590712544;
	Tue, 14 May 2013 21:05:12 -0700 (PDT)
Received: from vjalali-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPSA id fn2sm1096581pbc.15.2013.05.14.21.05.11
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 14 May 2013 21:05:11 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
Message-Id: <1A97FEA3-4D93-4CE8-A265-1C9CFBB66FEB@gmail.com>
Date: Tue, 14 May 2013 21:05:10 -0700
To: "openembedded-core@lists.openembedded.org oe-core layer"
	<Openembedded-core@lists.openembedded.org>, 
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
X-Mailer: Apple Mail (2.1503)
Subject: RFT: Python3
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
X-List-Received-Date: Wed, 15 May 2013 04:23:27 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi All,

Python3 (3.3.0) is now available. Please test it out on your platforms =
and report issues/successes you see, and above all feedback on patches

 the contrib tree for OE-Core is here

=
http://git.openembedded.org/openembedded-core-contrib/log/?h=3Dkraj/python=
3

I have tested it on all supported architectures in qemu and few hardware =
machines I have access to, Recipes have been around for
a long time so they have received some soak time

at minimum add=20

       python3 \
       python3-modules \
       python3-misc \

to your IMAGE_INSTALL in order to include it in images.=20

Complete set can be included by

python3-2to3            python3-audio \
python3-codecs          python3-compile \
python3-compression     python3-core \
python3-crypt           python3-ctypes \
python3-curses          python3-datetime \
python3-debugger        python3-difflib \
python3-distutils       python3-doctest \
python3-email           python3-html \
python3-idle            python3-image \
python3-io              python3-json \
python3-lang            python3-logging \
python3-mailbox         python3-man \
python3-math            python3-mime \
python3-misc            python3-modules \
python3-multiprocessing python3-netclient \
python3-netserver       python3-numbers \
python3-pickle          python3-pkgutil \
python3-pprint          python3-profile \
python3-pydoc           python3-pyvenv \
python3-re              python3-readline \
python3-shell           python3-smtpd \
python3-sqlite3         python3-sqlite3-tests \
python3-stringold       python3-subprocess \
python3-terminal        python3-tests \
python3-textutils       python3-threading \
python3-unittest        python3-unixadmin \
python3-xml \
python3-distribute \

Thanks
-Khem





