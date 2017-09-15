Return-Path: <trini@konsulko.com>
Received: from mail-yw0-f170.google.com (mail-yw0-f170.google.com
	[209.85.161.170])
	by mail.openembedded.org (Postfix) with ESMTP id 58A6F78354
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 12:16:52 +0000 (UTC)
Received: by mail-yw0-f170.google.com with SMTP id w22so1301344ywa.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Sep 2017 05:16:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=XzPGBq8dlj5vFdJZmqu9ycGeo62uqww3/dZRsN250tk=;
	b=OS3SA6J7NnWguKqrUK3cQZa+xth2wxRfvzeL7Qfq23xJkgIkoOZ5wHOWKUOlDqU97W
	/g6CJYhcMdK6MxuAX6aU8F9XYUYjPqKFs3jSJtC/R2dW03I2YWAuoNk9hsHhStcbDC4s
	RHhwysS+PQiC/kXk6NaImCZ5WAe+r1+nYuUqk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=XzPGBq8dlj5vFdJZmqu9ycGeo62uqww3/dZRsN250tk=;
	b=M3JF+ngWBsud2VJeySb2nAryWd6KhIfmeywbS57N/IKRlTe2pLPICp4BBgqrFwq4MT
	FrqlvOuzTDLwBuLS3dvmg1s6Z26Tby5mYfbQev/wfuJIzGZaa1XBj2Dnf6U9fr2uvAih
	MJ206YExzdoqTdagbwPeE9CABkFOLhvpdITRYNdvnl1fqp9sERC7QeVO8+BGNPgFpBR6
	xBfmkebRPoT8nbvyWoCKJlFG0MS2E0ZqEByMwwEDVvuBlZ83knWKckVEwacJk7axljmC
	8IDOqoWuhmclE3DOCQjvPV+tc4B9nyHit4uq8k5Or6ZXo93p5vGEEsUfrb+oSkx2pGmt
	Rpww==
X-Gm-Message-State: AHPjjUiNo7rhKpIdnJtzvJzL4A4cFQ/34xMqCahVO/TxKdRzFAn8hgG8
	VtWMVbUwKehSdpOU
X-Google-Smtp-Source: AOwi7QAP8OYXBfXzAFoIxVEOdJms3OtXmB5CjO6t4TxJHQ4jGGjRN6ON4Y9EVZEXBYDEy/rAUyWyWQ==
X-Received: by 10.37.88.5 with SMTP id m5mr6861004ybb.359.1505477813136;
	Fri, 15 Sep 2017 05:16:53 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-68.ec.res.rr.com. [65.184.142.68])
	by smtp.gmail.com with ESMTPSA id
	k189sm241576ywc.18.2017.09.15.05.16.51
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Fri, 15 Sep 2017 05:16:52 -0700 (PDT)
Date: Fri, 15 Sep 2017 08:16:20 -0400
From: Tom Rini <trini@konsulko.com>
To: Martin =?iso-8859-1?Q?Hundeb=F8ll?= <mnhu@prevas.dk>
Message-ID: <20170915121620.GR4560@bill-the-cat>
References: <1501012689-2574-1-git-send-email-trini@konsulko.com>
	<01d79bbc-39d1-b610-f199-15dc2b63c10c@prevas.dk>
MIME-Version: 1.0
In-Reply-To: <01d79bbc-39d1-b610-f199-15dc2b63c10c@prevas.dk>
User-Agent: Mutt/1.5.21 (2010-09-15)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] image: Fix "metadata is not deterministic" when chaining 2+ CONVERSION_CMDs
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
X-List-Received-Date: Fri, 15 Sep 2017 12:16:53 -0000
X-Groupsio-MsgNum: 102968
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7UIJfHqpdi+oBJdT"
Content-Disposition: inline

