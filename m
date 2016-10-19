Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f171.google.com (mail-pf0-f171.google.com
	[209.85.192.171])
	by mail.openembedded.org (Postfix) with ESMTP id 8A43B719EE
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 18:52:30 +0000 (UTC)
Received: by mail-pf0-f171.google.com with SMTP id r16so20530446pfg.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 19 Oct 2016 11:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:mime-version:from:in-reply-to:date:cc:message-id:references
	:to; bh=PtnMuXktiDNMF6cEKuO2VFOCkxVDeVrRL6XNWvkokGA=;
	b=aUZxFybe4UIK0VMvsZSu5kBXGVjPO3nlccTU44U80UnY9cXUVb1zK6mDhnBUIJHlH0
	xv+HHmMuXqXL4NyeXmcYCzuGpodr0A3RVivTHMANScHSm6n3FqHcIpPInVBOYe9t12/B
	0mqnyxKKo+eysdYllrOdgr3hOnlVRsS/t5mZ/HGHyRe4kI6GBollHPEenm50FDRdZvOk
	BE1gWVl3QqmfuSsytn2lja4L0fxwsA0RFYo1bSx73gdguzvpQwEAVzlR1cCdViW4Fj7V
	4Fg4gtwdmb9ZE9DBEz1dhgqUdbNJgQxQXhuN+1A1f9GsYDUmsdBiOanJnNmmKhuzwi5+
	QGBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:subject:mime-version:from:in-reply-to:date:cc
	:message-id:references:to;
	bh=PtnMuXktiDNMF6cEKuO2VFOCkxVDeVrRL6XNWvkokGA=;
	b=a+rA0CbrIxIqvDizeLe1lQ4zkMppZaatKfXD68niVa0K4SYL6xH/kJtlI9dAtpm9Xy
	ExhE4WMToEm7zf8zeFmcAZz+1TOyV5BK9Af0AZ8boqC0PwDn8ogymCLx9rg5Wg1Bt6Mo
	zkOgiVHoCSDquOHkhvstXvdIDlrUF2yoMLAhZcSEUERBQ5QDPTmcc7L9CG9AsZklrZOj
	3xqfhbGrvYVPbC+oQX5chgtQJUErx7IRO9wlWknrDtfnEMnjJWoIxt+Z4bqcEbZmWNZk
	k3a9WZANn90HnF+g9cMMk9RATRijCygK2D92BWdwLwq0NDPJuS+pd+VOPnditGF2+L+n
	F1Ig==
X-Gm-Message-State: AA6/9Rn5yDCb9hDQQYf5HeuboJs33r5Sk6IqgR8ifdrs61UHXx/drMBZ5b5KQtYx9Eonwg==
X-Received: by 10.98.208.3 with SMTP id p3mr13691877pfg.125.1476903151355;
	Wed, 19 Oct 2016 11:52:31 -0700 (PDT)
Received: from ?IPv6:2600:1010:b047:7421:a03d:d977:cbd6:bdb2?
	([2600:1010:b047:7421:a03d:d977:cbd6:bdb2])
	by smtp.gmail.com with ESMTPSA id
	d142sm6311081pfd.33.2016.10.19.11.52.30
	(version=TLS1 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 19 Oct 2016 11:52:30 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 9.3 \(3124\))
X-Pgp-Agent: GPGMail
From: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <7fbd0d05-46a3-81d6-2fef-8c0bc4ea1435@intel.com>
Date: Wed, 19 Oct 2016 11:52:25 -0700
Message-Id: <64872A29-9020-491A-8C10-0E36335931A0@gmail.com>
References: <1476451269-11260-1-git-send-email-amarnath.valluri@intel.com>
	<CAMKF1soK1czJxYNo2H=gQsk2SvvvYexL9DSa7p+Yz8Yw3FL+zQ@mail.gmail.com>
	<7fbd0d05-46a3-81d6-2fef-8c0bc4ea1435@intel.com>
To: Amarnath Valluri <amarnath.valluri@intel.com>
X-Mailer: Apple Mail (2.3124)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] glmark2: Enabling c++ 11 features
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
X-List-Received-Date: Wed, 19 Oct 2016 18:52:30 -0000
X-Groupsio-MsgNum: 88380
Content-Type: multipart/signed;
	boundary="Apple-Mail=_A530BC1A-FA4D-4680-9D1A-9396F846498C";
	protocol="application/pgp-signature"; micalg=pgp-sha1

--Apple-Mail=_A530BC1A-FA4D-4680-9D1A-9396F846498C
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_4BA6ADCD-ED92-4B95-8B9D-36D9F4B1A6E0"

