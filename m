Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f176.google.com (mail-qc0-f176.google.com
	[209.85.216.176])
	by mail.openembedded.org (Postfix) with ESMTP id A988465C91
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 11:20:23 +0000 (UTC)
Received: by mail-qc0-f176.google.com with SMTP id i17so1942220qcy.35
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Nov 2014 03:20:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=M6GT54vTNnuDUPbTwkFIZRTdCTzU8TvQOH6h6Bf/uh4=;
	b=QFeJbjyIMtlyrgiB3h4RBDRY7HiKA+ghsJgsd0pSeOFAHAd1aQucEihuVSbfCIngE2
	TmkSn5XQCyPqsK+Rhvqop0WZC/qkvIbgRV6C4HrlITOgvj4iEQTxRF2OkO5dv8XcoSJe
	WMF7I6cAle59ma0w+dxXFDQOmXgdGfv+IMcs9I1QnvcgSh1GJE6zZAMsL+GB64EGa4vM
	koUsP5Vm2+9Ri6kLbYw57E6uugwKbbzTIiph6HrVodEBQXss18Y+3WsnYXiUhk1wvYRG
	F7szxGi0rz1i4RJh10iwxVLAmbVt25uJDS4QhlYnP1Mxb9wjIdbfhZPXhZPRmbp3kxQd
	OpJA==
X-Gm-Message-State: ALoCoQmnthYUV2UulHEmfdj7lp7FQQ6GQ6nZI/A9EcUVc79Zeu9OwHdd3O//HEqmLKiLtnoA8MrG
X-Received: by 10.140.17.67 with SMTP id 61mr58138186qgc.59.1416482423698;
	Thu, 20 Nov 2014 03:20:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.231 with HTTP; Thu, 20 Nov 2014 03:20:03 -0800 (PST)
In-Reply-To: <6d00e71e0db5fd70243f69bbd6894a296620a41c.1416295260.git.Chong.Lu@windriver.com>
References: <cover.1416295260.git.Chong.Lu@windriver.com>
	<6d00e71e0db5fd70243f69bbd6894a296620a41c.1416295260.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Nov 2014 11:20:03 +0000
Message-ID: <CAJTo0Lb48t-x82qYKAmOY5TmvbWmNvSHV2tSkT+JqyLXcDjxtw@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] bison: update to 3.0.2
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
X-List-Received-Date: Thu, 20 Nov 2014 11:20:29 -0000
Content-Type: multipart/alternative; boundary=001a11c0fa28b2191a050848839d

--001a11c0fa28b2191a050848839d
Content-Type: text/plain; charset=UTF-8

On 18 November 2014 07:22, Chong Lu <Chong.Lu@windriver.com> wrote:

> Upgrade bison to 3.0.2.
>

In testing glibc fails to build on some arches and this patch may be the
cause:

| plural.c: In function '__gettextparse':
| plural.c:64:25: error: too few arguments to function '__gettextlex'
|  #define yylex           __gettextlex
|                          ^
| plural.c:1296:16: note: in expansion of macro 'yylex'
|        yychar = yylex (&yylval);
|                 ^
| plural.c:64:25: note: declared here
|  #define yylex           __gettextlex
|                          ^
| plural.y:69:12: note: in expansion of macro 'yylex'
|  static int yylex PARAMS ((YYSTYPE *lval, const char **pexp));
|             ^
| plural.y:178:29: error: 'arg' undeclared (first use in this function)
|       ((struct parse_args *) arg)->res = $1;

Does that look like something that bison 3 broke?  If so we need to fix
glibc.

Ross

--001a11c0fa28b2191a050848839d
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 November 2014 07:22, Chong Lu <span dir=3D"ltr">&lt;<a href=3D"mailto=
:Chong.Lu@windriver.com" target=3D"_blank">Chong.Lu@windriver.com</a>&gt;</=
span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,204);border-le=
ft-style:solid;padding-left:1ex"><div id=3D":2i1" class=3D"" style=3D"overf=
low:hidden">Upgrade <span class=3D"">bison</span> to 3.0.2.<br></div></bloc=
kquote></div><div class=3D"gmail_extra"><br></div>In testing glibc fails to=
 build on some arches and this patch may be the cause:</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_extra"=
>| plural.c: In function &#39;__gettextparse&#39;:</div><div class=3D"gmail=
_extra">| plural.c:64:25: error: too few arguments to function &#39;__gette=
xtlex&#39;</div><div class=3D"gmail_extra">| =C2=A0#define yylex =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 __gettextlex</div><div class=3D"gmail_extra">| =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0^</div><div class=3D"gmail_extra">| plural.c:1296:16: note: in=
 expansion of macro &#39;yylex&#39;</div><div class=3D"gmail_extra">| =C2=
=A0 =C2=A0 =C2=A0 =C2=A0yychar =3D yylex (&amp;yylval);</div><div class=3D"=
gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</d=
iv><div class=3D"gmail_extra">| plural.c:64:25: note: declared here</div><d=
iv class=3D"gmail_extra">| =C2=A0#define yylex =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 __gettextlex</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^</div=
><div class=3D"gmail_extra">| plural.y:69:12: note: in expansion of macro &=
#39;yylex&#39;</div><div class=3D"gmail_extra">| =C2=A0static int yylex PAR=
AMS ((YYSTYPE *lval, const char **pexp));</div><div class=3D"gmail_extra">|=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ^</div><div class=3D"gmail_extra=
">| plural.y:178:29: error: &#39;arg&#39; undeclared (first use in this fun=
ction)</div><div class=3D"gmail_extra">| =C2=A0 =C2=A0 =C2=A0 ((struct pars=
e_args *) arg)-&gt;res =3D $1;</div><div class=3D"gmail_extra"><br></div><d=
iv class=3D"gmail_extra">Does that look like something that bison 3 broke?=
=C2=A0 If so we need to fix glibc.</div><div class=3D"gmail_extra"><br></di=
v><div class=3D"gmail_extra">Ross</div></div></div>

--001a11c0fa28b2191a050848839d--
