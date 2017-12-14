Return-Path: <trini@konsulko.com>
Received: from mail-qk0-f175.google.com (mail-qk0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id C67957872E
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Dec 2017 01:22:59 +0000 (UTC)
Received: by mail-qk0-f175.google.com with SMTP id z203so4425901qkb.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Dec 2017 17:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=KyQHUrF2U4ZvnZea+IdS9kOjfsirghhKsuUEBS0fMQk=;
	b=FR5TG7VHvHdcYvGJrB07OJdsCHxtM0p4Ii+dhIKykEiYeefMhV5mjBT4KaWN6Ig/KG
	Oga7hayRcOnos/gVtQgdyRDD8Eea/EvyVFbBfslaHFElY9+B3cl2E1AJnqRrToNb01Hf
	r+vvsYhy72yHgVWAjTBpuaqCZLstHchaX43BY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=KyQHUrF2U4ZvnZea+IdS9kOjfsirghhKsuUEBS0fMQk=;
	b=q7rlXGzaarcjnLSSMOE1JSjNZQNqI8A/iL9S+5VpAWh11SLVs7+oQtv37tVkKK33tC
	eWcowF2UyMZwFnV7eSExhEeggnoyYeQc4Itvty1xjuQC6ZM2/c0OxpQ+wAl2twaTkTei
	/j1DVJntHzkWxgK2E1ByExVi2nIN6XSncvUNoCJPIbubRDTm1JMbXjj8GxnU5DoFT6AR
	9OHu4ZbvTtGdvlDuChKzE2V/g6cX5oKIqJiZ+MSPNauu95ZQfgYwqZEekjJ6sbzQoy1/
	n1zRKgvkDL4FLBwCYtUEtcgBmT6CVzkMdTWSgroiCVca/ClBCLNKIJ7KDXmgNbJ9nyGm
	ygeQ==
X-Gm-Message-State: AKGB3mK1asf0G9XoygDxbhTtPMQxvjmXbR+Ji+lXmlR21v6YE5Fmu9BC
	W2rxr6+DxM9UOyIDH7a8HzwBEA==
X-Google-Smtp-Source: ACJfBovgcesPz+oVfOqwoe5E8f7R/jMlMh2u0IqD4QDuCfXOFrdr27ohw377AfFWxbxzEicuVYi/6Q==
X-Received: by 10.55.98.6 with SMTP id w6mr14190068qkb.322.1513214579905;
	Wed, 13 Dec 2017 17:22:59 -0800 (PST)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	p202sm1878023qke.78.2017.12.13.17.22.59
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 13 Dec 2017 17:22:59 -0800 (PST)
Date: Wed, 13 Dec 2017 20:22:57 -0500
From: Tom Rini <trini@konsulko.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20171214012257.GG372@bill-the-cat>
References: <1510934900-22044-1-git-send-email-trini@konsulko.com>
	<1510934900-22044-5-git-send-email-trini@konsulko.com>
	<CAJTo0LbsO5iYxo5W9GRn-CMNpY+oyky9emUO69RTRvo6-D8ATg@mail.gmail.com>
	<20171124153611.GD3587@bill-the-cat>
	<20171128155527.GH3587@bill-the-cat>
	<CAJTo0LaOB_=4EPi=k+HCf=sqYAfrw+5J_cqQ-MFmTtC24EZtRA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaOB_=4EPi=k+HCf=sqYAfrw+5J_cqQ-MFmTtC24EZtRA@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 4/4] meta-selftest: wic: Add test for --use-uuid / --fsuuid
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
X-List-Received-Date: Thu, 14 Dec 2017 01:23:00 -0000
X-Groupsio-MsgNum: 106227
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="oFMCfUPuRwe/HdF5"
Content-Disposition: inline

--oFMCfUPuRwe/HdF5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 13, 2017 at 02:40:34PM +0000, Burton, Ross wrote:

> I finally made it break locally, with MACHINE=3Dqemux86 and using sysvinit
> instead of systemd.  Basically, a pristine poky local.conf.  I've not dug
> into it beyond that, or why it passes with systemd.

OK, thanks!  I'll see if I can reproduce locally.

--=20
Tom

--oFMCfUPuRwe/HdF5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJaMdJwAAoJEIf59jXTHXZSuK8P/0ToQFm7mu9uwWEL0Ogk1ugI
mJM3+TTajRwK7xYaY7pZ2slesgYHsPQaHrhLTeci1eJVYYCDKdngwCf4XYwOgdn0
ylHvAWLl0DW3udd2YqgklJ6KHYrQH7frBH+zuOseVgZJcH5/rUfTJgDuJUcGMOkE
DKz3b4a+X6nHS5Ak393v1vEDKDYjYeTXBS5s88rEIaAkIMSn7Nd7vBmpzjFr8TRN
0/bg4Lu7BuXcBm0QyynTIXQsK28JA2I5Ht7dra0tXSyd29FzfaGnjBp6sddsmROS
gYUJ27rvmqaUx9Zfh6khwjj9UBLLyW6IQTIlkCgGVusC/jSG5h3if9aJcfHe7Nti
SRCvF1NKVi5Lu2e6v2L5Gi9zcXiSu/qIXUrrsfI5sS7GzUe0/5rK8g42xtuHkW39
0HCIgDwGtY1iELtNpKhAFfvrKuFBOkIsjmUmFbqglsuffNXh76cO8o4yLKd5k70E
45OOkOvVQ+6zwM9h7TtNWF4BmR+C/qotzgkW9RD0DCKQ+2Dd+y3oy96owsJaufLA
O4Ao8omUIMVpms6pv+oDYUaSCnm661kY/RTcbO6aow7bjrMx2ABN9fr4qXdNgHCE
EKu+VhvHuOsIUUaXlcT32TblKPLuOPRQZlKCSS+kiWkOZX1bNHniWdcJPbiGau0v
85bZRjjx9ZDQ8pjT7N6B
=3rOj
-----END PGP SIGNATURE-----

--oFMCfUPuRwe/HdF5--
