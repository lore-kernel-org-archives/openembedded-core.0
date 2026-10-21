Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3125.1792550711873569291
 for <openembedded-core@lists.openembedded.org>;
 Tue, 20 Oct 2026 19:45:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=PTp8d8p2;
 spf=pass (domain: mvista.com, ip: 209.85.218.42, mailfrom: vanusuri@mvista.com)
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c3fd91337baso20036266b.3
        for <openembedded-core@lists.openembedded.org>; Tue, 20 Oct 2026 19:45:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792550710; cv=none;
        d=google.com; s=arc-20260327;
        b=G6g0SVVV9wjnR60J8HUGZI/kQaE/xhiBQRzVap8nm6e6hDnF9tvKWR7FFRs5DMehCJ
         psZPktsNgby/OXMBYC4IOPBJfcbY7w96E7BC+N9eP1Kjn/+nf1+T8Ht3Lp2A0TfudBTk
         bknTAYFkLkaNW36SVy4eVTtN6KqP9beZ68z7LwD5OjlFKaGSe5VEJzA4Mdy+jchdYM1t
         YwrsVS2WR9qq1W6sROukvOw8g6ZwhtkD4dL1R4FT87H20YZgwr/NKI63X+tuS2ErvFkM
         hL52otQYtLTyqU2zxK8kl7c2e0rbaE/w77lMXGFRz45E3+6c7FxfGrUvRNSIV3ivzTkX
         SfAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=+ZpFK0cafDKAtv3sOP0VpNhedICTxk2iJwNx9dpPo+w=;
        fh=6TNDk8lzinV+FHf41ZeJnx0eF0DjniDCKOpsw59+zis=;
        b=CR6xSUFp6IHOFowFuxBzCdwUSpYEEmbIsI/tseC5r0MzyAOiBVMv/oYJK0Ua3LGqLR
         idH/2nAKivZGSRBOMdr4x4mt3Lc/qzxPiCdwuRk5MVDjZhnVPrdSMY8/J7g2VTg+8Oh+
         iflt/Hx2FZoGaX5DJSnw2Uc7aMNsxBV41w8FjP4xJs7oY3ZmDHhkmZT9270RJvHrnTJC
         SZFwLrzVtM3bDdzZ7TKReWPcUm9CWBmWVWGRhgzbcwzVZBGJKkz+VC3KDsW5ct++qSyP
         WVDN9AZOx0WQGstFFpyGtMVLgTVqTTqHkEPG5UD8Kqq0t2UcclwasyHl4IktCO+nSVAK
         kn+A==;
        darn=lists.openembedded.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1792550710; x=1793155510; darn=lists.openembedded.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+ZpFK0cafDKAtv3sOP0VpNhedICTxk2iJwNx9dpPo+w=;
        b=PTp8d8p2mrt3ceGTf1q0i65vfZDrn+1+YVCq+uw83+iZZmly9w/OuL95GbCa3QcXIO
         oZHkreHHc/Ma1R94msweKNyWB7PaOVmdFOPEknTPG6eu56PyyUOnOGmlGxtXak2m22sp
         ZMqpRS2lz3WWnfgljVRQHzhybsB0bo8DHwyMk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792550710; x=1793155510;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+ZpFK0cafDKAtv3sOP0VpNhedICTxk2iJwNx9dpPo+w=;
        b=NJPge8R0hBGP54gfZjYXsU5kyRiO+bjQoFlFWhjlP7mtsfXh2tDgC4+fUOxA2HJiuf
         KR+FK+Vmqy5+iVPek7N+5JAtImgQgd8QYukGU3bEPnHiRSRd7GgdkXwLzK4hhWEzw51i
         U3AR9moQfQbxLL+p/l/xkOOAnup5t7WAHcUYJbXBq3Tr4ITRahHcNlb/BzgDiA4VzL93
         5WjFqfhLi5BjIMv1+Sm6l0nv6x1GnM+gRYmir8Z9KnAPh3AoG7D4u/NnBfEpNa3S4E+V
         WhyMgJF2fezBkA1H/8BsKoAJKL71Bzs1fpL/3yxXVsLp/woqRpqkamdEfJFs2WBIXoc7
         37Ww==