--Apple-Mail=_4BA6ADCD-ED92-4B95-8B9D-36D9F4B1A6E0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=us-ascii


> On Oct 17, 2016, at 11:49 PM, Amarnath Valluri =
<amarnath.valluri@intel.com> wrote:
>=20
>=20
>=20
> On Friday 14 October 2016 05:13 PM, Khem Raj wrote:
>> On Fri, Oct 14, 2016 at 3:21 PM, Amarnath Valluri
>> <amarnath.valluri@intel.com> <mailto:amarnath.valluri@intel.com> =
wrote:
>>> > The failure was:
>>> > | ../src/image-reader.cpp: In member function 'bool =
PNGReader::init(const
>>> > string&)':
>>> > | ../src/image-reader.cpp:123:16: error: 'unique_ptr' in namespace =
'std' does
>>> > not name a template type
>>> >
>>> > This change enables c++11 features, as code useing them.
>>> >
>>> > Signed-off-by: Amarnath Valluri <amarnath.valluri@intel.com> =
<mailto:amarnath.valluri@intel.com>
>>> > ---
>>> >  meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 3 +++
>>> >  1 file changed, 3 insertions(+)
>>> >
>>> > diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb =
b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
>>> > index 396ae70..4cb233b 100644
>>> > --- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
>>> > +++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
>>> > @@ -28,6 +28,9 @@ PACKAGECONFIG ?=3D =
"${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11-gl
>>> >                    ${@bb.utils.contains('DISTRO_FEATURES', =
'wayland opengl', 'wayland-gl wayland-gles2', '', d)} \
>>> >                    drm-gl drm-gles2"
>>> >
>>> > +# Enable C++11 features
>>> > +CXXFLAGS +=3D "--std=3Dc++11"
>> gcc6 now defaults to  -std=3Dgnu++14,so I have couple of  questions =
here
>>=20
>>  Are you pinning it to c++11 because it doesnt compile with c++14 ? =
or
>> is it because package is explicitly overrding the std option. In =
latter case
>> perhaps its better to patch the package and also submit it upstream
>>=20
> This failure was visible with gcc version 5.4(GCCVERSION=3D5.%).  With =
gcc6 It built successfully.
>=20

I see, you should mention such things in commit message.

> - Amarnath
>=20
>=20
> ---------------------------------------------------------------------
> Intel Finland Oy
> Registered Address: PL 281, 00181 Helsinki
> Business Identity Code: 0357606 - 4
> Domiciled in Helsinki
>=20
> This e-mail and any attachments may contain confidential material for
> the sole use of the intended recipient(s). Any review or distribution
> by others is strictly prohibited. If you are not the intended
> recipient, please contact the sender and delete all copies.
>=20


--Apple-Mail=_4BA6ADCD-ED92-4B95-8B9D-36D9F4B1A6E0
Content-Transfer-Encoding: 7bit
Content-Type: text/html;
	charset=us-ascii

<html><head><meta http-equiv="Content-Type" content="text/html charset=us-ascii"></head><body style="word-wrap: break-word; -webkit-nbsp-mode: space; -webkit-line-break: after-white-space;" class=""><br class=""><div><blockquote type="cite" class=""><div class="">On Oct 17, 2016, at 11:49 PM, Amarnath Valluri &lt;<a href="mailto:amarnath.valluri@intel.com" class="">amarnath.valluri@intel.com</a>&gt; wrote:</div><br class="Apple-interchange-newline"><div class="">
  
    <meta content="text/html; charset=utf-8" http-equiv="Content-Type" class="">
  
  <div bgcolor="#FFFFFF" text="#000000" class=""><p class=""><br class="">
    </p>
    <br class="">
    <div class="moz-cite-prefix">On Friday 14 October 2016 05:13 PM,
      Khem Raj wrote:<br class="">
    </div>
    <blockquote cite="mid:CAMKF1soK1czJxYNo2H=gQsk2SvvvYexL9DSa7p+Yz8Yw3FL+zQ@mail.gmail.com" type="cite" class="">
      <pre wrap="" class="">On Fri, Oct 14, 2016 at 3:21 PM, Amarnath Valluri
<a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:amarnath.valluri@intel.com">&lt;amarnath.valluri@intel.com&gt;</a> wrote:
</pre>
      <blockquote type="cite" style="" class="">
        <pre wrap="" class=""><span class="moz-txt-citetags">&gt; </span>The failure was:
