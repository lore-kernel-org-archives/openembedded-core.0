Return-Path: <liu.ming50@gmail.com>
Received: from mail-vk0-f67.google.com (mail-vk0-f67.google.com
	[209.85.213.67])
	by mail.openembedded.org (Postfix) with ESMTP id EC13777CCC
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 12:51:06 +0000 (UTC)
Received: by mail-vk0-f67.google.com with SMTP id d188so6694830vka.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Mar 2017 05:51:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YUG+mg7pay5/6Rc4vv9pLf8XNqnWKvhRdrAeWpqlHLY=;
	b=cb8A8Nl1l+k8pQkCtk2DD6NRGAMQ347WhvbEuohpMebPuBf4qLxlnW4/gtQnB15SIV
	ho1DMHbdFVsV0LR5XskAT50seSCXsh1LpuNWv/BFaJ3vHBM+Hpn0B4Z6klKsDHJVhM8N
	q/JywTtKSjmY7Ltr8I3P2mq9WWvrwRCjFt0uY/ZnWeII3eyvAHyIABYWtngVXwSwaXma
	PV10GYh87bHQcGH9iBtm8GBmtsMgRhAenKb5/QUMJyEmuJXHklgEg3WSmuPMXD5Sajt+
	01r2IjY6VKLjP9LAlP5R+1BE1DApazDO8ttvsas7zcEhcSi7c9jFZOm70vtx/yOCW2qw
	TXTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YUG+mg7pay5/6Rc4vv9pLf8XNqnWKvhRdrAeWpqlHLY=;
	b=pE5OqH1zsAlthttz6ilenm7RA+AmIXMPRI4DDUNkFWG9EPmKM7uBcUyHlKUSWYafpb
	djanhi/6ak1kVAMYDj9qK2NW0dS77Mi+kJXyKWd1NZai6ttMRNGwT4TT/nCJCe7Vw6bQ
	zaFOPar8wa9UI8gcomsdUups/5zkpn0zyovosUZ8KEceilqL77k4d3nrgfN20TtmCD1Z
	NddePbUEQhZhM/k6dgS5rG1lbLel9dMDd92fYDuqk42R8rCh6myGbtKnE1scMURoXNRi
	uo22Usflm6Lw6+3yisoRpAtQlKlVS7/ZZD2f/aLahvhSD9qwUqVjWJ+PpAt/xxAxTsSd
	KSHg==
X-Gm-Message-State: AFeK/H1+M4S9kQ+NGvsU1Jz91ndVoVl5KwJNLr+y3fIQy4/9oAAqg2DaTTLtPNoOwwRZ8MHphZzT16n6/jq69Q==
X-Received: by 10.31.163.6 with SMTP id m6mr3144221vke.115.1490878267895; Thu,
	30 Mar 2017 05:51:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.103.149.92 with HTTP; Thu, 30 Mar 2017 05:51:07 -0700 (PDT)
In-Reply-To: <CADkTA4PWt3jnegr3yNUKu9oSCeskDkK-bF8YD-07bq9iDN1Gxw@mail.gmail.com>
References: <1490860739-27953-1-git-send-email-liu.ming50@gmail.com>
	<CADkTA4PWt3jnegr3yNUKu9oSCeskDkK-bF8YD-07bq9iDN1Gxw@mail.gmail.com>
From: Ming Liu <liu.ming50@gmail.com>
Date: Thu, 30 Mar 2017 14:51:07 +0200
Message-ID: <CALatG=7HHJHt0y9Uw=HcTuK3GZgTAoYturtsW9KFLjvu2CHkmw@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Ming Liu <peter.x.liu@external.atlascopco.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel.bbclass: fix some incorrect inter-task dependencies
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
X-List-Received-Date: Thu, 30 Mar 2017 12:51:07 -0000
Content-Type: multipart/alternative; boundary=001a11416e8c8fc1ed054bf22558

--001a11416e8c8fc1ed054bf22558
Content-Type: text/plain; charset=UTF-8

Hi, Bruce:

Got your meaning, will send a V2 soon.

//Ming Liu

2017-03-30 14:38 GMT+02:00 Bruce Ashfield <bruce.ashfield@gmail.com>:

>
>
> On Thu, Mar 30, 2017 at 3:58 AM, <liu.ming50@gmail.com> wrote:
>
>> From: Ming Liu <peter.x.liu@external.atlascopco.com>
>>
>> - Move the addtask statment that kernel_link_images needs run after
>>   do_compile from linux-yocto.inc to kernel.bbclass. Or else the recipes
>>   that inheriting kernel.bbclass might run into implicit dependency
>>   issues.
>> - Fix a typo, "addtask do_strip" should be "addtask strip".
>> - Remove some redundant addtask statments, when "addtask A after B" is
>>   set, then "addtask B before A" is not needed.
>>
>
> These should be multiple commits. Whenever you find yourself listing
> changes in
> a single commit header, it should really be multiple commits. Even if the
> changes
> are small.
>
>
>>
>> Signed-off-by: Ming Liu <peter.x.liu@external.atlascopco.com>
>> ---
>>  meta/classes/kernel.bbclass               | 5 +++--
>>  meta/recipes-kernel/linux/linux-yocto.inc | 1 -
>>  2 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
>> index 244087a..d175f1d 100644
>> --- a/meta/classes/kernel.bbclass
>> +++ b/meta/classes/kernel.bbclass
>> @@ -538,6 +538,7 @@ do_kernel_link_images() {
>>                 ln -sf ../../../vmlinuz.bin
>>         fi
>>  }
>> +addtask kernel_link_images after do_compile
>>
>>  do_strip() {
>>         if [ -n "${KERNEL_IMAGE_STRIP_EXTRA_SECTIONS}" ]; then
>> @@ -566,7 +567,7 @@ do_strip() {
>>  }
>>  do_strip[dirs] = "${B}"
>>
>> -addtask do_strip before do_sizecheck after do_kernel_link_images
>> +addtask strip before do_sizecheck after do_kernel_link_images
>>
>>  # Support checking the kernel size since some kernels need to reside in
>> partitions
>>  # with a fixed length or there is a limit in transferring the kernel to
>> memory
>> @@ -586,7 +587,7 @@ do_sizecheck() {
>>  }
>>  do_sizecheck[dirs] = "${B}"
>>
>> -addtask sizecheck before do_install after do_strip
>> +addtask sizecheck before do_install
>>
>
> Although possibly redundant, I don't see the problem with leaving this in
> place.
> When we have the before and after here, it is self documenting when this
> should
> run.
>
> With this removed, the reader must track down all the task dependencies
> themselves
> if they are to come to the same conclusion. Also, if that other task
> dependency changes,
> this will change.
>
> So I prefer that this stay completely defined and self documenting.
>
> Bruce
>
>
>>
>>  KERNEL_IMAGE_BASE_NAME ?= "${PKGE}-${PKGV}-${PKGR}-${MAC
>> HINE}-${DATETIME}"
>>  # Don't include the DATETIME variable in the sstate package signatures
>> diff --git a/meta/recipes-kernel/linux/linux-yocto.inc
>> b/meta/recipes-kernel/linux/linux-yocto.inc
>> index 556546f..637506a 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto.inc
>> +++ b/meta/recipes-kernel/linux/linux-yocto.inc
>> @@ -65,6 +65,5 @@ do_install_append(){
>>
>>  # extra tasks
>>  addtask kernel_version_sanity_check after do_kernel_metadata
>> do_kernel_checkout before do_compile
>> -addtask kernel_link_images after do_compile before do_strip
>>  addtask validate_branches before do_patch after do_kernel_checkout
>>  addtask kernel_configcheck after do_configure before do_compile
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
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee
> at its end"
>

--001a11416e8c8fc1ed054bf22558
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi, Bruce:<div><br></div><div>Got your meaning, will send =
a V2 soon.</div><div><br></div><div>//Ming Liu</div></div><div class=3D"gma=
il_extra"><br><div class=3D"gmail_quote">2017-03-30 14:38 GMT+02:00 Bruce A=
shfield <span dir=3D"ltr">&lt;<a href=3D"mailto:bruce.ashfield@gmail.com" t=
arget=3D"_blank">bruce.ashfield@gmail.com</a>&gt;</span>:<br><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;p=
adding-left:1ex"><div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div c=
lass=3D"gmail_quote"><span class=3D"">On Thu, Mar 30, 2017 at 3:58 AM,  <sp=
an dir=3D"ltr">&lt;<a href=3D"mailto:liu.ming50@gmail.com" target=3D"_blank=
">liu.ming50@gmail.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">From: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascopco.co=
m" target=3D"_blank">peter.x.liu@external.atlascop<wbr>co.com</a>&gt;<br>
<br>
- Move the addtask statment that kernel_link_images needs run after<br>
=C2=A0 do_compile from linux-yocto.inc to kernel.bbclass. Or else the recip=
es<br>
=C2=A0 that inheriting kernel.bbclass might run into implicit dependency<br=
>
=C2=A0 issues.<br>
- Fix a typo, &quot;addtask do_strip&quot; should be &quot;addtask strip&qu=
ot;.<br>
- Remove some redundant addtask statments, when &quot;addtask A after B&quo=
t; is<br>
=C2=A0 set, then &quot;addtask B before A&quot; is not needed.<br></blockqu=
ote><div><br></div></span><div>These should be multiple commits. Whenever y=
ou find yourself listing changes in <br></div><div>a single commit header, =
it should really be multiple commits. Even if the changes<br></div><div>are=
 small.<br></div><div><div class=3D"h5"><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padd=
ing-left:1ex">
<br>
Signed-off-by: Ming Liu &lt;<a href=3D"mailto:peter.x.liu@external.atlascop=
co.com" target=3D"_blank">peter.x.liu@external.atlascop<wbr>co.com</a>&gt;<=
br>
---<br>
=C2=A0meta/classes/kernel.bbclass=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0| 5 +++--<br>
=C2=A0meta/recipes-kernel/linux/lin<wbr>ux-yocto.inc | 1 -<br>
=C2=A02 files changed, 3 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
index 244087a..d175f1d 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -538,6 +538,7 @@ do_kernel_link_images() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ln -sf ../../../vml=
inuz.bin<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
=C2=A0}<br>
+addtask kernel_link_images after do_compile<br>
<br>
=C2=A0do_strip() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${KERNEL_IMAGE_STRIP_EXTRA_SE<wbr=
>CTIONS}&quot; ]; then<br>
@@ -566,7 +567,7 @@ do_strip() {<br>
=C2=A0}<br>
=C2=A0do_strip[dirs] =3D &quot;${B}&quot;<br>
<br>
-addtask do_strip before do_sizecheck after do_kernel_link_images<br>
+addtask strip before do_sizecheck after do_kernel_link_images<br>
<br>
=C2=A0# Support checking the kernel size since some kernels need to reside =
in partitions<br>
=C2=A0# with a fixed length or there is a limit in transferring the kernel =
to memory<br>
@@ -586,7 +587,7 @@ do_sizecheck() {<br>
=C2=A0}<br>
=C2=A0do_sizecheck[dirs] =3D &quot;${B}&quot;<br>
<br>
-addtask sizecheck before do_install after do_strip<br>
+addtask sizecheck before do_install<br></blockquote><div><br></div></div><=
/div><div>Although possibly redundant, I don&#39;t see the problem with lea=
ving this in place.<br></div><div>When we have the before and after here, i=
t is self documenting when this should<br></div><div>run.<br><br></div><div=
>With this removed, the reader must track down all the task dependencies th=
emselves<br></div><div>if they are to come to the same conclusion. Also, if=
 that other task dependency changes,<br></div><div>this will change.<br><br=
