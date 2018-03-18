Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 8A490788F5;
	Sun, 18 Mar 2018 14:13:03 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id z12so16054164wrg.4;
	Sun, 18 Mar 2018 07:13:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=NRIG5OHqqbM2u7UMIHKvp+P9+8zlDppaDmw5F75YJl0=;
	b=EHUVgbdmHb26+bDxN/M2kv02aJMStMOEJcGJR4j1v+TEzNHRuCJ7UG+bJEvS211EU3
	0qy6C+gS0jYXplZIpjZJPw6M5pAmPOnEU71y6UsT3BGxpMGbBZjBBfuaDSxm7xeZxPNu
	/RwEv4qlNPgGkGfMQ3IgaG9+QwEb54r2E5wxEkACH6dXEA4ufmGQJcAiL/XYeyZ9widD
	QeLkjkIHymZgx/ZJCNA0H4ZNsJ2aDipd2C1hVvRagIp35Kx8TikHYMrCeT6FmAURo7fV
	Dm0DEaT+0VQtq0gYZK76KceQxd3UttaOgJbGM08fYdkUSwKGHk3bm0ikYMGe+R+2odVF
	Hx3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=NRIG5OHqqbM2u7UMIHKvp+P9+8zlDppaDmw5F75YJl0=;
	b=dADFyD/e3cokMWjij5s28v4DfVR0wpD5SX3aFEOZ3uzPIHHKWAyTZLmKELAKAxAFH1
	Ha9+Li/Wn9iEZhUXkSeDE2lbvmI2ZGQ4xFG7Q2lqdr1oBNBsQW0VjhG2BXS7gBbIusBB
	0lmwJ83DxkNUx5hXwa4TnPOsEBAjXMuvYjGTBV7yjlrnwXgmXG5c73IwZuZ+y+MCCq39
	RMg1dkzYozW6Mnv1B9pHjMbKlcRMiQLbuwos6K4v/wATl7JJ0xoJB5gBhzF7VTFBu85s
	7E+0Z/+wBAY7cZqm+5eitWV+JG/yYj2WQ2sekVaMOkR8O3AtlHdtAVvDHcJLzeUgMTvm
	xzYw==
X-Gm-Message-State: AElRT7FOox1cFb7ETWdr2RR6Z0HEbtabzrS04lrS8u73OU1EkWVpDRRi
	UygmZ+zceg+2wXwjWe1AHICCGGjpdZjdhDYEN80=
X-Google-Smtp-Source: AG47ELsONElbEXczKmyHL3j0s/w0FH6yeFvUM6GDnuybiN2X9D67GP+uO56fy80iRQPHmXc45yyo9XrORGdn4ZAzm0w=
X-Received: by 10.223.149.70 with SMTP id 64mr893576wrs.223.1521382384212;
	Sun, 18 Mar 2018 07:13:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Sun, 18 Mar 2018 07:13:03 -0700 (PDT)
In-Reply-To: <CA+chaQdN_qjQx_YSuD6RX5p=8OPNfv7OGdzrTqLfWMjnjfOxxQ@mail.gmail.com>
References: <152089240195.19773.3751229902290225520@git.openembedded.org>
	<20180312220642.1D65C232B12@git.openembedded.org>
	<CA+chaQdN_qjQx_YSuD6RX5p=8OPNfv7OGdzrTqLfWMjnjfOxxQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 18 Mar 2018 15:13:03 +0100
Message-ID: <CA+chaQdQP3zTRXDz2S=Oypbe9BE5CN+rASraHdxT5vYeNLBpAg@mail.gmail.com>
To: Juro Bystricky <juro.bystricky@intel.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: openembedded-commits@lists.openembedded.org
Subject: Re: [oe-commits] [openembedded-core] 02/03: reproducible_build_simple.bbclass: simple environment for reproducible binaries
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
X-List-Received-Date: Sun, 18 Mar 2018 14:13:04 -0000
Content-Type: multipart/alternative; boundary="94eb2c0df2109420780567b07071"

--94eb2c0df2109420780567b07071
Content-Type: text/plain; charset="UTF-8"

I've also noticed that the kernel.bbclass says:

                # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH
may not
                # be set....

but with git grep SOURCE_DATE_EPOCH I don't see any code in bitbake or
oe-core where this would be set in do_unpack (in oe-core/master and
oe-core/rocko). Is this part still only in one of your contrib branches for
reproducible?

Regards,