X-Forwarded-Encrypted: i=1; AKwUvBzg4DFWLKK3u8d0BT1ryeK22SJywSOnx/D1TKTY3givRh5ZcS+FWZ9NIcmLS/Ua03Y2jbiQ9Ii5H7ntFP7Fsl/huQ==@lists.openembedded.org
X-Gm-Message-State: AFq9FYLv/7sMuQ4nOG0JHLMyDS8dO2rUBmCmOk1Ves54+fbTsQ8oIJcI
	QuGCua8Sf40KdHNdxE1EOCR9ti1sh3WTJFDKj8BkaRGvSctEoGboFdTbfE3JabNa2U2loxD2/jd
	gQ8JxxvLdPrnfr6pOX/cy7GYJ9bGnWaQABPkPPsFY4w==
X-Gm-Gg: AYBFou0c93K+y91TS5SUBRzJE5uM/BFMaCjLzymwhgO6k7HTmMgmVBT042ppkJ1J6cC
	Zbm8vppd0ja4y9YF5c8yZvytvcp1a2uBTfoiUPn4mRZWr5M9MKUwWe2W00LVKuUiipSd+ToTn5C
	oCLY4D3Wbj6tHVgyCR25ulP2ibJfJr64fsp4lFR+i4yv/ndeEF71V4FeR8nUkFBCBtmXclvAwFN
	JdGLo1eLY/XJ/DryW03RW2vWyxFJv1YI60eNFzbuicAhJyesTg+1trP5lNZnrrfMlLM7PlLF9zp
	d4DZK41JYWh+hiM8sZyCMHL4lZF09QdvmS7Y3to1FNEf0l+WJiwZbNKblSYKT+XA/RHze2n0OTd
	imLoqkRPF+XS5eEDMpe9n3MuLwUXMvlQW87vZGHuk9JcYzK7pj0ghqyz0yd4=
X-Received: by 2002:a17:907:9d1a:b0:c46:7462:6332 with SMTP id
 a640c23a62f3a-c46797a6203mr53745066b.37.1792550709584; Tue, 20 Oct 2026
 19:45:09 -0700 (PDT)
MIME-Version: 1.0
References: <20261008090135.1485765-1-vanusuri@mvista.com> <2200835.1792497913489677566@lists.openembedded.org>
 <CAMKF1srPKNJzj=-yz2hU-KoqnfeznWtWe0w0j7DfY2cjvcaieg@mail.gmail.com>
In-Reply-To: <CAMKF1srPKNJzj=-yz2hU-KoqnfeznWtWe0w0j7DfY2cjvcaieg@mail.gmail.com>
From: Vijay Anusuri <vanusuri@mvista.com>
Date: Wed, 21 Oct 2026 08:14:57 +0530
X-Gm-Features: AclHuK_9ktem52lWVqbgmhq-42I-vCorn32x3YeKUSg72i7f55vVbAsuxcaTonQ
Message-ID: <CANQUz1927xM_N5CSba6TkJjpXvs4fWGE5jivZ8z_KAXt5+Au0A@mail.gmail.com>
Subject: Re: [OE-core] [patch] python3: upgrade 3.14.7 -> 3.14.8
To: raj.khem@gmail.com
Cc: dkelaiya@cisco.com, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004976af065e50bc53"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-core@lists.openembedded.org>; Wed, 21 Oct 2026 02:45:22 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/248347

--0000000000004976af065e50bc53
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Khem,

On Tue, Oct 20, 2026 at 9:10=E2=80=AFPM Khem Raj via lists.openembedded.org
<raj.khem=3Dgmail.com@lists.openembedded.org> wrote:

