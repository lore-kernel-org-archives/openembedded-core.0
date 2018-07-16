Return-Path: <nick83ola@gmail.com>
Received: from mail-oi0-f52.google.com (mail-oi0-f52.google.com
	[209.85.218.52])
	by mail.openembedded.org (Postfix) with ESMTP id D03057545B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 20:41:39 +0000 (UTC)
Received: by mail-oi0-f52.google.com with SMTP id v8-v6so77403777oie.5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 Jul 2018 13:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=ve8vGtkH6ZHLQUo/7X7xv/9S186VTkF6dH10AiB02G0=;
	b=Et+CCIgLvHZP2qPzVPmOz75WaMPuDY/JbVfUeThchWMmpIN+O70nTfFQ5RhT44KsZ3
	IO1sMKyXYwiVitBEjtGMBTEbCB44pirxPXyldDXDWCHYcS9Etiq1kMVc1UZPGSX/WVQQ
	UgxUdhAX+7x6StxI337AWuQ3TE54QeWxGPS7vmyX9FQRMHp3rr8+G33SQ3yQt4fCS+mp
	2Dx3rUNrAgvlAIqU1r/A8FhffGLaTmaeWeLXxhpVcI7PdkqZTkcFptl6C9Oz2zP5pGjU
	roKiuzg1/ItDb48hYKSem0ASkWEDRbksTL4f4aA1ZZ3bP/9zooEpmWyETPQ6dSRSN+z+
	ekSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=ve8vGtkH6ZHLQUo/7X7xv/9S186VTkF6dH10AiB02G0=;
	b=nUQ/XeGgx2JbtR8L4zQTl9PHY9e3sBz8giij6MaUAC3FwP/ZG0naA7iB9W+0k5iJt8
	tc8NffMJEwdEEU+2732XUHc97ySUnnFmrO4CS3qgVOf0H+WSYiPAAac9/03dq1n5i3Ji
	9/dpMItyvLhQHPErJPBbihgKq2FGMYvxd1ywl6wcd2ftdELromnbl62lzdwbHGQ2lO9k
	qYX+rM4a2cpngz2c2F4VFPuXIeByfCBSjSdvbCwHjSTSWwFh3aqbo2cqq3SCZfFQIFlF
	N+aqnafnrD16Sr38tPPpc/OQ6lSxFziVsJ4QAbFG2Pi++v/bk5pL1ni3NWCKbbW8o5BX
	3PKw==
X-Gm-Message-State: AOUpUlE0gMqVYOIa6BbIERdwQa24roEfTYVQ5oms4HKSfXl827KBiTHJ
	RSyxbNXv+fMZz9ZE8NnVGkeyJKqIN1g9AYR27mI=
X-Google-Smtp-Source: AAOMgpcFC0hkVj3RuX7hN92Aa6QjEqPjO2FG6T6yYAGq4CiFbGgwUjIfbBCCDE+ugJceZpVsP+d4JzX0CD6qEzGC+D4=
X-Received: by 2002:aca:3882:: with SMTP id
	f124-v6mr881092oia.195.1531773700722; 
	Mon, 16 Jul 2018 13:41:40 -0700 (PDT)
MIME-Version: 1.0
References: <CABPh3UMZTQwbOhJc0MN9HOg4hThYqG5tcg-sS7OhFjbgrPAhww@mail.gmail.com>
	<CANNYZj_M=6Ku76j2y=fvdEyN2xvv=8avg4NK-zmg9gs5Ur5nXw@mail.gmail.com>
	<CABPh3UNKtJ-Nd9r1VtFfeOMAHome5xJGmh-Hfw_qGCbjMxWoig@mail.gmail.com>
	<CANx9H-AaXcGjX_D3CBYeXXcFWpezkMkjmpHXxj-TmxjLnAphpQ@mail.gmail.com>
In-Reply-To: <CANx9H-AaXcGjX_D3CBYeXXcFWpezkMkjmpHXxj-TmxjLnAphpQ@mail.gmail.com>
From: nick83ola <nick83ola@gmail.com>
Date: Mon, 16 Jul 2018 21:41:27 +0100
Message-ID: <CABPh3UMDkLSRn62Q6Lp2T2Jv2fqQZ-fhfMq07zWgwB0HrL77Kw@mail.gmail.com>
To: ticotimo@gmail.com
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [HELP] ptest & ptest
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
X-List-Received-Date: Mon, 16 Jul 2018 20:41:39 -0000
Content-Type: multipart/alternative; boundary="0000000000004ed582057123db36"

--0000000000004ed582057123db36
Content-Type: text/plain; charset="UTF-8"

Thanks I'll have a look at those


On Mon, 16 Jul 2018 at 15:19, Tim Orling <ticotimo@gmail.com> wrote:

