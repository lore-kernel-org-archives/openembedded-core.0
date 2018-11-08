Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 852037BB8D
	for <openembedded-core@lists.openembedded.org>;
	Thu,  8 Nov 2018 16:20:15 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id z16-v6so21896826wrv.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 08 Nov 2018 08:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=ujNe+duhzDFfN9iyML2EW3lq2jC7u1xcG82guBzboP8=;
	b=PC6HPOI8ns+0C+nrvInXRz3by7OMsOxOGU+ldouexKY9U7LWNAN91YVhqLEXVOQ+vK
	+AhN4FTE+9RvJ+/4ywlX42rBV6Cr8xgy44oDdll0UjfIbcSKVlMFCkRzF3VKkVPD44m1
	7gBnPBaDeafeSQOA47gY4SlQU64ZH5yEku8T5FN1sAvv+Mr7wU2FYYEiidSCPNQrtnqe
	1KhbI+Ons2la4Kngrr7XMyzfr1omY2IAowrYxpEar/fOScFgnqNFTlzy/zhqy1hX6xp1
	VpJVyRwW98cUPjTmA4hOvjHtjo6Dgh+CqamQ65xw4TYIv17i0BCPBNtgCiBm1Mp3HbVj
	DpmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=ujNe+duhzDFfN9iyML2EW3lq2jC7u1xcG82guBzboP8=;
	b=rl2rExot3izDylngBi/xK+Sb787aBlDj63z2fAyBq17K2eruR/J8cKG/AY/tUtA2ud
	++4kFQgdzgR/TeXs0Gw1OLYj3N2zoEVKhsIiFI8uCarxl4MWfnxQxA+HEsc68ppixKm6
	5yOUUSuV4no1UEB9c6IL6/AVVMWIX1GmtzBVaRUB9uXAKFaJi3QZ2Um7miOI7W6Aa0s2
	qUqzJSBhPHXAodS7v2H47gbfhE2eyb9ZoC/rb9QhrTPaybMD5skukSfyHezQKhr4yb/3
	mt4XSj9+WHYpeg43fLICmB25Xhvql9rptTT4mtsDgkwX+NBAfeplLSj58ghkuAGvy0MG
	/vYg==
X-Gm-Message-State: AGRZ1gIwhZQt1WolxRwknidDIUkhTKZ2YHE9c/ObNBl7r/f9KwtkGc0y
	mdFBfdYLIhdhwYeSy1+iMqY=
X-Google-Smtp-Source: AJdET5fbuh8TvJY4VbvEVXsm+l5CuoJ6HFNhl9SNhgBLoYSzhFol2Wl0wulyDLl6Y3RCHeJXRBwyOA==
X-Received: by 2002:a5d:650c:: with SMTP id
	x12-v6mr4915427wru.150.1541694016122; 
	Thu, 08 Nov 2018 08:20:16 -0800 (PST)
Received: from ernie.muppets.liwing.de (b2b-78-94-80-58.unitymedia.biz.
	[78.94.80.58]) by smtp.gmail.com with ESMTPSA id
	o9-v6sm4869689wra.42.2018.11.08.08.20.15
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 08 Nov 2018 08:20:15 -0800 (PST)
From: Jens Rehsack <rehsack@gmail.com>
Message-Id: <E4DDD7D7-F019-4394-9D1F-5928D4B4D5E0@gmail.com>
Mime-Version: 1.0 (Mac OS X Mail 11.5 \(3445.9.1\))
Date: Thu, 8 Nov 2018 17:20:13 +0100
In-Reply-To: <CAJTo0LY1=XkrjSPBJKeDu_y8bo5fZYsfZChHpSsHwyHnV5mCvw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181106122429.24563-1-ross.burton@intel.com>
	<FB4F7315-9363-4F94-B5B0-3C736A1AE7FA@gmail.com>
	<CAJTo0LY1=XkrjSPBJKeDu_y8bo5fZYsfZChHpSsHwyHnV5mCvw@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.9.1)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pseudo: fix link with new sqlite3
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
X-List-Received-Date: Thu, 08 Nov 2018 16:20:15 -0000
X-Groupsio-MsgNum: 118052
Content-Type: multipart/signed;
	boundary="Apple-Mail=_3CC61164-DE5F-47FB-BB17-BEE3FB649C5D";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_3CC61164-DE5F-47FB-BB17-BEE3FB649C5D
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_95BA2884-A5D4-4D86-82C7-459D745C17A7"

--Apple-Mail=_95BA2884-A5D4-4D86-82C7-459D745C17A7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 08.11.2018 um 16:43 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
> On Thu, 8 Nov 2018 at 14:53, Jens Rehsack <rehsack@gmail.com> wrote:
>=20
>> I digged a bit deeper (since I'd like to get a reasonable solution =
even for other dependent components) and would say, pseudo will also =
fail, when sqlite3 is build using readline or libz.
>> The better option will be to let pseudo use the libs and link-flags =
from sqlite.pc
>=20
> Yes for libz, but I'd assumed the readline dependency was solely in
> the binary not the library.
>=20
> Annoyingly the fairly simple change to pseudo to make it use
> pkg-config for flags then failed to link statically.  If you want to
> see what I did and fancy fixing it, then my WIP is in the pkgconfig
> branch at https://gitlab.com/rossburton/pseudo.


