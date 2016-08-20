Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 62B90760AD
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 20:37:08 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id y134so3503573pfg.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 20 Aug 2016 13:37:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=qed2h2/I8ecTTopa+wdpksQpYClbNjvYEnZKfDfSwyQ=;
	b=ILfQ1hDHre4OB4szxxW9XRp8IaR5VB4CRCIgtxsYh0V8iBUaohFfkJLWN3I8Ksq77F
	riGabhHG8qSFjR5Lceq6gmrfgfwKvFFw8s/WfrB75MiyGi5Uxn/evteVvh1beliL5j3Y
	SdIoEcYAI8a9s+LuXDtx5x7WUlWiZmvA4r/A+d8WW+hoX9RF02G9dkAuBapxJFEqxa3l
	kfBfGgGvnySNcgXLPLRNwwzz/khwRpxow1q+tUl6YFuXc+2cov5+GIkVSr+VQE93WkIn
	gzdZVr2ydCBUw0xICq7eVkTrWii3J4EAObSNR8xTJYNBxEpHnK6QtDQESUboTF2aYDu3
	hlqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=qed2h2/I8ecTTopa+wdpksQpYClbNjvYEnZKfDfSwyQ=;
	b=DC4sKz0jD8uQjHlyQcuaeKACr5X5SS7Un78gAeckRp47g+4Jl5avE0q8zzQaZcPdSb
	xk9hCbT27PMvv4hJqIE/5+Nq4MKPX8ZSVQda5EpxQAbKmLnlnHeSkLpwe+6jXf6ydm4J
	cSzYOIscTxKZSkJUfFUFlMELx7poraIe9XCs8ZMN5qkYiPBGkzm2Ae7lClbVToLWFI0F
	1YNxItokk56KtfXkMSfyqp1i8DsQBhxU8GqPyPvdHL/1BWQLauFA1fna4ok7p4JQhk80
	RHHdajSBbEAMnAhVOf8rK0zdkLRe5bbSzmu/e7jSVe6Fl4zPvpixb2MGMDtDtPwR00fe
	g6kQ==
X-Gm-Message-State: AEkooutjK/3Nwv18nxJ60YEoNFHDE4D/55wtKMH1yqlKkamoPFC4KQ8+1xC3/9Kn5lEMxw==
X-Received: by 10.98.89.210 with SMTP id k79mr27401736pfj.43.1471725429657;
	Sat, 20 Aug 2016 13:37:09 -0700 (PDT)
Received: from ?IPv6:2601:646:8882:b8c:6946:5275:9a40:9b8e?
	([2601:646:8882:b8c:6946:5275:9a40:9b8e])
	by smtp.gmail.com with ESMTPSA id
	m65sm15974570pfg.79.2016.08.20.13.37.08
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 20 Aug 2016 13:37:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <1471724031.2858.5.camel@intel.com>
Date: Sat, 20 Aug 2016 13:37:12 -0700
Message-Id: <BDB7547A-90FD-483A-A931-0A03C2643417@gmail.com>
References: <20160820150300.15345-1-raj.khem@gmail.com>
	<20160820150300.15345-2-raj.khem@gmail.com>
	<1471724031.2858.5.camel@intel.com>
To: "Randle, William C" <william.c.randle@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-xf86-config: pre-load int10 and exa modules
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
X-List-Received-Date: Sat, 20 Aug 2016 20:37:10 -0000
X-Groupsio-MsgNum: 86021
Content-Type: multipart/signed;
	boundary="Apple-Mail=_9B6535BC-A08C-43E7-954B-19C511DB9963";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_9B6535BC-A08C-43E7-954B-19C511DB9963
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_75B5E2AA-9B1B-4B5E-9119-762BCECE8EC5"

--Apple-Mail=_75B5E2AA-9B1B-4B5E-9119-762BCECE8EC5
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Aug 20, 2016, at 1:13 PM, Randle, William C =
<william.c.randle@intel.com> wrote:
>=20
> This patch is only a partial solution, as the libint10 module is not =
installed so it can't be loaded.
>=20