>
>
> On Tue, Oct 20, 2026 at 5:05=E2=80=AFAM Darsh Kelaiya -X (dkelaiya - E IN=
FOCHIPS
> PRIVATE LIMITED at Cisco) via lists.openembedded.org <dkelaiya=3D
> cisco.com@lists.openembedded.org> wrote:
>
>> Hello Vijay, Ross,
>>
>> I reviewed the 3.14.8 upgrade. The downloaded source tarball=E2=80=99s S=
HA-256
>> matches the recipe, and the retained source patches apply without fuzz.
>>
>> Following Ross=E2=80=99s upstream report [1], I inspected libedit=E2=80=
=99s history
>> append path. append_history() opens the file with fopen(filename, "a"), =
and
>> history_save_fp() writes the _HiStOrY_V2_ header whenever ftell() return=
s
>> zero.
>>
>> If the append stream initially reports offset zero on musl, this would
>> cause another header to be appended to an existing history file. That is
>> consistent with the reported result where the header appears as a histor=
y
>> entry after truncation.
>>
>> This suggests a history handling issue that needs investigation before
>> deciding whether a test skip is appropriate. Could you check whether
>> explicitly positioning the append stream at EOF before saving resolves t=
he
>> failure, and share the result in the upstream issue?
>>
>> This analysis is based on source inspection. I have not independently
>> reproduced the musl failure.
>>
>> [1] https://github.com/python/cpython/issues/159424
>>
>
> I wonder why you did not look into the fix
>
> https://github.com/python/cpython/pull/157165
>
> which is also posted in the above
> bug report. Does this fix the issue ?
>
> The fix from PR #157165 is already included in Python 3.14.8, which we ar=
e
> upgrading to.
>
> That commit fixes existing SKIPPED_TESTS exclusion for
> test_write_read_limited_history. This test is now passing with the latest
> Python version.
>
> However, the newly introduced test test_append_limited_history is failing
> on musl builds.
>
>
>>
>>
>> Thanks,
>> Darsh
>>
>> On Thu, Oct 8, 2026 at 02:31 PM, Vijay Anusuri wrote:
>>
>> Release information:
>> * https://www.python.org/downloads/release/python-3148/
>> * Python 3.14.8 is an expedited security release and the eighth
>> maintenance release of 3.14, containing around 354 bugfixes, build
>> improvements and documentation changes from 142 contributors since 3.14.=
7.
>>
>> Handles CVE-2026-19445 CVE-2026-19553 CVE-2026-19672 CVE-2026-15310
>> CVE-2026-15806 CVE-2026-17084
>>
>> Changelog:
>> https://docs.python.org/3/whatsnew/changelog.html#python-3-14-8-final
>>
>> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
>> ---
>> .../python/{python3_3.14.7.bb =3D> python3_3.14.8.bb} | 2 +-
>> 1 file changed, 1 insertion(+), 1 deletion(-)
>> rename meta/recipes-devtools/python/{python3_3.14.7.bb =3D>
>> python3_3.14.8.bb} (99%)
>>
>> diff --git a/meta/recipes-devtools/python/python3_3.14.7.bb
>> b/meta/recipes-devtools/python/python3_3.14.8.bb
>> similarity index 99%
>> rename from meta/recipes-devtools/python/python3_3.14.7.bb
>> rename to meta/recipes-devtools/python/python3_3.14.8.bb
>> index f917edebd8..4663ee85cd 100644
>> --- a/meta/recipes-devtools/python/python3_3.14.7.bb
>> +++ b/meta/recipes-devtools/python/python3_3.14.8.bb
>> @@ -30,7 +30,7 @@ SRC_URI:append:class-native =3D " \
>> file://0001-Lib-sysconfig.py-use-prefix-value-from-build-configu.patch \
>> "
>>
>> -SRC_URI[sha256sum] =3D
>> "3b48dac8fb59f62eaa67ac83c1eb12bda1b7a08406dd286e252c11a66be27f81"
>> +SRC_URI[sha256sum] =3D
>> "c2215904f02b175596dc49351585104f4bc20341e1c47378b26a2c274360ce73"
>>
>> # exclude pre-releases for both python 2.x and 3.x
>> UPSTREAM_CHECK_REGEX =3D "[Pp]ython-(?P<pver>\d+(\.\d+)+).tar"
>> --
>> 2.43.0
>>
>>
>>
>>
>>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#248304):
> https://lists.openembedded.org/g/openembedded-core/message/248304
> Mute This Topic: https://lists.openembedded.org/mt/121652032/7301997
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vanusuri@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--0000000000004976af065e50bc53
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Khem,</div><br><div class=3D"gmail_quote gmail_quo=
te_container"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Oct 20, 2026 at=
 9:10=E2=80=AFPM Khem Raj via <a href=3D"http://lists.openembedded.org">lis=
