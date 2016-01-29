Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f178.google.com (mail-io0-f178.google.com
	[209.85.223.178])
	by mail.openembedded.org (Postfix) with ESMTP id 61FEE771A2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 12:38:21 +0000 (UTC)
Received: by mail-io0-f178.google.com with SMTP id 9so8448584iom.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 29 Jan 2016 04:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vKMwinC4kkvrpIiqd2AFDPCtuUW5YEaXsKscSY1n8Ew=;
	b=A1pOnY/Op4ZtIyQkbUMlmUio4/c10h5RIxzkVUuaF89pdW06YjKmP0NveWYsZyATpN
	75mGi4ZDk9EkJ3ZqFz6wcdd7ZeqH/WfbDmIgU7SAR6yqnLmnhNutghpTdd8JE9x5csWf
	expCwe0aDgxOOzmySYzmTq9c096/SEujG3Piq2Ss9J6mhULOJp1w9LpNGwzytZMkvt5x
	Cn+h4yVcKjShdITJJAEu2iDEhvJk47iC8XKLZLn7JofYHQxPAP/TuoXHw0NY2FIJWePb
	Qhf7sK4EsmVv5OokJUhmwFHpEoirtgI70zk/VQH8XpB8v9OvKMWywUh7wS9NL1AmZpTk
	6UZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=vKMwinC4kkvrpIiqd2AFDPCtuUW5YEaXsKscSY1n8Ew=;
	b=AKLoX4kFWMzyl8DxuSuyR5Du2cpkGJgnwF1xl8nvcfjJ+E7aGSRdP/deLr7VeCy+Pt
	MTB7scajJe/tVMgs3VTG1pcVsqOT2DZVgMryHpcFQnli+WfToptwEQZSd98k5mrVH8yZ
	IXVLiZacB1jwADqJlMZn9/1o1l8/Z/fhtzfidjQVz0saR1kOGsZkgXx5L9Ru1Z0IqcG7
	TlaHffZI0ziwmrQ8C1YuWZaeONYXU6BvRQ1i9Sm9X5excArrLvALKSNlIJJzjzMxzg/5
	50jd4/sD9Kw02qy6zzYk4k1LqiAA/vbnCYnjTWdKxIGntuSztvcc6FN5LKgmJYISOvHJ
	+02A==
X-Gm-Message-State: AG10YOTQjzqqt6AveVbNwIOgfyrqF5QZqqy+KM2cmuACssKj7+LCoRqF+n60//l8AExo5L95OGKTOK8l+zJf8oLg
X-Received: by 10.107.135.104 with SMTP id j101mr10970125iod.133.1454071102675;
	Fri, 29 Jan 2016 04:38:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 29 Jan 2016 04:38:03 -0800 (PST)
In-Reply-To: <1454070169-9820-1-git-send-email-adrian.ratiu@ni.com>
References: <1454070169-9820-1-git-send-email-adrian.ratiu@ni.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 29 Jan 2016 12:38:03 +0000
Message-ID: <CAJTo0Lbkg_r_bL7ppM9yUNpwZP-dOVB8AWbuuciCnCYPGEAoTg@mail.gmail.com>
To: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
Cc: Jacob Champion <jacob.champion@ni.com>,
	Adam Chappell <adam.chappell@ni.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] apr-util: add ldap crypto and sqlite3 to PACKAGECONFIG
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
X-List-Received-Date: Fri, 29 Jan 2016 12:38:24 -0000
Content-Type: multipart/alternative; boundary=001a113ebe928db362052a784f44

--001a113ebe928db362052a784f44
Content-Type: text/plain; charset=UTF-8

On 29 January 2016 at 12:22, Ioan-Adrian Ratiu <adrian.ratiu@ni.com> wrote:

> +PACKAGECONFIG_append = " ldap crypto sqlite3"
>

Never use PACKAGECONFIG_append in a recipe as then they can't easily be
disabled.  Recipes should use PACAKGECONFIG??="options".

apr is used by more than just apache, and the need for LDAP and sqlite
isn't universal.  I think these should default to disabled and the the
user/distro/whatever can enable them if required.


> +PACKAGECONFIG[ldap] = "--with-ldap,,openldap,"
>

You need a --without-ldap here.


> +PACKAGECONFIG[crypto] = "--with-crypto,,,"
>

Dito.


> +PACKAGECONFIG[sqlite3] = "--with-sqlite3=${STAGING_DIR_HOST}${prefix},,,"
>

Ditto.

Also, there's no point adding extra trailing commas, they just look ugly.


> +FILES_${PN}     += "${libdir}/apr-util-1/apr_ldap-1.so"
> +FILES_${PN}-dev += "${libdir}/apr-util-1/apr_ldap.so*
> ${libdir}/apr-util-1/apr_ldap.la"
> +FILES_${PN}-staticdev += "${libdir}/apr-util-1/apr_ldap.a"
> +
> +FILES_${PN}     += "${libdir}/apr-util-1/apr_crypto_openssl-1.so"
> +FILES_${PN}-dev += "${libdir}/apr-util-1/apr_crypto_openssl.so*
> ${libdir}/apr-util-1/apr_crypto_openssl.la"
> +FILES_${PN}-staticdev += "${libdir}/apr-util-1/apr_crypto_openssl.a"
> +
> +FILES_${PN}     += "${libdir}/apr-util-1/apr_dbd_sqlite3-1.so"
> +FILES_${PN}-dev += "${libdir}/apr-util-1/apr_dbd_sqlite3.so*
> ${libdir}/apr-util-1/apr_dbd_sqlite3.la"
> +FILES_${PN}-staticdev += "${libdir}/apr-util-1/apr_dbd_sqlite3.a"
> +
>  FILES_${PN}     += "${libdir}/apr-util-1/apr_dbm_gdbm-1.so"
>  FILES_${PN}-dev += "${libdir}/aprutil.exp
> ${libdir}/apr-util-1/apr_dbm_gdbm.so* ${libdir}/apr-util-1/apr_dbm_gdbm.la
> "
>  FILES_${PN}-staticdev += "${libdir}/apr-util-1/apr_dbm_gdbm.a"
>

