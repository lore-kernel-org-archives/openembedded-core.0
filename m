Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.10684.1792510811393093740
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 08:40:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=AtuuRL3T;
 spf=pass (domain: gmail.com, ip: 209.85.128.179, mailfrom: raj.khem@gmail.com)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-8ac4806e210so23086477b3.1
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 08:40:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792510810; cv=none;
        d=google.com; s=arc-20260327;
        b=I8lW8TaogTFvwcW1dHoY5QSGtX9GSisGnSPWzEP80+Lcy6LgQhpn3T8uvFzw0rMYMY
         3OhiNSvQ5xamfKUaSb0jNUpyHhb5I/ZBvWesJ5rYXOia71Zyp/WpCnt+iv+A8jE7IVXx
         pSZWSwjyaY/pkz6Am0oDHy210LUKR4qNL1BSBT0sY5wlFYN9yavX8CiDqNK5Sxw77VO2
         DPN8TemIiOhFsTw3DfNjWsKUb2Nsj2OBEaTqGNwMyKJs19YSVogryy4e5mkOd0N7f6A1
         t4ANKGTJD2Cx0SHYPN0VdWcRfQeki6G9ueMScHoRTJICHUE99z4qhIJasJUDie3IS49x
         9zsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=XwgQEVfsJs5zwi+wH1C6KuYS1X+GUnDDv9HC2As0j3k=;
        fh=D53iXobqCUJPE169wyPSmZF3DvfOHYm7FbZQF58V1Dc=;
        b=B42ZyYAkgiLknr2cRbXVDXcVOzNpkbNCjydsOfiZ+gx4Tz+lB7ZKdpjAGnOSmMeiMD
         dfQk9q10VUHqjEsPqW116AKoVjUrys6G9ozf0BbQx7o9WHqANUTktu8LTJmIh0mLVrjA
         ndVQXfmWhK/ALqdKh0hzKtryGt+ch4pjwagYcTMTA2KDK9VGzNhx03VoQVc80Hwdpxds
         244RX//Jgzy9ot2V6oeL8V1zII91hB9ZKIeWdrh5H7+Ce+JJZldXf0nHDwOt55YVgt6J
         7kwBwF5jBpljeVRUuiqhH4lgsKerLuj32LDNaFGVbdR5buGKd/vlQjwIfXlFtCiVgwjx
         OElA==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792510810; x=1793115610; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XwgQEVfsJs5zwi+wH1C6KuYS1X+GUnDDv9HC2As0j3k=;
        b=AtuuRL3TYz1D4j0eTZvjTrcb/zA6ACrqileXUiZOwArgcd7iQ2yNZI2m6vIG1OYqWi
         Xtw8n5jWxRVgZvylAEUBVyK2a2Jr8eOlYOmEmvOpeIHOE4/oyaqRtElBvPPC/F4cfIKy
         XG5X6xnyQ5rt8XcLrvennUCOYileKRuNlQo+WfgDVYThZBmUIfytBFB3BcmjeZ9ue2sV
         gT8mP3h/M8UNz7IDK10HJMZ5bd2qv0y74CBVcLzXDNd6nTEkvle4K4oQCjLJNRrCWfb+
         BPV2pnEfXGaXG6oORUQO5e/qGO1uPZR+uM11ggmrsZnoPPu45nThxpVtaRI/KClLmD0M
         bcmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792510810; x=1793115610;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=XwgQEVfsJs5zwi+wH1C6KuYS1X+GUnDDv9HC2As0j3k=;
        b=k+5AzJI7D6u32YrflTHARgFMOgGhn6RsCN6aYSuG1cvPme/tOQ3In8YhOKKZgbTEZ6
         EYMEjBjHXnd62bzinqkWOjNKMhHfmQb81x8VjcCj3/mVFacPhG4g1Z3YLB9LMmcv9ucQ
         T8vI6EkGsRfWuMdc+MDOLuQ51Senaib7c8AT/M252u5/jQoX5rVOMC4uQlpw89vrV0qm
         DZc2tzzga9pylhMdVluUVjrFkf0TfopK/DnX5gFaV4BLzQ3qnJHpARZSf+hRNSTmp6zI
         gMSNKhAWhGY/lgExqsmdWw5TsQ5+27JeTND1LArX8GQiGbteHBirqUiVr4kyw6gN8iwx
         if6w==
