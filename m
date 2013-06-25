Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id E99B5605F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 18:09:47 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id kp12so12989224pab.35
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Jun 2013 11:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=iHJ3O1QFmsSVth46GbjTdv8o8F4Zr3meYxDx4SlkNUk=;
	b=aXUnXxJxrD/5g6veLLo2g9UOBZXaYzxWZiQIsR09yilSgravo2Jcw5az0b+zFMAPb/
	KamY5qwCeZ8IEVa9/Ur3XTF5sf6URlT1O+ilCIM4MdhcbDApKKS1zARCIeweTZBKJOw7
	rurHtFkS83/YFMIWI7vQBo3YZNWQ8Y1AjKW+zNsEPEz2XtAY1cRUZORGeO+aGRbtk00y
	v/irPG0yE/lVLFEXrDM8uIxNK57ZChNV4tYVeCWw3qbX0+qMGb7JWwfNBn9zDDsPoHpG
	ERRPDp/9vLzh30MkYcGQN187uGrQILYLXavoiZYthLJoHZpjqOxYrbjo1bGK5OBBVN3O
	X3iw==
X-Received: by 10.68.248.100 with SMTP id yl4mr199866pbc.125.1372183789115;
	Tue, 25 Jun 2013 11:09:49 -0700 (PDT)
Received: from kosborne-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	jf4sm16464052pbb.19.2013.06.25.11.09.46 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Tue, 25 Jun 2013 11:09:47 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAP9ODKrdDSkQrT2S+oqa3y2DQLPXk26_OuUzZHsU46wJCGZ5aQ@mail.gmail.com>
Date: Tue, 25 Jun 2013 11:09:44 -0700
Message-Id: <6EC13E0C-6260-419D-9424-A93DAB286003@gmail.com>
References: <51C9CE42.8020207@linux.intel.com>
	<56275DFD-34FD-49BF-B17D-79DBB877418E@gmail.com>
	<CAP9ODKoEGMAwf-kL8HO1rH0scxAQFtbWz2bfF5=VQHGDvW=n+Q@mail.gmail.com>
	<F59505EA-0C28-444B-B818-21A015E76B58@gmail.com>
	<CAP9ODKrdDSkQrT2S+oqa3y2DQLPXk26_OuUzZHsU46wJCGZ5aQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Mailer: Apple Mail (2.1508)
Cc: Zhenhua Luo <zhenhua.luo@freescale.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Schmitt Richard-B43082 <B43082@freescale.com>,
	richard.schmitt@freescale.com
Subject: Re: GCC 4.8 Issues with fsl-ppc and fsl-arm (e5000)
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 25 Jun 2013 18:09:48 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


On Jun 25, 2013, at 11:03 AM, Otavio Salvador <otavio@ossystems.com.br> =
wrote:

> Do I need to run it using 4.8 or 4.7 should be enough?

4.8 but even 4.7 might work=

