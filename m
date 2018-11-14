Return-Path: <liu.ming50@gmail.com>
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com
	[209.85.221.49])
	by mail.openembedded.org (Postfix) with ESMTP id 76D86601D4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 19:47:25 +0000 (UTC)
Received: by mail-wr1-f49.google.com with SMTP id 96so1744035wrb.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2018 11:47:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kRIvphIcwVbaEgZYgQl0bm+imWEwBhVyPE12SzhH9Vg=;
	b=hq6RVFRKdG6KD3MjjTYKjSd/z9tp9PfWdmku/UgRi7FnORUeU2zA/nsBiS+4Rf6fM6
	gKz8rGzuKrC1+NrGICFKviZ8QCnnwVylfn51s+Hr2HDfXQvnqMIxlvsRV3u6GqlrkBBx
	rXT64DyVZY2vSALM5NxQroewQjSSLC38AhNx/RPSPLwPiSokM95Z93dPH/PPFtlk1Wb2
	lNmbF89NL+Gm1bb2gUhWmdk1g7g9loiq2DoFd9vc/28pX3ctC+jwCrYOMk32boxnIg8O
	7GRF4wiuCkUlt0k4el+OjX2WCJog2O8c+XaYYF3eiIRL9O5oD6elsiB4l/x4MU2PFQxH
	4Rlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kRIvphIcwVbaEgZYgQl0bm+imWEwBhVyPE12SzhH9Vg=;
	b=rLpSZ2plq6grRrUWeNRr2/P9yQrQBxwDEKx58wx9MW6vO5EqKsAtPH4bGoC1tjLji+
	PNqyn7LrzkA0A99PMpdZcNpgPUfYuzpJoryqeNKw88fdev9JmEVOCcB/dT5IYEdnrOG3
	ZZZCVaiJSHxSe0oamLbs+FBUfVUNsClxz9/BUMOji0h0lCcTMfQI8ctghh3MGD+FPD3j
	meTUOOEJ4AjqTi2mcOM74rIDf6qeiGZBMCRD9FxRtwcNQJZMs6eA/y0XO+ZDrZ1rqklq
	JUDwqPivpqkpbWQmMwROLqu3nlPAk9y9ZnvYaZYYUs2WtXz1Q8JOowb8DrpVyCbEJYIe
	HhDQ==
X-Gm-Message-State: AA+aEWbUQqVkIBGr2La87v0tyj7Qm6UzbupN9GIikZU45CwtY1s8frnP
	7ML8eZOpM6jr9Sxx7ZMKowQ5sLsDmNPUswPcOhY=
X-Google-Smtp-Source: AFSGD/W2sbMMGH0iUzTcSBg5i0hHVHxH7Ncu7NGm0YC51F1YfYgk4ysvaC+2snJfpAD+L0y7pvQsFtfarIT4ukwxXpw=
X-Received: by 2002:a5d:6549:: with SMTP id z9mr1250841wrv.116.1542224846185; 
	Wed, 14 Nov 2018 11:47:26 -0800 (PST)
MIME-Version: 1.0
References: <1542222350-15249-1-git-send-email-liu.ming50@gmail.com>
	<CAFNP8OupoL7_iTydvuAL2hZA=MHZ8=3bNd16pMMDToTGrsxKAg@mail.gmail.com>
In-Reply-To: <CAFNP8OupoL7_iTydvuAL2hZA=MHZ8=3bNd16pMMDToTGrsxKAg@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Wed, 14 Nov 2018 20:47:14 +0100
Message-ID: <CALatG=5Fuy-5xv1aA2agjQCa+7Mq2jj=JdXak_-tSvvyJ0pBvw@mail.gmail.com>
To: srifenbark@gmail.com
Cc: stefan.agner@toradex.com,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] doc: drop some incorrect instructions
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
X-List-Received-Date: Wed, 14 Nov 2018 19:47:25 -0000
Content-Type: multipart/alternative; boundary="0000000000001ee834057aa53481"

--0000000000001ee834057aa53481
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Scott:

Thanks for the re-writing, I think it's correct technically, the incorrect
description had been removed.

//Ming Liu

Scott Rifenbark <srifenbark@gmail.com> =E6=96=BC 2018=E5=B9=B411=E6=9C=8814=
=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=888:36=E5=AF=AB=E9=81=93=EF=BC=
=9A

