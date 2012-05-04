Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elvis.dowson@gmail.com>) id 1SQEpa-0008Ix-O1
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 11:29:42 +0200
Received: by wibhj13 with SMTP id hj13so1047809wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 02:19:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=aNqm4nlx7Pb6NXvsSV2JofkX9peTgOVA2iNjJ3mxVNU=;
	b=w3/1WqJU1wq9Q3duTIcVmyqGVnuGnQOyei/MzK8F2pyGR35XDU9jqZ9tWmY8XJgVez
	HENKJFDc8vf+OPgXNQ43wMMgHQssGp9+EfxHNXLN1jMAnsENJTUSVnXE1EZ1Ro8GY37R
	jAHMqCQCLFI5cthBOp2mgcn4zI8ph3oNx30sildTe//RbjoQTGP1w/6f45G9qPqzeBEI
	HVU5uKJzkdFz8CNAQ2mjEeruIcMH/hHZnmrzidRFyhZU3ZSELU0dBe/E9ZDdZh50Dpht
	hsYT3MmaIKnN7MfWltGhCPu9ZXHUiklnKNeABQyTzyB7lBUwOjBXnJb0CeKOx6pXxCam
	4DiA==
Received: by 10.180.77.4 with SMTP id o4mr11093802wiw.17.1336123196202;
	Fri, 04 May 2012 02:19:56 -0700 (PDT)
Received: from [192.168.1.35] (39.Red-81-33-71.dynamicIP.rima-tde.net.
	[81.33.71.39])
	by mx.google.com with ESMTPS id o2sm13077246wiv.11.2012.05.04.02.19.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 May 2012 02:19:55 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Elvis Dowson <elvis.dowson@gmail.com>
In-Reply-To: <20120504080242.GD3163@jama.jama.net>
Date: Fri, 4 May 2012 11:19:53 +0200
Message-Id: <E4CB1C49-5AAE-4A6D-9218-83F2ED109A08@gmail.com>
References: <2FE2EDAA-66BE-4D28-AE9E-344308BF0DB3@gmail.com>
	<20120504080242.GD3163@jama.jama.net>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
Subject: Re: How to fix warning: set SYSTEMD_PACKAGES as <existing-package>-systemd
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
X-List-Received-Date: Fri, 04 May 2012 09:29:42 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi,
       I've submitted a patch to fix the warning for =
networkmanager_0.9.2.0.bb.

However, I still get the warning for lighttpd_1.4.30.bb

even after adding the following line:

SYSTEMD_PACKAGES =3D "${PN}-systemd"

or both these two lines in the recipe:

SYSTEMD_PACKAGES =3D "${PN}-systemd"
SYSTEMD_SERVICE =3D "lighttpd.service"

WARNING: =
/tool/yocto/poky/meta/recipes-extended/lighttpd/lighttpd_1.4.30.bb: it =
is recommended to set SYSTEMD_PACKAGES as <existing-package>-systemd

Best regards,

Elvis Dowson



