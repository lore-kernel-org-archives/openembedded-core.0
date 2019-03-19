Return-Path: <alex.kanavin@gmail.com>
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
	[209.85.208.49])
	by mail.openembedded.org (Postfix) with ESMTP id 255F47CE22
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 16:31:53 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id e4so17177760edi.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2019 09:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=R0JwLs5nAkrTVDKc2iwcdHeAyVwoV7kTq6gq8hOjUiU=;
	b=DE3MUldzDQmYY2l9jr3sXTc+RAFlw06iI0NTId+ZNmgPOiFAgc9KHrInvjWUSllq2/
	u/zRDsAWPkh6GpSXcPEbb0AtguImttDauPh/n3G/SWbWNumgk/yRN3TgSUWype2i5Sez
	f1j+tMxSlWPoI2W+IsRsRtMgUZXmOUMfJFFBQEKX6kRUQm7IVYKkAxyO1UY4MMtOA9Tp
	L6HfLJ27JCOFVFa6hrHSXkmhRGAAA6EsdNdTGBbFdpxZZZAsTbqOGxtH/4AB5MJ6aGPG
	VzLk9UUNcidpxvAWHxRiJr8c35xDUrmfKhYaDm+UJ1niugV0O0mMj0s41ueeBAd8MYHr
	vVRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to;
	bh=R0JwLs5nAkrTVDKc2iwcdHeAyVwoV7kTq6gq8hOjUiU=;
	b=nbtvjyptJbdBNuClU/e9MYk/JMmGwibMPGwPAnCyjuZdx9I+uqNQTurhMmhkvFN04g
	rUtZGF5wisftQ02EWp2lnTel8sRwM+UBuL3nglDMDb+zpigINEr5O64359jWWdtRbTYw
	kWKTt1oU6BR88ei6c6llYVQ29MEyJqiFfb+H8sTLhjs28O7jOZ2IaG9h4JJ0QHldKLjz
	mXzGejaDSe1bDLP4vhmWZRRZyhj4JR3edGzB/9Nq/J7L+IcBykznnXjrwWgAuje7rXJi
	TQLAOPzD6oxK7+fURNWhbyaTp8hlZK5Vy0bYVp6QYYre+2UmYZTpF3nY9NmZziQFx9B1
	rLEw==
X-Gm-Message-State: APjAAAUOHTgyPpzUBTtIzEXkaxW12LpbdNFSID3p8wXgA45UgbWEe7xb
	ClN1YKUmqgMvx1KKxIr0LHA=
X-Google-Smtp-Source: APXvYqzqCez9k5sYSxwAmeKfQVQxz9qHSllGsGX2Gw/ooqP0r2Pd01IMOJXScBsArffwB+4PMbMmhw==
X-Received: by 2002:a50:b493:: with SMTP id w19mr18086681edd.11.1553013113930; 
	Tue, 19 Mar 2019 09:31:53 -0700 (PDT)
Received: from [192.168.44.177] (vpn30.hotsplots.net. [185.46.137.15])
	by smtp.gmail.com with ESMTPSA id
	z17sm3969420edi.67.2019.03.19.09.31.52
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 19 Mar 2019 09:31:53 -0700 (PDT)
Mime-Version: 1.0 (1.0)
From: Alexander Kanavin <alex.kanavin@gmail.com>
X-Mailer: iPhone Mail (16D57)
In-Reply-To: <20190319135538.GH1994@jama>
Date: Tue, 19 Mar 2019 17:31:52 +0100
Message-Id: <8ECD4C1B-CF62-4D11-9757-F3176AEA4B50@gmail.com>
References: <cover.1552962581.git.akuster808@gmail.com>
	<20190319085532.GF1994@jama>
	<D3413079-663B-47D2-8550-658159790D3B@gmail.com>
	<20190319104001.GG1994@jama>
	<22BB06E0-D9DD-4070-960B-53D03755B65A@gmail.com>
	<20190319135538.GH1994@jama>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/26] thud patch review
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
X-List-Received-Date: Tue, 19 Mar 2019 16:31:53 -0000
Content-Type: multipart/alternative;
	boundary=Apple-Mail-E3D763AE-93A0-4493-8E0E-8BF370BC2830
Content-Transfer-Encoding: 7bit

