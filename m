Return-Path: <raj.khem@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id 9B170768B5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 17:22:21 +0000 (UTC)
Received: by pdrg1 with SMTP id g1so73681626pdr.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 10:22:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=hsJTxfNnNWXTpMfXVPKtNqGVIn87n2+Q/d7mNx+CNXA=;
	b=N/k1ImtognVNccrwO+tie3QhwVcyKu3kIzL2iV0rhExkTNlQO2BHkwM4dyptzfOu46
	BFk0g3lMA8BdDB2vcS5omCrJFo7EXQquDpYvLg8Gz1fhDcwUortF4hV2/d8e9BklOQhZ
	zyNi3c+AvCSZpxSSCASCH7HcnYvsal0j+8jxjvwyef1EGvKODM4UV6gcba00pZ7/iERW
	IacGqIobR6bCrtoimJRorefHQ4wPE5LsV5yDldYMlrius9cc58K4afDMUpZ/V2TwnETn
	1xh6WvBtt1SokUMf5OEW/j8GvQNLl0huzNmN+GOzr7yD9v3QinjRv384P9umO25YycwO
	Ij8A==
X-Received: by 10.70.98.163 with SMTP id ej3mr38875320pdb.61.1439227341123;
	Mon, 10 Aug 2015 10:22:21 -0700 (PDT)
Received: from ?IPv6:2601:647:4c02:370d:a5ef:b853:ba79:d0ee?
	([2601:647:4c02:370d:a5ef:b853:ba79:d0ee])
	by smtp.gmail.com with ESMTPSA id
	tg5sm13910034pab.1.2015.08.10.10.22.19
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 10 Aug 2015 10:22:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.2 \(2104\))
X-Pgp-Agent: GPGMail 2.5
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0Lb=YHJ5LQs0LbUWkWom5Trey9T-yXazDy-meUQX2Jn7YA@mail.gmail.com>
Date: Mon, 10 Aug 2015 10:22:15 -0700
Message-Id: <6113A0F4-13FC-4950-8657-6E35DB17F4B1@gmail.com>
References: <1438978727-2172-1-git-send-email-raj.khem@gmail.com>
	<1438978727-2172-2-git-send-email-raj.khem@gmail.com>
	<CAJTo0Lb=YHJ5LQs0LbUWkWom5Trey9T-yXazDy-meUQX2Jn7YA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.2104)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gnu-config: Update git version to latest and use it
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
X-List-Received-Date: Mon, 10 Aug 2015 17:22:21 -0000
X-Groupsio-MsgNum: 69238
Content-Type: multipart/signed;
	boundary="Apple-Mail=_E0E8C637-8D36-46E0-BBFF-5136126B4FCE";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_E0E8C637-8D36-46E0-BBFF-5136126B4FCE
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_09AD0397-296F-4F7F-9467-ECB42FDAF2C3"

--Apple-Mail=_09AD0397-296F-4F7F-9467-ECB42FDAF2C3
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 10, 2015, at 9:22 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 7 August 2015 at 21:18, Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>> wrote:
> its GPLv3 with autoconf exception but the GPLv2 copy of recipe
> is left in as well to not break non-GPLv3 builds
>=20
> As the files in this are only used to configure the build, could it be =
whitelisted to allow it to be used in a no-GPLv3 build?
>=20

it could be. Remember its GPLv3 with autoconf exception but still its a =
new license for folks to use

> Ross


--Apple-Mail=_09AD0397-296F-4F7F-9467-ECB42FDAF2C3
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Aug 10, 2015, at 9:22 AM, Burton, Ross &lt;<a href="mailto:ross.burton@intel.com" class="">ross.burton@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class=""><div dir="ltr" class=""><div class="gmail_extra"><br class=""><div class="gmail_quote">On 7 August 2015 at 21:18, Khem Raj <span dir="ltr" class="">&lt;<a href="mailto:raj.khem@gmail.com" target="_blank" class="">raj.khem@gmail.com</a>&gt;</span> wrote:<br class=""><blockquote class="gmail_quote" style="margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=":1zz" class="a3s" style="overflow:hidden">its GPLv3 with autoconf exception but the GPLv2 copy of recipe<br class="">
is left in as well to not break non-GPLv3 builds</div></blockquote></div><br class="">As the files in this are only used to configure the build, could it be whitelisted to allow it to be used in a no-GPLv3 build?</div><div class="gmail_extra"><br class=""></div></div></div></blockquote><div><br class=""></div><div>it could be. Remember its GPLv3 with autoconf exception but still its a new license for folks to use</div><br class=""><blockquote type="cite" class=""><div class=""><div dir="ltr" class=""><div class="gmail_extra">Ross</div></div>
</div></blockquote></div><br class=""></body></html>

--Apple-Mail=_09AD0397-296F-4F7F-9467-ECB42FDAF2C3--

--Apple-Mail=_E0E8C637-8D36-46E0-BBFF-5136126B4FCE
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlXI3csACgkQuwUzVZGdMxTi2wCfVoYrKVrTfOoSTV2AoxeCT8mJ
W7QAoIEQa31YHbNqW7Nco8NdxxmhvGr4
=hBTu
-----END PGP SIGNATURE-----

--Apple-Mail=_E0E8C637-8D36-46E0-BBFF-5136126B4FCE--