ts.openembedded.org</a> &lt;raj.khem=3D<a href=3D"mailto:gmail.com@lists.op=
enembedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=
=3D"ltr"><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D=
"gmail_attr">On Tue, Oct 20, 2026 at 5:05=E2=80=AFAM Darsh Kelaiya -X (dkel=
aiya - E INFOCHIPS PRIVATE LIMITED at Cisco) via <a href=3D"http://lists.op=
enembedded.org" target=3D"_blank">lists.openembedded.org</a> &lt;dkelaiya=
=3D<a href=3D"mailto:cisco.com@lists.openembedded.org" target=3D"_blank">ci=
sco.com@lists.openembedded.org</a>&gt; wrote:<br></div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div>Hello Vijay, Ross,<br><br>I reviewed the=
 3.14.8 upgrade. The downloaded source tarball=E2=80=99s SHA-256 matches th=
e recipe, and the retained source patches apply without fuzz.<br><br>Follow=
ing Ross=E2=80=99s upstream report [1], I inspected libedit=E2=80=99s histo=
ry append path. append_history() opens the file with fopen(filename, &quot;=
a&quot;), and history_save_fp() writes the _HiStOrY_V2_ header whenever fte=
ll() returns zero.<br><br>If the append stream initially reports offset zer=
o on musl, this would cause another header to be appended to an existing hi=
story file. That is consistent with the reported result where the header ap=
pears as a history entry after truncation.<br><br>This suggests a history h=
andling issue that needs investigation before deciding whether a test skip =
is appropriate. Could you check whether explicitly positioning the append s=
tream at EOF before saving resolves the failure, and share the result in th=
e upstream issue?</div>
<div>=C2=A0</div>
<div>This analysis is based on source inspection. I have not independently =
reproduced the musl failure.</div>
<div><br>[1] <a href=3D"https://github.com/python/cpython/issues/159424" re=
l=3D"noopener" target=3D"_blank">https://github.com/python/cpython/issues/1=
59424</a></div></blockquote><div><br></div><div>I wonder why you did not lo=
ok into the fix=C2=A0</div><div><br></div><div><a href=3D"https://github.co=
m/python/cpython/pull/157165" target=3D"_blank">https://github.com/python/c=
python/pull/157165</a>=C2=A0</div><div><br></div><div>which is also posted =
in the above</div><div>bug report. Does this fix the issue ?<br><br><p><spa=
n>The fix from PR #157165 is already included in Python 3.14.8, which we ar=
e upgrading to.<br><br></span><span>That commit fixes  existing </span><cod=
e dir=3D"ltr">SKIPPED_TESTS</code><span> exclusion for </span><code dir=3D"=
ltr">test_write_read_limited_history</code><span>. This test is now passing=
 with the latest Python version.<br><br></span></p><p><span>However, the ne=
wly introduced test </span><code dir=3D"ltr"><span>test_append_limited_hist=
ory</span></code><span> is failing on musl builds.</span></p></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><br><br>Tha=
nks,<br>Darsh</div>
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
<br>
<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#248304): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/248304" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/248304</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/121652032/730=
1997" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/121652032/7301997</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vanusuri@mvista.com" targe=
t=3D"_blank">vanusuri@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000004976af065e50bc53--