X-Gm-Message-State: AFq9FYJgMi4BhGNJd3tvb4r6VPYMz8rllqeDJK7McyMCD2SWaUsweCSv
	Tyn/E/K7lPWcNU5oRC5rnasGeQctjiU+cxStcIMTLLhdwyfFAnjO5KX/sdnfCeKz4rKzJQW9vLj
	63Ku7ox84up6CusAKxMIceHNMyt883KE=
X-Gm-Gg: AYBFou3SVf2EPHECQUYqIogdebeIWoxhGjIp/fdiJ18OqK7qFH+4FZH/L9UDCwJP2Kz
	u3QX6zJsHE4Oiw8cDHTS54dz1Cv+4jlsQj793DWwm45pYvSm6SBHeLg0yIdOT7ZNeKyk/9r25MI
	EE+KIfOccYzOCuAW49JrFNihJFs9tSNne1aPbwGni5GZov6k54zS7uS5MvfDwdgYeQJ9ElcGNi9
	c3n8fvbuYwveRue1f5/9nZ89pt6Bmdz58pzKeJTY9vu2tNtlq+U6fKULMABmsEsUzeqLNfm46Pu
	qiRwu0u5p4mEApvqVp36D2QNWWAdXX8Ji8VTBZtVH65Ij6xjgGxpODLulOZONnXl7W8kmwyVF9k
	XKoxcdasJR2tt2bZvf3hvZVKXFlqfiU5bitaVjJuXyNSuvKjgt1GpD4dSTdFTL9Gw/5kCKBX5Cf
	/v/VyE8gveGVDk1uu3/gQnjswreXDkUVgAByYNnQKKrErhVC/xJAEnKZ6mV0eTePp01J6QpwGwx
	IptSB0vqT8Q+9SJIPTHZ0KttQ2R1rAo+fqWPEljQtfEbduqhL3gJ54xXMNKtalIoz1JBYtYUW++
	Uux1C0JhmHxsFNu1aGJ0vGwQfTEza5+Hmlk2Dfs=
X-Received: by 2002:a05:690c:4:b0:8b0:e238:2719 with SMTP id
 00721157ae682-8b0f2173795mr44611157b3.31.1792510810154; Tue, 20 Oct 2026
 08:40:10 -0700 (PDT)
MIME-Version: 1.0
References: <20261008090135.1485765-1-vanusuri@mvista.com> <2200835.1792497913489677566@lists.openembedded.org>
In-Reply-To: <2200835.1792497913489677566@lists.openembedded.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 20 Oct 2026 08:39:44 -0700
X-Gm-Features: AclHuK9lex1QBigQNujH4F0bRzRd2yCCXVcNqavgVGHA8QNdLeGWCqrG_YjsxKI
Message-ID: <CAMKF1srPKNJzj=-yz2hU-KoqnfeznWtWe0w0j7DfY2cjvcaieg@mail.gmail.com>
Subject: Re: [OE-core] [patch] python3: upgrade 3.14.7 -> 3.14.8
To: dkelaiya@cisco.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000001869b8065e47727b"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 15:40:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248304

--0000000000001869b8065e47727b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 20, 2026 at 5:05=E2=80=AFAM Darsh Kelaiya -X (dkelaiya - E INFO=
CHIPS
PRIVATE LIMITED at Cisco) via lists.openembedded.org <dkelaiya=3D
cisco.com@lists.openembedded.org> wrote:

> Hello Vijay, Ross,
>
> I reviewed the 3.14.8 upgrade. The downloaded source tarball=E2=80=99s SH=
A-256
> matches the recipe, and the retained source patches apply without fuzz.
>
> Following Ross=E2=80=99s upstream report [1], I inspected libedit=E2=80=
=99s history append
> path. append_history() opens the file with fopen(filename, "a"), and
> history_save_fp() writes the _HiStOrY_V2_ header whenever ftell() returns
> zero.
>
> If the append stream initially reports offset zero on musl, this would
> cause another header to be appended to an existing history file. That is
> consistent with the reported result where the header appears as a history
> entry after truncation.
>
> This suggests a history handling issue that needs investigation before
> deciding whether a test skip is appropriate. Could you check whether
> explicitly positioning the append stream at EOF before saving resolves th=
e
> failure, and share the result in the upstream issue?
>
> This analysis is based on source inspection. I have not independently
> reproduced the musl failure.
>
> [1] https://github.com/python/cpython/issues/159424
>

