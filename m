Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f46.google.com (mail-pb0-f46.google.com
	[209.85.160.46])
	by mail.openembedded.org (Postfix) with ESMTP id A1AA36158D;
	Thu, 19 Sep 2013 21:43:08 +0000 (UTC)
Received: by mail-pb0-f46.google.com with SMTP id rq2so8881085pbb.19
	for <multiple recipients>; Thu, 19 Sep 2013 14:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=+/HFwmY5QZaA6yFTNET0VcNIU31syEQP8d9/bfEYQTw=;
	b=aTpl7dIwEiuJB0uKY9nFheGfRr/72GIBpJ4qrsF5LJ14nCN5zRe0efFAReRTlORMg3
	dygwic3xXTAUzQ8lNAHX6neDndSIAA4TzXUPOZzvEicB7A5dvL5RoVcBCUfR7BbeSFh8
	4EKKgcPzzk++fjnjIHa3YmIY6fIBIp23rt3aa9O2xaZeLxnBj0pBUbWAWyoQEfSqzz6x
	NvM+CEGwLhhBT3Kz0zFaPQXKvtsa85rBWOLLwIA3ZDvsZY/LcEhS/nv24LBCs8PsIPeQ
	dWBeEEbmaxU00lULuEY95GRt02GWgXgFC9l8togUD+srLUFuRX7i1NDTPBzzUtfIfHXT
	B6tg==
X-Received: by 10.68.172.3 with SMTP id ay3mr4222517pbc.5.1379626990519;
	Thu, 19 Sep 2013 14:43:10 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	l8sm11397912pbl.22.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 19 Sep 2013 14:43:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.6 \(1510\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20130919120202.GK7313@jama>
Date: Thu, 19 Sep 2013 14:43:11 -0700
Message-Id: <4A33DFFF-FC98-4FDF-B8D4-C03677808EDA@gmail.com>
References: <CAMKF1sonakYiB++QeeeXKVztx+7CKW3zn=ndn=kP+kSVmqu3Qw@mail.gmail.com>
	<20130919120202.GK7313@jama>
To: Martin Jansa <martin.jansa@gmail.com>
X-Mailer: Apple Mail (2.1510)
Cc: openembeded-devel <Openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: patchwork updated
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
X-List-Received-Date: Thu, 19 Sep 2013 21:43:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Sep 19, 2013, at 5:02 AM, Martin Jansa <martin.jansa@gmail.com> =
wrote:

> On Sun, Sep 15, 2013 at 12:32:44AM -0700, Khem Raj wrote:
>> Hi All,
>>=20
>> The patchwork has been updated to latest. Please keep an eye if you
>> see something non working let me know immediately.
>=20
> Hi,
>=20
> something is wrong,
>=20
> http://patchwork.openembedded.org/user/bundles/
>=20
> returns 502 Bad Gateway for me and I cannot access individual bundles,
> which is very bad, because all oe-devel patches are separated into
> bundles based on layer.

Hmm, I saw that we use python 2.6 on the server and pw has been using =
few of python 2.7
features and modules. I have requested Tom to look into upgrading the =
server from 10.04 -> 12.04
meanwhile I will see if I can reproduce it and see whats going on.

>=20
> Regards,
>=20
> --=20
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


