Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
 by mx.groups.io with SMTP id smtpd.web11.14385.1605645306700164905
 for <openembedded-core@lists.openembedded.org>;
 Tue, 17 Nov 2020 12:35:06 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=eJPHvBdH;
 spf=pass (domain: gmail.com, ip: 209.85.221.194, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f194.google.com with SMTP id s135so4858995vkh.6
        for <openembedded-core@lists.openembedded.org>; Tue, 17 Nov 2020 12:35:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zF56vlKiClzBcShNfRw5oKVzFEWlSyK3RJSDnytpaK4=;
        b=eJPHvBdHUEqgigzgDYqa3+NWSgq94soxHeKe77XfKiFR/fUOEVXCw05Q2c4CnrotnQ
         0kMEdGp9JE+aANB07k/A2YRj713iJpsxls+Jc5AGX2KsfTrpg5KNKSOdDS1zDKpSJG9Q
         FV4aL2rUh0ynKrVmgmwral1ocAr8XGq+j8owRCeOsqHWEc3pqxQDuX17JUzO9vtExP/U
         pTa/E0Dflhz5tScamYhuV9rWcbvBVCpcDUP//0W9h+zuWWZsTvJHO8uJIGV/h/PZhR+J
         Earo5YAFr59U1V7BJ4sl+IvBw23Pud34kV0NtExdpKmpCyJPZTp/7R5KYR4ECr5a6Mld
         bP/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zF56vlKiClzBcShNfRw5oKVzFEWlSyK3RJSDnytpaK4=;
        b=KL3oCaEK+YV5kbknbiCmKGj/0Nkz2rM+AlGgB7Kk+59L5U36geYH/jwi+0Fr4kHeoE
         /CfUsrmTZOVQJcSIf+4cV6wqJC86lIR2a6g8QIR1kwYN+fvyoSFs/cnLXj0S3kTsD6J+
         TLflnxVsqAHQF3BuxLCLkXu4x1nJOdK6MTrTfELrJvL/OMlVIeDU7UTXRsOcF3tBk+8F
         1GBpmhWe6EyVMF5efisUJEW5gNU+Dq7YCP2tshRbWejmd9LSaeraNqqZaGQNYcEDmGYn
         eaa3JDrDz8DEAzWB+yYFKSjW+sVHL0koKGn79PeIzAvvLbNiAl6gjD9jKrRWzdXWb0CM
         FLjA==
X-Gm-Message-State: AOAM5326cvgn7Lu7MeTVbIPLmjftNCH6TNtBBxi+9so7pJsB+9nPgrw4
	cFTCxxflusZR3ezHxYYImqsULqQr7M4aUDphFfI=
X-Google-Smtp-Source: ABdhPJzzFXUO1KTFKHWVn+MwIeUWuGyKE3IQY/T1rlL6n/e0kdXRLKT0LPajwGKSd65ArtfT+CWUqe70WHPvvwnDfE8=
X-Received: by 2002:a1f:5e0b:: with SMTP id s11mr1150218vkb.8.1605645305787;
 Tue, 17 Nov 2020 12:35:05 -0800 (PST)
MIME-Version: 1.0
References: <20201117153436.3701771-1-raj.khem@gmail.com> <CA+chaQej+epYOHFh4T_07WwMGA5Rof4ubkEEhFHxKDX2fAYppw@mail.gmail.com>
 <CA+chaQeFfTaMPwsSWwztk+LLyM9L7Dq+KorJ3Jzavq0rfd1+TQ@mail.gmail.com>
 <CANNYZj9HXmkfgS-imyzA2+oYLJeE-i7=Rnx0dm3XNQTHDUA0vA@mail.gmail.com> <CA+chaQdur+Q=7pXkvQ2uc-7AWh9kufJ_7V_cj4cQRrNWcmWk0g@mail.gmail.com>
In-Reply-To: <CA+chaQdur+Q=7pXkvQ2uc-7AWh9kufJ_7V_cj4cQRrNWcmWk0g@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 17 Nov 2020 21:34:54 +0100
Message-ID: <CANNYZj-cz2otrCDKzh4vVYP7OhemLFeaTCzFgQBS=ri_CM9apg@mail.gmail.com>
Subject: Re: [PATCH] python3targetconfig.bbclass: Add py3 dependecy only for target recipes
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000163a3b05b4536e7b"

--000000000000163a3b05b4536e7b
Content-Type: text/plain; charset="UTF-8"

No, it had always worked. _PYTHON_SYSCONFIGDATA_NAME shouldn't be exported
without a dependency on target python3, if you are building for the target,
but if you are building for native via BBCLASSEXTEND, it fell back
correctly to sysconfigdata provided by native python.

Alex

On Tue, 17 Nov 2020 at 21:29, Martin Jansa <martin.jansa@gmail.com> wrote:

> BBCLASSEXTEND was also a bit broken, right? You said that
> _PYTHON_SYSCONFIGDATA_NAME shouldn't be exported without a dependency on
> target python3 which the BBCLASSEXTENDed native didn't get.
>
> On Tue, Nov 17, 2020 at 6:45 PM Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> The commit description should be adjusted to drop mention of
>> BBCLASSEXTEND, the problem does not happen there.
>>
>> Also note my comment in the other thread.
>>
>> Alex
>>
>> On Tue, 17 Nov 2020 at 17:42, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>
>>> Errm, I meant:
>>>
>>> EXTRA_PYTHON_DEPENDS ?= ""
>>> EXTRA_PYTHON_DEPENDS_class-target = "python3"
>>> DEPENDS_append = " ${EXTRA_PYTHON_DEPENDS}"
>>>
>>> On Tue, Nov 17, 2020 at 5:41 PM Martin Jansa <martin.jansa@gmail.com>
>>> wrote:
>>>
>>>> Do we need to export _PYTHON_SYSCONFIGDATA_NAME for non-target cases?
>>>>
>>>> And instead of:
>>>> DEPENDS_append = "${@['', ' python3']['${CLASSOVERRIDE}' ==
>>>> 'class-target']}"
>>>>
>>>> I would use intermediate variable like
>>>> EXTRA_PYTHON_DEPENDS = "python3"
>>>> EXTRA_PYTHON_DEPENDS_class-target = ""
>>>> DEPENDS_append = " ${EXTRA_PYTHON_DEPENDS}"
>>>>
>>>> I know it's just personal preference, but in this case with small
>>>> benefit to undo the append if you really don't want it added for some
>>>> mysterious reason.
>>>>
>>>> On Tue, Nov 17, 2020 at 4:34 PM Khem Raj <raj.khem@gmail.com> wrote:
>>>>
>>>>> python3targetconfig append target python3 to dependencies
>>>>> unconditionally, and here its inherited unconditionally too but
>>>>> distutils3-base is inherited in BBCLASSEXTEND'ed recipes and other
>>>>> not-target
>>>>> recipes as well. Hence the change added via
>>>>> 9c8f666097802cb594a759989edcf01603a22df3
>>>>> is now bridging the native dependencies with target python3 and thats
>>>>> resulting all sorts of rebuilds for multimachine builds e.g.
>>>>>
>>>>> MACHINE=qemuarm bitbake python3-scons-native
>>>>> MACHINE=qemumips bitbake python3-scons-native
>>>>>
>>>>> results in rebuilds for python3-scons-native
>>>>>
>>>>> bitbake-diffsigs shows
>>>>>
>>>>> Hash for dependent task python/python3-scons-native_3.1.2.bb:do_populate_sysroot
>>>>> changed from
>>>>> 1cdb93193b416477df6faa137e83a967b433c7aa29033146b405153f73f36933 to
>>>>> 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897
>>>>> 0e3b97bd058d162065
>>>>>     Hash for dependent task python/python3-scons-native_3.1.2.bb:do_install
>>>>> changed from
>>>>> 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb4fb11aef86dd89 to
>>>>> c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156
>>>>> 229cb0f5ebb11
>>>>>         Hash for dependent task python/python3-scons-native_3.1.2.bb:do_compile
>>>>> changed from
>>>>> e3ee4b52a15267e6ae7853ec19a666b2fb62608a597608793336382d1c45f8a0 to
>>>>> 1e582043dfe6b3e00aaa532f363ce6afb37652abe837dac
>>>>> 7cc9769194c43eae1
>>>>>             Hash for dependent task
>>>>> python/python3-scons-native_3.1.2.bb:do_configure changed from
>>>>> 770a4d5a77a96ebd9e1e7368f710bca3f88e3b1266dffa3b2d0360b1e3a81e27 to
>>>>> a366982778b03eee5165c3117ee778f848acdfaa2
>>>>> b346650fbdf114ac70ab57b
>>>>>                 Hash for dependent task
>>>>> python/python3-scons-native_3.1.2.bb:do_prepare_recipe_sysroot
>>>>> changed from
>>>>> 958910037856ff5d5eb2b5162b3cdd02a3a710fc543b933cfeba771ee095cb72 to
>>>>> 474333fb565f908992fd3716
>>>>> 4935aaecf31a79e867826fe634cde4f44171d8e7
>>>>>                     Hash for dependent task python/python3_3.9.0.bb:do_populate_sysroot
>>>>> changed from
>>>>> 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2c9e485e7f5975fecf8 to
>>>>> 25dcfe74a95af19cce8df7c29311cc5edbbf6ad
>>>>> 08777e46a6fa6e417c0445018
>>>>>
>>>>> ...
>>>>>
>>>>> Therefore limit inheriting this class only for target recipes.
>>>>>
>>>>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>>>> Cc: Alexander Kanavin <alex.kanavin@gmail.com>
>>>>> Cc: Martin Jansa <Martin.Jansa@gmail.com>
>>>>> ---
>>>>> v2: Mark depends conditional instead
>>>>>
>>>>>  meta/classes/python3targetconfig.bbclass | 2 +-
>>>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/meta/classes/python3targetconfig.bbclass
>>>>> b/meta/classes/python3targetconfig.bbclass
>>>>> index 640d0c97b6..b79ec211c7 100644
>>>>> --- a/meta/classes/python3targetconfig.bbclass
>>>>> +++ b/meta/classes/python3targetconfig.bbclass
>>>>> @@ -1,6 +1,6 @@
>>>>>  inherit python3native
>>>>>
>>>>> -DEPENDS_append = " python3"
>>>>> +DEPENDS_append = "${@['', ' python3']['${CLASSOVERRIDE}' ==
>>>>> 'class-target']}"
>>>>>
>>>>>  do_configure_prepend() {
>>>>>          export _PYTHON_SYSCONFIGDATA_NAME="_sysconfigdata"
>>>>> --
>>>>> 2.29.2
>>>>>
>>>>>

--000000000000163a3b05b4536e7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>No, it had always worked. _PYTHON_SYSCONFIGDATA_NAME =
shouldn&#39;t be exported without a dependency on target python3, if you ar=
e building for the target, but if you are building for native via BBCLASSEX=
TEND, it fell back correctly to sysconfigdata provided by native python.<br=
></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 17 Nov 2020 at 21:29, Mart=
in Jansa &lt;<a href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.c=
om</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
"><div dir=3D"ltr">BBCLASSEXTEND was also a bit broken, right? You said tha=
t _PYTHON_SYSCONFIGDATA_NAME shouldn&#39;t be exported without a dependency=
 on target python3 which the=C2=A0BBCLASSEXTENDed native didn&#39;t get.<br=
></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr"=
>On Tue, Nov 17, 2020 at 6:45 PM Alexander Kanavin &lt;<a href=3D"mailto:al=
ex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"l=
tr"><div></div><div>The commit description should be adjusted to drop menti=
on of BBCLASSEXTEND, the problem does not happen there. <br></div><div><br>=
</div><div>Also note my comment in the other thread.<br></div><div><br></di=
v><div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Tue, 17 Nov 2020 at 17:42, Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr">Errm, I meant:<div><br></div><div><div>EXTRA_PYTHON_DEPEND=
S ?=3D &quot;&quot;</div><div>EXTRA_PYTHON_DEPENDS_class-target =3D &quot;p=
ython3&quot;<br></div><div>DEPENDS_append =3D &quot; ${EXTRA_PYTHON_DEPENDS=
}&quot;</div></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cl=
ass=3D"gmail_attr">On Tue, Nov 17, 2020 at 5:41 PM Martin Jansa &lt;<a href=
=3D"mailto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com=
</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:=
0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">=
<div dir=3D"ltr">Do we need to export _PYTHON_SYSCONFIGDATA_NAME for non-ta=
rget cases?<div><br></div><div>And instead of:</div><div>DEPENDS_append =3D=
 &quot;${@[&#39;&#39;, &#39; python3&#39;][&#39;${CLASSOVERRIDE}&#39; =3D=
=3D &#39;class-target&#39;]}&quot;<br></div><div><br></div><div>I would use=
 intermediate variable like</div><div>EXTRA_PYTHON_DEPENDS =3D &quot;python=
3&quot;</div><div>EXTRA_PYTHON_DEPENDS_class-target =3D &quot;&quot;<br></d=
iv><div>DEPENDS_append =3D &quot; ${EXTRA_PYTHON_DEPENDS}&quot;</div><div><=
br></div><div>I know it&#39;s just personal preference, but in this case wi=
th small benefit to undo the append if you really don&#39;t want it added f=
or some mysterious reason.</div></div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 17, 2020 at 4:34 PM Khem Raj &l=
t;<a href=3D"mailto:raj.khem@gmail.com" target=3D"_blank">raj.khem@gmail.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>python3targetconfig append target python3 to dependencies<br>
unconditionally, and here its inherited unconditionally too but<br>
distutils3-base is inherited in BBCLASSEXTEND&#39;ed recipes and other not-=
target<br>
recipes as well. Hence the change added via 9c8f666097802cb594a759989edcf01=
603a22df3<br>
is now bridging the native dependencies with target python3 and thats<br>
resulting all sorts of rebuilds for multimachine builds e.g.<br>
<br>
MACHINE=3Dqemuarm bitbake python3-scons-native<br>
MACHINE=3Dqemumips bitbake python3-scons-native<br>
<br>
results in rebuilds for python3-scons-native<br>
<br>
bitbake-diffsigs shows<br>
<br>
Hash for dependent task python/python3-scons-native_3.1.2.bb:do_populate_sy=
sroot changed from 1cdb93193b416477df6faa137e83a967b433c7aa29033146b405153f=
73f36933 to 3cea1e7cbedd121ecb768fbc291cc4e4d7d3b5c0442897<br>
0e3b97bd058d162065<br>
=C2=A0 =C2=A0 Hash for dependent task python/python3-scons-native_3.1.2.bb:=
do_install changed from 8d6018fd03ffc6060a04532dc39a5b7ccca1be026a69d069cb4=
fb11aef86dd89 to c5f1d173596a8e910f45a2b6e0b4dab96cd0102be4d62bd3156<br>
229cb0f5ebb11<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash for dependent task python/python3-scons-na=
tive_3.1.2.bb:do_compile changed from e3ee4b52a15267e6ae7853ec19a666b2fb626=
08a597608793336382d1c45f8a0 to 1e582043dfe6b3e00aaa532f363ce6afb37652abe837=
dac<br>
7cc9769194c43eae1<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash for dependent task python/py=
thon3-scons-native_3.1.2.bb:do_configure changed from 770a4d5a77a96ebd9e1e7=
368f710bca3f88e3b1266dffa3b2d0360b1e3a81e27 to a366982778b03eee5165c3117ee7=
78f848acdfaa2<br>
b346650fbdf114ac70ab57b<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash for dependent =
task python/python3-scons-native_3.1.2.bb:do_prepare_recipe_sysroot changed=
 from 958910037856ff5d5eb2b5162b3cdd02a3a710fc543b933cfeba771ee095cb72 to 4=
74333fb565f908992fd3716<br>
4935aaecf31a79e867826fe634cde4f44171d8e7<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Hash =
for dependent task python/python3_3.9.0.bb:do_populate_sysroot changed from=
 7ac1c4fcbb2eacf98d2c32d991751bd2f3c7d55e2e32f2c9e485e7f5975fecf8 to 25dcfe=
74a95af19cce8df7c29311cc5edbbf6ad<br>
08777e46a6fa6e417c0445018<br>
<br>
...<br>
<br>
Therefore limit inheriting this class only for target recipes.<br>
<br>
Signed-off-by: Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com" target=3D=
"_blank">raj.khem@gmail.com</a>&gt;<br>
Cc: Alexander Kanavin &lt;<a href=3D"mailto:alex.kanavin@gmail.com" target=
=3D"_blank">alex.kanavin@gmail.com</a>&gt;<br>
Cc: Martin Jansa &lt;<a href=3D"mailto:Martin.Jansa@gmail.com" target=3D"_b=
lank">Martin.Jansa@gmail.com</a>&gt;<br>
---<br>
v2: Mark depends conditional instead<br>
<br>
=C2=A0meta/classes/python3targetconfig.bbclass | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/classes/python3targetconfig.bbclass b/meta/classes/python=
3targetconfig.bbclass<br>
index 640d0c97b6..b79ec211c7 100644<br>
--- a/meta/classes/python3targetconfig.bbclass<br>
+++ b/meta/classes/python3targetconfig.bbclass<br>
@@ -1,6 +1,6 @@<br>
=C2=A0inherit python3native<br>
<br>
-DEPENDS_append =3D &quot; python3&quot;<br>
+DEPENDS_append =3D &quot;${@[&#39;&#39;, &#39; python3&#39;][&#39;${CLASSO=
VERRIDE}&#39; =3D=3D &#39;class-target&#39;]}&quot;<br>
<br>
=C2=A0do_configure_prepend() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0export _PYTHON_SYSCONFIGDATA_NAME=3D&quot=
;_sysconfigdata&quot;<br>
-- <br>
2.29.2<br>
<br>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>
</blockquote></div>

--000000000000163a3b05b4536e7b--
