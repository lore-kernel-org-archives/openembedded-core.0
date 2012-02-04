Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RtjIm-0006Nl-NB
	for openembedded-core@lists.linuxtogo.org;
	Sat, 04 Feb 2012 18:21:28 +0100
Received: by lbol12 with SMTP id l12so746585lbo.6
	for <openembedded-core@lists.linuxtogo.org>;
	Sat, 04 Feb 2012 09:13:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	bh=1EpNhpHZuGgEQHtNjiX+8rk+c+UHXkKhhPSh41fkN3U=;
	b=PYUXLZaUt/pF+7i1EqbB6DAyasW8M6eXAHaefmZjziWOr+IXPwPWfaWVwAyMcLS7pN
	FsAC9kgIB2PPzkqxAHnqzvGyaoL1OxiL8atbo8eIQG17yL6JSrAApa/2aB6yZnJO/MP3
	M4G9A93VErjjqW4W5Arvgb9fFp975W5PMqzMs=
Received: by 10.112.101.34 with SMTP id fd2mr3015412lbb.16.1328375605264; Sat,
	04 Feb 2012 09:13:25 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Sat, 4 Feb 2012 09:12:55 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 4 Feb 2012 09:12:55 -0800
Message-ID: <CAMKF1spO-FVweKU21EdHK-Rs5gc4qun=JRYnwMWc88SOSeQufg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.linuxtogo.org>, 
	openembeded-devel <Openembedded-devel@lists.openembedded.org>
Subject: Duplicate recipes in meta-oe
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
X-List-Received-Date: Sat, 04 Feb 2012 17:21:28 -0000
Content-Type: text/plain; charset=UTF-8

Hi

Following recipes are duplicated in meta-oe

recipes-devtools/python/python-imaging_1.1.7.bb
recipes-devtools/python/python-setuptools_0.6c11.bb
recipes-core/eglibc/ldconfig-native_2.12.1.bb
recipes-graphics/xorg-app/rgb_1.0.4.bb
recipes-extended/tzcode/tzcode-native_2011i.bb
recipes-multimedia/libmad/libmad_0.15.1b.bb
recipes-extended/cups/cups_1.4.6.bb

lets try to find the differences and consolidate them and move them to
either oe-core or meta-oe
where ever they are more suitable.

Thanks
-Khem


