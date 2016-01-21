Return-Path: <raj.khem@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id D09B76E687;
	Thu, 21 Jan 2016 20:38:59 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id cy9so28773237pac.0;
	Thu, 21 Jan 2016 12:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:content-type:subject:date:message-id:to:mime-version;
	bh=dU3HMJPHKQWqZEpFv2Ee7yEFIaKrU+nbwnOCDwdFoBI=;
	b=XmhP6Zkn9mIjRUlcymyieuMU61TZIzTokrJaqbolgtHNy3sWvm6gid0bOtHLveS0ny
	QKf7KVftWTstiPqYLP6ESNl0lcYqx0v+G/NEQS+u+vJdst8S5OIV2hW0hr58ZdbfMVGm
	A7j5gEolWSjoKLzhpa4pQI6Om6CH4rbjhvuYpISmoy5aGqKHASZ2p4u1s9D3a5Nr4QMX
	/jtkHmUJ+EsKnW/WqzuAVGFTHH16+p0pIKrYS730u889Dfkmal40RmkQp8It5e1ZuCX3
	nQ1IEgcreh9MnOC3Gh6QCPGCdiI0rR822GsHTAbHTooMD12+/OAId5Xb2+G532jfvQk1
	ZG7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:content-type:subject:date:message-id:to
	:mime-version;
	bh=dU3HMJPHKQWqZEpFv2Ee7yEFIaKrU+nbwnOCDwdFoBI=;
	b=PkZbHt3oMujZhUbOJawA4sRL3bXrBGIBXDp3uCTWfkdrSsakE9S3qWEdKPDaojf07V
	aGqEJce2tWVa4595SX4aCN2S/XD/ZlSyt4S1zABlBtRL1kIHcdS+4gB2dcEWwgqrHw8Q
	AQoYLWgZ3Yl6MK7YK/qwsMZpwrhDvc50V5EGWC5pfMds5qFQzB86EhsqjWbF0zUrzPtt
	CK7PRz4yZ5ZPUKdWwDiY3fkfALCkRvRB5j97WuxWdmi0+9DIHr/id8ye1v1y1CKhHSx2
	CDpOGLiA0ns80MTacQOL8V1/FWyeKNlW+y3b/3c4zEOE6vYqWWfrv0MzMmhsHyQhDNqP
	JifA==
X-Gm-Message-State: ALoCoQk55/j/46EZ9msKAGe8NsQ/93EzGKBBy16L5O8iJ63pNWOTEdOE+up83bUaE1mXxlFLEmpKPV9U2hPHfgx4vuu/yBLuSQ==
X-Received: by 10.66.65.203 with SMTP id z11mr63713905pas.152.1453408740134;
	Thu, 21 Jan 2016 12:39:00 -0800 (PST)
Received: from ?IPv6:2601:646:8802:5d5c:153d:39b8:c78:68fa?
	([2601:646:8802:5d5c:153d:39b8:c78:68fa])
	by smtp.gmail.com with ESMTPSA id
	r15sm4546296pfr.59.2016.01.21.12.38.58
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 21 Jan 2016 12:38:59 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Pgp-Agent: GPGMail 2.6b2
Date: Thu, 21 Jan 2016 12:38:53 -0800
Message-Id: <27913D31-C426-4F79-B305-92401B7860E0@gmail.com>
To: OE Core mailing list <openembedded-core@lists.openembedded.org>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>,
	Yocto Project <yocto@yoctoproject.org>
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Mailer: Apple Mail (2.3112)
Subject: meta-openwrt layer is available
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
X-List-Received-Date: Thu, 21 Jan 2016 20:39:01 -0000
X-Groupsio-MsgNum: 76641
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5BD983AD-0EF1-478D-87E4-49C631F35CB3";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_5BD983AD-0EF1-478D-87E4-49C631F35CB3
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=us-ascii

Hi all

A new layer for openwrt packages is available

https://github.com/kraj/meta-openwrt

This is aimed at providing OE metadata for packages which are unique to
openwrt. Currently it does not contain recipes for all possible packages
but if you have one or are housing them in different layers please feel free
to move them to this layer

The layer index URI is

http://layers.openembedded.org/layerindex/branch/master/layer/meta-openwrt/

Thanks
-Khem


--Apple-Mail=_5BD983AD-0EF1-478D-87E4-49C631F35CB3
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlahQeEACgkQuwUzVZGdMxRleQCcDhfw+GyEROtC+hK6UZi5Gx3Z
KaQAnjiQv2heI9oOoiBLiRn4H1rYfSBk
=0Gq+
-----END PGP SIGNATURE-----

--Apple-Mail=_5BD983AD-0EF1-478D-87E4-49C631F35CB3--