></div><div>So I prefer that this stay completely defined and self document=
ing.<br><br></div><div>Bruce<br></div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding=
-left:1ex"><span class=3D"">
<br>
=C2=A0KERNEL_IMAGE_BASE_NAME ?=3D &quot;${PKGE}-${PKGV}-${PKGR}-${MAC<wbr>H=
INE}-${DATETIME}&quot;<br>
=C2=A0# Don&#39;t include the DATETIME variable in the sstate package signa=
tures<br>
diff --git a/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc b/meta/recipes-=
kernel/linux/li<wbr>nux-yocto.inc<br>
index 556546f..637506a 100644<br>
--- a/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
+++ b/meta/recipes-kernel/linux/li<wbr>nux-yocto.inc<br>
@@ -65,6 +65,5 @@ do_install_append(){<br>
<br>
=C2=A0# extra tasks<br>
=C2=A0addtask kernel_version_sanity_check after do_kernel_metadata do_kerne=
l_checkout before do_compile<br>
-addtask kernel_link_images after do_compile before do_strip<br>
=C2=A0addtask validate_branches before do_patch after do_kernel_checkout<br=
>
=C2=A0addtask kernel_configcheck after do_configure before do_compile<br>
</span><span class=3D"m_-6195538520088688080HOEnZb"><font color=3D"#888888"=
>--<br>
2.7.4<span class=3D"HOEnZb"><font color=3D"#888888"><br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openem<wbr>bedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</font></span></font></span></blockquote></div><span class=3D"HOEnZb"><font=
 color=3D"#888888"><br><br clear=3D"all"><br>-- <br><div class=3D"m_-619553=
8520088688080gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou=
 shalt not follow the NULL pointer, for chaos and madness await thee at its=
 end&quot;</div>
</font></span></div></div>
</blockquote></div><br></div>

--001a11416e8c8fc1ed054bf22558--