--7UIJfHqpdi+oBJdT
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 15, 2017 at 09:41:36AM +0200, Martin Hundeb=F8ll wrote:
>=20
>=20
> On 2017-07-25 21:58, Tom Rini wrote:
> >When we have more than one CONVERSION_CMD being used, for example
> >ext4.gz.sha256sum we will see errors about "metadata is not
> >deterministic".  This is because we do not have a stable order of
> >intermediate files that will be removed in the generated shell command.
> >We fix this by calling sorted() on the set of rm_tmp_images so that we
> >will have a stable hash again.
> >
> >Cc: Patrick Ohly <patrick.ohly@intel.com>
> >Signed-off-by: Tom Rini <trini@konsulko.com>
> >---
> >  meta/classes/image.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> >diff --git a/meta/classes/image.bbclass b/meta/classes/image.bbclass
> >index b095bca..dee17ae 100644
> >--- a/meta/classes/image.bbclass
> >+++ b/meta/classes/image.bbclass
> >@@ -474,7 +474,7 @@ python () {
> >          # Clean up after applying all conversion commands. Some of the=
m might
> >          # use the same input, therefore we cannot delete sooner withou=
t applying
> >          # some complex dependency analysis.
> >-        for image in rm_tmp_images:
> >+        for image in sorted(rm_tmp_images):
> >              cmds.append("\trm " + image)
> >          after =3D 'do_image'
> >
>=20
> This commit has resulted in more or less persistent basehash issues
> for my cpio.gz.u-boot image:
>=20
> ERROR: When reparsing /home/mnhu/projects/pil/yocto/meta-pil/recipes-file=
systems/rescue-rootfs.bb.do_image_cpio,
> the basehash value changed from ac9907bbb8ee2ee6d9ca90f7a7e265f5 to
> 8c7b717add6b1d1ba6ff761ebfdedf01. The metadata is not deterministic
> and this needs to be fixed.
>=20
> The error occurs repeatedly when doing `bitbake -c clean
> rescue-rootfs && bitbake rescue-rootfs`. Reverting the commit makes
> the error go away.
>=20
> Also, the issue only appears for cpio.gz.u-boot image types, but not
> for cpio.gz
>=20
> I am far from an expert in bitbake signature handling, so please let
> me know what to do, to debug this further.

Can you let me know what layers and machine I need to reproduce this?
I'll take a look, thanks!

--=20
Tom

--7UIJfHqpdi+oBJdT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJZu8STAAoJEIf59jXTHXZSZcMP/10UaPpTWiY6NCZVshErfR9h
HjbLBXFjQQ6dDi9ao99fqKKTImcM2yX7esJRbPvhZhMRvcuRvNs0f4d0+W6bENVh
tzK6sgmWYafUyyuf2HprIH2T7b9HGmLrEGW3fQxiadHa9xHVoUK6GHgdb3nNNJmx
imqaK4yWlIV2sghVsAd3sc+1YfYcweql5hyu8PAFjMoh6TxnobU5XXnM0QObUaPp
eT033Ko2ArucQLPiAGZ0m4OivP6zlud5BCpAhAxErB3UXmga92p4M3mxVNPDpwRe
PqBDs6bPrjTpaW03a8SFPwPCIWoN6B3y8r1yA9rsDwTc08VIpuYIlxdZZ+h6F/Oa
PlpPOU+84Go1o38j4kNnVVrN2EOsbWtzRkJNmPGgJMaxdPiGVCdxiaWdVwdLtGOH
8qzyquK2Jq5loz+wKPGzmMsjlZYjQosnL7E5rP8T8bsr6S9SelG1Ri3QXJ0gr+RW
6MrF3ARDwaqk5maQgSecSwL57mxVl48jZYc00la1xDPf/NmyBqLY+Nziz6Fweex+
n0DtXykEkOPDf6Tgk+htPhh9mBmtgqwVg5QXxzHzW4FjzjmLotaz6QeFykeSnpW1
ATO1UevAloKgj9zz0qYI/kZkEiZp0oKix5Wi0XGbDADrdeAuzeob68eQfo+i9p0L
U3/+gf9t01fsHt+vc19K
=Ij4x
-----END PGP SIGNATURE-----

--7UIJfHqpdi+oBJdT--
