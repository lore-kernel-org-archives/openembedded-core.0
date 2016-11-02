Return-Path: <fabio.berton@ossystems.com.br>
Received: from mail-lf0-f65.google.com (mail-lf0-f65.google.com
	[209.85.215.65])
	by mail.openembedded.org (Postfix) with ESMTP id E89A7719F7
	for <openembedded-core@lists.openembedded.org>;
	Wed,  2 Nov 2016 13:02:23 +0000 (UTC)
Received: by mail-lf0-f65.google.com with SMTP id p100so941728lfg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 02 Nov 2016 06:02:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=STSzadvJF/+OdqK7xcTl2fIgdsD+v+aD4KsHwzaaO0A=;
	b=beAqZRrunt88tfRxyw6TrlmUUxLd7UzTuR4RgUWBmz7sR96SHZnEWTxOwtBxNw1cTb
	ZZo5NnjwJxCUG/zRBoTcOucqYkZqGxpFVIL0mRBoLzFmIrMuKE0QV8MMuZYOScHRoHZs
	4tTzvbfxh1D5QmNWKrOol/uHVpfzWosabH45uolvNcYlZubhfnjxr5P6AGcqYLbRXxrd
	v1eJ/kraeZ3+ddmrxcnmjzoq02Urt15HlRVgDNjaCuGDFLtiLE92gUz1dz10pb50GjqV
	lyEmFmssrtmI/pkF2hJ+j9lgLwXpzF0ZnX5aBMxOr3R5DGoA/l5NQViNxDFIF/bdNx8J
	EchA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=STSzadvJF/+OdqK7xcTl2fIgdsD+v+aD4KsHwzaaO0A=;
	b=fc9OZUz5rWv1wPjnOuydw9NW2p4JaJoWVHaZpkIABLRTASfqudNBiGRNKii8UqVDpt
	0QfD2ijiEifwiOfXCUW7cVO7xpKS+dQzuqkGS0b0zizDukelYXwGs82sKbGnIC/x8JIq
	yxk/HIVV+YkzgqBG9/DCpv6jHeWkjQ3uygweTYWmLLJ3+/dpUbgT6smFLsvVmrJ9x68p
	ud254MGle4GfzqZAdPK8XuqnlwzL0Vt0wws2Vu9PS9TZDBsbWcnIy9B1+Neo9MmCHe5C
	YpsL/IJwu2C4sSmoYOg11ibH3H6Iy6AZT7Cui+oMsjVmO6gEQmdb9AO1edHLi8K1kcOW
	Ik7w==
X-Gm-Message-State: ABUngveMgFP0/yQHiN2BwW1UEGD+xhP/IxlD80tRhNJFvj6kSP2xyxFaRuAAfyOmp3Ax6TBxB+gkDZ3MYAjjjQ==
X-Received: by 10.25.156.211 with SMTP id f202mr1955308lfe.159.1478091744712; 
	Wed, 02 Nov 2016 06:02:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.89.139 with HTTP; Wed, 2 Nov 2016 06:01:54 -0700 (PDT)
X-Originating-IP: [187.23.148.135]
In-Reply-To: <CAJTo0LYzaYCx6S1BP=FF_D6d20wzdGh7uZcypr+yPhAMWWQjLQ@mail.gmail.com>
References: <1478030040-20670-1-git-send-email-fabio.berton@ossystems.com.br>
	<1478030040-20670-7-git-send-email-fabio.berton@ossystems.com.br>
	<CAJTo0LYzaYCx6S1BP=FF_D6d20wzdGh7uZcypr+yPhAMWWQjLQ@mail.gmail.com>
From: Fabio Berton <fabio.berton@ossystems.com.br>
Date: Wed, 2 Nov 2016 11:01:54 -0200
Message-ID: <CAAPZna3qY7w1oSXLVmLrJe3wSythErDeUdvZtikRGTGuuWKaPg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 7/8] gawk: Update to version 4.1.4
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
X-List-Received-Date: Wed, 02 Nov 2016 13:02:25 -0000
Content-Type: multipart/alternative; boundary=001a11411bd063b6200540510d4e

--001a11411bd063b6200540510d4e
Content-Type: text/plain; charset=UTF-8

Hi Ross,

I'll look this issue.

Thanks,

Fabio

On Wed, Nov 2, 2016 at 9:34 AM, Burton, Ross <ross.burton@intel.com> wrote:

