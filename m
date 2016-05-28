Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 04C29770F4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2016 22:16:10 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id r64so18786498oie.1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 28 May 2016 15:16:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=pZ5Qo5gKxJcg2ALy5j7tCCAns2vmqoUwzsvC4ulT5Aw=;
	b=JlmdPn+2tVKZQZN39xlEo1aT/+jpEXVAXBmkdWgYDG2NvjUc0gx1QnhZROzFijl1JH
	F/FtxyGHpAxk4QdOgLCpjzi+xIRLcfvYFdU6dgyYNm5xSXVve2mqHnmkloRHeynwjNKI
	x043LVtPRlQJ/xJ0IEeFkRGVxJZ42+p07xFBUrF48xtGh0vRFEMgeK59gTmYqjTFaUbw
	fXnZiRYZZQ/Dg/ZrR5w60t0FvUcIMW1TKssRbmUUc3rEfB76HklDUQtwlJqN+hRJxLQU
	Mxn4cMU2E+LTUhi5G1u6LwBatQPReiiCPZQnen3iENEJRHMOe7Giw5/9HrCgHNXSUTdW
	rHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=pZ5Qo5gKxJcg2ALy5j7tCCAns2vmqoUwzsvC4ulT5Aw=;
	b=a/bCBNQqyMarK6HOHZNN4B97fy0FWyj98zjnAjt8GoLUq+c7VBoYjiJpII3z8KTuUq
	svsqz0UEOhxQ4arhd3638oUkF1UOgoPKU+oKb9ivmMjfrRKomNuZsUEgkeorvgzaL2Qq
	AGfkhYtYBCxe2N8bCfvPnRJtRXDiZSWdCMNJkX28fs178tUhQkf+JW/Cw13vWaH1j8p7
	5lktrPRay7C7FA0mudHs//8tvn4FfRzfb2avJoCTkr8XiDmi0cErQoF67cIxqAgbvx3Y
	whsAA8v/Y9pNlmKEeceZsPKglxv7ffRIGJhW2oApqw0RonVsRE/gZ2A9AMqg7YmAuV7o
	wjtg==
X-Gm-Message-State: ALyK8tLN+nvnvdk5S3tw8FVHo7mpYXl4OOWqHno1wLv+GuxGhd1JyWHFbgBhSBfzgN0pRY7TdK0lq+A+Y7QYag==
MIME-Version: 1.0
X-Received: by 10.157.51.70 with SMTP id u6mr13306901otd.8.1464473771086; Sat,
	28 May 2016 15:16:11 -0700 (PDT)
Received: by 10.157.32.198 with HTTP; Sat, 28 May 2016 15:16:11 -0700 (PDT)
In-Reply-To: <CADkTA4NQ8TKiQtJSNx8v=mEu0dGOkZahrkFB=+G=oxoGJPd=CQ@mail.gmail.com>
References: <cover.1464450270.git.tom.zanussi@linux.intel.com>
	<2d425e7e0f2020c64240c74a78b65c67d8ad97f0.1464450270.git.tom.zanussi@linux.intel.com>
	<CADkTA4NQ8TKiQtJSNx8v=mEu0dGOkZahrkFB=+G=oxoGJPd=CQ@mail.gmail.com>
Date: Sat, 28 May 2016 18:16:11 -0400
Message-ID: <CADkTA4MO+nkW0JKg4n0EjwGJhCp7YsoJmhUw-LJvw3_Gu=h-5A@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto-rt/4.4: Update KBRANCH
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
X-List-Received-Date: Sat, 28 May 2016 22:16:12 -0000
Content-Type: multipart/alternative; boundary=001a113eed64e899380533ee5e8b

--001a113eed64e899380533ee5e8b
Content-Type: text/plain; charset=UTF-8

On Sat, May 28, 2016 at 6:14 PM, Bruce Ashfield <bruce.ashfield@gmail.com>
wrote:

>
>
> On Sat, May 28, 2016 at 3:27 PM, Tom Zanussi <tom.zanussi@linux.intel.com>
> wrote:
>
>> standard/preempt-rt was replaced by standard/preempt-rt/base in
>> linux-yocto-4.4.git, so KBRANCH needs to be updated accordingly.
>>
>> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>
>> ---
>>  meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> index 5e39374..beff921 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto-rt_4.4.bb
>> @@ -1,4 +1,4 @@
>> -KBRANCH ?= "standard/preempt-rt"
>> +KBRANCH ?= "standard/preempt-rt/base"
>>
>
> This is missing the krogoth tag in the patch, right ?  since for master,
> this was in my series
> under commit [linux-yocto: create intel branches].
>

Hmm. Now that I read all my email, I see that you did send one with the
krogoth tag.
But the rest of my comment was correct :D

Bruce


>
> Bruce
>
>
>
>>
>>  require recipes-kernel/linux/linux-yocto.inc
>>
>> --
>> 1.9.3
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a113eed64e899380533ee5e8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Sat, May 28, 2016 at 6:14 PM, Bruce Ashfield <span dir=3D"ltr">&lt;<=
a href=3D"mailto:bruce.ashfield@gmail.com" target=3D"_blank">bruce.ashfield=
@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=
=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quote"><spa=
n class=3D"">On Sat, May 28, 2016 at 3:27 PM, Tom Zanussi <span dir=3D"ltr"=
>&lt;<a href=3D"mailto:tom.zanussi@linux.intel.com" target=3D"_blank">tom.z=
anussi@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-=
style:solid;border-left-color:rgb(204,204,204);padding-left:1ex">standard/p=
reempt-rt was replaced by standard/preempt-rt/base in<br>
linux-yocto-4.4.git, so KBRANCH needs to be updated accordingly.<br>
<br>
Signed-off-by: Tom Zanussi &lt;<a href=3D"mailto:tom.zanussi@linux.intel.co=
m" target=3D"_blank">tom.zanussi@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.4.bb</a> | 2 +-<br>
=C2=A01 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4=
.bb" rel=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.4.bb</a> b/meta/=
recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" rel=3D"norefe=
rrer" target=3D"_blank">linux-yocto-rt_4.4.bb</a><br>
index 5e39374..beff921 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto-rt_4.4.bb" re=
l=3D"noreferrer" target=3D"_blank">linux-yocto-rt_4.4.bb</a><br>
@@ -1,4 +1,4 @@<br>
-KBRANCH ?=3D &quot;standard/preempt-rt&quot;<br>
+KBRANCH ?=3D &quot;standard/preempt-rt/base&quot;<br></blockquote><div><br=
></div></span><div>This is missing the krogoth tag in the patch, right ? =
=C2=A0since for master, this was in my series</div><div>under commit [linux=
-yocto: create intel branches].</div></div></div></div></blockquote><div><b=
r></div><div>Hmm. Now that I read all my email, I see that you did send one=
 with the krogoth tag.=C2=A0</div><div>But the rest of my comment was corre=
ct :D</div><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gm=
ail_quote"><div><br></div><div>Bruce</div><span class=3D"">







<div><br></div><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left-width:1px;border-left-style:solid;=
border-left-color:rgb(204,204,204);padding-left:1ex">
<br>
=C2=A0require recipes-kernel/linux/linux-yocto.inc<br>
<span><font color=3D"#888888"><br>
--<br>
1.9.3<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></span></div><span class=3D"HOEnZb"><font color=
=3D"#888888"><br><br clear=3D"all"><div><br></div>-- <br><div>&quot;Thou sh=
alt not follow the NULL pointer, for chaos and madness await thee at its en=
d&quot;</div>
</font></span></div></div>
</blockquote></div><br><br clear=3D"all"><div><br></div>-- <br><div class=
=3D"gmail_signature">&quot;Thou shalt not follow the NULL pointer, for chao=
s and madness await thee at its end&quot;</div>
</div></div>

--001a113eed64e899380533ee5e8b--
