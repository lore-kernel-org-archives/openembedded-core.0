Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1Sd04b-0008Ut-97
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Jun 2012 16:21:57 +0200
Received: by wgbdr1 with SMTP id dr1so868201wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Jun 2012 07:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=HJtkJNt7n2osEDSoVzGVuEVKct0Ykr1bMOtIoBirh0I=;
	b=g5lAXiRE/Rd/zFqOJd+4WrwGhG4f/ysO+J9PvEm9p8G+/fSx6EYKj65EBAwxAc587a
	1rRoGFlqThz1Mb/FkqOq6WIjk6Dju/ParvRlyXNuYDesnAMAK0QuMH23JuIRY5dyJFhd
	SwEt9B13c6U1lZOUF4BYhQPOgRVGhlpHkFSlsl/fgn/445yzMjnc+eo7165004hy1J05
	KmFl+suNKZiQxbch9pXrGp11cJJmBcauqHzkvPwaLqU9SxslOJVQVkEdAxnmJllaaVRY
	A6xeYNKo7Z7HZA+qjLnXPaEXGKyhY8+aZJWPq5/xDDVNcj6MGy69yQOnJVUNX+AktAJh
	JXMA==
Received: by 10.180.86.5 with SMTP id l5mr719556wiz.6.1339164687702;
	Fri, 08 Jun 2012 07:11:27 -0700 (PDT)
Received: from [192.168.1.36] (89.Red-83-42-2.dynamicIP.rima-tde.net.
	[83.42.2.89])
	by mx.google.com with ESMTPS id f7sm2417319wiv.2.2012.06.08.07.11.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Jun 2012 07:11:26 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <1339164325.26324.0.camel@elmorro>
Date: Fri, 8 Jun 2012 16:11:25 +0200
Message-Id: <6E24F887-F9C7-4A78-ACAE-44EFFDADA2D6@gmail.com>
References: <32D32342-6B45-4644-9909-FEB737528DCF@gmail.com>
	<1339164325.26324.0.camel@elmorro>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
Subject: Re: ERROR: ExpansionError during parsing /tool/yocto/poky/meta/recipes-kernel/linux/linux-yocto_3.2.bb: Failure expanding variable SRCPV
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
X-List-Received-Date: Fri, 08 Jun 2012 14:21:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,

On Jun 8, 2012, at 4:05 PM, Tom Zanussi wrote:

> I just posted a patch to fix this - it was a SRCREV typo.
>=20
> Building fine here now with that simple fix...

Yes, removing the stray 'l' character from the SRCREV fixed it, the =
build is progressing fine now.

Best regards,

Elvis Dowson=


