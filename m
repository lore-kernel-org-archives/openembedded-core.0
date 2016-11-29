Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id E34D6719F2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 17:33:28 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e9so16948401pgc.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 09:33:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=OfN97v4UgL/Z/gOjh1iNaV+lAU7EJfTXKpBoBxCMp0Q=;
	b=p5d5cq0oWxKQ1K7YoKiSX21SwKlf2oYhkM2nDtaoLuyGG5N+vsgMb8okEVJOXcRoin
	H1quIaHenOz2SB+kNthFxwcX97LXgLZ6mCVHFtlDPvl9ORATQSFYGEGYyMIdo6m5Kh3M
	tTDOvecL9FEYC+vA7I4QGeZ8sEbh8XghB+dYPLsGqhmCY+1Sj3UwKlhrFWO6cdoIlPqJ
	sPMIxipGtxFENuFkQn3y8tadSXRUN69oQbC/Zpf/YpqUuNHT+M4fux01muUlkiE3BwmF
	7pLQgoKouQILOSrG75ZdjbesckJ1bsZ2TJEVL2/SMh7Ab3s0IBH15+JYWUNpacew6cy1
	SDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=OfN97v4UgL/Z/gOjh1iNaV+lAU7EJfTXKpBoBxCMp0Q=;
	b=FXZmMFwJDfxkHcDI48yWRtU+PfKFvw7PPwMDeQTRl9Vs1PRbd5SWwC635u//U8i+Fi
	OZ+gqLvmAvBevn2b73Ck93TqSNKVhghP+gzkeSSDOIEvJXQPkz+F6m9gCC/nzsiYjtrB
	k0+DMxoUq0Jq0x7xhvL0ia01xp/nY6369mlJexKx1aR3wWhjNi1DYKyF9N9m/lIYFmzU
	/KlXJ9lAOzWHHk9GAn99fN17gXWmjc5IzXyhRsYQNiqMWMYlHP1E1CX+dvXvqNKCwuVc
	BQf9cCcAQlsaa6PAk2k7QHgG/h171HhUG0/ZJ3wtvXam2IvY2YeGH8egra3CuxwlVRd1
	gJxg==
X-Gm-Message-State: AKaTC02DSXTLHOnxQjh81pWkmdjzU2XwaypPyzxSHAb75zfdE/K1QM6mc6QQoxdxiqn4zA==
X-Received: by 10.98.15.206 with SMTP id 75mr29019947pfp.105.1480440809836;
	Tue, 29 Nov 2016 09:33:29 -0800 (PST)
Received: from ?IPv6:2601:646:8882:b8c:a19b:b7db:ed72:12bc?
	([2601:646:8882:b8c:a19b:b7db:ed72:12bc])
	by smtp.gmail.com with ESMTPSA id
	p67sm82310104pfb.2.2016.11.29.09.33.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 29 Nov 2016 09:33:29 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 10.1 \(3251\))
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1480047434-20600-1-git-send-email-mark.asselstine@windriver.com>
Date: Tue, 29 Nov 2016 09:33:28 -0800
Message-Id: <BDB3BFFB-884E-49C8-AB7D-14473F96BE80@gmail.com>
References: <1480047434-20600-1-git-send-email-mark.asselstine@windriver.com>
To: Mark Asselstine <mark.asselstine@windriver.com>
X-Mailer: Apple Mail (2.3251)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd.bbclass: don't block on service restart
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
X-List-Received-Date: Tue, 29 Nov 2016 17:33:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> On Nov 24, 2016, at 8:17 PM, Mark Asselstine =
<mark.asselstine@windriver.com> wrote:
>=20
> The current class works fine when a recipe uses SYSTEMD_AUTO_ENABLE
> 'enable' and has no on device pkg_postinst(), ie when the postinst is
> run as part of rootfs creation.  However, when there is a component of
> pkg_postinst() that is run on device the 'systemctl restart' is run as
> part of the run_postinsts.service at boot. This results in the boot
> spinning indefinitely with:
>=20
> [ *** ] A start job is running for Run pending postinsts (7s / no =
limit)

yeah usually it would be nice if there was some sort of timeout on =
failed
restarts

>=20
> The issue could potentially be that the packages service has an
> 'After' clause which comes later in the boot, beyond
> run_postinsts.service, creating a chicken before the egg
> scenario. Even service files without an 'After' clause cause this
> situation however. Despite this not being the cause of the issue this
> fix will prevent this scenario from happenning.
>=20
> Using strace we are able to find that during boot, when
> run_postinsts.service is running attempting to start or restart any
> service will result in the call get stuck on poll(). Since the
> run_postinsts.service does not monitor the outcome of the call to
> restart we can work around this by using '--no-block'.
>=20
> Signed-off-by: Mark Asselstine <mark.asselstine@windriver.com>
> ---
> meta/classes/systemd.bbclass | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/meta/classes/systemd.bbclass =
b/meta/classes/systemd.bbclass
> index 7e51ed6..99a08a0 100644
> --- a/meta/classes/systemd.bbclass
> +++ b/meta/classes/systemd.bbclass
> @@ -36,7 +36,7 @@ if type systemctl >/dev/null 2>/dev/null; then
> 	systemctl $OPTS ${SYSTEMD_AUTO_ENABLE} ${SYSTEMD_SERVICE}
>=20
> 	if [ -z "$D" -a "${SYSTEMD_AUTO_ENABLE}" =3D "enable" ]; then
> -		systemctl restart ${SYSTEMD_SERVICE}
> +		systemctl --no-block restart ${SYSTEMD_SERVICE}
> 	fi
> fi
> }
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