> This causes QA warnings:
>
> WARNING: gawk-4.1.4-r0 do_package_qa: QA Issue: /usr/lib/gawk/ptest/test/arrayind1.awk
> contained in package gawk-ptest requires /usr/local/bin/awk, but no
> providers found in RDEPENDS_gawk-ptest? [file-rdeps]
>
> We should patch out the hashbang line (and submit that upstream as none of
> the other awk scripts in the test suite have a hashbang).
>
> Ross
>
> On 1 November 2016 at 19:53, Fabio Berton <fabio.berton@ossystems.com.br>
> wrote:
>
>> Signed-off-by: Fabio Berton <fabio.berton@ossystems.com.br>
>> ---
>>  meta/recipes-extended/gawk/{gawk-4.1.3 => gawk-4.1.4}/run-ptest | 0
>>  meta/recipes-extended/gawk/{gawk_4.1.3.bb => gawk_4.1.4.bb}     | 4 ++--
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>  rename meta/recipes-extended/gawk/{gawk-4.1.3 => gawk-4.1.4}/run-ptest
>> (100%)
>>  rename meta/recipes-extended/gawk/{gawk_4.1.3.bb => gawk_4.1.4.bb} (89%)
>>
>> diff --git a/meta/recipes-extended/gawk/gawk-4.1.3/run-ptest
>> b/meta/recipes-extended/gawk/gawk-4.1.4/run-ptest
>> similarity index 100%
>> rename from meta/recipes-extended/gawk/gawk-4.1.3/run-ptest
>> rename to meta/recipes-extended/gawk/gawk-4.1.4/run-ptest
>> diff --git a/meta/recipes-extended/gawk/gawk_4.1.3.bb
>> b/meta/recipes-extended/gawk/gawk_4.1.4.bb
>> similarity index 89%
>> rename from meta/recipes-extended/gawk/gawk_4.1.3.bb
>> rename to meta/recipes-extended/gawk/gawk_4.1.4.bb
>> index 6ca7f3e..ad18237 100644
>> --- a/meta/recipes-extended/gawk/gawk_4.1.3.bb
>> +++ b/meta/recipes-extended/gawk/gawk_4.1.4.bb
>> @@ -19,8 +19,8 @@ SRC_URI = "${GNU_MIRROR}/gawk/gawk-${PV}.tar.gz \
>>             file://run-ptest \
>>  "
>>
>> -SRC_URI[md5sum] = "55d37f4069502677f25d1340df8eec97"
>> -SRC_URI[sha256sum] = "524effa5b9ecd4ed940f2581c5d3c
>> 1df4e4bd7e6f768aa033c1916f47dfc6e29"
>> +SRC_URI[md5sum] = "f20c94ca51b6ebfc9bffb90f95c8ffbb"
>> +SRC_URI[sha256sum] = "8c03080e2b5a56263e8783f6f1f30
>> 6398d4591be18254041f3f547efef944d35"
>>
>>  inherit autotools gettext texinfo update-alternatives
>>
>> --
>> 2.1.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>

--001a11411bd063b6200540510d4e
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi Ross,<br><br></div><div class=3D"gmail_defa=
ult" style=3D"font-family:monospace,monospace;font-size:small">I&#39;ll loo=
k this issue.<br><br></div><div class=3D"gmail_default" style=3D"font-famil=
y:monospace,monospace;font-size:small">Thanks,<br><br></div><div class=3D"g=
mail_default" style=3D"font-family:monospace,monospace;font-size:small">Fab=
io<br></div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"=
>On Wed, Nov 2, 2016 at 9:34 AM, Burton, Ross <span dir=3D"ltr">&lt;<a href=
=3D"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</=
a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0=
 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Thi=
