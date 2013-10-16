Return-Path: <sujith.h@gmail.com>
Received: from mail-vc0-f175.google.com (mail-vc0-f175.google.com
	[209.85.220.175])
	by mail.openembedded.org (Postfix) with ESMTP id BC92C6CCA3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Oct 2013 05:54:04 +0000 (UTC)
Received: by mail-vc0-f175.google.com with SMTP id ia6so116446vcb.20
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Oct 2013 22:54:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=P9/yu088PZWRYIUU5W6HdPtJEwjUZ/OjgDpftt306gg=;
	b=Q3/Ep8q8QjGX4lxaoWRDW/Ewh7wy8DKIL5PxbsYZF6VRS+KmrTcwQ/Ay4i7OhXuMHu
	jAMuK87xh0fdwrssPyCBuKHjhHh1KFoWzxtHa7AEmqygVA8Yj5h09D9WaYfVMhPxEjlC
	eQAO5C3CeLXK1wVUGZE8o8u/v5OFUD6msCHFBUYC5D2xvs7VWFFO4xOClVSxzC2MR72H
	gHFGOJz8dcBJ4gFD/+UAhvNu7k+1Qa4KPxVTM7MhOCmiHESh5sPSksKRb34+glMu2mv7
	5FfDqpXfS1x5BpJQo3xsoP3a+GXKJXjSfNuJt2wl/pBRs/X7RYCgRJHpjNWrbwxEAPQQ
	0E4Q==
X-Received: by 10.220.142.140 with SMTP id q12mr298277vcu.21.1381902846145;
	Tue, 15 Oct 2013 22:54:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.205.17 with HTTP; Tue, 15 Oct 2013 22:53:46 -0700 (PDT)
In-Reply-To: <525D8E5F.3020705@linux.intel.com>
References: <1381292732-5090-1-git-send-email-sujith.h@gmail.com>
	<525D8E5F.3020705@linux.intel.com>
From: sujith h <sujith.h@gmail.com>
Date: Wed, 16 Oct 2013 11:23:46 +0530
Message-ID: <CADyYWL=GT-ugd2ZJ8DDgfmrDFrOh2HU6ZGHx_Yh3H6-Jk+C1Rg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Sujith H <Sujith_Haridasan@mentor.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] Fixing the warning
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
X-List-Received-Date: Wed, 16 Oct 2013 05:54:05 -0000
Content-Type: multipart/alternative; boundary=047d7b344064423ad604e8d5543a

--047d7b344064423ad604e8d5543a
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Sau


On Wed, Oct 16, 2013 at 12:20 AM, Saul Wold <sgw@linux.intel.com> wrote:

> On 10/08/2013 09:25 PM, Sujith H wrote:
>
>> Warning: No GNU_HASH in the elf binary
>>
>>
> The short commit message needs to be in the format similar to
> nspr: Add LDFLAGS to TARGET_CC_ARCH to fix Warning
>
> Then more details in the commit message.
>
> Can you give more details about which target this is failing, I am not
> sure we have seen these.
>


I had updated the patch. This scenario is observed in the imx6 sabrelite
board( based on arm). There are lot of warning messages
which come while building nspr. I had mentioned only 3 of them in my new
patch. Kindly let me know if more information is required,
so that I can help.


> 1.5 is complete and will be released shortly.
>

