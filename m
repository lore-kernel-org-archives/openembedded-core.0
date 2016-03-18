Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f169.google.com (mail-pf0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id C916665C5C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 18 Mar 2016 00:22:21 +0000 (UTC)
Received: by mail-pf0-f169.google.com with SMTP id u190so142197066pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 Mar 2016 17:22:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=DN/LR7l8DIqBp2wAj8iY8zyf8EUw5OU1aFldTdT3CAY=;
	b=nuV4MproDYsiG0Fv7OqA+2Nhv5nDnnnCm/HQvt2Zmn0UPY1rp045S8POAgSaTpUGdd
	A8yUu+8eNdRcYnLqOgayms4ViaRHCd0MWqM+HVmaAjFj9slIV0Von/UR+JjB+unOuacz
	Fl0ynwPLUGJMdhPtUJU4aOW4j5kvYlkQCac9KmyUSM0kg3S6EJGYHDWu0Uu0H9uK81P4
	HCtd0OWUSG5yE2qiiwINNojiguzXI+WeZ4QRcoCfgLVUCHXlULdENjgi8Yr2m3c8Y1zc
	aM9HvrSr1natUjfIz0DXB5MrMdJybzDjazbP2yT68SVIz7WyBqAglPNq0FGsVko0pGtY
	1mjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=DN/LR7l8DIqBp2wAj8iY8zyf8EUw5OU1aFldTdT3CAY=;
	b=iN9AacEpwFray+qIPVr/QbI2o6Bbdvv8Au3rCwgImdy9lkpx86OWNcNN0khY+P+Jpi
	uRFIwdGfkXpsEVqUMhT9nPSxTRLGV8FlF3NJH2aGY1Mx8n2IhszkqGBzrxGszWQAIbmW
	dZPpXRt0ib1dY3aJDMB8DkaKnd6yfaRINKx2dbX/bg32ix0jWpXO/tQi4XARMOCw+QLl
	lhY2DDLhWF2+NAvd18rxZxcjHDXWp77kebbfMnIv1oXH4uj+M4tnTnqMfwuUoofANg00
	anVDqDtvqc87yIUC56W9xqW5+C+EnzL1Nsqt+u0W/qdC6Ajru1KoF30sTAemYxx0fv4q
	07Rg==
X-Gm-Message-State: AD7BkJJOef8x1DlOl3YSBrXYoFQLf5JGC2wsFWnHG+jGERoMH7W9wmk6wdoAQfCZJAjazQ==
X-Received: by 10.66.154.233 with SMTP id vr9mr19306430pab.66.1458260542007;
	Thu, 17 Mar 2016 17:22:22 -0700 (PDT)
Received: from [192.168.0.76] (c-76-102-32-192.hsd1.ca.comcast.net.
	[76.102.32.192])
	by smtp.gmail.com with ESMTPSA id 9sm16055306pfm.10.2016.03.17.17.22.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Mar 2016 17:22:20 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.2 \(3112\))
X-Pgp-Agent: GPGMail 2.6b2
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <CAJTo0LYcCQ9f0W6gQPtemxKjzCVo55M-pS+iWatV5YsfDrq41A@mail.gmail.com>
Date: Thu, 17 Mar 2016 17:22:15 -0700
Message-Id: <1BF009E9-B718-4FE2-BBF3-83CEA93D1ABB@gmail.com>
References: <1456753354-7448-1-git-send-email-adrian.ratiu@ni.com>
	<CAJTo0LYcCQ9f0W6gQPtemxKjzCVo55M-pS+iWatV5YsfDrq41A@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.3112)
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Jacob Champion <jacob.champion@ni.com>
Subject: Re: [PATCH v1] site: enable pthread support for x86_64 APR builds
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
X-List-Received-Date: Fri, 18 Mar 2016 00:22:21 -0000
X-Groupsio-MsgNum: 79765
Content-Type: multipart/signed;
	boundary="Apple-Mail=_F19D269A-9D5C-4020-9762-4ECFDD658C62";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_F19D269A-9D5C-4020-9762-4ECFDD658C62
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_D47561A4-042B-4210-96F2-4890D8F4EECF"

--Apple-Mail=_D47561A4-042B-4210-96F2-4890D8F4EECF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8