s causes QA warnings:<div><br></div><div>WARNING: gawk-4.1.4-r0 do_package_=
qa: QA Issue: /usr/lib/gawk/ptest/test/<wbr>arrayind1.awk contained in pack=
age gawk-ptest requires /usr/local/bin/awk, but no providers found in RDEPE=
NDS_gawk-ptest? [file-rdeps]<br><div><br></div><div>We should patch out the=
 hashbang line (and submit that upstream as none of the other awk scripts i=
n the test suite have a hashbang).</div></div><div><br></div><div>Ross</div=
></div><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><div><div =
class=3D"h5">On 1 November 2016 at 19:53, Fabio Berton <span dir=3D"ltr">&l=
t;<a href=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.=
berton@ossystems.com.br</a><wbr>&gt;</span> wrote:<br></div></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div><div class=3D"h5">Signed-off-by: Fabio Berton &l=
t;<a href=3D"mailto:fabio.berton@ossystems.com.br" target=3D"_blank">fabio.=
berton@ossystems.com.br</a><wbr>&gt;<br>
---<br>
=C2=A0meta/recipes-extended/gawk/{g<wbr>awk-4.1.3 =3D&gt; gawk-4.1.4}/run-p=
test | 0<br>
=C2=A0meta/recipes-extended/gawk/{<a href=3D"http://gawk_4.1.3.bb" rel=3D"n=
oreferrer" target=3D"_blank">g<wbr>awk_4.1.3.bb</a> =3D&gt; <a href=3D"http=
://gawk_4.1.4.bb" rel=3D"noreferrer" target=3D"_blank">gawk_4.1.4.bb</a>}=
=C2=A0 =C2=A0 =C2=A0| 4 ++--<br>
=C2=A02 files changed, 2 insertions(+), 2 deletions(-)<br>
=C2=A0rename meta/recipes-extended/gawk/{ga<wbr>wk-4.1.3 =3D&gt; gawk-4.1.4=
}/run-ptest (100%)<br>
=C2=A0rename meta/recipes-extended/gawk/{<a href=3D"http://gawk_4.1.3.bb" r=
el=3D"noreferrer" target=3D"_blank">ga<wbr>wk_4.1.3.bb</a> =3D&gt; <a href=
=3D"http://gawk_4.1.4.bb" rel=3D"noreferrer" target=3D"_blank">gawk_4.1.4.b=
b</a>} (89%)<br>
<br>
diff --git a/meta/recipes-extended/gawk/g<wbr>awk-4.1.3/run-ptest b/meta/re=
cipes-extended/gawk/g<wbr>awk-4.1.4/run-ptest<br>
similarity index 100%<br>
rename from meta/recipes-extended/gawk/gaw<wbr>k-4.1.3/run-ptest<br>
rename to meta/recipes-extended/gawk/gaw<wbr>k-4.1.4/run-ptest<br>
diff --git a/meta/recipes-extended/gawk/<a href=3D"http://gawk_4.1.3.bb" re=
l=3D"noreferrer" target=3D"_blank">g<wbr>awk_4.1.3.bb</a> b/meta/recipes-ex=
tended/gawk/<a href=3D"http://gawk_4.1.4.bb" rel=3D"noreferrer" target=3D"_=
blank">g<wbr>awk_4.1.4.bb</a><br>
similarity index 89%<br>
rename from meta/recipes-extended/gawk/<a href=3D"http://gawk_4.1.3.bb" rel=
=3D"noreferrer" target=3D"_blank">gaw<wbr>k_4.1.3.bb</a><br>
rename to meta/recipes-extended/gawk/<a href=3D"http://gawk_4.1.4.bb" rel=
=3D"noreferrer" target=3D"_blank">gaw<wbr>k_4.1.4.bb</a><br>
index 6ca7f3e..ad18237 100644<br>
--- a/meta/recipes-extended/gawk/<a href=3D"http://gawk_4.1.3.bb" rel=3D"no=
referrer" target=3D"_blank">g<wbr>awk_4.1.3.bb</a><br>
+++ b/meta/recipes-extended/gawk/<a href=3D"http://gawk_4.1.4.bb" rel=3D"no=
referrer" target=3D"_blank">g<wbr>awk_4.1.4.bb</a><br>
@@ -19,8 +19,8 @@ SRC_URI =3D &quot;${GNU_MIRROR}/gawk/gawk-${PV}<wbr>.tar.=
gz \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://run-ptest \<br>
=C2=A0&quot;<br>
<br>
-SRC_URI[md5sum] =3D &quot;55d37f4069502677f25d1340df8ee<wbr>c97&quot;<br>
-SRC_URI[sha256sum] =3D &quot;524effa5b9ecd4ed940f2581c5d3c<wbr>1df4e4bd7e6=
f768aa033c1916f47df<wbr>c6e29&quot;<br>
+SRC_URI[md5sum] =3D &quot;f20c94ca51b6ebfc9bffb90f95c8f<wbr>fbb&quot;<br>
+SRC_URI[sha256sum] =3D &quot;8c03080e2b5a56263e8783f6f1f30<wbr>6398d4591be=
18254041f3f547efef9<wbr>44d35&quot;<br>
<br>
=C2=A0inherit autotools gettext texinfo update-alternatives<br>
</div></div><span class=3D"HOEnZb"><font color=3D"#888888"><span class=3D"m=
_9009312117033284758HOEnZb"><font color=3D"#888888"><br>
--<br>
2.1.4<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></font></span></blockquote></div><br></div>
</blockquote></div><br></div>

--001a11411bd063b6200540510d4e--
