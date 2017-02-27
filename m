Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id 69A3F71DC7;
	Mon, 27 Feb 2017 12:29:57 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id v77so59824746wmv.1;
	Mon, 27 Feb 2017 04:29:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=EZQskWcrWmnYh+GP3oVmKQ6R3/eo0IB74lMmuxh9/is=;
	b=Fcr/S+snrpS0/FkL7KqAmDJVcFhrB8IQVjNGhusTduPXuEFWkuIiRjwzRRoCwB9wMV
	8nu7dzUcUDuB0pjwVrhb1WpVzSRG9VJgSiRLNsOWsS397EapCHJpY6QkhvFEWLuBxVUO
	QVmi7GKEGdyq4FGzT1nNA5vQx4a+IXuM9qyoR9TT/Lou1HVOKjQ1bVE1yLCPm2R3yvE0
	JoE9thD+sQtPjXtZ60cQm18a3cgjdi7QPLl43qO59iPej4+fyKk9kL9yf3+q7gPOJPZg
	PPxAtQ3HV3Q/m5FqcUH4jVt5OIqCOB5IvjQ4VpfQHbux3ia6Ok1k7J6wb+uduW0jiatD
	1CAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=EZQskWcrWmnYh+GP3oVmKQ6R3/eo0IB74lMmuxh9/is=;
	b=pLI5Is0esslyfG7yV1XRFZxmWlsoZkpWc4MXVk6ZcWVb6jAljtE1u0BYn+2J5tKdGL
	ZGT14mIt08C1Xxqn1uGFQWmi+u1CQLtODpu4x1pEqCNSB+5GCp9JUGoWtfuRantwVMt8
	dsDixKuGru6iVJBOEaoDkgeEkHt9e37zann7NM15Xs7zRcq5ow5mXFNSMHAiq8eRJA9j
	QzQgpLBeBzCkqo9CIMg4nqEsIgxozvpwsrZSBhCLtkJWY73KDBZGtBMLfzxqxXQiS8VD
	DAOKbmUp9bZfMjikV5chEn0WkdJCuTY1ehLGC7BGbIuH6R7FeRFFHv+mwHpnpbQIerLj
	tevA==
X-Gm-Message-State: AMke39nggSi/6Mg779PtjzPRgvLVEzNTxqV2S8TpYs4LIoyU+/uKTPRpRWc3mtSbCG7NJOkpMbp0tX/zDqyGJA==
X-Received: by 10.28.74.69 with SMTP id x66mr12848659wma.124.1488198598095;
	Mon, 27 Feb 2017 04:29:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.80.145.24 with HTTP; Mon, 27 Feb 2017 04:29:57 -0800 (PST)
In-Reply-To: <CAJTo0LZy--6KGkcfumi=_mkRpW9YryFFfAofK5T7jkuO3hik3Q@mail.gmail.com>
References: <20170223222004.GA23285@jama>
	<CAJTo0LZy--6KGkcfumi=_mkRpW9YryFFfAofK5T7jkuO3hik3Q@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Mon, 27 Feb 2017 13:29:57 +0100
Message-ID: <CA+chaQfFmuR8ZpMgLzVMsMvqdkWjyPE6CGUJrtOO9LrSBdmibw@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: State of bitbake world, Failed tasks 2017-02-23
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
X-List-Received-Date: Mon, 27 Feb 2017 12:29:57 -0000
Content-Type: multipart/alternative; boundary=94eb2c0706e8cb7d9d0549823c0e

--94eb2c0706e8cb7d9d0549823c0e
Content-Type: text/plain; charset=UTF-8

Yes, it is reproduced only when ld-is-gold and ptest are used in
DISTRO_FEATURES.

On Mon, Feb 27, 2017 at 12:50 PM, Burton, Ross <ross.burton@intel.com>
wrote:

>
> On 23 February 2017 at 22:20, Martin Jansa <martin.jansa@gmail.com> wrote:
>
>> === common (2) ===
>>     * openembedded-core/meta/recipes-extended/parted/parted_3.2.
>> bb:do_compile_ptest_base
>>     * openembedded-core/meta/recipes-support/apr/apr_1.5.2.bb:do_
>> compile_ptest_base
>>
>
> FWIW neither me nor the yocto autobuilder sees these, so I suspect they're
> ld-is-gold related.
>
> Ross
>

--94eb2c0706e8cb7d9d0549823c0e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Yes, it is reproduced only when ld-is-gold and ptest are u=
sed in DISTRO_FEATURES.</div><div class=3D"gmail_extra"><br><div class=3D"g=
mail_quote">On Mon, Feb 27, 2017 at 12:50 PM, Burton, Ross <span dir=3D"ltr=
">&lt;<a href=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burto=
n@intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div di=
r=3D"ltr"><div class=3D"gmail_extra"><span class=3D""><br><div class=3D"gma=
il_quote">On 23 February 2017 at 22:20, Martin Jansa <span dir=3D"ltr">&lt;=
<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gm=
ail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
m_-9186343667207052792:6ef" class=3D"m_-9186343667207052792a3s m_-918634366=
7207052792aXjCH m_-9186343667207052792m15a6d0fb201895ee">=3D=3D=3D common (=
2) =3D=3D=3D<br>
=C2=A0 =C2=A0 * openembedded-core/meta/recipes<wbr>-extended/parted/parted_=
3.2.<wbr>bb:do_compile_ptest_base<br>
=C2=A0 =C2=A0 * openembedded-core/meta/recipes<wbr>-support/apr/apr_1.5.2.b=
b:do_<wbr>compile_ptest_base<br></div></blockquote></div><br></span>FWIW ne=
ither me nor the yocto autobuilder sees these, so I suspect they&#39;re ld-=
is-gold related.</div><span class=3D"HOEnZb"><font color=3D"#888888"><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></font>=
</span></div>
</blockquote></div><br></div>

--94eb2c0706e8cb7d9d0549823c0e--
