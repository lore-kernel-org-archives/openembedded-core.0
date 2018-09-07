Return-Path: <trini@konsulko.com>
Received: from mail-yw1-f65.google.com (mail-yw1-f65.google.com
	[209.85.161.65])
	by mail.openembedded.org (Postfix) with ESMTP id 856EC78AB6
	for <openembedded-core@lists.openembedded.org>;
	Fri,  7 Sep 2018 12:19:10 +0000 (UTC)
Received: by mail-yw1-f65.google.com with SMTP id j131-v6so5286199ywc.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2018 05:19:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Oh33bKkvo81YS8wzagpCXe+eWXh24XKWEcNFPZ6XrTU=;
	b=aj1oqC7nEmSQ4+T0kyucRY6OSNC814PIyGwl2JOqJCq0uaPp6038T/lPY0BVNcdrqn
	7tyOxjz/wbV8PqhmSttuhgC7AwyFU4iiZXoBXSSclz2XXFn1wHYb5mPVeSFGa2xHlIQz
	DlCqIlnycpaNCb7WxI6KbQKfpkz7+Cyczxc2Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Oh33bKkvo81YS8wzagpCXe+eWXh24XKWEcNFPZ6XrTU=;
	b=ap9knBjshPfs2BMgxw/qfIYzAclAR+V0yVToTBZ36WieR2nf1YScxSq9l7EY3Cglv1
	B6F0lH/A+vM+1PgGwclCAjcMvBQT2QEPXJ8Izd2ypkP+1VLTWfrQke6tHrAH+g4g/SsP
	MiThjsVymYv5ZTcLBJlGfN2tBxZAnWN0jrSbkF3s+b5eYOJWMH28mBjoNLICDi+//1m3
	4ftieT38kWJ5a/LmZTcm4zFGbsgiJ+uiR9RTAB6K3SThcJ7o6Rld79Ufx7KYH6rF4DBE
	B/YMEw7MGkEspaLw9iEaGcANdOKIgjaLZq3n49pD2b84tDBwdXUkUhWyzHkYUSG/6x8E
	BSyw==
X-Gm-Message-State: APzg51DQSsvTL0Zlilb1UsS9yICvVAQ7SqDQviPdBquGsuoHGCHPkhol
	TizKE/BkaXwdSROEJobDEgiV6w==
X-Google-Smtp-Source: ANB0VdZ1yjsjO0tsXg8h8n18H8+sNsopcTT6eCwB2vvW/u6ir3qimudBsrPPaOThd4nYq1l4OPck5Q==
X-Received: by 2002:a81:a097:: with SMTP id
	x145-v6mr3814349ywg.474.1536322751297; 
	Fri, 07 Sep 2018 05:19:11 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	e126-v6sm2680964ywf.72.2018.09.07.05.19.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Sep 2018 05:19:10 -0700 (PDT)
Date: Fri, 7 Sep 2018 08:19:08 -0400
From: Tom Rini <trini@konsulko.com>
To: "Lu.Jiang" <lu.jiang@windriver.com>
Message-ID: <20180907121908.GI26633@bill-the-cat>
References: <1535681710-29461-1-git-send-email-lu.jiang@windriver.com>
	<e16a6f29-9651-5b0e-7b81-e73750d0c7b7@windriver.com>
MIME-Version: 1.0
In-Reply-To: <e16a6f29-9651-5b0e-7b81-e73750d0c7b7@windriver.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [v2] [PATCH 0/7] wic:allow wic compile as an individual package
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
X-List-Received-Date: Fri, 07 Sep 2018 12:19:10 -0000
X-Groupsio-MsgNum: 116037
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="W7DEIw0fpbPWP2dV"
Content-Disposition: inline

--W7DEIw0fpbPWP2dV
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 07, 2018 at 11:02:23AM +0800, Lu.Jiang wrote:

> Hi all,
>=20
> Thanks Tom help me review this patch.
>=20
> The patch intend to bring wic into target, allow it generate new image at
> runtime.
> For example, most x86 board can boot from USB or SATA,=A0 then wic enable=
 uuid
> for partition to distinguish different device. If we use same image for a=
ll
> device, uuid will be same. It is better to generate a new image based on
> running system at runtime. Then wic is best choice.

Ah, this is an interesting problem.  But, I wouldn't involve wic in
solving "how do I take one image and get multiple unique
partition/filesystem UUIDs".  Generally this problem (since you see it
with clonezilla and other things of that nature) is to script up using
sfdisk to change the partition UUIDs, tune2fs to change the filesystem
UUIDs and correct the files that care.

--=20
Tom

--W7DEIw0fpbPWP2dV
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJbkmy8AAoJEIf59jXTHXZSSr0P/0oWPNI48wInZIjPA42ZWCF8
Yefg5MY3zLVZyG5KP/kezuNuR2bCkiGcy6A2VmC/UMRMOqCt8V/+BF3HcaN60u3X
SPmp7NhTQjQGx/UCksy1XOxf47MQOr9Pyuu4zo2TNTdYgHqRg5b+KzdoDJQiDVaR
8Qv5m7oNuXxnOVqDoH3/tolGkPJngVJM7fuoFqkPgQ1yhTTRBRlHm+Nln95kv/xw
j/nBuOiP0vWZ1/5ub57XBU+6T26E1t2pWOTsEkqWQCQge7d+6CJIWxFEmtQSinVj
SBTqNL46IW4li5yughboU4VLva6a6s7wiaYxUoU1umgvChV325OxbxYzJDBkkree
NvD/pw542BnuP9muokfa+9+JSDZZNeIMKsVC9i6L08JP1AZXMBvtFKrO6TPYNXH/
Vf/CXjPI5fjbNMeFSw1ovlTs74rbI42pZgHnqyQd2Q0l/w4FRnCNuZwI2JK/SUpB
be/Ow85BmObuuPpLg6O73m6pwdMHsA8Pt2Cs0hBkhyDSdpe4l6tVfJ3Ypq3k8rho
99/FWoEEowq1Y4jheEcU0aPxilx5tIpEOR0sYdlK3CGcY1bxB2xjY7ILB1QyAH8d
rcd9lJLA9cOERbmMXpZGiExKH5n5y/r/fwfa1wQHovs81E1cL7i9HBmlQ6P2b31B
PdOjIGL6VoPurIHFYkpL
=E7yh
-----END PGP SIGNATURE-----

--W7DEIw0fpbPWP2dV--