right, there is a v2 just posted, I was assuming that the modules were =
getting into image via some recommendations but it seems not.

>     -Bill
>=20
> On Sat, 2016-08-20 at 08:03 -0700, Khem Raj wrote:
>> musl doesn't like lazy loading that xorg uses, therefore
>> load the needed modules explicitly
>>=20
>> [YOCTO #10169]
>>=20
>> Signed-off-by: Khem Raj <raj.khem@gmail.com =
<mailto:raj.khem@gmail.com>>
>> ---
>>  .../xorg-xserver/xserver-xf86-config/10-preload-modules.conf         =
  | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>=20
>> diff --git =
a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-module=
s.conf =
b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-module=
s.conf
>> index 7ceb6fd..132459c 100644
>> --- =
a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-module=
s.conf
>> +++ =
b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-module=
s.conf
>> @@ -3,7 +3,8 @@ Section "Module"
>>      Load "fb"
>>      Load "shadow"
>>      Load "shadowfb"
>> +    Load "int10"
>>      Load "vbe"
>>      Load "vgahw"
>> +    Load "exa"
>>  EndSection
>> -
>> --
>> 2.9.3
>>=20


--Apple-Mail=_75B5E2AA-9B1B-4B5E-9119-762BCECE8EC5
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Aug 20, 2016, at 1:13 PM, Randle, William C &lt;<a href="mailto:william.c.randle@intel.com" class="">william.c.randle@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class="">

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" class="">

<div bgcolor="#f7f7f7" text="#2c2c2c" link="#4a90d9" vlink="#4a90d9" class="">
<div class="">This patch is only a partial solution, as the libint10 module is not installed so it can't be loaded.</div>
<div class=""><br class=""></div></div></div></blockquote><div><br class=""></div><div>right, there is a v2 just posted, I was assuming that the modules were getting into image via some recommendations but it seems not.</div><br class=""><blockquote type="cite" class=""><div class=""><div bgcolor="#f7f7f7" text="#2c2c2c" link="#4a90d9" vlink="#4a90d9" class=""><div class="">
</div>
<div class="">&nbsp; &nbsp; -Bill</div>
<div class=""><br class="">
</div>
<div class="">On Sat, 2016-08-20 at 08:03 -0700, Khem Raj wrote:</div>
<blockquote type="cite" class="">
<pre class="">musl doesn't like lazy loading that xorg uses, therefore
load the needed modules explicitly

[YOCTO #10169]

Signed-off-by: Khem Raj &lt;<a href="mailto:raj.khem@gmail.com" class="">raj.khem@gmail.com</a>&gt;
---
 .../xorg-xserver/xserver-xf86-config/10-preload-modules.conf           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
index 7ceb6fd..132459c 100644
--- a/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
+++ b/meta/recipes-graphics/xorg-xserver/xserver-xf86-config/10-preload-modules.conf
@@ -3,7 +3,8 @@ Section "Module"
     Load "fb"
     Load "shadow"
     Load "shadowfb"
+    Load "int10"
     Load "vbe"
     Load "vgahw"
+    Load "exa"
 EndSection
-
-- 
2.9.3

</pre>
</blockquote>
</div>

</div></blockquote></div><br class=""></body></html>

--Apple-Mail=_75B5E2AA-9B1B-4B5E-9119-762BCECE8EC5--

--Apple-Mail=_9B6535BC-A08C-43E7-954B-19C511DB9963
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAle4v3wACgkQuwUzVZGdMxSWlgCeMGxrmRuaBsuRYKrrYx2dyJra
nr4An1J0j+dWiaJOuF85f/E6y8xU8Msp
=+0Ra
-----END PGP SIGNATURE-----

--Apple-Mail=_9B6535BC-A08C-43E7-954B-19C511DB9963--
