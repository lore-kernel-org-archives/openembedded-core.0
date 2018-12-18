Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id B432F7BFBD
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 12:57:53 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id r10so15783905wrs.10
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Dec 2018 04:57:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=WtOqp1c39oF8y2rwfkJK+uqlY6hZ2cm9k6cPMIu7si4=;
	b=MlA0GoSiH3fs188iwvkPEQUHJq7PP9Aw4zfOEbfFZM+8cIaZsJN2xX76bqlwUnSXqg
	ahG/CWVklrWO8Sy4I4pdowbI6qG0CEPbpIJGKOdDPo351dRuAykidLNF2ublBLjIdBSn
	BHTjrbz/mdD8grKqIRb1z3S+VTw7HItTrK/aiscToaZQP4Sd+SH9Olqal9WnH7jkop7w
	M4Dr/Wf1eNOVIYL4U7dcQ6IS8zMyT7OUfv5U1fOPQgtn6VXbOoMu2ss7sO6VWAyl3lI4
	2bNAzORkEr6qwXAzkIFm4O2edOqVVhxJfcIkeTVAhjTyhP2cxuWXzpDfKdAb3skUXCb0
	9jOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=WtOqp1c39oF8y2rwfkJK+uqlY6hZ2cm9k6cPMIu7si4=;
	b=pMZ9fhgi8Bj0Xgey41r7Oqny4Qnn+EsMGftzHQbnTXdNXb45PaQLiANS1/LKFlOv4j
	XSnUKcs082XrlQgPaZ4OjjuojmJpqokO3xHihhuZPhdIgRACXQYM/6iVX5kErSzpTT5J
	dsxtUs+quZ3/f5FzyhXI6AnlLxgoDvkuPHYmMUTiRctLIsSttQ7ydHl6B+SHwn/kZSxl
	GvqJUoouzF2kiQG62tg+uE4nUX2+ODhS36F+IG4FzHEl9EFAcJn88lAj5k+2fceMUgrd
	6ixjBN0Ocyyp11RvZwOoIuMNUnOcs6G7IaILJyrOChMXE8hDOZ1Br0/loVgkXyA030Qz
	D63Q==
X-Gm-Message-State: AA+aEWYTOvj7+8rJLEMnZ7q1hHjaMJRMTRdG69k3yFXSN5aLfpjkGWkk
	Sb8YWuxQycTVSeX2lJGtXoI=
X-Google-Smtp-Source: AFSGD/VqmHFACcniZPs4PMam11Rm9eODo4iCdqG7mpox8kesLBX8dNJYKooF4jxYetO3WgKRdHG35g==
X-Received: by 2002:adf:ba8e:: with SMTP id p14mr14001712wrg.230.1545137874354;
	Tue, 18 Dec 2018 04:57:54 -0800 (PST)
Received: from ?IPv6:2a01:598:8187:f519:714f:3dc3:63fb:372b?
	([2a01:598:8187:f519:714f:3dc3:63fb:372b])
	by smtp.gmail.com with ESMTPSA id v1sm2549513wrw.90.2018.12.18.04.57.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 18 Dec 2018 04:57:53 -0800 (PST)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <A198D244-A078-49CF-941D-41BF011F39F1@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 12.2 \(3445.102.3\))
Date: Tue, 18 Dec 2018 13:57:51 +0100
In-Reply-To: <CAJTo0LYR+x05NHQMN_bfLgSnceiOCRznodAFza-UBkyT_NZh=w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
References: <20181215125926.12227-1-sno@netbsd.org>
	<CAJTo0LYR+x05NHQMN_bfLgSnceiOCRznodAFza-UBkyT_NZh=w@mail.gmail.com>
X-Mailer: Apple Mail (2.3445.102.3)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_deb.bbclass: report error during creation
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
X-List-Received-Date: Tue, 18 Dec 2018 12:57:54 -0000
X-Groupsio-MsgNum: 119348
Content-Type: multipart/signed;
	boundary="Apple-Mail=_DD806FD4-39BA-4776-97F4-F06305ADC265";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_DD806FD4-39BA-4776-97F4-F06305ADC265
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_E58DE8BD-BFDE-4BC2-A4F7-A74C3131153D"

