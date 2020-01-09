Return-Path: <anibal.limon@linaro.org>
Received: from mail-vs1-f65.google.com (mail-vs1-f65.google.com
	[209.85.217.65])
	by mail.openembedded.org (Postfix) with ESMTP id 87B2F7FE1A
	for <openembedded-core@lists.openembedded.org>;
	Thu,  9 Jan 2020 14:51:51 +0000 (UTC)
Received: by mail-vs1-f65.google.com with SMTP id u14so4375503vsu.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 09 Jan 2020 06:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=IOFyCVgIYXiNb37PkQ0Trw209NlTl9bSzmU8b+cHG4s=;
	b=RtW6wfynOKqZ/IRxGeg/l9dpVlyxwsDEg+aVSEJxZLQZi3VZS6h53ORnooZEWnwcvp
	Zc52ebBB0cdF/q2Q/lhGckMWGC7oN9TTF2jduk23eI2OYs+NDrpgT/qGgklr6l87e4n0
	OMM3RsUq1NMlNBcPDRIV23dKn6jMMh+rrEDmnCOJrfStHTJLJUOox2DjN/OsgGTXPgXa
	w32uUD9YWBrX7vKIFgxnY3c464r1IlfZyN/CnpERhL2GnrfBif++43mpsoyeji+97XLr
	j6EB5RAg09pr5tnZXXpmKgViaF6tbwKfJTCcjwCm9N22tNvN8K1XHwIpfsAcGbDb9wHq
	wfvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=IOFyCVgIYXiNb37PkQ0Trw209NlTl9bSzmU8b+cHG4s=;
	b=UIVj28p2zSgW9nGT8w0myRZuM3feg2tJOW1MS6zU1aficTtBQf4NX4GM05M6XPPNv0
	F3QAn6NajL8Yl0km81qLwhx9vxQaIsl5iLfvfqhL4TtjLfHJF8+u6ltYdFMj8O+p17Xi
	XDmAjPpi6B4cAlRbliEo9VZy8Rf4E2Mmhsy+ZDVwbgJQyHG38Ebs/v82UGfIl7On6iIz
	+aA8bAFIhthzfQY46zjOq0ux+O2UXP7wfp/7XoQdgiyPqwxJYZDO4SVjmQ+KLBu2nhiN
	3NzOOlUTcz791Kdfmm8xUSbQFWRb/XhZUc/jcoA2g3YJ3vG/dKOt9OJlxYMYcIAEdwQG
	MDlA==
X-Gm-Message-State: APjAAAUE1Q55dsS9sgITvwfc9q226BoFYQs9Numn/2aS5H+wm0qxLoqi
	Hxm0GYVfqjpwquHPiEjlTU102at6zZ/iV5EnXPF4hw==
X-Google-Smtp-Source: APXvYqw5fAaWlQcHg8qwqXXQqJZ/G60H81/YQ4VS98ErTUSVUsKRvc1zXesiLYbQs7c+s7R2QeLbxbz7T1YQwvbK0x8=
X-Received: by 2002:a67:c204:: with SMTP id i4mr1120710vsj.118.1578581512421; 
	Thu, 09 Jan 2020 06:51:52 -0800 (PST)
MIME-Version: 1.0
References: <20200109014307.37924-1-anibal.limon@linaro.org>
	<CANNYZj97iX9P1LFajY1GjQQ2JjEYP4EppaCM8YpHnt=QJ2TNcA@mail.gmail.com>
In-Reply-To: <CANNYZj97iX9P1LFajY1GjQQ2JjEYP4EppaCM8YpHnt=QJ2TNcA@mail.gmail.com>
From: Anibal Limon <anibal.limon@linaro.org>
Date: Thu, 9 Jan 2020 08:51:41 -0600
Message-ID: <CA+_Aqisqk-UdMMQAUKNkWvf0k1pMf98rH_JWQ4wZTdh7Z=X9Qw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] meta/classes/menson.bbclass: Add python3 dependency
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
X-List-Received-Date: Thu, 09 Jan 2020 14:51:51 -0000
Content-Type: multipart/alternative; boundary="0000000000004c1ebe059bb6262e"