--Apple-Mail-E3D763AE-93A0-4493-8E0E-8BF370BC2830
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

For what it=E2=80=99s worth, OpenSSL is also being relicensed to Apache 2.0,=
 so backporting their fixes may not be an option either.=20
https://license.openssl.org/

Please be careful with your language: I=E2=80=99m sure you know that recipe m=
aintenance is a tedious, thankless task. Having it belittled doesn=E2=80=99t=
 help.

Alex

> On 19 Mar 2019, at 14.55, Martin Jansa <martin.jansa@gmail.com> wrote:
>=20
>> On Tue, Mar 19, 2019 at 12:35:59PM +0100, Alexander Kanavin wrote:
>> Just to remind once more, all upstream support for OpenSSL 1.0.2 ceases i=
n 9 months, so shipping products with it may not be the best idea.
>=20
> Just to remind once more, shipping products isn't as easy as building
> the few recipes included in oe-core.
>=20
> For example:
> Believe it or not, some projects need to use old Qt 5.6 due to license
> change in newer version and 5.6 doesn't support openssl 1.1,
> backporting the necessary changes would violate the license as well.
> Providing clean room re-implementation is also difficult, because there
> aren't many other options how to implement this than how it was done in
> newer qt already, see:
>=20
> https://bugreports.qt.io/browse/QTBUG-71623
> https://development.qt-project.narkive.com/RW4wxYXY/openssl-1-1-x-support-=
on-qt-5-6-5-9
>=20
> Yes, it's not the best idea, but even backporting security fixes to old
> openssl might be cheaper than buying commercial qt license...
>=20
> Cheeers,

--Apple-Mail-E3D763AE-93A0-4493-8E0E-8BF370BC2830
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">For what it=E2=80=99s worth, OpenSSL is als=
o being relicensed to Apache 2.0, so backporting their fixes may not be an o=
ption either.&nbsp;<div><a href=3D"https://license.openssl.org/">https://lic=
ense.openssl.org/</a></div><div><br></div><div>Please be careful with your l=
anguage: I=E2=80=99m sure you know that recipe maintenance is a tedious, tha=
nkless task. Having it belittled doesn=E2=80=99t help.<br><br><div id=3D"App=
leMailSignature" dir=3D"ltr">Alex</div><div dir=3D"ltr"><br>On 19 Mar 2019, a=
t 14.55, Martin Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.j=
ansa@gmail.com</a>&gt; wrote:<br><br></div><blockquote type=3D"cite"><div di=
r=3D"ltr"><span>On Tue, Mar 19, 2019 at 12:35:59PM +0100, Alexander Kanavin w=
rote:</span><br><blockquote type=3D"cite"><span>Just to remind once more, al=
l upstream support for OpenSSL 1.0.2 ceases in 9 months, so shipping product=
s with it may not be the best idea.</span><br></blockquote><span></span><br>=
<span>Just to remind once more, shipping products isn't as easy as building<=
/span><br><span>the few recipes included in oe-core.</span><br><span></span>=
<br><span>For example:</span><br><span>Believe it or not, some projects need=
 to use old Qt 5.6 due to license</span><br><span>change in newer version an=
d 5.6 doesn't support openssl 1.1,</span><br><span>backporting the necessary=
 changes would violate the license as well.</span><br><span>Providing clean r=
oom re-implementation is also difficult, because there</span><br><span>aren'=
t many other options how to implement this than how it was done in</span><br=
><span>newer qt already, see:</span><br><span></span><br><span><a href=3D"ht=
tps://bugreports.qt.io/browse/QTBUG-71623">https://bugreports.qt.io/browse/Q=
TBUG-71623</a></span><br><span><a href=3D"https://development.qt-project.nar=
kive.com/RW4wxYXY/openssl-1-1-x-support-on-qt-5-6-5-9">https://development.q=
t-project.narkive.com/RW4wxYXY/openssl-1-1-x-support-on-qt-5-6-5-9</a></span=
><br><span></span><br><span>Yes, it's not the best idea, but even backportin=
g security fixes to old</span><br><span>openssl might be cheaper than buying=
 commercial qt license...</span><br><span></span><br><span>Cheeers,</span><b=
r></div></blockquote></div></body></html>=

--Apple-Mail-E3D763AE-93A0-4493-8E0E-8BF370BC2830--