--Apple-Mail=_E58DE8BD-BFDE-4BC2-A4F7-A74C3131153D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 17.12.2018 um 18:11 schrieb Burton, Ross <ross.burton@intel.com>:
>=20
> On Sat, 15 Dec 2018 at 12:59, Jens Rehsack <sno@netbsd.org> wrote:
>> +        try:
>> +            subprocess.check_output("PATH=3D\"%s\" dpkg-deb -b %s =
%s" % (localdata.getVar("PATH"), root, pkgoutdir),
>> +                                    stderr=3Dsubprocess.STDOUT,
>=20
> So stderr is redirected to stdout.
>=20
>> +        except subprocess.CalledProcessError as cpe:
>> +            bb.note("%s" % cpe)
>> +            bb.note("%s" % cpe.stdout)
>> +            bb.note("%s" % cpe.stderr)
>=20
> So why display both?

Better safe than sorry :P

> Do this as one bb.error

Sure

> and you won't need to re-raise as it will fail.

So neither raise nor pass - just print?

> Ross


Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_E58DE8BD-BFDE-4BC2-A4F7-A74C3131153D
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 17.12.2018 um 18:11 schrieb Burton, Ross &lt;<a =
href=3D"mailto:ross.burton@intel.com" =
class=3D"">ross.burton@intel.com</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
Sat, 15 Dec 2018 at 12:59, Jens Rehsack &lt;<a =
href=3D"mailto:sno@netbsd.org" class=3D"">sno@netbsd.org</a>&gt; =
wrote:<br class=3D""><blockquote type=3D"cite" class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;try:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;subproce=
ss.check_output("PATH=3D\"%s\" dpkg-deb -b %s %s" % =
(localdata.getVar("PATH"), root, pkgoutdir),<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;stderr=3Dsub=
process.STDOUT,<br class=3D""></blockquote><br class=3D"">So stderr is =
redirected to stdout.<br class=3D""><br class=3D""><blockquote =
type=3D"cite" class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;except =
subprocess.CalledProcessError as cpe:<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bb.note(=
"%s" % cpe)<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bb.note(=
"%s" % cpe.stdout)<br class=3D"">+ =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;bb.note(=
"%s" % cpe.stderr)<br class=3D""></blockquote><br class=3D"">So why =
display both?<br class=3D""></div></div></blockquote><div><br =
class=3D""></div><div>Better safe than sorry :P</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
class=3D"">Do this as one bb.error</div></div></blockquote><div><br =
class=3D""></div><div>Sure</div><br class=3D""><blockquote type=3D"cite" =
class=3D""><div class=3D""><div class=3D""> and you won't need to =
re-raise as it will fail.<br class=3D""></div></div></blockquote><div><br =
class=3D""></div><div>So neither raise nor pass - just print?</div><br =
class=3D""><blockquote type=3D"cite" class=3D""><div class=3D""><div =
class=3D"">Ross<br class=3D""></div></div></blockquote></div><div =
class=3D""><br class=3D""></div>Cheers<br class=3D""><div class=3D"">
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

--Apple-Mail=_E58DE8BD-BFDE-4BC2-A4F7-A74C3131153D--

--Apple-Mail=_DD806FD4-39BA-4776-97F4-F06305ADC265
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlwY7s8ACgkQRJmWrtzl
Cp3kZA/5ATMy+Z5qSnXsbwiznVF72B+Tk/eumKCsXhSWb/5oZaKdmbJKBJeqGN4F
RlgKX1zp2prGVBchIOxd/1Hj9zWbn+hTwJAEzzBbpEzOvyOEkVB1OCkV1MN6ywOO
CVHRmKA+mU+8Mz9cXV07MXU1S9Z8Qq23XuZnyyqiX6PuZsgGmvohSWuU8OgoD9tI
v+rvxqjIBYVq3rnvMNVBF2PjQFo9kRHIa5pF18sSxlERJBPbTjATr8CbNH9vJN2M
Uo7rbeiEgikO44EiNwRGzzKPt/08kyTC9aj0tMCGPyozphJzF0LjYbjzlxPjjsyd
kvPdwXLW4w21/NesEPeSc3j8rP+CC+hDn6QHep2sJaU7ddOHE79f2XugdCJhybMo
3b1PWRCO/BB3f6Rq6zgsmvp6I51F+JE5Fut1MldAk9jmfg/sH06QsayV8pqDk32u
DUp7loKfH1cKxTw6XCbhSdeBgSBhfcYNEjSKYQ3pEd+nb2cLvYxC8w3/EIb+kxCP
iaSqsYp5SOgsJG1so9ez5qW2WjkaPZ20ghVhjKwJHB5vs6OKEoJnf2lf/BlusOKO
bMIi7GBkANDOWFdA8NNyr95KEbl1KClEPFHyH8v0a+e/mLTitg6+4rtZIL78BJ5p
ZEvvJNWa3KtdKmnB0pQgyfrjW3aHHFCDAdNIxv2AzbuI/HmYXLs=
=kV0Y
-----END PGP SIGNATURE-----

--Apple-Mail=_DD806FD4-39BA-4776-97F4-F06305ADC265--
