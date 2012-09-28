Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1THiMf-0007V2-9U
	for openembedded-core@lists.openembedded.org;
	Fri, 28 Sep 2012 23:44:53 +0200
Received: by wibhj13 with SMTP id hj13so282760wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Sep 2012 14:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=uzLCKsUqujugnB0AbEpug/U+nx6OvT8DZq9edth/d3E=;
	b=YghAs6+uBCRldGqjzeyzRllxD+bVzk2qAXEbwbgk2LS1H1xeh1Am6jOSUSGQeyDXbs
	6LtYmkQMiH9/f504tMAZO3hG2PHdHOVeaMfCF1sljJ6JFJlxtnRxHkBWJdadJ/WQhw+8
	SsIY4ZAJ1BFQ0qUvzcBO6IymDW06tsH/SHmixHeE6FLXsymOez1hrs4Ubqid3YHIwRkt
	FJeDPIYEWCDpsh6F8uuEZzdrOOBJlheBxbVj9SulUv2OqsIogpUBSobrzlD0CgFPOzDg
	8S9zFiKrtpFxTLMYEbb4IHOR0dYivye7LH7uDGWbJHV0VwIccxWjmx9YwvmP22lcBLyE
	M8hA==
Received: by 10.180.33.111 with SMTP id q15mr44870wii.20.1348867919736;
	Fri, 28 Sep 2012 14:31:59 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id cu1sm1486284wib.6.2012.09.28.14.31.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 28 Sep 2012 14:31:58 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.1 \(1498\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1348867656.15753.86.camel@ted>
Date: Fri, 28 Sep 2012 23:31:57 +0200
Message-Id: <C51662CA-CCDE-4BF5-8E50-AB7BE65C1895@dominion.thruhere.net>
References: <1348866282-30437-1-git-send-email-koen@dominion.thruhere.net>
	<1348867656.15753.86.camel@ted>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Mailer: Apple Mail (2.1498)
X-Gm-Message-State: ALoCoQk2JzB9MnMJorb6QPFFlItd1023BOWBARSQNxFIzFvE2TNWEVFsU0kvrOjI70X/c4A3kOhj
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Revert "opkg svn: respect to the arch priority"
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
X-List-Received-Date: Fri, 28 Sep 2012 21:44:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 28 sep. 2012, om 23:27 heeft Richard Purdie =
<richard.purdie@linuxfoundation.org> het volgende geschreven:

> On Fri, 2012-09-28 at 23:04 +0200, Koen Kooi wrote:
>> This completely breaks installing packages from feeds:
>>=20
>> root@bone-mainline:~# opkg install libgtk-2.0
>> Installing libgtk-2.0 (2.24.8-r7.1) to root...
>> Downloading =
http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp=
-neon/base/libgtk-2.0_2.24.8-r7.1_armv7a-vfp-neon.ipk.
>> Installing pango (1.30.0-r1.1) to root...
>> Downloading =
http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp=
-neon/base/pango_1.30.0-r1.1_armv7a-vfp-neon.ipk.
>> Installing pango-module-basic-x (1.30.0-r1.1) to root...
>> Downloading =
http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp=
-neon/base/pango-module-basic-x_1.30.0-r1.1_armv7a-vfp-neon.ipk.
>> Installing pango-module-basic-fc (1.30.0-r1.1) to root...
>> Downloading =
http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp=
-neon/base/pango-module-basic-fc_1.30.0-r1.1_armv7a-vfp-neon.ipk.
>> Installing shared-mime-info (0.91-r4.9) to root...
>> Downloading =
http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp=
-neon/base/shared-mime-info_0.91-r4.9_armv7a-vfp-neon.ipk.
>> Installing gdk-pixbuf-loader-png (2.24.1-r7.1) to root...
>> Downloading =
http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp=
-neon/base/gdk-pixbuf-loader-png_2.24.1-r7.1_armv7a-vfp-neon.ipk.
>> Installing gdk-pixbuf-loader-jpeg (2.24.1-r7.1) to root...
>> Downloading =
http://eu.feeds.angstrom-distribution.org/feeds/core/ipk/eglibc/armv7a-vfp=
-neon/base/gdk-pixbuf-loader-jpeg_2.24.1-r7.1_armv7a-vfp-neon.ipk.
>> Installing libjpeg8 (8d+1.2.1-r1.1) to root...
>> Configuring pango-module-basic-x.
>> Configuring pango.
>> Configuring pango-module-basic-fc.
>> Configuring shared-mime-info.
>> Configuring hicolor-icon-theme.
>> //var/lib/opkg/info/hicolor-icon-theme.postinst: line 11: =
gtk-update-icon-cache: command not found
>> Configuring gdk-pixbuf-loader-png.
>> Collected errors:
>> * opkg_download_pkg: Package libjpeg8 is not available from any =
configured src.
>> * opkg_install_pkg: Failed to download libjpeg8. Perhaps you need to =
run 'opkg update'?
>> * opkg_install_cmd: Cannot install package libgtk-2.0.
>> * pkg_run_script: package "hicolor-icon-theme" postinst script =
returned status 127.
>> * opkg_configure: hicolor-icon-theme.postinst returned 127.
>=20
> I'm not entirely seeing the connection to this patch based on the =
above
> errors.=20
>=20
> Also did you try opkg with the new options? I'm not saying there isn't =
a
> problem but some help in figuring out how to resolve this would be =
good.

Doing the revert and installing a new (old) opkg does seem to fix the =
problems.=


