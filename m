Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f169.google.com (mail-wr0-f169.google.com
	[209.85.128.169])
	by mail.openembedded.org (Postfix) with ESMTP id 3801D78914;
	Sun, 18 Mar 2018 14:22:05 +0000 (UTC)
Received: by mail-wr0-f169.google.com with SMTP id f14so16000688wre.8;
	Sun, 18 Mar 2018 07:22:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Lm/u6xhVF3I4YujvIk1Xy8G0Snjd+VHrrP9+VjiZ47o=;
	b=F2nY7XbPSx8gUdRUHkeD6u3UN3ygn7Ly0uB7VgidnRrD5mIUFm+kwrJzBjdAW4jLMo
	Mc5btO1XUW/x/Td9WJzt4GP1WrSVq/1BcQogQNM9r2/o153rMZzX+ynn1R69NNvS/qSs
	qMYIAd2DT94rbom11+DR9FemCkteriMhmy00r3q1ojXVjt2Y4t7rPQEcslDELhLLzzyx
	cKPeQ5zfGQQV/GtNLJijoNLI4CbcGRVM1xcP9hJwnt1v64/KvKZKQbO+EhLTOcx2jhAt
	Qh/56pC6QZG3JmySU1gZHnuPMXtx7zdh4puKvsBKslSL03zfiRJ+yNRRApQHT86GtBhO
	1Gug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Lm/u6xhVF3I4YujvIk1Xy8G0Snjd+VHrrP9+VjiZ47o=;
	b=C/tbiexQhF8/Lv6wfcXEQYr6KWU6wvctT9PoXEpjLbGed41m0Ln40on02drNqfKsRK
	wybhtRCTVllbdWctbd7A4K1RUMAtJlPYABwgrf+IQj6D2ReYYlX+r4qT81lSyNtcn/mA
	Q6cFUWTfFQAulyqq3qVR3od30awiiU4lpLTjpaEleJvuxRs8VXd54k9zH5xi9qqTxZYL
	x0tBXa17CS/SNZDPXy3auTi10orxF2cgyFxtHY1hOqSo2yXTYy0XjgA+44wzWGUYoExi
	gFuatxh648susTVQo/O/6iP+pf72qjWWDi0+u2HACO3AghQBQFPuHGHa3KM+YRGMAT7a
	5qEA==
X-Gm-Message-State: AElRT7FCf+2tQMCn5iKrcHS6I4E22tv9y1srTWmjGQ0JGpgAiG1XTrsz
	9wSUBMpqg4hLE1kuEkNRekQv/SFlN7oqlu1SREA=
X-Google-Smtp-Source: AG47ELvE0o2ZgY5KUbI7rjRMI+CABU0Hymo+knhm9GanEof+9m102KPGE3aH0LFZfX+XxHO5ZtLPaLMlCsRCgB6nIV4=
X-Received: by 10.223.146.230 with SMTP id 93mr6534812wrn.241.1521382927077;
	Sun, 18 Mar 2018 07:22:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.30.136 with HTTP; Sun, 18 Mar 2018 07:22:06 -0700 (PDT)
In-Reply-To: <CA+chaQdQP3zTRXDz2S=Oypbe9BE5CN+rASraHdxT5vYeNLBpAg@mail.gmail.com>
References: <152089240195.19773.3751229902290225520@git.openembedded.org>
	<20180312220642.1D65C232B12@git.openembedded.org>
	<CA+chaQdN_qjQx_YSuD6RX5p=8OPNfv7OGdzrTqLfWMjnjfOxxQ@mail.gmail.com>
	<CA+chaQdQP3zTRXDz2S=Oypbe9BE5CN+rASraHdxT5vYeNLBpAg@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sun, 18 Mar 2018 15:22:06 +0100
Message-ID: <CA+chaQfJx-cuye=3HDTi4BHpY64kmihykiD8yeLAQnSaurfZVg@mail.gmail.com>
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
X-List-Received-Date: Sun, 18 Mar 2018 14:22:06 -0000
Content-Type: multipart/alternative; boundary="94eb2c0d2218efa4290567b09010"

--94eb2c0d2218efa4290567b09010
Content-Type: text/plain; charset="UTF-8"

SOURCE_DATE_EPOCH was supposed to be exported in this review:
https://patchwork.openembedded.org/patch/139558/
but it wasn't merged to master nor rocko.