--0000000000004c1ebe059bb6262e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 9 Jan 2020 at 05:23, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Thu, 9 Jan 2020 at 02:43, An=C3=ADbal Lim=C3=B3n <anibal.limon@linaro.=
org> wrote:
>
>> -DEPENDS_append =3D " meson-native ninja-native"
>> +DEPENDS_append =3D " meson-native ninja-native python3"
>>
>
> Apologies, but I cannot accept this. Not all meson-based components even
> ask for python, and this adds a non-trivial (built time wise) target
> dependency to them all. There is also the potential to create circular
> dependencies some time in the future if something required by target pyth=
on
> switches over to meson.
>
> I suggest you rather patch meson itself, so that the python probe
> implemented there does not import a target module.
>

This issue comes from python3native.bbclass when use python target library
and include dirs and set _sysconfigdata too.

...
export PYTHON_LIBRARY=3D"${STAGING_LIBDIR}/lib${PYTHON_DIR}${PYTHON_ABI}.so=
"
export PYTHON_INCLUDE_DIR=3D"${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}"

export _PYTHON_SYSCONFIGDATA_NAME=3D"_sysconfigdata"
...

Menson python module uses it to get python interpreter information to build
[1], I agree that not all recipes uses menson + python but it is
a single point to patch.

I understand the implications of build time being increase so the other
option is to add the dependency only on waffle.

Comments?

Regards,
Anibal

[1]
https://github.com/mesonbuild/meson/blob/master/mesonbuild/modules/python.p=
y#L262


>
> Alex
>

--0000000000004c1ebe059bb6262e
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Thu, 9 Jan 2020 at 05:23, Alexande=
r Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x"><div dir=3D"ltr"><div dir=3D"ltr">On Thu, 9 Jan 2020 at 02:43, An=C3=ADb=
al Lim=C3=B3n &lt;<a href=3D"mailto:anibal.limon@linaro.org" target=3D"_bla=
nk">anibal.limon@linaro.org</a>&gt; wrote:<br></div><div class=3D"gmail_quo=
te"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">-DEPENDS_append =3D &=
quot; meson-native ninja-native&quot;<br>
+DEPENDS_append =3D &quot; meson-native ninja-native python3&quot;<br></blo=
ckquote><div><br></div><div>Apologies, but I cannot accept this. Not all me=
son-based components even ask for python, and this adds a non-trivial (buil=
t time wise) target dependency to them all. There is also the potential to =
create circular dependencies some time in the future if something required =
by target python switches over to meson.</div><div><br></div><div>I suggest=
 you rather patch meson itself, so that the python probe implemented there =
does not import a target module.</div></div></div></blockquote><div><br></d=
iv><div><div>This issue comes from python3native.bbclass when use python ta=
rget library and include dirs and set _sysconfigdata too.=C2=A0</div><div><=
br></div><div>...</div><div>export PYTHON_LIBRARY=3D&quot;${STAGING_LIBDIR}=
/lib${PYTHON_DIR}${PYTHON_ABI}.so&quot;<br>export PYTHON_INCLUDE_DIR=3D&quo=
t;${STAGING_INCDIR}/${PYTHON_DIR}${PYTHON_ABI}&quot;<br><br>export _PYTHON_=
SYSCONFIGDATA_NAME=3D&quot;_sysconfigdata&quot;<br></div><div>...=C2=A0</di=
v><div><br></div><div>Menson python module uses it to get python interprete=
r=C2=A0information to build [1], I agree that not all recipes uses menson +=
 python but it is</div><div>a single point to patch.</div><div><br></div><d=
iv>I understand the implications of build time being increase so the other =
option is to add the dependency only on waffle.</div><div><br></div><div>Co=
mments?</div><div><br></div><div>Regards,<br></div><div>Anibal</div><div><b=
r></div><div><div>[1]=C2=A0<a href=3D"https://github.com/mesonbuild/meson/b=
lob/master/mesonbuild/modules/python.py#L262" target=3D"_blank">https://git=
hub.com/mesonbuild/meson/blob/master/mesonbuild/modules/python.py#L262</a><=
/div></div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_quote"><div><br></div><div>=
Alex<br></div></div></div>
</blockquote></div></div>

--0000000000004c1ebe059bb6262e--