<span class="moz-txt-citetags">&gt; </span>| ../src/image-reader.cpp: In member function 'bool PNGReader::init(const
<span class="moz-txt-citetags">&gt; </span>string&amp;)':
<span class="moz-txt-citetags">&gt; </span>| ../src/image-reader.cpp:123:16: error: 'unique_ptr' in namespace 'std' does
<span class="moz-txt-citetags">&gt; </span>not name a template type
<span class="moz-txt-citetags">&gt;</span>
<span class="moz-txt-citetags">&gt; </span>This change enables c++11 features, as code useing them.
<span class="moz-txt-citetags">&gt;</span>
<span class="moz-txt-citetags">&gt; </span>Signed-off-by: Amarnath Valluri <a moz-do-not-send="true" class="moz-txt-link-rfc2396E" href="mailto:amarnath.valluri@intel.com">&lt;amarnath.valluri@intel.com&gt;</a>
<span class="moz-txt-citetags">&gt; </span>---
<span class="moz-txt-citetags">&gt; </span> meta-oe/recipes-benchmark/glmark2/glmark2_git.bb | 3 +++
<span class="moz-txt-citetags">&gt; </span> 1 file changed, 3 insertions(+)
<span class="moz-txt-citetags">&gt;</span>
<span class="moz-txt-citetags">&gt; </span>diff --git a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
<span class="moz-txt-citetags">&gt; </span>index 396ae70..4cb233b 100644
<span class="moz-txt-citetags">&gt; </span>--- a/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
<span class="moz-txt-citetags">&gt; </span>+++ b/meta-oe/recipes-benchmark/glmark2/glmark2_git.bb
<span class="moz-txt-citetags">&gt; </span>@@ -28,6 +28,9 @@ PACKAGECONFIG ?= "${@bb.utils.contains('DISTRO_FEATURES', 'x11 opengl', 'x11-gl
<span class="moz-txt-citetags">&gt; </span>                   ${@bb.utils.contains('DISTRO_FEATURES', 'wayland opengl', 'wayland-gl wayland-gles2', '', d)} \
<span class="moz-txt-citetags">&gt; </span>                   drm-gl drm-gles2"
<span class="moz-txt-citetags">&gt;</span>
<span class="moz-txt-citetags">&gt; </span>+# Enable C++11 features
<span class="moz-txt-citetags">&gt; </span>+CXXFLAGS += "--std=c++11"
</pre>
      </blockquote>
      <pre wrap="" class="">gcc6 now defaults to  -std=gnu++14,so I have couple of  questions here

 Are you pinning it to c++11 because it doesnt compile with c++14 ? or
is it because package is explicitly overrding the std option. In latter case
perhaps its better to patch the package and also submit it upstream

</pre>
    </blockquote>
    This failure was visible with gcc version 5.4(GCCVERSION=5.%).&nbsp; With
    gcc6 It built successfully.<br class="">
    <br class=""></div></div></blockquote><div><br class=""></div><div>I see, you should mention such things in commit message.</div><br class=""><blockquote type="cite" class=""><div class=""><div bgcolor="#FFFFFF" text="#000000" class="">
    - Amarnath<br class="">
    <br class="">
    <br class=""><p class="">---------------------------------------------------------------------<br class="">
Intel Finland Oy<br class="">
Registered Address: PL 281, 00181 Helsinki <br class="">
Business Identity Code: 0357606 - 4 <br class="">
Domiciled in Helsinki </p><p class="">This e-mail and any attachments may contain confidential material for<br class="">
the sole use of the intended recipient(s). Any review or distribution<br class="">
by others is strictly prohibited. If you are not the intended<br class="">
recipient, please contact the sender and delete all copies.</p></div>

</div></blockquote></div><br class=""></body></html>

--Apple-Mail=_4BA6ADCD-ED92-4B95-8B9D-36D9F4B1A6E0--

--Apple-Mail=_A530BC1A-FA4D-4680-9D1A-9396F846498C
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename=signature.asc
Content-Type: application/pgp-signature;
	name=signature.asc
Content-Description: Message signed with OpenPGP using GPGMail

-----BEGIN PGP SIGNATURE-----
Comment: GPGTools - https://gpgtools.org

iEYEARECAAYFAlgHwO0ACgkQuwUzVZGdMxSQtQCfVQjr9DuP1IutmIaNTZ7z3SCi
brcAmQF9OapSeMdbWlqUd7ler08GgHIr
=1yyv
-----END PGP SIGNATURE-----

--Apple-Mail=_A530BC1A-FA4D-4680-9D1A-9396F846498C--
