Return-Path: <ross@burtonini.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 09B6D60C10
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Feb 2020 22:37:15 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id h23so3280ljc.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Feb 2020 14:37:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=burtonini-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=UF/ITG7oUgQ2I1SNT+0q4TqwnIlgcNPbsVkJtfbsujQ=;
	b=y4xpdfLocq4swMmjs9sy9oxm16NnPnSTrGMeIJwg1qHavuoNW1+9fDn9h/5Gy4xQm4
	dwpxWmIU8JzNZ4gs6iwxQp6JsKD23vrzwoOldzBbCsapygxNs0TjTgyZDqe55a9Ie6Mq
	VzYpC9Ju7xjTUCy557jk+vyIoFW6cFIuDUvEdRmgAPrDb+kXDgRwoyFO+3qjUtAaY3zU
	wUi4W17yZVtuqtnIB9kiUKovOh6u6E38DJskhlUNVgpcXNeR99VRIiJtII92opCfNapA
	HtUZP10O4uq8ph7DgFwc1N/hKZXwW+M/KBrIf+eE1n9IN+6pzsOvm0yyRBS7c5HIiWTg
	h7tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=UF/ITG7oUgQ2I1SNT+0q4TqwnIlgcNPbsVkJtfbsujQ=;
	b=A62ZbKCksFijArjFY8i7oDk3/1iyzXiqrteITzTkA2U3vcfrApBr/L1pRin4GLQqmi
	RozQL+2IdlFjrM31f0I+5lVx32fKhVv+EhWjtYWR2azeJqOYUDt87321YLhnMCJx0hKl
	66urYJcsmZOcK/1CoP9y3R45JF2vbXflDcrx5ZQ1R+IJoRuFheZjrDXbeHsXw+YfQlxq
	k8xdiXSzfgQPsnIV3ZHjiOOq/EnK1tOHvAA5VfaD0kGuDd9MxoiJ/bI6ACJRzYt/ohih
	+Eg8+BaVMz4xqZnWCj77yTbu6gzVwseKs12nyqKEtl2l8cLBVRCizVFM7rh3mHwgn98W
	12Zw==
X-Gm-Message-State: APjAAAXvMKoOYA5OdwsOshwErVuPpzFlqyAviMNA3PvbXwxJpN7qUI69
	WtWTwSem76NagmKQlzIy7kS8S4nbPoToMhzhqP5npw==
X-Google-Smtp-Source: APXvYqycoVz/SxCTx379cZY82m5ANyg1U339SF4oZ2PQ71aMOoTVHMdlcB4aEXMXLMBvTEgyCTJJo9qGfd0kmvARSYI=
X-Received: by 2002:a2e:8e84:: with SMTP id z4mr3270639ljk.207.1581028636411; 
	Thu, 06 Feb 2020 14:37:16 -0800 (PST)
MIME-Version: 1.0
References: <20200206220704.1109-1-ross@burtonini.com>
	<CANNYZj_qsWW4cugUQHzVRx6Z+WRaFbayQs8-hfEd71n6vOuJMA@mail.gmail.com>
In-Reply-To: <CANNYZj_qsWW4cugUQHzVRx6Z+WRaFbayQs8-hfEd71n6vOuJMA@mail.gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Thu, 6 Feb 2020 22:37:05 +0000
Message-ID: <CAAnfSTu9e1arn0fJV0Gw0GZP16TSfkJVshsWYS0-d3xTowe-ow@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] perl: don't package the host configuration
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
X-List-Received-Date: Thu, 06 Feb 2020 22:37:16 -0000
Content-Type: multipart/alternative; boundary="00000000000040d727059defea2e"

--00000000000040d727059defea2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Note to self: it=E2=80=99s time to stop working.

