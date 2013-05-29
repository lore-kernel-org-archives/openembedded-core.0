Return-Path: <raj.khem@gmail.com>
Received: from mail-pb0-f53.google.com (mail-pb0-f53.google.com
	[209.85.160.53])
	by mail.openembedded.org (Postfix) with ESMTP id BD7F36A459
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 18:22:21 +0000 (UTC)
Received: by mail-pb0-f53.google.com with SMTP id un4so9531769pbc.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 May 2013 11:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer;
	bh=82LyuWzaNqx1+1eRFSxniYtOnuR6IRzre04Y7klx5Cc=;
	b=EvqspTwarfOyUv75SbybeCOu3yhlNy9f3RTp0ElPafSkyydw0xdHk1AIT3Dx8hhHPN
	5xK8EB6q/EwZMtlmoVqVswnDvoUnIQExwMLM0GEoJUUY6icBTLTgb2PJ9bPpbOHe3Wbx
	bR4kN9yk3xKKHf/uFgChb1Wh7h8viLzO1ThPNmiXneV+Kxzndg4YreLsRxuNIp/IFBQQ
	AXrDOHiqormBYLNFOxA6DmdjnsFfkqox/YgFsYnZOFLeakXerxE/7oH1Lexv9FlX4IB4
	wSHte0ilAXrVUOa58hjmNI6WkHcXgkjHhxHa3hBsUHSUSsurMrsC/ZnWH57+PiBeyS6a
	99Ww==
X-Received: by 10.66.252.4 with SMTP id zo4mr4768902pac.100.1369851742714;
	Wed, 29 May 2013 11:22:22 -0700 (PDT)
Received: from ramanathan-sslvpn-nc.jnpr.net (natint3.juniper.net.
	[66.129.224.36]) by mx.google.com with ESMTPSA id
	cq1sm38247747pbc.13.2013.05.29.11.22.21 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 29 May 2013 11:22:21 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <2384925.8Ec5ojEbuK@helios>
Date: Wed, 29 May 2013 11:22:21 -0700
Message-Id: <25ADA965-1538-44CD-8DAC-EFCDBBBB4062@gmail.com>
References: <1369842682-11880-1-git-send-email-paul.eggleton@linux.intel.com>
	<CAMKF1sotc9HtmKM8ZAE1k3Z1P8qf7G44T31X4T-Zbo1PcWWS4A@mail.gmail.com>
	<2384925.8Ec5ojEbuK@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1503)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] python-smartpm: add gettext-native to DEPENDS
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
X-List-Received-Date: Wed, 29 May 2013 18:22:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


On May 29, 2013, at 10:51 AM, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:

> On Wednesday 29 May 2013 10:41:25 Khem Raj wrote:
>> On Wednesday, May 29, 2013, Paul Eggleton =
<paul.eggleton@linux.intel.com>
>> wrote:
>>> -DEPENDS =3D "python rpm"
>>> +DEPENDS =3D "python rpm gettext-native"
>>=20
>> Why not inherit gettext ?
>=20
> Because that doesn't work for python-smartpm-native - that will add =
gettext-
> minimal-native to DEPENDS which does not provide msgfmt.


Add that info to commit log please=20

>=20
> Cheers,
> Paul
>=20
> --=20
>=20
> Paul Eggleton
> Intel Open Source Technology Centre


