Return-Path: <vincent.prince.fr@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id E2AB765D35
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 20:07:33 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id f1so5858759iob.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2018 13:07:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=4yrBauyUV0L97Yd7/DTiaWbl/z3PMeUtDj6pSb6Jlv8=;
	b=N7hlV8iqtTItTKN90NuxM4x9nnN3yHKeRrULV/MK2r/R/w/Euwyyn3NiP/4cP1CRPa
	PkRHXfyzz8EoxwDEpCwcpU5SuWfaeEdmPt2OXciXKYv7oqrnbMcmKc2D9ScADxn8/hnD
	2np8Rn10jatZi9A9mQRI2HLcp7YQ4HzdLOkOpD3hz6mhkBdDNpDSEwqMiHgCjyoMsm88
	DTa6L4l2nmsp70C2yNrbzA2kDB+B3gnJXOhs2mCMORt2zOi/tW+4keHvILQCuXjD3OD4
	34Z604kzRE4HPBrzJi+0FQeB3FFmWM86TbvOQdlmfFqcxXTm8hR53WLsbdlwplr5lSBC
	1e+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=4yrBauyUV0L97Yd7/DTiaWbl/z3PMeUtDj6pSb6Jlv8=;
	b=Wl5n4gm8t6xa7lfIzyU6GLKC/KIekqRIxcsYxhMqvVLXRDEHCN6Xd4aWOFWn4Vrl2W
	rbDBFAoCCepJQFxUyhkvIWuHkF6/8NK3R3JuNy+QxKBTZbVoWmM4Xw2UdRczRsdETZKq
	haCtgoE86SYUjA7T+MHk8bF9xxz0ssDRIC4h34YggoTzCz1Gpe1tGeRDrXh12G+HoxoT
	d7NKViTGaHZb3PL/cqJ7gX8THzk/224yMM0tVmLW7lyfBsHFpUgvkuOmc4u7nZH9+oX6
	uXP5sW6I9XK8Ye8Wr9f7Do3x82XIaTSK5WO6NFix62RJf8vHiFIq6uoLHMlUhyo053qG
	Jweg==
X-Gm-Message-State: AElRT7HU01mH1enQePI4jpPkI5sPv3BSSBqBmDJgmYLzi6R53o58IRum
	9bNzvMmePzKZCw9K6cMWQ3FzC9xLgfXl2Cv3gO8=
X-Google-Smtp-Source: AG47ELve0uG4ru6etapFIO7jibWmaACxzUAnX5tSm25c8hdgdDj3QrfdGGur9FTXdTnF25ug4E7U0BEUDDLzmKpXWSk=
X-Received: by 10.107.16.65 with SMTP id y62mr6170937ioi.213.1521058054818;
	Wed, 14 Mar 2018 13:07:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.2.176.144 with HTTP; Wed, 14 Mar 2018 13:07:14 -0700 (PDT)
In-Reply-To: <CA+chaQfQ8y60w15ot+Gn0Hnvv5P-gU_07fpW-HYRy-VNY18M+Q@mail.gmail.com>
References: <cover.1520728804.git.Martin.Jansa@gmail.com>
	<46eeffd1f3886c633a7586562b1ec67508650528.1520728804.git.Martin.Jansa@gmail.com>
	<CA+chaQfQ8y60w15ot+Gn0Hnvv5P-gU_07fpW-HYRy-VNY18M+Q@mail.gmail.com>
From: Vincent Prince <vincent.prince.fr@gmail.com>
Date: Wed, 14 Mar 2018 21:07:14 +0100
Message-ID: <CAB2nKc-8OrNeAFHK4MYC=CfQOExd6QvxiB4K8+f=vBMxChQSXw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Stefan Agner <stefan.agner@toradex.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [rocko][PATCH 1/8] Revert "waf.bbclass: explicitly pass bindir and libdir if supported"
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
X-List-Received-Date: Wed, 14 Mar 2018 20:07:34 -0000
Content-Type: multipart/alternative; boundary="001a113f22560a5dd2056764eded"

--001a113f22560a5dd2056764eded
Content-Type: text/plain; charset="UTF-8"

Hi Stefan,

If I remember correctly, you submitted this feature?

Best Regards,
Vincent

2018-03-14 16:28 GMT+01:00 Martin Jansa <martin.jansa@gmail.com>:

> ping, this was in rocko-next for a while and then it disappeared.
>
> On Sun, Mar 11, 2018 at 1:43 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> * this doesn't work correctly as discussed in:
>>   http://lists.openembedded.org/pipermail/openembedded-commits
>> /2018-January/218460.html
>> * some of the issues were fixed in master since then
>>   but not all, so revert it until it's completely resolved
>>
>> This reverts commit eac21f981337bfaddb2d67161a1ff049158041ce.
>>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  meta/classes/waf.bbclass | 17 +----------------
>>  1 file changed, 1 insertion(+), 16 deletions(-)
>>
>> diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass
>> index acbda278a2..c4698e910a 100644
>> --- a/meta/classes/waf.bbclass
>> +++ b/meta/classes/waf.bbclass
>> @@ -25,23 +25,8 @@ def get_waf_parallel_make(d):
>>
>>      return ""
>>
>> -python waf_preconfigure() {
>> -    from distutils.version import StrictVersion
>> -    srcsubdir = d.getVar('S')
>> -    wafbin = os.path.join(srcsubdir, 'waf')
>> -    status, result = oe.utils.getstatusoutput(wafbin + " --version")
>> -    if status != 0:
>> -        bb.warn("Unable to execute waf --version, exit code %d. Assuming
>> waf version without bindir/libdir support." % status)
>> -        return
>> -    version = result.split()[1]
>> -    if StrictVersion(version) >= StrictVersion("1.8.7"):
>> -        d.setVar("WAF_EXTRA_CONF", "--bindir=${bindir}
>> --libdir=${libdir}")
>> -}
>> -
>> -do_configure[prefuncs] += "waf_preconfigure"
>> -
>>  waf_do_configure() {
>> -       ${S}/waf configure --prefix=${prefix} ${WAF_EXTRA_CONF}
>> ${EXTRA_OECONF}
>> +       ${S}/waf configure --prefix=${prefix} ${EXTRA_OECONF}
>>  }
>>
>>  waf_do_compile()  {
>> --
>> 2.15.1
>>
>>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

--001a113f22560a5dd2056764eded
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Stefan,=C2=A0<div><br></div><div>If I remember correctl=
y, you submitted this feature?</div><div><br></div><div>Best Regards,</div>=
<div>Vincent</div></div><div class=3D"gmail_extra"><br><div class=3D"gmail_=
quote">2018-03-14 16:28 GMT+01:00 Martin Jansa <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.co=
m</a>&gt;</span>:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">ping, =
this was in rocko-next for a while and then it disappeared.</div><div class=
=3D"HOEnZb"><div class=3D"h5"><div class=3D"gmail_extra"><br><div class=3D"=
gmail_quote">On Sun, Mar 11, 2018 at 1:43 AM, Martin Jansa <span dir=3D"ltr=
">&lt;<a href=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.ja=
nsa@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">* thi=
s doesn&#39;t work correctly as discussed in:<br>
=C2=A0 <a href=3D"http://lists.openembedded.org/pipermail/openembedded-comm=
its/2018-January/218460.html" rel=3D"noreferrer" target=3D"_blank">http://l=
ists.openembedded.org/<wbr>pipermail/openembedded-commits<wbr>/2018-January=
/218460.html</a><br>
* some of the issues were fixed in master since then<br>
=C2=A0 but not all, so revert it until it&#39;s completely resolved<br>
<br>
This reverts commit eac21f981337bfaddb2d67161a1ff0<wbr>49158041ce.<br>
<br>
Signed-off-by: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" t=
arget=3D"_blank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/waf.bbclass | 17 +----------------<br>
=C2=A01 file changed, 1 insertion(+), 16 deletions(-)<br>
<br>
diff --git a/meta/classes/waf.bbclass b/meta/classes/waf.bbclass<br>
index acbda278a2..c4698e910a 100644<br>
--- a/meta/classes/waf.bbclass<br>
+++ b/meta/classes/waf.bbclass<br>
@@ -25,23 +25,8 @@ def get_waf_parallel_make(d):<br>
<br>
=C2=A0 =C2=A0 =C2=A0return &quot;&quot;<br>
<br>
-python waf_preconfigure() {<br>
-=C2=A0 =C2=A0 from distutils.version import StrictVersion<br>
-=C2=A0 =C2=A0 srcsubdir =3D d.getVar(&#39;S&#39;)<br>
-=C2=A0 =C2=A0 wafbin =3D os.path.join(srcsubdir, &#39;waf&#39;)<br>
-=C2=A0 =C2=A0 status, result =3D oe.utils.getstatusoutput(wafbi<wbr>n + &q=
uot; --version&quot;)<br>
-=C2=A0 =C2=A0 if status !=3D 0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.warn(&quot;Unable to execute waf --version,=
 exit code %d. Assuming waf version without bindir/libdir support.&quot; % =
status)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 return<br>
-=C2=A0 =C2=A0 version =3D result.split()[1]<br>
-=C2=A0 =C2=A0 if StrictVersion(version) &gt;=3D StrictVersion(&quot;1.8.7&=
quot;):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 d.setVar(&quot;WAF_EXTRA_CONF&quot;, &quot;--b=
indir=3D${bindir} --libdir=3D${libdir}&quot;)<br>
-}<br>
-<br>
-do_configure[prefuncs] +=3D &quot;waf_preconfigure&quot;<br>
-<br>
=C2=A0waf_do_configure() {<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/waf configure --prefix=3D${prefix} ${WAF_E=
XTRA_CONF} ${EXTRA_OECONF}<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0${S}/waf configure --prefix=3D${prefix} ${EXTRA=
_OECONF}<br>
=C2=A0}<br>
<br>
=C2=A0waf_do_compile()=C2=A0 {<br>
<span class=3D"m_124574729275703013HOEnZb"><font color=3D"#888888">--<br>
2.15.1<br>
<br>
</font></span></blockquote></div><br></div>
</div></div><br>--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
<br></blockquote></div><br></div>

--001a113f22560a5dd2056764eded--
