Return-Path: <rehsack@gmail.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id C8CCA7D38D
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Apr 2019 17:05:49 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id w10so22406671wrm.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2019 10:05:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:message-id:mime-version:subject:date:in-reply-to:cc:to
	:references; bh=Y0+Xo9eWZXzX2ncZIjWzFr1dxEqHjl3x3XB1mdfMdI4=;
	b=iobKVB7fz5xySMMqqq9zhqeF3PTW4/5jYINkI9a1fpuKN7ythb9JZ45slOadDZYBxw
	IaEJZxPLPA2b9cRWUKfhmfDgwp3FyWYzvVSinLtrkd4R1RGFzjTcPxAen8n7XUqYDWCo
	ogybFlYE49NKIkVepGtiPxwAciOpyF0OLbNP6nydfmFTx9djj0DOu+HkNJc9Uayu9li0
	G+7FRHjZMIM6dDwES3aYR+5wj5W/JjQkkybTu3iWLXLcdbJqQRToskn0Iq09zsdMCdto
	Cct9eCfF2V3t1gDLySH/cdy3TXiecgUZ5EN8jTRsB+YlPGQlX4QkksZu6NzauPWPjkoW
	/ORQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:message-id:mime-version:subject:date
	:in-reply-to:cc:to:references;
	bh=Y0+Xo9eWZXzX2ncZIjWzFr1dxEqHjl3x3XB1mdfMdI4=;
	b=Z40XgCX19VO0l3YYJHmyZudiW1o4rm/FMxhL9KjUtECSNAW7357//cpX4TdAlPn/40
	R2NfCEuwswO1jQHP/0UztdbYfaxsgnWsixJ7ZOgs8e5D5V/lTCUc03dUcSJOHX+MFBbF
	zucurLHG9dESBLpZJiLA9Wt4NWpqd8TnenMn4ffyeWjHNQjyOCQCyjc5Bm+WGIx2gfwt
	wRQjeXLu/VTncN44SpLnKPWFn33U4HtwmCr4dPfd/UzlQfUO508+8wwvTHRkWA8qfXT4
	FEkMy16x7O6suLyFGyXizfqtQ5Xgh3/HhAq9H24ZahRdmoTH/xXTpCWnVO2uLRflTSuc
	+3Ww==
X-Gm-Message-State: APjAAAXte+C4qr15nhr1SZT1/YAaaBa3+hTJTthxXEpE040d4b/TDceJ
	hlHhul+Imr4GhEjjPGzFN6A=
X-Google-Smtp-Source: APXvYqxiQq2TJrfCte0855ymHJbwvfsWghUGblkF/GYVNTRkmwofKkIRR757YdgCPEqOlzXkaqjoAQ==
X-Received: by 2002:a5d:54c4:: with SMTP id x4mr466218wrv.296.1554311150536;
	Wed, 03 Apr 2019 10:05:50 -0700 (PDT)
Received: from [10.42.8.217] (b2b-78-94-80-58.unitymedia.biz. [78.94.80.58])
	by smtp.gmail.com with ESMTPSA id
	l23sm16230587wmj.10.2019.04.03.10.05.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 03 Apr 2019 10:05:49 -0700 (PDT)
Sender: Jens Rehsack <rehsack@gmail.com>
From: Jens Rehsack <sno@netbsd.org>
Message-Id: <CCFDEF2A-61E0-493B-AF4B-8A8EA5D6A551@netbsd.org>
Mime-Version: 1.0 (Mac OS X Mail 12.4 \(3445.104.8\))
Date: Wed, 3 Apr 2019 19:05:48 +0200
In-Reply-To: <089f9da0ec7f175fcf327994f31e0728f75313a0.camel@linuxfoundation.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20190403131822.19503-1-sno@netbsd.org>
	<089f9da0ec7f175fcf327994f31e0728f75313a0.camel@linuxfoundation.org>
X-Mailer: Apple Mail (2.3445.104.8)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] support CONFIG_MODULE_COMPRESS=y
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
X-List-Received-Date: Wed, 03 Apr 2019 17:05:50 -0000
X-Groupsio-MsgNum: 123010
Content-Type: multipart/signed;
	boundary="Apple-Mail=_5189D63F-61F3-417B-8ECD-2483C4D5B589";
	protocol="application/pgp-signature"; micalg=pgp-sha512

--Apple-Mail=_5189D63F-61F3-417B-8ECD-2483C4D5B589
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_E53C0805-74F2-4552-AD14-2463280FBB2B"

--Apple-Mail=_E53C0805-74F2-4552-AD14-2463280FBB2B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii



> Am 03.04.2019 um 15:58 schrieb Richard Purdie =
<richard.purdie@linuxfoundation.org>:
>=20
> On Wed, 2019-04-03 at 15:18 +0200, Jens Rehsack wrote:
>> In case, kernel config enables compressed modules, support of
>> splitting via split_kernel_module_packages won't find any module.
>> So, first expand module pattern regex to recognize compressed
>> modules and then objcopy on temporary extacted to extract module
>> information.
>>=20
>> Signed-off-by: Jens Rehsack <sno@netbsd.org>
>> ---
>> meta/classes/kernel-module-split.bbclass | 36 +++++++++++++++++-----
>> --
>> 1 file changed, 26 insertions(+), 10 deletions(-)
>=20
> There is a lot of whitespace noise in this, could you clean that up =
and
> resend please?


It's because of <tab>s were replaced with spaces - which is reasonable =
when python code is mixed in.
Sure that you want keep the tab's?

Cheers
--
Jens Rehsack - rehsack@gmail.com


--Apple-Mail=_E53C0805-74F2-4552-AD14-2463280FBB2B
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dus-ascii"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D""><br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">Am 03.04.2019 um 15:58 schrieb Richard Purdie &lt;<a =
href=3D"mailto:richard.purdie@linuxfoundation.org" =
class=3D"">richard.purdie@linuxfoundation.org</a>&gt;:</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><div class=3D"">On =
Wed, 2019-04-03 at 15:18 +0200, Jens Rehsack wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">In case, kernel config =
enables compressed modules, support of<br class=3D"">splitting via =
split_kernel_module_packages won't find any module.<br class=3D"">So, =
first expand module pattern regex to recognize compressed<br =
class=3D"">modules and then objcopy on temporary extacted to extract =
module<br class=3D"">information.<br class=3D""><br =
class=3D"">Signed-off-by: Jens Rehsack &lt;<a =
href=3D"mailto:sno@netbsd.org" class=3D"">sno@netbsd.org</a>&gt;<br =
class=3D"">---<br class=3D""> meta/classes/kernel-module-split.bbclass | =
36 +++++++++++++++++-----<br class=3D"">--<br class=3D""> 1 file =
changed, 26 insertions(+), 10 deletions(-)<br class=3D""></blockquote><br =
class=3D"">There is a lot of whitespace noise in this, could you clean =
that up and<br class=3D"">resend please?<br =
class=3D""></div></div></blockquote></div><div class=3D""><br =
class=3D""></div>It's because of &lt;tab&gt;s were replaced with spaces =
- which is reasonable when python code is mixed in.<div class=3D"">Sure =
that you want keep the tab's?</div><div class=3D""><br =
class=3D""></div><div class=3D"">Cheers<br class=3D""><div class=3D"">
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
<br class=3D""></div></body></html>=

--Apple-Mail=_E53C0805-74F2-4552-AD14-2463280FBB2B--

--Apple-Mail=_5189D63F-61F3-417B-8ECD-2483C4D5B589
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEGutaqWUYV+tvC/mCRJmWrtzlCp0FAlyk5+wACgkQRJmWrtzl
Cp35cg//ahrn1elhYwv+6gPYfFYX4CV/wXqEopPnbR2glKUdvwQmmxtCBJ4a9/lP
Z8fs4pcAvg5znokWDb3pjciteC635VgYtcR45llNOnMZ10TsmwpaUf+rVI+UACky
ZAtIqGbeeiicD1e7j+N7jx2sza0Yt5mycJGRgBSnz/pQXWLNoQJ3ubeOLrxobBww
6WjsE74y7hnZxAxCSZq07pI5wtVxe1cNOqTt4uiHwbpSnGO+t9o7SqOjX/BnXC1I
yLo3amWibPxg3I66oovPdySI0SqNAbxD2AIeXoyWWZww0lm8SUhiIePXHGeBRg74
dU86Pza4gl6rGo5C3TtjoZ6Zrt1XLnjqS02TeTi+N3/wCrSScA9z5vkvbeDiSNjn
dnRic3slcr/zHzNOmrz3PUvoWK0rK9D+IWF8Agq7aA/zZdvrC8bXLGL/bAeUDq1N
xqqCQudzEgASb68vBQPdgUxi/uS5JCMZqBPidT6CyaPXsH3Ozyrqz2aYdw0AfwH/
8uKOmxwIIFCcgeJEFR7n910fFqDsKpc7O6WB5KcVfk4PwFAoZt13DfhXd2cR7KRk
qPTEfgpvp7+3iHTgK8QDNIMsvtEMGRiCVRGVUXPcnxY8+UQpxgHESiZo8e+kNt51
gwyiSwLc6dT0cLhgQSSzKOxszGk7V0LfWZq0ab/D+UrqBSsr5K4=
=hexQ
-----END PGP SIGNATURE-----

--Apple-Mail=_5189D63F-61F3-417B-8ECD-2483C4D5B589--
