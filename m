Return-Path: <frederic.martinsons@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7661C77B7E
	for <webhook@archiver.kernel.org>; Mon, 24 Apr 2023 09:44:40 +0000 (UTC)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
 by mx.groups.io with SMTP id smtpd.web11.46824.1682329474791976532
 for <openembedded-core@lists.openembedded.org>;
 Mon, 24 Apr 2023 02:44:35 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=oPpMOogb;
 spf=pass (domain: gmail.com, ip: 209.85.167.46, mailfrom: frederic.martinsons@gmail.com)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-4edcdfa8638so4453767e87.2
        for <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 02:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682329473; x=1684921473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=GqRCwxGEEVBvHhIDEgawQlen/WETHs//esSDawsTdys=;
        b=oPpMOogbrFJKfm3TnJzPuXakRhyqZbRk5qn/aEEfA/3VBJDK16klutXaIUQk4CkBNJ
         UKW54UB/r7kCxeU8UgcPqWG/7wAWO5LUmm2+YMv3I+JBPL95L8CC83nk7rpzAz1Kp8ON
         zr4HmvBGzvpPGZhjm382GXbbCb8KYB03S/+mqdLLnb+zxELV4RyOEPj8Fwx4RdgUSFb9
         MAQPIayJ/8tqk4OO2KbRd39mVf3K/IrgrVXuvQlrn/xLOrnfMKwXZP0nsAVl3o14DDC2
         ZkfE3KehPGsSIg8Hkv/2cWgBCyryvV0IRtGesAmQIVxfMmr3Kbd31kDh7DsloZPH0VfV
         DBFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682329473; x=1684921473;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GqRCwxGEEVBvHhIDEgawQlen/WETHs//esSDawsTdys=;
        b=MHIyqvL2L79rBZab3nD8vstj013/knRWt+M2h/I87j8QWqRIWD3VMFEc6mdAAnwYXF
         KOXPnYaZFQS481RqlzHpSdl0p4HnzuPVZHwpPKBXvovYWT2C54kWbjZDO+7eWtKxHpxl
         e1H7mSScN9clRfC0ihEDxi7JIcRwKQl0OaDiXXG6ltxgx80escJ/ytYnZ7JlrbGRWKFS
         h4oH/O32NWrX2AW+Uja2s1Sj/ek8fKI/Dir8Aeg4uNPShSlKSwiATC2V96X42BbeJevp
         Om5LFGOUkmBY9CawYgBrX9v1g5dWXm+JuT0GVblXngSW4Z3Ym43oQQu6rpbKDFxJNnUY
         ie0A==
X-Gm-Message-State: AAQBX9cmrDq5LTASEvBQinKRGkBPzdJ4monFZ9H6gXte1qBhEWf+2Fef
	Hf3gBHLR3eGw05YBty46v7F2mOjBFh9jR/yeY2g=
X-Google-Smtp-Source: AKy350bizF2/xA+qfukN/i9QsR2azo0I+0/KyLMYRK3Slx0CNYHPjIVndcCCtkWK2FjXsVA3FJ638XWXx6oUczwCy+w=
X-Received: by 2002:a19:ac43:0:b0:4ee:d799:eca with SMTP id
 r3-20020a19ac43000000b004eed7990ecamr2886347lfc.40.1682329472758; Mon, 24 Apr
 2023 02:44:32 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1682178812.git.frederic.martinsons@gmail.com>
 <CANNYZj-z_nV55eatamXDzGh5Y0TzPX3=yOJ1UnL9qtOHgtpKbA@mail.gmail.com> <1758D12BE8A5C7D7.10313@lists.openembedded.org>
In-Reply-To: <1758D12BE8A5C7D7.10313@lists.openembedded.org>
From: =?UTF-8?B?RnLDqWTDqXJpYyBNYXJ0aW5zb25z?= <frederic.martinsons@gmail.com>
Date: Mon, 24 Apr 2023 11:44:21 +0200
Message-ID: <CA+cAker=3c7CYdq8WRnaVmr45n-Ja2Tt7p-0iMWKmDeAcZJUqQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 0/3] Create class for building rust unit test
To: frederic.martinsons@gmail.com
Cc: Alexander Kanavin <alex.kanavin@gmail.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009e79c605fa11da65"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 24 Apr 2023 09:44:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/180346