On Sun, Mar 18, 2018 at 3:13 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> I've also noticed that the kernel.bbclass says:
>
>                 # kernel sources do not use do_unpack, so
> SOURCE_DATE_EPOCH may not
>                 # be set....
>
> but with git grep SOURCE_DATE_EPOCH I don't see any code in bitbake or
> oe-core where this would be set in do_unpack (in oe-core/master and
> oe-core/rocko). Is this part still only in one of your contrib branches for
> reproducible?
>
> Regards,
>
> On Sun, Mar 18, 2018 at 3:06 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Hi,
>>
>> There seems to be small issue when people set BUILD_REPRODUCIBLE_BINARIES
>> = "1" without exporting SOURCE_DATE_EPOCH like this .bbclass does
>>
>> In kernel.bbclass change from:
>> http://git.openembedded.org/openembedded-core/commit/meta/cl
>> asses/kernel.bbclass?id=012a70da7ae0617740cd0cf807d01c3cd912c823
>>
>> you're comparing SOURCE_DATE_EPOCH with 0 which doesn't seem to be set
>> anywhere, so by default it's empty which leads to kernel build failure like
>> this:
>>
>> DEBUG: Executing shell function do_compile
>> date: invalid date '@'
>> WARNING: exit code 1 from a shell command.
>>
>> because empty SOURCE_DATE_EPOCH is used in "ts=`LC_ALL=C date -d
>> @$SOURCE_DATE_EPOCH`". Testing SOURCE_DATE_EPOCH for empty or "0" allows to
>> use REPRODUCIBLE_TIMESTAMP_ROOTFS as a default value again.
>>
>> These build failures seem to be triggered in all my builds since
>> kernel.bbclass was fixed to respect BUILD_REPRODUCIBLE_BINARIES in:
>> http://git.openembedded.org/openembedded-core/commit/meta/cl
>> asses/kernel.bbclass?id=27f87bbc8395a2481ef808465a62d213a6b678ac
>>
>> One way to fit it would be to inherit reproducible_build_simple.bbclass,
>> but this requirement to set exported SOURCE_DATE_EPOCH doesn't seem to be
>> documented anywhere and looking at kernel.bbclass changes it probably
>> wasn't even intended like that.
>>
>> Thanks
>>
>> On Mon, Mar 12, 2018 at 11:06 PM, <git@git.openembedded.org> wrote:
>>
>>> This is an automated email from the git hooks/post-receive script.
>>>
>>> rpurdie pushed a commit to branch master
>>> in repository openembedded-core.
>>>
>>> commit 5c2685c5ee2f8210a36b9a8591491b6af0482084
>>> Author: Juro Bystricky <juro.bystricky@intel.com>
>>> AuthorDate: Sat Mar 10 10:57:49 2018 -0800
>>>
>>>     reproducible_build_simple.bbclass: simple environment for
>>> reproducible binaries
>>>
>>>     Export environmental variables needed for binary reproducibility
>>> with consistent values.
>>>
>>>     This class can be used either directly via:
>>>     INHERIT += "reproducible_build_simple"
>>>
>>>     or can be inherited by a more complex/complete bbclass, for example
>>> a bblass which
>>>     will crack SOURCE_DATE_EPOCH for each recipe.
>>>
>>>     Signed-off-by: Juro Bystricky <juro.bystricky@intel.com>
>>>     Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>>> ---
>>>  meta/classes/reproducible_build_simple.bbclass | 11 +++++++++++
>>>  1 file changed, 11 insertions(+)
>>>
>>> diff --git a/meta/classes/reproducible_build_simple.bbclass
>>> b/meta/classes/reproducible_build_simple.bbclass
>>> new file mode 100644
>>> index 0000000..dd11cd9
>>> --- /dev/null
>>> +++ b/meta/classes/reproducible_build_simple.bbclass
>>> @@ -0,0 +1,11 @@
>>> +# Setup default environment for reproducible builds.
>>> +
>>> +BUILD_REPRODUCIBLE_BINARIES = "1"
>>> +
>>> +export PYTHONHASHSEED = "0"
>>> +export PERL_HASH_SEED = "0"
>>> +export TZ = 'UTC'
>>> +export SOURCE_DATE_EPOCH ??= "1520598896"
>>> +
>>> +REPRODUCIBLE_TIMESTAMP_ROOTFS ??= "1520598896"
>>> +
>>>
>>> --
>>> To stop receiving notification emails like this one, please contact
>>> the administrator of this repository.
>>> --
>>> _______________________________________________
>>> Openembedded-commits mailing list
>>> Openembedded-commits@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-commits
>>>
>>
>>
>

--94eb2c0d2218efa4290567b09010
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"color:rgb(34,34,34);font-family:arial,=
sans-serif;font-size:small;font-style:normal;font-variant-ligatures:normal;=
font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:s=
tart;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0p=
x;background-color:rgb(255,255,255);text-decoration-style:initial;text-deco=
ration-color:initial;float:none;display:inline">SOURCE_DATE_EPOCH was suppo=
sed to be exported in this review:</span><br></div><a href=3D"https://patch=
work.openembedded.org/patch/139558/">https://patchwork.openembedded.org/pat=
ch/139558/</a><br><div>but it wasn&#39;t merged to master nor rocko.<br></d=
iv><div><br></div><div><br></div></div><div class=3D"gmail_extra"><br><div =
class=3D"gmail_quote">On Sun, Mar 18, 2018 at 3:13 PM, Martin Jansa <span d=
ir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">=
martin.jansa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex"><div dir=3D"ltr">I&#39;ve also noticed that the kernel.bbclass says:<di=
v><div><br></div><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 # kernel sources do not use do_unpack, so SOURCE_DATE_EPOCH may not</di=
v><div>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # be set....=
</div></div><div><br></div><div>but with git grep=C2=A0<span style=3D"color=
:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-style:norm=
al;font-variant-ligatures:normal;font-variant-caps:normal;font-weight:400;l=
etter-spacing:normal;text-align:start;text-indent:0px;text-transform:none;w=
hite-space:normal;word-spacing:0px;background-color:rgb(255,255,255);text-d=
ecoration-style:initial;text-decoration-color:initial;float:none;display:in=
line">SOURCE_DATE_EPOCH I don&#39;t see any code in bitbake or oe-core wher=
e this would be set in do_unpack (in oe-core/master and oe-core/rocko). Is =
this part still only in one of your contrib branches for reproducible?</spa=
n></div><div><span style=3D"color:rgb(34,34,34);font-family:arial,sans-seri=
f;font-size:small;font-style:normal;font-variant-ligatures:normal;font-vari=
ant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text=
-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline"><br></span></div><div><span style=3D=
"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:small;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">Regards,</span></div></div><div class=3D"HOEnZb"><div class=3D"=
h5"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">On Sun, Mar 1=
8, 2018 at 3:06 PM, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:ma=
rtin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</spa=
n> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div>Hi,</div>=
<div><br></div>There seems to be small issue when people set=C2=A0<span sty=
le=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;fon=
t-style:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-=
weight:400;letter-spacing:normal;text-align:start;text-indent:0px;text-tran=
sform:none;white-space:normal;word-spacing:0px;background-color:rgb(255,255=
,255);text-decoration-style:initial;text-decoration-color:initial;float:non=
e;display:inline">BUILD_REPRODUCIBLE_BINARIE<wbr>S =3D &quot;1&quot; withou=
t exporting=C2=A0<span style=3D"color:rgb(34,34,34);font-family:arial,sans-=
serif;font-size:12.8px;font-style:normal;font-variant-ligatures:normal;font=
-variant-caps:normal;font-weight:400;letter-spacing:normal;text-align:start=
;text-indent:0px;text-transform:none;white-space:normal;word-spacing:0px;ba=
ckground-color:rgb(255,255,255);text-decoration-style:initial;text-decorati=
on-color:initial;float:none;display:inline">SOURCE_DATE_EPOCH like this .bb=
class does</span></span><div><span style=3D"font-size:12.8px"><br></span></=
div><div><span style=3D"font-size:12.8px">In kernel.bbclass change from:<br=
></span><span style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;fon=
t-size:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-=
caps:normal;font-weight:400;letter-spacing:normal;text-align:start;text-ind=
ent:0px;text-transform:none;white-space:normal;word-spacing:0px;background-=
color:rgb(255,255,255);text-decoration-style:initial;text-decoration-color:=
initial;float:none;display:inline"></span><div><a href=3D"http://git.openem=
bedded.org/openembedded-core/commit/meta/classes/kernel.bbclass?id=3D012a70=
da7ae0617740cd0cf807d01c3cd912c823" target=3D"_blank">http://git.openembedd=
ed.org/op<wbr>enembedded-core/commit/meta/cl<wbr>asses/kernel.bbclass?id=3D=
012a70<wbr>da7ae0617740cd0cf807d01c3cd912<wbr>c823</a><br></div></div><div>=
<br></div><div>you&#39;re comparing=C2=A0<span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">SOURCE_=
DATE_EPOCH with 0 which doesn&#39;t seem to be set anywhere, so by default =
it&#39;s empty which leads to kernel build failure like this:</span></div><=
div><span style=3D"text-align:start;text-indent:0px;background-color:rgb(25=
5,255,255);text-decoration-style:initial;text-decoration-color:initial;floa=
t:none;display:inline"><div><span style=3D"font-size:12.8px"><br></span></d=
iv><div><span style=3D"font-size:12.8px">DEBUG: Executing shell function do=
_compile</span></div><div><span style=3D"font-size:12.8px">date: invalid da=
te &#39;@&#39;</span></div><div><span style=3D"font-size:12.8px">WARNING: e=
xit code 1 from a shell command.</span></div><div style=3D"color:rgb(34,34,=
34);font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-va=
riant-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spac=
ing:normal;text-transform:none;white-space:normal;word-spacing:0px"><br></d=
iv><div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size=
:12.8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:n=
ormal;font-weight:400;letter-spacing:normal;text-transform:none;white-space=
:normal;word-spacing:0px">because empty SOURCE_DATE_EPOCH is used in &quot;=
ts=3D`LC_ALL=3DC date -d @$SOURCE_DATE_EPOCH`&quot;. Testing SOURCE_DATE_EP=
OCH for empty or &quot;0&quot; allows to use=C2=A0REPRODUCIBLE_TIMESTAMP_RO=
O<wbr>TFS as a default value again.</div><div style=3D"color:rgb(34,34,34);=
font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varian=
t-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing:=
normal;text-transform:none;white-space:normal;word-spacing:0px"><br></div><=
div style=3D"color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.=
8px;font-style:normal;font-variant-ligatures:normal;font-variant-caps:norma=
l;font-weight:400;letter-spacing:normal;text-transform:none;white-space:nor=
mal;word-spacing:0px">These build failures seem to be triggered in all my b=
uilds since kernel.bbclass was fixed to respect BUILD_REPRODUCIBLE_BINARIES=
 in:</div><div><span style=3D"font-size:12.8px"><a href=3D"http://git.opene=
mbedded.org/openembedded-core/commit/meta/classes/kernel.bbclass?id=3D27f87=
bbc8395a2481ef808465a62d213a6b678ac" target=3D"_blank">http://git.openembed=
ded.org/op<wbr>enembedded-core/commit/meta/cl<wbr>asses/kernel.bbclass?id=
=3D27f87b<wbr>bc8395a2481ef808465a62d213a6b6<wbr>78ac</a></span><br></div><=
div><span style=3D"font-size:12.8px"><br></span></div><div><span style=3D"f=
ont-size:12.8px">One way to fit it would be to inherit=C2=A0<span style=3D"=
color:rgb(34,34,34);font-family:arial,sans-serif;font-size:12.8px;font-styl=
e:normal;font-variant-ligatures:normal;font-variant-caps:normal;font-weight=
:400;letter-spacing:normal;text-align:start;text-indent:0px;text-transform:=
none;white-space:normal;word-spacing:0px;background-color:rgb(255,255,255);=
text-decoration-style:initial;text-decoration-color:initial;float:none;disp=
lay:inline">reproducible_</span><span style=3D"color:rgb(34,34,34);font-fam=
ily:arial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatu=
res:normal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;t=
ext-align:start;text-indent:0px;text-transform:none;white-space:normal;word=
-spacing:0px;background-color:rgb(255,255,255);text-decoration-style:initia=
l;text-decoration-color:initial;float:none;display:inline">build_sim<wbr>pl=
e.bbclass, but this requirement to set exported SOURCE_DATE_EPOCH doesn&#39=
;t seem to be documented anywhere and looking at kernel.bbclass changes it =
probably wasn&#39;t even intended like that.</span></span></div><div><span =
style=3D"font-size:12.8px"><span style=3D"color:rgb(34,34,34);font-family:a=
rial,sans-serif;font-size:12.8px;font-style:normal;font-variant-ligatures:n=
ormal;font-variant-caps:normal;font-weight:400;letter-spacing:normal;text-a=
lign:start;text-indent:0px;text-transform:none;white-space:normal;word-spac=
ing:0px;background-color:rgb(255,255,255);text-decoration-style:initial;tex=
t-decoration-color:initial;float:none;display:inline"><br></span></span></d=
iv><div><span style=3D"font-size:12.8px"><span style=3D"color:rgb(34,34,34)=
;font-family:arial,sans-serif;font-size:12.8px;font-style:normal;font-varia=
nt-ligatures:normal;font-variant-caps:normal;font-weight:400;letter-spacing=
:normal;text-align:start;text-indent:0px;text-transform:none;white-space:no=
rmal;word-spacing:0px;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline">Thanks<=
/span></span></div></span></div></div><div class=3D"m_-8114575700723207354H=
OEnZb"><div class=3D"m_-8114575700723207354h5"><div class=3D"gmail_extra"><=
br><div class=3D"gmail_quote">On Mon, Mar 12, 2018 at 11:06 PM,  <span dir=
=3D"ltr">&lt;<a href=3D"mailto:git@git.openembedded.org" target=3D"_blank">=
git@git.openembedded.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex">This is an automated email from the git hooks/post-receive script.<br=
>
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
<span class=3D"m_-8114575700723207354m_-2939368165476955101HOEnZb"><font co=
lor=3D"#888888"><br>
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
</div></div></blockquote></div><br></div>

--94eb2c0d2218efa4290567b09010--