I wonder why you did not look into the fix

https://github.com/python/cpython/pull/157165

which is also posted in the above
bug report. Does this fix the issue ?


>
>
> Thanks,
> Darsh
>
> On Thu, Oct 8, 2026 at 02:31 PM, Vijay Anusuri wrote:
>
> Release information:
> * https://www.python.org/downloads/release/python-3148/
> * Python 3.14.8 is an expedited security release and the eighth
> maintenance release of 3.14, containing around 354 bugfixes, build
> improvements and documentation changes from 142 contributors since 3.14.7=
.
>
> Handles CVE-2026-19445 CVE-2026-19553 CVE-2026-19672 CVE-2026-15310
> CVE-2026-15806 CVE-2026-17084
>
> Changelog:
> https://docs.python.org/3/whatsnew/changelog.html#python-3-14-8-final
>
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
> .../python/{python3_3.14.7.bb =3D> python3_3.14.8.bb} | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
> rename meta/recipes-devtools/python/{python3_3.14.7.bb =3D>
> python3_3.14.8.bb} (99%)
>
> diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb
> b/meta/recipes-devtools/python/python3_3.14.8.bb
> similarity index 99%
> rename from meta/recipes-devtools/python/python3_3.14.7.bb
> rename to meta/recipes-devtools/python/python3_3.14.8.bb
> index f917edebd8..4663ee85cd 100644
> --- a/meta/recipes-devtools/python/python3_3.14.7.bb
> +++ b/meta/recipes-devtools/python/python3_3.14.8.bb
> @@ -30,7 +30,7 @@ SRC_URI:append:class-native =3D " \
> file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
> "
>
> -SRC_URI[sha256sum] =3D
> "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81"
> +SRC_URI[sha256sum] =3D
> "c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73"
>
> # exclude pre-releases for both python 2.x and 3.x
> UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
> --
> 2.43.0
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248274):
> https://lists.openembedded.org/g/openembedded-core/message/248274
> Mute This Topic: https://lists.openembedded.org/mt/121652032/1997914
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000001869b8065e47727b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 20,=
 2026 at 5:05=E2=80=AFAM Darsh Kelaiya -X (dkelaiya - E INFOCHIPS PRIVATE L=
IMITED at Cisco) via <a href=3D"http://lists.openembedded.org">lists.openem=
bedded.org</a> &lt;dkelaiya=3D<a href=3D"mailto:cisco.com@lists.openembedde=
d.org">cisco.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div>Hello Vijay, Ross,<br><br>I rev=
iewed the 3.14.8 upgrade. The downloaded source tarball=E2=80=99s SHA-256 m=
atches the recipe, and the retained source patches apply without fuzz.<br><=
br>Following Ross=E2=80=99s upstream report [1], I inspected libedit=E2=80=
=99s history append path. append_history() opens the file with fopen(filena=
me, &quot;a&quot;), and history_save_fp() writes the _HiStOrY_V2_ header wh=
enever ftell() returns zero.<br><br>If the append stream initially reports =
offset zero on musl, this would cause another header to be appended to an e=
xisting history file. That is consistent with the reported result where the=
 header appears as a history entry after truncation.<br><br>This suggests a=
 history handling issue that needs investigation before deciding whether a =
