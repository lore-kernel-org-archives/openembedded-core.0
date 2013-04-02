Received: from mail-pb0-f42.google.com ([209.85.160.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1UMrhj-0008Pf-Qe
	for openembedded-core@lists.openembedded.org;
	Tue, 02 Apr 2013 05:16:12 +0200
Received: by mail-pb0-f42.google.com with SMTP id up7so842571pbc.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 01 Apr 2013 19:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=sno2Fy8UDUOkRalOxvrAbY20p8/P+6mwSpMzsXIe78g=;
	b=JTAseuaWtSxcEF5OvVktSjLIMAQGorDd0JM2+73d7nDkvrFsVTHmZUEsQEhsgtHD8K
	+zzzxGln4X8wHVsmcRm5YLHHtgrLtzZWi43tMe1pR91VWLJViN6/HDTc2Eag+ASZcR53
	L8MrmsM1KiXOxNwZm9VNIK2arTh+HotF+0UB9PHJujFIAANb9/4KOzDI1xT9Su185hRz
	b5pKxZ91bz4IVh5ZUHoDYp9lPkXr3U4BWB8i8IwX/+DuMWjbpod6ns4kY1dXCi0BDBkC
	DQ3KQzQazuPkm+XXE3swezWPKv2GOLY2O/m6StlkEuz/Tr5eb1vfkji0mEYDWm3pjtbE
	o5CQ==
X-Received: by 10.66.76.170 with SMTP id l10mr22073201paw.190.1364871541879;
	Mon, 01 Apr 2013 19:59:01 -0700 (PDT)
Received: from vspringer-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36])
	by mx.google.com with ESMTPS id qh4sm276372pac.8.2013.04.01.19.58.59
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 01 Apr 2013 19:59:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <be55160b84e74f803f6dce4ba755225538a76651.1364793033.git.Qi.Chen@windriver.com>
Date: Mon, 1 Apr 2013 19:59:02 -0700
Message-Id: <24D31CC5-0333-455D-BE77-A4D0DF9E8AD7@gmail.com>
References: <cover.1364793033.git.Qi.Chen@windriver.com>
	<be55160b84e74f803f6dce4ba755225538a76651.1364793033.git.Qi.Chen@windriver.com>
To: Qi.Chen@windriver.com
X-Mailer: Apple Mail (2.1503)
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] core-image-sato.bb: increase free space size
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
X-List-Received-Date: Tue, 02 Apr 2013 03:16:12 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Apr 1, 2013, at 7:30 PM, Qi.Chen@windriver.com wrote:

> +
> +# Override IMAGE_OVERHEAD_FACTOR to increase the free space size on =
sato images.
> +IMAGE_OVERHEAD_FACTOR =3D "2.0"

what is the size of image before and after ?=