On Thu, 6 Feb 2020 at 22:16, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> My patch is more comprehensive, as it also adjusts the ptests ;)
>
> Alex
>
> On Thu, 6 Feb 2020 at 23:07, Ross Burton <ross@burtonini.com> wrote:
>
>> From: Ross Burton <ross.burton@intel.com>
>>
>> `make install` installs xconfig.h, which is the configuration of the
>> *build host* used when building miniperl, used to bootstrap the Perl
>> build.
>>
>> As this changes depending on the build host, remove don't install it.
>>
>> [ YOCTO #13372 ]
>>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta/recipes-devtools/perl/perl_5.30.1.bb | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/recipes-devtools/perl/perl_5.30.1.bb
>> b/meta/recipes-devtools/perl/perl_5.30.1.bb
>> index d4b6bb32b43..8af9dfa4a2c 100644
>> --- a/meta/recipes-devtools/perl/perl_5.30.1.bb
>> +++ b/meta/recipes-devtools/perl/perl_5.30.1.bb
>> @@ -139,6 +139,10 @@ do_install() {
>>      # Fix up shared library
>>      rm ${D}/${libdir}/perl5/${PV}/*/CORE/libperl.so
>>      ln -sf ../../../../libperl.so.${PERL_LIB_VER} $(echo
>> ${D}/${libdir}/perl5/${PV}/*/CORE)/libperl.so
>> +
>> +    # This is the native configuration for the bootstrap perl, don't
>> need it
>> +    # packaged.
>> +    rm -f ${D}${libdir}/perl5/${PV}/*/CORE/xconfig.h
>>  }
>>
>>  do_install_append_class-target() {
>> --
>> 2.20.1
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--00000000000040d727059defea2e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><div dir=3D"auto">Note to self: it=E2=80=99s time to stop working.</di=
v></div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 6 Feb 2020 at 22:16, Alexander Kanavin &lt;<a href=3D"mailto=
:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb(=
204,204,204)"><div dir=3D"ltr"><div>My patch is more comprehensive, as it a=
lso adjusts the ptests ;)</div><div><br></div><div>Alex<br></div></div><br>=
<div class=3D"gmail_quote"></div><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Thu, 6 Feb 2020 at 23:07, Ross Burton &lt;<a href=
=3D"mailto:ross@burtonini.com" target=3D"_blank">ross@burtonini.com</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left-width:1px;border-left-style:solid;padding-left:1ex;bo=
rder-left-color:rgb(204,204,204)">From: Ross Burton &lt;<a href=3D"mailto:r=
oss.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&gt;<br>
<br>
`make install` installs xconfig.h, which is the configuration of the<br>
*build host* used when building miniperl, used to bootstrap the Perl<br>
build.<br>
<br>
As this changes depending on the build host, remove don&#39;t install it.<b=
r>
<br>
[ YOCTO #13372 ]<br>
<br>
Signed-off-by: Ross Burton &lt;<a href=3D"mailto:ross.burton@intel.com" tar=
get=3D"_blank">ross.burton@intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.30.1.bb</a> | 4 ++++<br>
=C2=A01 file changed, 4 insertions(+)<br>
<br>
diff --git a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.1.bb" r=
el=3D"noreferrer" target=3D"_blank">perl_5.30.1.bb</a> b/meta/recipes-devto=
ols/perl/<a href=3D"http://perl_5.30.1.bb" rel=3D"noreferrer" target=3D"_bl=
ank">perl_5.30.1.bb</a><br>
index d4b6bb32b43..8af9dfa4a2c 100644<br>
--- a/meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.30.1.bb</a><br>
+++ b/meta/recipes-devtools/perl/<a href=3D"http://perl_5.30.1.bb" rel=3D"n=
oreferrer" target=3D"_blank">perl_5.30.1.bb</a><br>
@@ -139,6 +139,10 @@ do_install() {<br>
=C2=A0 =C2=A0 =C2=A0# Fix up shared library<br>
=C2=A0 =C2=A0 =C2=A0rm ${D}/${libdir}/perl5/${PV}/*/CORE/libperl.so<br>
=C2=A0 =C2=A0 =C2=A0ln -sf ../../../../libperl.so.${PERL_LIB_VER} $(echo ${=
D}/${libdir}/perl5/${PV}/*/CORE)/libperl.so<br>
+<br>
+=C2=A0 =C2=A0 # This is the native configuration for the bootstrap perl, d=
on&#39;t need it<br>
+=C2=A0 =C2=A0 # packaged.<br>
+=C2=A0 =C2=A0 rm -f ${D}${libdir}/perl5/${PV}/*/CORE/xconfig.h<br>
=C2=A0}<br>
<br>
=C2=A0do_install_append_class-target() {<br>
-- <br>
2.20.1<br>
<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>
</blockquote></div></div>

--00000000000040d727059defea2e--