> On Feb 29, 2016, at 5:50 AM, Burton, Ross <ross.burton@intel.com> =
wrote:
>=20
>=20
> On 29 February 2016 at 13:42, Ioan-Adrian Ratiu <adrian.ratiu@ni.com =
<mailto:adrian.ratiu@ni.com>> wrote:
>   apr_cv_process_shared_works=3Dno: several platforms already set this
>   option, which conservatively disables support for PROCESS_SHARED
>   mutexes.
>=20
> Which is interesting as building apr-native (so the site files don't =
get used) for x86-64 gives:
>=20
> apr_cv_process_shared_works=3Dyes
>=20
> Can we not go around disabling stuff when it actually does work?

No it really doesnt work. its running a configure time test on your =
build host ( which I assume is x86_64 mostly now
a days) and then deciding that process shared mutexes work, which is not =
correct.

If we think that it should work on x86_64 then lets cache the value to =
=E2=80=98yes=E2=80=99 but not leave it
at the mercy of configure.

>=20
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core


--Apple-Mail=_D47561A4-042B-4210-96F2-4890D8F4EECF
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><br class=3D""><div><blockquote type=3D"cite" class=3D""><div =
class=3D"">On Feb 29, 2016, at 5:50 AM, Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt; wrote:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div dir=3D"ltr" =
class=3D""><div class=3D"gmail_extra"><br class=3D""><div =
class=3D"gmail_quote">On 29 February 2016 at 13:42, Ioan-Adrian Ratiu =
<span dir=3D"ltr" class=3D"">&lt;<a href=3D"mailto:adrian.ratiu@ni.com" =
target=3D"_blank" class=3D"">adrian.ratiu@ni.com</a>&gt;</span> =
wrote:<br class=3D""><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px =
0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-left=
-style:solid;padding-left:1ex"><div id=3D":32t" class=3D"" =
style=3D"overflow:hidden">&nbsp; apr_cv_process_shared_works=3Dno: =
several platforms already set this<br class=3D"">
&nbsp; option, which conservatively disables support for =
PROCESS_SHARED<br class=3D"">
&nbsp; mutexes.</div></blockquote></div><br class=3D"">Which is =
interesting as building apr-native (so the site files don't get used) =
for x86-64 gives:</div><div class=3D"gmail_extra"><br =
class=3D""></div><div =
class=3D"gmail_extra">apr_cv_process_shared_works=3Dyes<br =
class=3D""></div><div class=3D"gmail_extra"><br class=3D""></div><div =
class=3D"gmail_extra">Can we not go around disabling stuff when it =
actually does work?</div></div></div></blockquote><div><br =
class=3D""></div>No it really doesnt work. its running a configure time =
test on your build host ( which I assume is x86_64 mostly =
now</div><div>a days) and then deciding that process shared mutexes =
work, which is not correct.&nbsp;</div><div><br class=3D""></div><div>If =
we think that it should work on x86_64 then lets cache the value to =
=E2=80=98yes=E2=80=99 but not leave it</div><div>at the mercy of =
configure.</div><div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div dir=3D"ltr" class=3D""><div =
class=3D"gmail_extra"><br class=3D""></div><div =
class=3D"gmail_extra">Ross</div></div>
-- <br class=3D"">_______________________________________________<br =
class=3D"">Openembedded-core mailing list<br class=3D""><a =
href=3D"mailto:Openembedded-core@lists.openembedded.org" =
class=3D"">Openembedded-core@lists.openembedded.org</a><br =
class=3D"">http://lists.openembedded.org/mailman/listinfo/openembedded-cor=
e<br class=3D""></div></blockquote></div><br class=3D""></body></html>=

--Apple-Mail=_D47561A4-042B-4210-96F2-4890D8F4EECF--

--Apple-Mail=_F19D269A-9D5C-4020-9762-4ECFDD658C62
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlbrSjsACgkQuwUzVZGdMxQ0TQCcDqKPR7w657h5cOz17COTb3Fd
pz4An1mRufpPqVOLkjGFWvIZBq4IiLLt
=q/nM
-----END PGP SIGNATURE-----

--Apple-Mail=_F19D269A-9D5C-4020-9762-4ECFDD658C62--