test skip is appropriate. Could you check whether explicitly positioning th=
e append stream at EOF before saving resolves the failure, and share the re=
sult in the upstream issue?</div>
<div>=C2=A0</div>
<div>This analysis is based on source inspection. I have not independently =
reproduced the musl failure.</div>
<div><br>[1] <a href=3D"https://github.com/python/cpython/issues/159424" re=
l=3D"noopener" target=3D"_blank">https://github.com/python/cpython/issues/1=
59424</a></div></blockquote><div><br></div><div>I wonder why you did not lo=
ok into the fix=C2=A0</div><div><br></div><div><a href=3D"https://github.co=
m/python/cpython/pull/157165">https://github.com/python/cpython/pull/157165=
</a>=C2=A0</div><div><br></div><div>which is also posted in the above</div>=
<div>bug report. Does this fix the issue ?</div><div>=C2=A0</div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div><br><br>Thanks,<br>Darsh</div>
<div>=C2=A0</div>
<div>On Thu, Oct 8, 2026 at 02:31 PM, Vijay Anusuri wrote:</div>
<div>
<blockquote>Release information:<br>* <a href=3D"https://www.python.org/dow=
nloads/release/python-3148/" rel=3D"noopener" target=3D"_blank">https://www=
.python.org/downloads/release/python-3148/</a><br>* Python 3.14.8 is an exp=
edited security release and the eighth maintenance release of 3.14, contain=
ing around 354 bugfixes, build improvements and documentation changes from =
142 contributors since 3.14.7.<br><br>Handles CVE-2026-19445 CVE-2026-19553=
 CVE-2026-19672 CVE-2026-15310<br>CVE-2026-15806 CVE-2026-17084<br><br>Chan=
gelog: <a href=3D"https://docs.python.org/3/whatsnew/changelog.html#python-=
3-14-8-final" rel=3D"noopener" target=3D"_blank">https://docs.python.org/3/=
whatsnew/changelog.html#python-3-14-8-final</a><br><br>Signed-off-by: Vijay=
 Anusuri &lt;<a href=3D"mailto:vanusuri@mvista.com" target=3D"_blank">vanus=
uri@mvista.com</a>&gt;<br>---<br>.../python/{<a href=3D"http://python3_3.14=
.7.bb" target=3D"_blank">python3_3.14.7.bb</a> =3D&gt; <a href=3D"http://py=
thon3_3.14.8.bb" target=3D"_blank">python3_3.14.8.bb</a>} | 2 +-<br>1 file =
changed, 1 insertion(+), 1 deletion(-)<br>rename meta/recipes-devtools/pyth=
on/{<a href=3D"http://python3_3.14.7.bb" target=3D"_blank">python3_3.14.7.b=
b</a> =3D&gt; <a href=3D"http://python3_3.14.8.bb" target=3D"_blank">python=
3_3.14.8.bb</a>} (99%)<br><br>diff --git a/meta/recipes-devtools/python/<a =
href=3D"http://python3_3.14.7.bb" target=3D"_blank">python3_3.14.7.bb</a> b=
/meta/recipes-devtools/python/<a href=3D"http://python3_3.14.8.bb" target=
=3D"_blank">python3_3.14.8.bb</a><br>similarity index 99%<br>rename from me=
ta/recipes-devtools/python/<a href=3D"http://python3_3.14.7.bb" target=3D"_=
blank">python3_3.14.7.bb</a><br>rename to meta/recipes-devtools/python/<a h=
ref=3D"http://python3_3.14.8.bb" target=3D"_blank">python3_3.14.8.bb</a><br=
>index f917edebd8..4663ee85cd 100644<br>--- a/meta/recipes-devtools/python/=
<a href=3D"http://python3_3.14.7.bb" target=3D"_blank">python3_3.14.7.bb</a=
><br>+++ b/meta/recipes-devtools/python/<a href=3D"http://python3_3.14.8.bb=
" target=3D"_blank">python3_3.14.8.bb</a><br>@@ -30,7 +30,7 @@ SRC_URI:appe=
nd:class-native =3D &quot; \<br>file://0001-Lib-sysconfig.py-use-prefix-val=
ue-from-build-configu.patch \<br>&quot;<br><br>-SRC_URI[sha256sum] =3D &quo=
t;3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81&quot;<br=
>+SRC_URI[sha256sum] =3D &quot;c2215904f02b175596dc49351585104f4bc20341e1c4=
7378b26a2c274360ce73&quot;<br><br># exclude pre-releases for both python 2.=
x and 3.x<br>UPSTREAM_CHECK_REGEX =3D &quot;[Pp]ython-(?P&lt;pver&gt;\d+(\.=
\d+)+).tar&quot;<br>-- <br>2.43.0</blockquote>
</div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#248274): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/248274" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/248274</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121652032/199=
7914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121652032/1997914</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000001869b8065e47727b--