That looks even better then my patch (I send it for review), which =
results in
> DB_LDFLAGS=3D$(SQLITE)/$(SQLITE_LIB)/libsqlite3.a -lz -lm -ldl =
-lpthread -lpthread
for pseudo to link ...

I'm a bit confused wrt. the requirement of static linking anyway ... but =
let's assume it's necessary and not dig into that :D

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_95BA2884-A5D4-4D86-82C7-459D745C17A7
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 08.11.2018 um 16:43 schrieb Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
Thu, 8 Nov 2018 at 14:53, Jens Rehsack &lt;<a =
href=3D"mailto:rehsack@gmail.com" class=3D"">rehsack@gmail.com</a>&gt; =
wrote:<br class=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">I=
 digged a bit deeper (since I'd like to get a reasonable solution even =
for other dependent components) and would say, pseudo will also fail, =
when sqlite3 is build using readline or libz.<br class=3D"">The better =
option will be to let pseudo use the libs and link-flags from =
sqlite.pc<br class=3D""></blockquote><br class=3D"">Yes for libz, but =
I'd assumed the readline dependency was solely in<br class=3D"">the =
binary not the library.<br class=3D""><br class=3D"">Annoyingly the =
fairly simple change to pseudo to make it use<br class=3D"">pkg-config =
for flags then failed to link statically. &nbsp;If you want to<br =
class=3D"">see what I did and fancy fixing it, then my WIP is in the =
pkgconfig<br class=3D"">branch at <a =
href=3D"https://gitlab.com/rossburton/pseudo" =
class=3D"">https://gitlab.com/rossburton/pseudo</a>.<br =
class=3D""></div></div></blockquote></div><div class=3D""><br =
class=3D""></div><div class=3D"">That looks even better then my patch (I =
send it for review), which results in</div><div class=3D"">&gt; =
DB_LDFLAGS=3D$(SQLITE)/$(SQLITE_LIB)/libsqlite3.a -lz -lm -ldl -lpthread =
-lpthread</div><div class=3D"">for pseudo to link ...</div><div =
class=3D""><br class=3D""></div><div class=3D"">I'm a bit confused wrt. =
the requirement of static linking anyway ... but let's assume it's =
necessary and not dig into that :D</div><div class=3D""><br =
class=3D""></div>Cheers<br class=3D""><div class=3D"">
<div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; orphans: =
auto; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div style=3D"color: rgb(0, 0, 0); letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; word-wrap: break-word; =
-webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" =
class=3D""><div class=3D"">--&nbsp;</div><div class=3D"">Jens Rehsack - =
<a href=3D"mailto:rehsack@gmail.com" =
class=3D"">rehsack@gmail.com</a></div></div></div>
</div>
<br class=3D""></body></html>=

--Apple-Mail=_95BA2884-A5D4-4D86-82C7-459D745C17A7--

--Apple-Mail=_3CC61164-DE5F-47FB-BB17-BEE3FB649C5D
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlvkYj0ACgkQRJmWrtzl
Cp131Q//Vohpm8m+Iew3MGmpsMzJ6g4mVQe9fNd+BN217c9yOrKUcItFcc5+7t3T
vlgzFjTdWCllX56S3Vf7LJmtActD3y1jYqiSKBMqOW839qJKkQJWc4TZi6UZs4Sw
w9FM7NlDZ1dzMvdQxJg81Ji9OkY6Oqn5AJehgPz5epYsxOfmSl+xUzNkDqBNi6h/
YAEp6qdhrhfLeA76De3hGhFykoWhEsGeftOzoPET/ZmAaXbebFEFs7HsmY0/mn3i
YP5BPZhJlMMzARCuJ2aLj84QfurzB1CeXFXQdMhNAm81VgNHIPbfRctrfqBQ4m9b
2ldejKMQ4Hk5PVwr3lzzVRDurTlxVf/5Dl/tvk4Jp9jm9fSfRy5UeGw2NcaMZzv7
gsK9lGWqs7h9UKTcVjXTXpRFkshLT81QLyTt1yzn3Mxt77z+uwryHgGkLPDi/GDN
HHB8mpi5yW+xe4Nhz9bjnIEBkTl4klRn0fpX4e3Lpp0iBfEphK+1Qoid1rgRbgkD
vHvLp5pVfQZKf0TA3KGEptSh2Or4p1G2PZ62EAHWeF7FwUOHuTOBpv4ZAaE4fgv6
iGRwxd//08zYIPvmBkfwYsTreEeaBxHDLb32ipNUYXeikB97CMxbWZZLJKWqYkT8
8T2oS8vju5xTdcX5CUa2eK9FJ7PmO7BZ+FmVfr8y4AUvJHIdGDk=
=6hST
-----END PGP SIGNATURE-----

--Apple-Mail=_3CC61164-DE5F-47FB-BB17-BEE3FB649C5D--
