Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web08.19577.1621838055092967647
 for <openembedded-core@lists.openembedded.org>;
 Sun, 23 May 2021 23:34:15 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=NR4eQV/N;
 spf=pass (domain: gmail.com, ip: 209.85.218.49, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id lg14so39973541ejb.9
        for <openembedded-core@lists.openembedded.org>; Sun, 23 May 2021 23:34:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=lFxM6nzdswi20ThYrE79raGMC4Hv94nmPZtVzVZd8KM=;
        b=NR4eQV/Ne7YHoHd1j3FdcoSvTrs2rJwmUE+nG6+1v37oS6bodfMW0+rVW6K9/6dPAX
         rQ4fPYWJMsqULxmS33aK4YOyTJaTDkpko8msxWVLXi/5bPgySvB3OKpWTFoAgNF8d5BY
         VjHT2zmh1uTvi9qfFa6CQ7KLOojmFbBQiQa3AtnPg3kB7Fr9O9wFXzTOhQrGga90XvhS
         8CbdPUoK+n7TWlIOj6A2qGZL4GXPDcIm2fkxAqTB06xGFZ0Kx4TENPG7VS2isZX8+MsI
         8A3O7nzI90r3CbSmjo+aBZjMcEh80j3EQ5nTOg+FaIV0CBGZchx5vwfDTKNBG/FW+Kji
         t5Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=lFxM6nzdswi20ThYrE79raGMC4Hv94nmPZtVzVZd8KM=;
        b=ch2ahLHdwnoq5YPX42nHWlnl2hpbVENS1TC1k5wTohDg512kTJu65dKzIHS38DPNYz
         sNgWDtLTbHGS5ZsBjNUS5btnlMiqhoE4kAl+eXnvRMnn5aFPlKoqj009A9ur55Aml3t2
         r4Au37qP8Y9qFu35Thw9/IIjyktFm80kzLNsg2CuPiFqhDJrLGcEqYuPo6BzdxzYpZv0
         d4LKa66KgZsRcnDSNUtVc+TCAnAT73XGCCuWxgkHtiMIM63kJV5G5kJUvEWN5V5dP/WK
         KtCty5mrvU6o27NlKqNdSUg+SQunHFpr8SVfs4wJo57wgzyqDN3X2Fz4sGN28PbrxQPt
         AqUg==
X-Gm-Message-State: AOAM530vqJ6IczB0PU7MUv68KrCeJhPPQ930wLyyo/YZmTM6B/UTKUOg
	h6r+uyLiqyN7Rc2xjvXEzRMeKlrsvEVJAxjutiM=
X-Google-Smtp-Source: ABdhPJxI3OstNZ8MoRARzODaJ+T7ChdSRmWYsQMfb8jOgquARujn+l1CKCyfyGCsrahh6gkDfycsSFVcm/OL16H+vlc=
X-Received: by 2002:a17:907:98c9:: with SMTP id kd9mr5662899ejc.54.1621838053346;
 Sun, 23 May 2021 23:34:13 -0700 (PDT)
MIME-Version: 1.0
References: <20210430065946.1475-1-qiang.zhang@windriver.com>
 <CA+chaQdUUJUWO3KR53KMhS+Z0awz3pdeGNFaOcK+VTaBQ487pQ@mail.gmail.com> <31d6ac76-270e-4a9a-217d-83b07a9589cd@windriver.com>
In-Reply-To: <31d6ac76-270e-4a9a-217d-83b07a9589cd@windriver.com>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Mon, 24 May 2021 08:34:02 +0200
Message-ID: <CA+chaQekbs0NTM=cYcMSE1mOSbDoTaE3wn091VBpOZRzW19u6w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rt-tests: Update rt-tests
To: ChenQi <Qi.Chen@windriver.com>
Cc: "Zhang, Qiang" <qiang.zhang@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000000d91b505c30d9905"

--0000000000000d91b505c30d9905
Content-Type: text/plain; charset="UTF-8"

Hi,

thanks, I haven't seen this patch yesterday, but now I've found it, can you
please update the PV "1.10" and the comment "# Version 1.8" as it's no
longer 1.10 nor 1.8?

rt-tests$ git log --oneline v1.10..c9051a36d934503b4673ca5615f631bae36dead0
| wc -l                                                |
65

Regards,

On Mon, May 24, 2021 at 3:58 AM ChenQi <Qi.Chen@windriver.com> wrote:

> I talked with Qiang and sent out a patch to solve this problem last week.
> The title is "[OE-core][PATCH] rt-tests: update SRCREV".
>
> Best Regards,
> Chen Qi
>
> On 05/23/2021 02:39 PM, Martin Jansa wrote:
>
> Hi,
>
> this SRCREV no longer exists in rt-tests repo:
> rt-tests-1_1.10-r0 do_fetch: Fetcher failure: Unable to find revision
> 6af88067da16c6e69243b376c3b6454ec694460b in branch unstable/devel/latest
> even from upstream
>
> rt-tests$ git branch -a --contains 6af88067da16c6e69243b376c3b6454ec694460b
> error: no such commit 6af88067da16c6e69243b376c3b6454ec694460b
>
> the old v1.10 SRCREV still exists in defined branch:
> rt-tests$ git branch -a --contains 32819581cc0509c9d58c33c3061f57abe0c40c88
>   remotes/origin/unstable/devel/latest
>   remotes/origin/unstable/devel/no-numa-runtime
>
> rt-tests$ git show-ref -d v1.10
> d232f528fd131b7d840e79a3756d1dbdaa9b1b60 refs/tags/v1.10
> 32819581cc0509c9d58c33c3061f57abe0c40c88 refs/tags/v1.10^{}
>
> Can you please fix PV to indicate that it doesn't match with 1.10 version
> anymore and update the SRCREV to something which exists now?
>
> Regards,
>
> On Fri, Apr 30, 2021 at 8:59 AM Zhang, Qiang <qiang.zhang@windriver.com>
> wrote:
>
>> From: Zqiang <qiang.zhang@windriver.com>
>>
>> When run cyclictest, the parameter enable NUMA. but in some BSP
>> which not support NUMA, will causes the test program to exit
>> directly and does not carry out subsequent operations, the
>> latest changes have fixed this problem. so update to the
>> latest branch to resolve.
>>
>> Signed-off-by: Zqiang <qiang.zhang@windriver.com>
>> ---
>>  meta/recipes-rt/rt-tests/rt-tests.inc | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc
>> b/meta/recipes-rt/rt-tests/rt-tests.inc
>> index 9358f13d06..0c89bad91f 100644
>> --- a/meta/recipes-rt/rt-tests/rt-tests.inc
>> +++ b/meta/recipes-rt/rt-tests/rt-tests.inc
>> @@ -1,5 +1,5 @@
>>  # Version 1.8
>> -SRCREV = "32819581cc0509c9d58c33c3061f57abe0c40c88"
>> +SRCREV = "6af88067da16c6e69243b376c3b6454ec694460b"
>>  PE = "1"
>>
>>  SRC_URI = "git://
>> git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest
>> <https://urldefense.com/v3/__http://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=unstable/devel/latest__;%21%21AjveYdw8EvQ%21LmrhADE_pizwsseLouVODl2xByKZt-B7V6l43HZZ6ykhrJXHXvOYYZDsxWEZZTHh8w$>
>> "
>> --
>> 2.17.1
>>
>>
>>
>>
>>
>
> 
>
>
>
>

--0000000000000d91b505c30d9905
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br></div><div>thanks, I haven&#39;t seen this pat=
ch yesterday, but now I&#39;ve found it, can you please update the PV &quot=
;1.10&quot; and the comment &quot;# Version 1.8&quot; as it&#39;s no longer=
 1.10 nor 1.8?</div><div><br></div><div>rt-tests$ git log --oneline v1.10..=
c9051a36d934503b4673ca5615f631bae36dead0 | wc -l =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>=
65<br></div><div><br></div><div>Regards,</div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, May 24, 2021 at 3:58 =
AM ChenQi &lt;<a href=3D"mailto:Qi.Chen@windriver.com">Qi.Chen@windriver.co=
m</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>

  
  <div bgcolor=3D"#FFFFFF">
    <div>I talked with Qiang and sent out a
      patch to solve this problem last week.<br>
      The title is &quot;[OE-core][PATCH] rt-tests: update SRCREV&quot;.<b=
r>
      <br>
      Best Regards,<br>
      Chen Qi<br>
      <br>
      On 05/23/2021 02:39 PM, Martin Jansa wrote:<br>
    </div>
    <blockquote type=3D"cite">
      
      <div dir=3D"ltr">Hi,
        <div><br>
        </div>
        <div>this SRCREV no longer exists in rt-tests repo:</div>
        <div>rt-tests-1_1.10-r0 do_fetch: Fetcher failure: Unable to
          find revision 6af88067da16c6e69243b376c3b6454ec694460b in
          branch unstable/devel/latest even from upstream<br>
        </div>
        <div><br>
        </div>
        <div>rt-tests$ git branch -a --contains
          6af88067da16c6e69243b376c3b6454ec694460b<br>
          error: no such commit 6af88067da16c6e69243b376c3b6454ec694460b<b=
r>
        </div>
        <div><br>
        </div>
        <div>the old v1.10 SRCREV still exists in defined branch:</div>
        <div>rt-tests$ git branch -a --contains
          32819581cc0509c9d58c33c3061f57abe0c40c88<br>
          =C2=A0 remotes/origin/unstable/devel/latest<br>
          =C2=A0 remotes/origin/unstable/devel/no-numa-runtime<br>
        </div>
        <div><br>
        </div>
        <div>rt-tests$ git show-ref -d v1.10<br>
          d232f528fd131b7d840e79a3756d1dbdaa9b1b60 refs/tags/v1.10<br>
          32819581cc0509c9d58c33c3061f57abe0c40c88 refs/tags/v1.10^{}<br>
        </div>
        <div><br>
        </div>
        <div>Can you please fix PV to indicate that it doesn&#39;t match
          with 1.10 version anymore and update the SRCREV to something
          which exists now?</div>
        <div><br>
        </div>
        <div>Regards,</div>
      </div>
      <br>
      <div class=3D"gmail_quote">
        <div dir=3D"ltr" class=3D"gmail_attr">On Fri, Apr 30, 2021 at 8:59
          AM Zhang, Qiang &lt;<a href=3D"mailto:qiang.zhang@windriver.com"=
 target=3D"_blank">qiang.zhang@windriver.com</a>&gt;
          wrote:<br>
        </div>
        <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">From:
          Zqiang &lt;<a href=3D"mailto:qiang.zhang@windriver.com" target=
=3D"_blank">qiang.zhang@windriver.com</a>&gt;<br>
          <br>
          When run cyclictest, the parameter enable NUMA. but in some
          BSP<br>
          which not support NUMA, will causes the test program to exit<br>
          directly and does not carry out subsequent operations, the<br>
          latest changes have fixed this problem. so update to the<br>
          latest branch to resolve.<br>
          <br>
          Signed-off-by: Zqiang &lt;<a href=3D"mailto:qiang.zhang@windrive=
r.com" target=3D"_blank">qiang.zhang@windriver.com</a>&gt;<br>
          ---<br>
          =C2=A0meta/recipes-rt/rt-tests/rt-tests.inc | 2 +-<br>
          =C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
          <br>
          diff --git a/meta/recipes-rt/rt-tests/rt-tests.inc
          b/meta/recipes-rt/rt-tests/rt-tests.inc<br>
          index 9358f13d06..0c89bad91f 100644<br>
          --- a/meta/recipes-rt/rt-tests/rt-tests.inc<br>
          +++ b/meta/recipes-rt/rt-tests/rt-tests.inc<br>
          @@ -1,5 +1,5 @@<br>
          =C2=A0# Version 1.8<br>
          -SRCREV =3D &quot;32819581cc0509c9d58c33c3061f57abe0c40c88&quot;=
<br>
          +SRCREV =3D &quot;6af88067da16c6e69243b376c3b6454ec694460b&quot;=
<br>
          =C2=A0PE =3D &quot;1&quot;<br>
          <br>
          =C2=A0SRC_URI =3D &quot;git://<a href=3D"https://urldefense.com/=
v3/__http://git.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=3Duns=
table/devel/latest__;%21%21AjveYdw8EvQ%21LmrhADE_pizwsseLouVODl2xByKZt-B7V6=
l43HZZ6ykhrJXHXvOYYZDsxWEZZTHh8w$" rel=3D"noreferrer" target=3D"_blank">git=
.kernel.org/pub/scm/utils/rt-tests/rt-tests.git;branch=3Dunstable/devel/lat=
est</a>&quot;<br>
          -- <br>
          2.17.1<br>
          <br>
          <br>
          <br>
          <br>
        </blockquote>
      </div>
      <br>
      <fieldset></fieldset>
      <br>
      <pre>

</pre>
    </blockquote>
    <p><br>
    </p>
  </div>

</blockquote></div>

--0000000000000d91b505c30d9905--