>
> http://cgit.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python-cryptography_2.2.2.bb
>
> http://cgit.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb
> On Mon, Jul 16, 2018 at 1:41 AM nick83ola <nick83ola@gmail.com> wrote:
>
>> Hi Alex,
>> thanks for your response.
>>
>> Do you or anyone else have an example about an actual python package that
>> use ptest (possibily using distutils/nose/py.test)?
>>
>> Thanks
>> Nick
>>
>> On Tue, 26 Jun 2018 at 16:07, Alexander Kanavin <alex.kanavin@gmail.com>
>> wrote:
>>
>>> The Yocto documentation has general information:
>>>
>>>
>>> https://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-packages-with-ptest
>>>
>>> Alex
>>>
>>>
>>> 2018-06-26 14:57 GMT+02:00 nick83ola <nick83ola@gmail.com>:
>>> > Hi all,
>>> >
>>> > I have a python3 package that launch a py.test test suite from
>>> > setup.py and I have created a recipe for it using setuptools3
>>> >
>>> > Anyone has some hint about how to add a ptest target to run the tests
>>> > into the final image (or better in a qemu test image)?
>>> >
>>> > there are some recipe/documentation that I can look at about creating
>>> > -ptest target for python packages?
>>> >
>>> > Regards
>>> > Nicola Lunghi
>>> > --
>>> > _______________________________________________
>>> > Openembedded-core mailing list
>>> > Openembedded-core@lists.openembedded.org
>>> > http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--0000000000004ed582057123db36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Thanks I&#39;ll have a look at those<div><br></div></div><=
br><div class=3D"gmail_quote"><div dir=3D"ltr">On Mon, 16 Jul 2018 at 15:19=
, Tim Orling &lt;<a href=3D"mailto:ticotimo@gmail.com">ticotimo@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><a href=3D"http://cgi=
t.openembedded.org/meta-openembedded/tree/meta-python/recipes-devtools/pyth=
on/python-cryptography_2.2.2.bb" target=3D"_blank">http://cgit.openembedded=
.org/meta-openembedded/tree/meta-python/recipes-devtools/python/python-cryp=
tography_2.2.2.bb</a><br><a href=3D"http://cgit.openembedded.org/meta-opene=
mbedded/tree/meta-python/recipes-devtools/python/python-pygpgme_0.3.bb" tar=
get=3D"_blank">http://cgit.openembedded.org/meta-openembedded/tree/meta-pyt=
hon/recipes-devtools/python/python-pygpgme_0.3.bb</a><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr">On Mon, Jul 16, 2018 at 1:41 AM nick83ola &lt;<a =
href=3D"mailto:nick83ola@gmail.com" target=3D"_blank">nick83ola@gmail.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div=
>Hi Alex, <br></div><div>thanks for your response.</div><div><br></div><div=
>Do you or anyone else have an example about an actual python package that =
use ptest (possibily using distutils/nose/py.test)?</div><div><br></div><di=
v>Thanks<br></div><div>Nick<br></div></div><br><div class=3D"gmail_quote"><=
div dir=3D"ltr">On Tue, 26 Jun 2018 at 16:07, Alexander Kanavin &lt;<a href=
=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">The Yocto documenta=
tion has general information:<br>
<br>
<a href=3D"https://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.h=
tml#testing-packages-with-ptest" rel=3D"noreferrer" target=3D"_blank">https=
://www.yoctoproject.org/docs/latest/dev-manual/dev-manual.html#testing-pack=
ages-with-ptest</a><br>
<br>
Alex<br>
<br>
<br>
2018-06-26 14:57 GMT+02:00 nick83ola &lt;<a href=3D"mailto:nick83ola@gmail.=
com" target=3D"_blank">nick83ola@gmail.com</a>&gt;:<br>
&gt; Hi all,<br>
&gt;<br>
&gt; I have a python3 package that launch a py.test test suite from<br>
&gt; setup.py and I have created a recipe for it using setuptools3<br>
&gt;<br>
&gt; Anyone has some hint about how to add a ptest target to run the tests<=
br>
&gt; into the final image (or better in a qemu test image)?<br>
&gt;<br>
&gt; there are some recipe/documentation that I can look at about creating<=
br>
&gt; -ptest target for python packages?<br>
&gt;<br>
&gt; Regards<br>
&gt; Nicola Lunghi<br>
&gt; --<br>
&gt; _______________________________________________<br>
&gt; Openembedded-core mailing list<br>
&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"=
_blank">Openembedded-core@lists.openembedded.org</a><br>
&gt; <a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded=
-core" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/m=
ailman/listinfo/openembedded-core</a><br>
</blockquote></div>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>
</blockquote></div>

--0000000000004ed582057123db36--
