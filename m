Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 2FB166BA1B
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 16:00:01 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id v10so6458095pde.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Aug 2013 09:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=0NVn7UaMEVHuO10PU0nMFY5FqJ2fOjeVVU8Utg+i/EA=;
	b=jABwAXnfY+wjjtAi/01MFuHrVP+E9OaX2VoXT5LgJVN5JYcvGq3OgRXlA94XdTmu6d
	+qur/IolkIzakSRiQC8XSxIsLDoIQZS409T9Rt25F3WLXG+x2afVoNi1+nIi7AgkdIl2
	QjWeaXviDpsuszmzRfZyX/NWkvsaTmVrACTdWnphUqLS8UP/h2y9eoNC5ogMxhkEevUr
	qX4fiOfSBnsmHWX3aGtFBl9forkZrxowyl4ZXfEuf2WG2L+V+v4urvdAaO8QRmFpxb/4
	B4u/eQRldkJGCUfYY2sL7NPTUVpTrFHGXxohX5P0HxV4AjiWUKxd2Ba2+ppIQIAh9z9b
	6Rwg==
X-Received: by 10.66.150.232 with SMTP id ul8mr28163664pab.26.1377705601695;
	Wed, 28 Aug 2013 09:00:01 -0700 (PDT)
Received: from kraj-sslvpn-nc.jnpr.net (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPSA id
	xe9sm34780226pab.0.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 28 Aug 2013 09:00:00 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.5 \(1508\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <521D0495.203@windriver.com>
Date: Wed, 28 Aug 2013 09:00:03 -0700
Message-Id: <B859C8D8-4EF9-4436-9D64-41C72BCA0153@gmail.com>
References: <1377251290-4290-1-git-send-email-lpapp@kde.org>
	<521D0495.203@windriver.com>
To: Randy MacLeod <randy.macleod@windriver.com>
X-Mailer: Apple Mail (2.1508)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] u-boot: update to 2013.07
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
X-List-Received-Date: Wed, 28 Aug 2013 16:00:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On Aug 27, 2013, at 12:57 PM, Randy MacLeod =
<randy.macleod@windriver.com> wrote:

> Just curious...
> I dont' see a good reason to specify the git protocol twice:
>   git://.... and ; protocol=3Dgit

since its explicit. it does provide readability benefits which does have =
value
when newbies read the recipes.

>=20
> This occurs in many recipes and we could get rid of the clutter
> with a script if it bothers anyone else. :)
>=20
> Am I missing something or are people just copying and pasting the =
text?