Ouch :(


>
> Thanks
>         Sau!
>
>
>  Signed-off-by: Sujith H <Sujith_Haridasan@mentor.com>
>> ---
>>   meta/recipes-support/nspr/nspr**_4.10.bb <http://nspr_4.10.bb> | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-support/nspr/ns**pr_4.10.bb<http://nspr_4.10.b=
b>b/meta/recipes-support/nspr/
>> ns**pr_4.10.bb <http://nspr_4.10.bb>
>> index fcecb95..4247fd0 100644
>> --- a/meta/recipes-support/nspr/ns**pr_4.10.bb <http://nspr_4.10.bb>
>> +++ b/meta/recipes-support/nspr/ns**pr_4.10.bb <http://nspr_4.10.bb>
>> @@ -19,6 +19,7 @@ SRC_URI[sha256sum] =3D "**0cfbe561676b92e5af3ddc7ac774=
52*
>> *014e3da8885da66baec811e73541
>>   S =3D "${WORKDIR}/nspr-${PV}/nspr"
>>
>>   RDEPENDS_${PN}-dev +=3D "perl"
>> +TARGET_CC_ARCH +=3D "${LDFLAGS}"
>>
>>   TESTS =3D "runtests.pl \
>>       runtests.sh \
>>
>>

Thanks,

Sujith H

--=20
=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=B4=B0=
=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D
Bangalore
<Project>Contributor to KDE project
http://fci.wikia.com/wiki/Anti-DRM-Campaign
<Blog> http://sujithh.info

--047d7b344064423ad604e8d5543a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Sau<br><div><div class=3D"gmail_extra"><br><br><div cla=
ss=3D"gmail_quote">On Wed, Oct 16, 2013 at 12:20 AM, Saul Wold <span dir=3D=
"ltr">&lt;<a href=3D"mailto:sgw@linux.intel.com" target=3D"_blank">sgw@linu=
x.intel.com</a>&gt;</span> wrote:<br>

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div class=3D"im">On 10/08/2013 09:25 PM, Su=
jith H wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Warning: No GNU_HASH in the elf binary<br>
<br>
</blockquote>
<br></div>
The short commit message needs to be in the format similar to<br>
nspr: Add LDFLAGS to TARGET_CC_ARCH to fix Warning<br>
<br>
Then more details in the commit message.<br>
<br>
Can you give more details about which target this is failing, I am not sure=
 we have seen these.<br></blockquote><div><br><br></div><div>I had updated =
the patch. This scenario is observed in the imx6 sabrelite board( based on =
arm). There are lot of warning messages<br>

which come while building nspr. I had mentioned only 3 of them in my new pa=
tch. Kindly let me know if more information is required,<br>so that I can h=
elp.<br><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .=
8ex;border-left:1px #ccc solid;padding-left:1ex">


<br>
1.5 is complete and will be released shortly.<br></blockquote><div><br></di=
v><div>Ouch :(<br>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Thanks<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 Sau!<div class=3D"HOEnZb"><div class=3D"h5"><br=
>
<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
Signed-off-by: Sujith H &lt;<a href=3D"mailto:Sujith_Haridasan@mentor.com" =
target=3D"_blank">Sujith_Haridasan@mentor.com</a>&gt;<br>
---<br>
=C2=A0 meta/recipes-support/nspr/<a href=3D"http://nspr_4.10.bb" target=3D"=
_blank">nspr<u></u>_4.10.bb</a> | 1 +<br>
=C2=A0 1 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/recipes-support/nspr/<a href=3D"http://nspr_4.10.bb" targ=
et=3D"_blank">ns<u></u>pr_4.10.bb</a> b/meta/recipes-support/nspr/<a href=
=3D"http://nspr_4.10.bb" target=3D"_blank">ns<u></u>pr_4.10.bb</a><br>
index fcecb95..4247fd0 100644<br>
--- a/meta/recipes-support/nspr/<a href=3D"http://nspr_4.10.bb" target=3D"_=
blank">ns<u></u>pr_4.10.bb</a><br>
+++ b/meta/recipes-support/nspr/<a href=3D"http://nspr_4.10.bb" target=3D"_=
blank">ns<u></u>pr_4.10.bb</a><br>
@@ -19,6 +19,7 @@ SRC_URI[sha256sum] =3D &quot;<u></u>0cfbe561676b92e5af3dd=
c7ac77452<u></u>014e3da8885da66baec811e73541<br>
=C2=A0 S =3D &quot;${WORKDIR}/nspr-${PV}/nspr&quot;<br>
<br>
=C2=A0 RDEPENDS_${PN}-dev +=3D &quot;perl&quot;<br>
+TARGET_CC_ARCH +=3D &quot;${LDFLAGS}&quot;<br>
<br>
=C2=A0 TESTS =3D &quot;<a href=3D"http://runtests.pl" target=3D"_blank">run=
tests.pl</a> \<br>
=C2=A0 =C2=A0 =C2=A0 runtests.sh \<br>
<br>
</blockquote>
</div></div></blockquote></div><br><br></div><div class=3D"gmail_extra">Tha=
nks,<br><br>Sujith H<br clear=3D"all"></div><div class=3D"gmail_extra"><br>=
-- <br>=E0=B4=B8=E0=B5=81=E0=B4=9C=E0=B4=BF=E0=B4=A4=E0=B5=8D =E0=B4=B9=E0=
=B4=B0=E0=B4=BF=E0=B4=A6=E0=B4=BE=E0=B4=B8=E0=B4=A8=E0=B5=8D<br>Bangalore<b=
r>&lt;Project&gt;Contributor to KDE project<br>

<a href=3D"http://fci.wikia.com/wiki/Anti-DRM-Campaign" target=3D"_blank">h=
ttp://fci.wikia.com/wiki/Anti-DRM-Campaign</a><br>&lt;Blog&gt; <a href=3D"h=
ttp://sujithh.info" target=3D"_blank">http://sujithh.info</a><br>
</div></div></div>

--047d7b344064423ad604e8d5543a--