> Ming,
>
> I could not simply apply this patch.  I had to do some re-writing for
> clarity.  Please look at this link to the updated section on the
> image_types class and let me know if this is technically correct.
>
>
> https://yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#ref-classes-=
image_types
>
> Thanks,
> Scott
>
> On Wed, Nov 14, 2018 at 11:06 AM <liu.ming50@gmail.com> wrote:
>
>> From: Ming Liu <liu.ming50@gmail.com>
>>
>> image_types bbclass now is being inherited mandatorily in image.bbclass
>> through the variable IMGCLASSES, and the users do not have to inherit
>> it in their customized image type bbclass, or put it in IMAGE_CLASSES.
>>
>> Drop the incorrect descriptions, it's confusing the developers.
>>
>> Signed-off-by: Ming Liu <liu.ming50@gmail.com>
>> ---
>>  documentation/ref-manual/ref-classes.xml | 9 ++-------
>>  1 file changed, 2 insertions(+), 7 deletions(-)
>>
>> diff --git a/documentation/ref-manual/ref-classes.xml
>> b/documentation/ref-manual/ref-classes.xml
>> index 24d7a0a..876e242 100644
>> --- a/documentation/ref-manual/ref-classes.xml
>> +++ b/documentation/ref-manual/ref-classes.xml
>> @@ -1275,15 +1275,10 @@
>>      </para>
>>
>>      <para>
>> -        By default, this class is enabled through the
>> -        <link
>> linkend=3D'var-IMAGE_CLASSES'><filename>IMAGE_CLASSES</filename></link>
>> -        variable in
>> +        By default, this class is enabled mandatorily in
>>          <link
>> linkend=3D'ref-classes-image'><filename>image.bbclass</filename></link>.
>>          If you define your own image types using a custom BitBake class
>> and
>> -        then use <filename>IMAGE_CLASSES</filename> to enable it, the
>> custom
>> -        class must either inherit <filename>image_types</filename> or
>> -        <filename>image_types</filename> must also appear in
>> -        <filename>IMAGE_CLASSES</filename>.
>> +        then use <filename>IMAGE_CLASSES</filename> to enable it.
>>      </para>
>>
>>      <para>
>> --
>> 2.7.4
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>

--0000000000001ee834057aa53481
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Scott:<div><br></div><div>Thanks for the re-writing, I=
 think it&#39;s correct technically, the incorrect description had been rem=
oved.</div><div><br></div><div>//Ming Liu</div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr">Scott Rifenbark &lt;<a href=3D"mailto:srifenbark@=
gmail.com">srifenbark@gmail.com</a>&gt; =E6=96=BC 2018=E5=B9=B411=E6=9C=881=
4=E6=97=A5 =E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=888:36=E5=AF=AB=E9=81=93=EF=
=BC=9A<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8e=
x;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><div>Ming, <br></div><div><br></div><div>I could not simply apply thi=
s patch.=C2=A0 I had to do some re-writing for clarity.=C2=A0 Please look a=
t this link to the updated section on the image_types class and let me know=
 if this is technically correct.</div><div><br></div><div><a href=3D"https:=
//yoctoproject.org/docs/2.6/ref-manual/ref-manual.html#ref-classes-image_ty=
pes" target=3D"_blank">https://yoctoproject.org/docs/2.6/ref-manual/ref-man=
ual.html#ref-classes-image_types</a></div><div><br></div><div>Thanks,</div>=
<div>Scott<br></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"=
ltr">On Wed, Nov 14, 2018 at 11:06 AM &lt;<a href=3D"mailto:liu.ming50@gmai=
l.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #cc=
c solid;padding-left:1ex">From: Ming Liu &lt;<a href=3D"mailto:liu.ming50@g=
mail.com" target=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
<br>
image_types bbclass now is being inherited mandatorily in image.bbclass<br>
through the variable IMGCLASSES, and the users do not have to inherit<br>
it in their customized image type bbclass, or put it in IMAGE_CLASSES.<br>
<br>
Drop the incorrect descriptions, it&#39;s confusing the developers.<br>
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:liu.ming50@gmail.com" target=
=3D"_blank">liu.ming50@gmail.com</a>&gt;<br>
---<br>
=C2=A0documentation/ref-manual/ref-classes.xml | 9 ++-------<br>
=C2=A01 file changed, 2 insertions(+), 7 deletions(-)<br>
<br>
diff --git a/documentation/ref-manual/ref-classes.xml b/documentation/ref-m=
anual/ref-classes.xml<br>
index 24d7a0a..876e242 100644<br>
--- a/documentation/ref-manual/ref-classes.xml<br>
+++ b/documentation/ref-manual/ref-classes.xml<br>
@@ -1275,15 +1275,10 @@<br>
=C2=A0 =C2=A0 =C2=A0&lt;/para&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0&lt;para&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 By default, this class is enabled through the<=
br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;link linkend=3D&#39;var-IMAGE_CLASSES&#39;=
&gt;&lt;filename&gt;IMAGE_CLASSES&lt;/filename&gt;&lt;/link&gt;<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 variable in<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 By default, this class is enabled mandatorily =
in<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;link linkend=3D&#39;ref-classes-image=
&#39;&gt;&lt;filename&gt;image.bbclass&lt;/filename&gt;&lt;/link&gt;.<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0If you define your own image types using =
a custom BitBake class and<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 then use &lt;filename&gt;IMAGE_CLASSES&lt;/fil=
ename&gt; to enable it, the custom<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 class must either inherit &lt;filename&gt;imag=
e_types&lt;/filename&gt; or<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;filename&gt;image_types&lt;/filename&gt; m=
ust also appear in<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 &lt;filename&gt;IMAGE_CLASSES&lt;/filename&gt;=
.<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 then use &lt;filename&gt;IMAGE_CLASSES&lt;/fil=
ename&gt; to enable it.<br>
=C2=A0 =C2=A0 =C2=A0&lt;/para&gt;<br>
<br>
=C2=A0 =C2=A0 =C2=A0&lt;para&gt;<br>
-- <br>
2.7.4<br>
<br>
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

--0000000000001ee834057aa53481--