On Sun, Mar 18, 2018 at 3:06 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> Hi,
>
> There seems to be small issue when people set BUILD_REPRODUCIBLE_BINARIES
> = "1" without exporting SOURCE_DATE_EPOCH like this .bbclass does
>
> In kernel.bbclass change from:
> http://git.openembedded.org/openembedded-core/commit/meta/
> classes/kernel.bbclass?id=012a70da7ae0617740cd0cf807d01c3cd912c823
>
> you're comparing SOURCE_DATE_EPOCH with 0 which doesn't seem to be set
> anywhere, so by default it's empty which leads to kernel build failure like
> this:
>
> DEBUG: Executing shell function do_compile
> date: invalid date '@'
> WARNING: exit code 1 from a shell command.
>
> because empty SOURCE_DATE_EPOCH is used in "ts=`LC_ALL=C date -d
> @$SOURCE_DATE_EPOCH`". Testing SOURCE_DATE_EPOCH for empty or "0" allows to
> use REPRODUCIBLE_TIMESTAMP_ROOTFS as a default value again.
>
> These build failures seem to be triggered in all my builds since
> kernel.bbclass was fixed to respect BUILD_REPRODUCIBLE_BINARIES in:
> http://git.openembedded.org/openembedded-core/commit/meta/
> classes/kernel.bbclass?id=27f87bbc8395a2481ef808465a62d213a6b678ac
>
> One way to fit it would be to inherit reproducible_build_simple.bbclass,
> but this requirement to set exported SOURCE_DATE_EPOCH doesn't seem to be
> documented anywhere and looking at kernel.bbclass changes it probably
> wasn't even intended like that.
>
> Thanks
>
> On Mon, Mar 12, 2018 at 11:06 PM, <git@git.openembedded.org> wrote:
>
>> This is an automated email from the git hooks/post-receive script.
>>
>> rpurdie pushed a commit to branch master
>> in repository openembedded-core.
>>
>> commit 5c2685c5ee2f8210a36b9a8591491b6af0482084
>> Author: Juro Bystricky <juro.bystricky@intel.com>
>> AuthorDate: Sat Mar 10 10:57:49 2018 -0800
>>
>>     reproducible_build_simple.bbclass: simple environment for
>> reproducible binaries
>>
>>     Export environmental variables needed for binary reproducibility with
>> consistent values.
>>
>>     This class can be used either directly via:
>>     INHERIT += "reproducible_build_simple"
>>
>>     or can be inherited by a more complex/complete bbclass, for example a
>> bblass which
>>     will crack SOURCE_DATE_EPOCH for each recipe.
>>
>>     Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  meta/classes/reproducible_build_simple.bbclass | 11 +++++++++++
>>  1 file changed, 11 insertions(+)
>>
>> diff --git a/meta/classes/reproducible_build_simple.bbclass
>> b/meta/classes/reproducible_build_simple.bbclass
>> new file mode 100644
>> index 0000000..dd11cd9
>> --- /dev/null
>> +++ b/meta/classes/reproducible_build_simple.bbclass
>> @@ -0,0 +1,11 @@
>> +# Setup default environment for reproducible builds.
>> +
>> +BUILD_REPRODUCIBLE_BINARIES = "1"
>> +
>> +export PYTHONHASHSEED = "0"
>> +export PERL_HASH_SEED = "0"
>> +export TZ = 'UTC'
>> +export SOURCE_DATE_EPOCH ??= "1520598896"
>> +
>> +REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
>> +
>>
>> --
>> To stop receiving notification emails like this one, please contact
>> the administrator of this repository.
>> --
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>>
>
>

--94eb2c0df2109420780567b07071
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I&#39;ve also noticed that the kernel.bbclass says:<div><d=
iv><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 #=
 kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not</div><di=
v>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # be set....</div=
></div><div><br></div><div>but with git grep=C2=A0<span style=3D"color:rgb(=
34,34,34);font-family:arial,sans-serif;font-size:small;font-style:normal;fo=
nt-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter=
-spacing:normal;text-align:start;text-indent:0px;text-transform:none;white-=
space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decora=
tion-style:initial;text-decoration-color:initial;float:none;display:inline"=
>SOURCE_DATE_EPOCH I don&#39;t see any code in bitbake or oe-core where thi=
s would be set in do_unpack (in oe-core/master and oe-core/rocko). Is this =
part still only in one of your contrib branches for reproducible?</span></d=
iv><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:small;font-style:normal;font-variant-ligatures:normal;font-variant-c=
aps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-inde=
nt:0px;text-transform:none;white-space:normal;word-spacing:0px;background-c=
olor:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:i=
nitial;float:none;display:inline"><br></span></div><div><span style=3D"colo=
r:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:nor=
mal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;=
letter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;=
white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-=
decoration-style:initial;text-decoration-color:initial;float:none;display:i=
nline">Regards,</span></div></div><div class=3D"gmail_extra"><br><div class=
=3D"gmail_quote">On Sun, Mar 18, 2018 at 3:06 PM, Martin Jansa <span dir=3D=
"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">marti=
n.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"ltr"><div>Hi,</div><div><br></div>There seems to be small issue =
when people set=C2=A0<span style=3D"color:rgb(34,34,34);font-family:arial,s=
ans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline">BUILD_REPRODUCIBLE_<wbr>BIN=
ARIES =3D &quot;1&quot; without exporting=C2=A0<span style=3D"color:rgb(34,=
34,34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font=
-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-s=
pacing:normal;text-align:start;text-indent:0px;text-transform:none;white-sp=
ace:normal;word-spacing:0px;background-color:rgb(255,255,255);text-decorati=
on-style:initial;text-decoration-color:initial;float:none;display:inline">S=
OURCE_DATE_EPOCH like this .bbclass does</span></span><div><span style=3D"f=
ont-size:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">In =
kernel.bbclass change from:<br></span><span style=3D"color:rgb(34,34,34);fo=
nt-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-=
ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:no=
rmal;text-align:start;text-indent:0px;text-transform:none;white-space:norma=
l;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:=
initial;text-decoration-color:initial;float:none;display:inline"></span><di=
v><a href=3D"http://git.openembedded.org/openembedded-core/commit/meta/clas=
ses/kernel.bbclass?id=3D012a70da7ae0617740cd0cf807d01c3cd912c823" target=3D=
"_blank">http://git.openembedded.org/<wbr>openembedded-core/commit/meta/<wb=
r>classes/kernel.bbclass?id=3D<wbr>012a70da7ae0617740cd0cf807d01c<wbr>3cd91=
2c823</a><br></div></div><div><br></div><div>you&#39;re comparing=C2=A0<spa=
n style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8p=
x;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;=
font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text=
-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline">SOURCE_DATE_EPOCH with 0 which doesn&#39;t seem to b=
e set anywhere, so by default it&#39;s empty which leads to kernel build fa=
ilure like this:</span></div><div><span style=3D"text-align:start;text-inde=
nt:0px;background-color:rgb(255,255,255);text-decoration-style:initial;text=
-decoration-color:initial;float:none;display:inline"><div><span style=3D"fo=
nt-size:12.8px"><br></span></div><div><span style=3D"font-size:12.8px">DEBU=
G: Executing shell function do_compile</span></div><div><span style=3D"font=
-size:12.8px">date: invalid date &#39;@&#39;</span></div><div><span style=
=3D"font-size:12.8px">WARNING: exit code 1 from a shell command.</span></di=
v><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:=
12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:no=
rmal;font-weight:400;letter-spacing:normal;text-transform:none;white-space:=
normal;word-spacing:0px"><br></div><div style=3D"color:rgb(34,34,34);font-f=
amily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-liga=
tures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal=
;text-transform:none;white-space:normal;word-spacing:0px">because empty SOU=
RCE_DATE_EPOCH is used in &quot;ts=3D`LC_ALL=3DC date -d @$SOURCE_DATE_EPOC=
H`&quot;. Testing SOURCE_DATE_EPOCH for empty or &quot;0&quot; allows to us=
e=C2=A0REPRODUCIBLE_TIMESTAMP_<wbr>ROOTFS as a default value again.</div><d=
iv style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8=
px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:normal=
;font-weight:400;letter-spacing:normal;text-transform:none;white-space:norm=
al;word-spacing:0px"><br></div><div style=3D"color:rgb(34,34,34);font-famil=
y:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligature=
s:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;tex=
t-transform:none;white-space:normal;word-spacing:0px">These build failures =
seem to be triggered in all my builds since kernel.bbclass was fixed to res=
pect BUILD_REPRODUCIBLE_BINARIES in:</div><div><span style=3D"font-size:12.=
8px"><a href=3D"http://git.openembedded.org/openembedded-core/commit/meta/c=
lasses/kernel.bbclass?id=3D27f87bbc8395a2481ef808465a62d213a6b678ac" target=
=3D"_blank">http://git.openembedded.org/<wbr>openembedded-core/commit/meta/=
<wbr>classes/kernel.bbclass?id=3D<wbr>27f87bbc8395a2481ef808465a62d2<wbr>13=
a6b678ac</a></span><br></div><div><span style=3D"font-size:12.8px"><br></sp=
an></div><div><span style=3D"font-size:12.8px">One way to fit it would be t=
o inherit=C2=A0<span style=3D"color:rgb(34,34,34);font-family:arial,sans-se=
rif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-v=
ariant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;t=
ext-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;back=
ground-color:rgb(255,255,255);text-decoration-style:initial;text-decoration=
-color:initial;float:none;display:inline">reproducible_</span><span style=
=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-=
style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-we=
ight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transf=
orm:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,2=
55);text-decoration-style:initial;text-decoration-color:initial;float:none;=
display:inline">build_<wbr>simple.bbclass, but this requirement to set expo=
rted SOURCE_DATE_EPOCH doesn&#39;t seem to be documented anywhere and looki=
ng at kernel.bbclass changes it probably wasn&#39;t even intended like that=
.</span></span></div><div><span style=3D"font-size:12.8px"><span style=3D"c=
olor:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-style=
:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:=
400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:n=
one;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);t=
ext-decoration-style:initial;text-decoration-color:initial;float:none;displ=
ay:inline"><br></span></span></div><div><span style=3D"font-size:12.8px"><s=
pan style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-align:start;text-indent:0px;te=
xt-transform:none;white-space:normal;word-spacing:0px;background-color:rgb(=
255,255,255);text-decoration-style:initial;text-decoration-color:initial;fl=
oat:none;display:inline">Thanks</span></span></div></span></div></div><div =
class=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div clas=
s=3D"gmail_quote">On Mon, Mar 12, 2018 at 11:06 PM,  <span dir=3D"ltr">&lt;=
<a href=3D"mailto:git@git.openembedded.org" target=3D"_blank">git@git.opene=
mbedded.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">This is=
 an automated email from the git hooks/post-receive script.<br>
<br>
rpurdie pushed a commit to branch master<br>
in repository openembedded-core.<br>
<br>
commit 5c2685c5ee2f8210a36b9a8591491b<wbr>6af0482084<br>
Author: Juro Bystricky &lt;<a href=3D"mailto:juro.bystricky@intel.com" targ=
et=3D"_blank">juro.bystricky@intel.com</a>&gt;<br>
AuthorDate: Sat Mar 10 10:57:49 2018 -0800<br>
<br>
=C2=A0 =C2=A0 reproducible_build_simple.bbcl<wbr>ass: simple environment fo=
r reproducible binaries<br>
<br>
=C2=A0 =C2=A0 Export environmental variables needed for binary reproducibil=
ity with consistent values.<br>
<br>
=C2=A0 =C2=A0 This class can be used either directly via:<br>
=C2=A0 =C2=A0 INHERIT +=3D &quot;reproducible_build_simple&quot;<br>
<br>
=C2=A0 =C2=A0 or can be inherited by a more complex/complete bbclass, for e=
xample a bblass which<br>
=C2=A0 =C2=A0 will crack SOURCE_DATE_EPOCH for each recipe.<br>
<br>
=C2=A0 =C2=A0 Signed-off-by: Juro Bystricky &lt;<a href=3D"mailto:juro.byst=
ricky@intel.com" target=3D"_blank">juro.bystricky@intel.com</a>&gt;<br>
=C2=A0 =C2=A0 Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.p=
urdie@linuxfoundation.org" target=3D"_blank">richard.purdie@linuxfoundatio<=
wbr>n.org</a>&gt;<br>
---<br>
=C2=A0meta/classes/reproducible_bui<wbr>ld_simple.bbclass | 11 +++++++++++<=
br>
=C2=A01 file changed, 11 insertions(+)<br>
<br>
diff --git a/meta/classes/reproducible_bu<wbr>ild_simple.bbclass b/meta/cla=
sses/reproducible_bu<wbr>ild_simple.bbclass<br>
new file mode 100644<br>
index 0000000..dd11cd9<br>
--- /dev/null<br>
+++ b/meta/classes/reproducible_bu<wbr>ild_simple.bbclass<br>
@@ -0,0 +1,11 @@<br>
+# Setup default environment for reproducible builds.<br>
+<br>
+BUILD_REPRODUCIBLE_BINARIES =3D &quot;1&quot;<br>
+<br>
+export PYTHONHASHSEED =3D &quot;0&quot;<br>
+export PERL_HASH_SEED =3D &quot;0&quot;<br>
+export TZ =3D &#39;UTC&#39;<br>
+export SOURCE_DATE_EPOCH ??=3D &quot;1520598896&quot;<br>
+<br>
+REPRODUCIBLE_TIMESTAMP_ROOTFS ??=3D &quot;1520598896&quot;<br>
+<br>
<span class=3D"m_-2939368165476955101HOEnZb"><font color=3D"#888888"><br>
--<br>
To stop receiving notification emails like this one, please contact<br>
the administrator of this repository.<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-commits mailing list<br>
<a href=3D"mailto:Openembedded-commits@lists.openembedded.org" target=3D"_b=
lank">Openembedded-commits@lists.ope<wbr>nembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-comm=
its" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wb=
r>mailman/listinfo/openembedded-<wbr>commits</a><br>
</font></span></blockquote></div><br></div>
</div></div></blockquote></div><br></div>

--94eb2c0df2109420780567b07071--