Please change the existing FILES_ to use globs instead of listing all the
files to match explicitly.

Ross

--001a113ebe928db362052a784f44
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 29 January 2016 at 12:22, Io=
an-Adrian Ratiu <span dir=3D"ltr">&lt;<a href=3D"mailto:adrian.ratiu@ni.com=
" target=3D"_blank">adrian.ratiu@ni.com</a>&gt;</span> wrote:<br><div class=
=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":28s" class=3D"a=
3s" style=3D"overflow:hidden">+PACKAGECONFIG_append =3D &quot; ldap crypto =
sqlite3&quot;<br></div></blockquote><div><br></div><div>Never use PACKAGECO=
NFIG_append in a recipe as then they can&#39;t easily be disabled.=C2=A0 Re=
cipes should use PACAKGECONFIG??=3D&quot;options&quot;.</div><div><br></div=
><div>apr is used by more than just apache, and the need for LDAP and sqlit=
e isn&#39;t universal.=C2=A0 I think these should default to disabled and t=
he the user/distro/whatever can enable them if required.</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex"><div id=3D":28s" class=3D"a3s" style=3D"=
overflow:hidden">
+PACKAGECONFIG[ldap] =3D &quot;--with-ldap,,openldap,&quot;<br></div></bloc=
kquote><div><br></div><div>You need a --without-ldap here.</div><div>=C2=A0=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-l=
eft:1px #ccc solid;padding-left:1ex"><div id=3D":28s" class=3D"a3s" style=
=3D"overflow:hidden">
+PACKAGECONFIG[crypto] =3D &quot;--with-crypto,,,&quot;<br></div></blockquo=
te><div><br></div><div>Dito.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div id=3D":28s" class=3D"a3s" style=3D"overflow:hidden">
+PACKAGECONFIG[sqlite3] =3D &quot;--with-sqlite3=3D${STAGING_DIR_HOST}${pre=
fix},,,&quot;<br></div></blockquote><div><br></div><div>Ditto.</div><div><b=
r></div><div>Also, there&#39;s no point adding extra trailing commas, they =
just look ugly.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div i=
d=3D":28s" class=3D"a3s" style=3D"overflow:hidden">+FILES_${PN}=C2=A0 =C2=
=A0 =C2=A0+=3D &quot;${libdir}/apr-util-1/apr_ldap-1.so&quot;<br>
+FILES_${PN}-dev +=3D &quot;${libdir}/apr-util-1/apr_ldap.so* ${libdir}/apr=
-util-1/<a href=3D"http://apr_ldap.la" rel=3D"noreferrer" target=3D"_blank"=
>apr_ldap.la</a>&quot;<br>
+FILES_${PN}-staticdev +=3D &quot;${libdir}/apr-util-1/apr_ldap.a&quot;<br>
+<br>
+FILES_${PN}=C2=A0 =C2=A0 =C2=A0+=3D &quot;${libdir}/apr-util-1/apr_crypto_=
openssl-1.so&quot;<br>
+FILES_${PN}-dev +=3D &quot;${libdir}/apr-util-1/apr_crypto_openssl.so* ${l=
ibdir}/apr-util-1/<a href=3D"http://apr_crypto_openssl.la" rel=3D"noreferre=
r" target=3D"_blank">apr_crypto_openssl.la</a>&quot;<br>
+FILES_${PN}-staticdev +=3D &quot;${libdir}/apr-util-1/apr_crypto_openssl.a=
&quot;<br>
+<br>
+FILES_${PN}=C2=A0 =C2=A0 =C2=A0+=3D &quot;${libdir}/apr-util-1/apr_dbd_sql=
ite3-1.so&quot;<br>
+FILES_${PN}-dev +=3D &quot;${libdir}/apr-util-1/apr_dbd_sqlite3.so* ${libd=
ir}/apr-util-1/<a href=3D"http://apr_dbd_sqlite3.la" rel=3D"noreferrer" tar=
get=3D"_blank">apr_dbd_sqlite3.la</a>&quot;<br>
+FILES_${PN}-staticdev +=3D &quot;${libdir}/apr-util-1/apr_dbd_sqlite3.a&qu=
ot;<br>
+<br>
=C2=A0FILES_${PN}=C2=A0 =C2=A0 =C2=A0+=3D &quot;${libdir}/apr-util-1/apr_db=
m_gdbm-1.so&quot;<br>
=C2=A0FILES_${PN}-dev +=3D &quot;${libdir}/aprutil.exp ${libdir}/apr-util-1=
/apr_dbm_gdbm.so* ${libdir}/apr-util-1/<a href=3D"http://apr_dbm_gdbm.la" r=
el=3D"noreferrer" target=3D"_blank">apr_dbm_gdbm.la</a>&quot;<br>
=C2=A0FILES_${PN}-staticdev +=3D &quot;${libdir}/apr-util-1/apr_dbm_gdbm.a&=
quot;</div></blockquote></div><br></div><div class=3D"gmail_extra">Please c=
hange the existing FILES_ to use globs instead of listing all the files to =
match explicitly.</div><div class=3D"gmail_extra"><br></div><div class=3D"g=
mail_extra">Ross</div></div>

--001a113ebe928db362052a784f44--