--0000000000009e79c605fa11da65
Content-Type: text/plain; charset="UTF-8"

On Mon, 24 Apr 2023 at 10:20, Frederic Martinsons via lists.openembedded.org
<frederic.martinsons=gmail.com@lists.openembedded.org> wrote:

>
> On Mon, 24 Apr 2023 at 09:51, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> If you add ptests, please also add them to appropriate lists in
>> meta/conf/distro/include/ptest-packagelists.inc, so they will be
>> actually built and executed in yocto CI.
>>
>> Can you include a sample output of the tests you added into commit
>> messages?
>>
>> Alex
>>
>
> Ok I will issue a V2 with the modifications asked.
>
>
I looked again and python3-bcrypt is already in PTESTS_FAST , for zvariant
, the recipe is in meta-selftest
so this layer is not always included, is this will be a problem to add
zvariant into PTESTS_FAST ?

On Sat, 22 Apr 2023 at 17:59, Frederic Martinsons
>> <frederic.martinsons@gmail.com> wrote:
>> >
>> > From: Frederic Martinsons <frederic.martinsons@gmail.com>
>> >
>> > This brings the possibility to use this class to build and ship
>> > unit tests of rust projects, the class also create (or modified)
>> > standard run-ptest script to run the generated rust test suite.
>> >
>> > It has been tested successfully with core-image-sato under qemu
>> > for zvariant-ptest and python3-bcrypt-ptest (though the last one
>> > didn't define any unit tests).
>> >
>> > Note that I tried to do the same with python3-cryptography but fail
>> > to build the test suite and I don't know how to do it with the rust
>> > extension module build by python setuptools. There must be some kind
>> > of way for doing that so maybe someone will put some work in it (
>> > because python3-cryptography rust extension do have unit tests).
>> >
>> > Moreover, in the class, I didn't manage to share data between
>> > do_compile_ptest_base and do_install_ptest_base cleanly (I tried
>> > to d.setVar in compile and d.getVar in install but it seems that
>> > the data store doens't recognize my new variable) so I used a file
>> > for that. I'm sure there is a clever way for doing that, so feel
>> > free to tell me.
>> >
>> > The following changes since commit
>> 45a8bb6e4676899d40525e7d5ad1c1ddefee3185:
>> >
>> >   apt-util: Fix ptest on musl (2023-04-20 11:56:03 +0100)
>> >
>> > are available in the Git repository at:
>> >
>> >   https://gitlab.com/fmartinsons/openembedded-core cargo-add-ptest
>> >
>> > Frederic Martinsons (3):
>> >   ptest-cargo.bbclass: create class
>> >   python3-bcrypt: enable build of unit tests
>> >   zvariant: add ptest feature for zvariant test suite
>> >
>> >  .../zvariant/zvariant_3.12.0.bb               |  11 +-
>> >  meta/classes-recipe/ptest-cargo.bbclass       | 108 ++++++++++++++++++
>> >  .../python/python3-bcrypt_4.0.1.bb            |   4 +-
>> >  3 files changed, 121 insertions(+), 2 deletions(-)
>> >  create mode 100644 meta/classes-recipe/ptest-cargo.bbclass
>> >
>> > --
>> > 2.34.1
>> >
>> >
>> >
>> >
>>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#180341):
> https://lists.openembedded.org/g/openembedded-core/message/180341
> Mute This Topic: https://lists.openembedded.org/mt/98436057/6213388
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> frederic.martinsons@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000009e79c605fa11da65
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, 24 Apr 2023 at 10:20, Frederi=
c Martinsons via <a href=3D"http://lists.openembedded.org">lists.openembedd=
ed.org</a> &lt;frederic.martinsons=3D<a href=3D"mailto:gmail.com@lists.open=
embedded.org">gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D"=
ltr"><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, 24 Apr 2023 at 09:51, Alexander Kanavin &lt;<a href=3D"mailto:=
alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.com</a>&gt; wr=
ote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">If you add =
ptests, please also add them to appropriate lists in<br>
meta/conf/distro/include/ptest-packagelists.inc, so they will be<br>
actually built and executed in yocto CI.<br>
<br>
Can you include a sample output of the tests you added into commit messages=
?<br>
<br>
Alex<br></blockquote><div><br></div>Ok I will issue a V2 with the modificat=
ions=C2=A0asked.<br><div><br></div></div></div></blockquote><div><br></div>=
<div>I looked again and python3-bcrypt is already in PTESTS_FAST , for zvar=
iant , the recipe is in meta-selftest</div><div>so this layer is not always=
 included, is this will be a problem to add zvariant into PTESTS_FAST ?</di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=
=3D"ltr"><div class=3D"gmail_quote"><div></div><blockquote class=3D"gmail_q=
uote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,2=
04);padding-left:1ex">
On Sat, 22 Apr 2023 at 17:59, Frederic Martinsons<br>
&lt;<a href=3D"mailto:frederic.martinsons@gmail.com" target=3D"_blank">fred=
eric.martinsons@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; From: Frederic Martinsons &lt;<a href=3D"mailto:frederic.martinsons@gm=
ail.com" target=3D"_blank">frederic.martinsons@gmail.com</a>&gt;<br>
&gt;<br>
&gt; This brings the possibility to use this class to build and ship<br>
&gt; unit tests of rust projects, the class also create (or modified)<br>
&gt; standard run-ptest script to run the generated rust test suite.<br>
&gt;<br>
&gt; It has been tested successfully with core-image-sato under qemu<br>
&gt; for zvariant-ptest and python3-bcrypt-ptest (though the last one<br>
&gt; didn&#39;t define any unit tests).<br>
&gt;<br>
&gt; Note that I tried to do the same with python3-cryptography but fail<br=
>
&gt; to build the test suite and I don&#39;t know how to do it with the rus=
t<br>
&gt; extension module build by python setuptools. There must be some kind<b=
r>
&gt; of way for doing that so maybe someone will put some work in it (<br>
&gt; because python3-cryptography rust extension do have unit tests).<br>
&gt;<br>
&gt; Moreover, in the class, I didn&#39;t manage to share data between<br>
&gt; do_compile_ptest_base and do_install_ptest_base cleanly (I tried<br>
&gt; to d.setVar in compile and d.getVar in install but it seems that<br>
&gt; the data store doens&#39;t recognize my new variable) so I used a file=
<br>
&gt; for that. I&#39;m sure there is a clever way for doing that, so feel<b=
r>
&gt; free to tell me.<br>
&gt;<br>
&gt; The following changes since commit 45a8bb6e4676899d40525e7d5ad1c1ddefe=
e3185:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0apt-util: Fix ptest on musl (2023-04-20 11:56:03 +0100)<br=
>
&gt;<br>
&gt; are available in the Git repository at:<br>
&gt;<br>
&gt;=C2=A0 =C2=A0<a href=3D"https://gitlab.com/fmartinsons/openembedded-cor=
e" rel=3D"noreferrer" target=3D"_blank">https://gitlab.com/fmartinsons/open=
embedded-core</a> cargo-add-ptest<br>
&gt;<br>
&gt; Frederic Martinsons (3):<br>
&gt;=C2=A0 =C2=A0ptest-cargo.bbclass: create class<br>
&gt;=C2=A0 =C2=A0python3-bcrypt: enable build of unit tests<br>
&gt;=C2=A0 =C2=A0zvariant: add ptest feature for zvariant test suite<br>
&gt;<br>
&gt;=C2=A0 .../zvariant/<a href=3D"http://zvariant_3.12.0.bb" rel=3D"norefe=
rrer" target=3D"_blank">zvariant_3.12.0.bb</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 11 +-<br>
&gt;=C2=A0 meta/classes-recipe/ptest-cargo.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=
=A0| 108 ++++++++++++++++++<br>
&gt;=C2=A0 .../python/<a href=3D"http://python3-bcrypt_4.0.1.bb" rel=3D"nor=
eferrer" target=3D"_blank">python3-bcrypt_4.0.1.bb</a>=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A04 +-<br>
&gt;=C2=A0 3 files changed, 121 insertions(+), 2 deletions(-)<br>
&gt;=C2=A0 create mode 100644 meta/classes-recipe/ptest-cargo.bbclass<br>
&gt;<br>
&gt; --<br>
&gt; 2.34.1<br>
&gt;<br>
&gt;<br>
&gt; <br>
&gt;<br>
</blockquote></div></div>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#180341): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/180341" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/180341</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/98436057/6213=
388" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/98436057/6213388</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:frederic.martinsons@gmail.=
com" target=3D"_blank">frederic.martinsons@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--0000000000009e79c605fa11da65--

