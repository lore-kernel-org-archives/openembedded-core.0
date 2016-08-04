Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id 102D175CF1
	for <openembedded-core@lists.openembedded.org>;
	Thu,  4 Aug 2016 01:41:49 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id x189so9829490qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Aug 2016 18:41:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YbTQNkQcNQDr2Gf97XDfzsERin0rHGwskz4uzQC8ho8=;
	b=nimUkAVrExfOnw5fXfWiH+eC+bEHDGJU0Sc2jnGK2ioIebdEKLwtNqSUGNfu9pyVju
	mZzRvhpWDdm/rrGMGpNZ6syl02yB+Vb/TDXfeTg87M2CT25k8Y60PKrHy/+nT3YxLm0p
	uECLtt3GYlbm4jbBXa4bM3qsk+0sw1gMjgCGlapsSJRnzwBDHKfh/uBkxsoY5hY7CRfM
	pHEkAyhpP/9ZeU3C57yBlU4Vs6zfPfKuLZpcSdASxvLnaaCP+4KMFZKF+cH5DSL5XTq+
	palzBYPLrvkJGAdaGjTRIKyHMv+qaIHEIrj4yAWLl6yYEHakVzHs9PcR8ZGHkuIWedmN
	p/iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YbTQNkQcNQDr2Gf97XDfzsERin0rHGwskz4uzQC8ho8=;
	b=PysBeEGPcTM+mJ96VTMZ0jWh9oX/wZ6Zv1xPQyf0Hu3UF0dFffMe98YFbwVUPuKKe6
	b0b/Qdk+zPBflOfUKUvNqmUDmqPjd+CPEaP0IrZvlgm54dSoT3gtnEiM6yJoSKkXTQSC
	SySAAWf411ac8XoPDS+99XQ/ikz3q9idhJw47/TSdE+FZEj9rMsMT5gR4RNDKNSM8Uue
	/Zcyylx3a1cByE3EH+urnDK5yxFm8fDqxus0OOv1LAqPup1u8e34YZ4Kj0tHTXA31GMz
	I0xCiqyXcpnY2G7gaQAjDywHV416rSTXreCv8TW3Ko1lSYDhDuoFsr2o4IonsX2afta+
	zM4Q==
X-Gm-Message-State: AEkoouuSH/R+4u/0hRbMzRaSMkZjALRIHhX7qU5LIDt1JNHMOIhPwGu4/DhkkbzBH+W1jdTmsdyM5pN2fegNUg==
X-Received: by 10.55.106.195 with SMTP id f186mr3456603qkc.92.1470274910490;
	Wed, 03 Aug 2016 18:41:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Wed, 3 Aug 2016 18:41:50 -0700 (PDT)
In-Reply-To: <1e6c0615-e39a-e2c3-23dd-992a03e06901@gmail.com>
References: <1469552171-8500-1-git-send-email-jacob.kroon@gmail.com>
	<1e6c0615-e39a-e2c3-23dd-992a03e06901@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 3 Aug 2016 21:41:50 -0400
Message-ID: <CADkTA4MYqHCQ0AiR72dxhVAVw0=K7Ui-F3ip3jS9x6gUE_5VqA@mail.gmail.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-devsrc: Don't package kernel meta-data
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
X-List-Received-Date: Thu, 04 Aug 2016 01:41:53 -0000
Content-Type: multipart/alternative; boundary=001a114fddb8c315990539350d34

--001a114fddb8c315990539350d34
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 3, 2016 at 5:33 AM, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> On 07/26/2016 06:56 PM, Jacob Kroon wrote:
>
>>  * The kernel meta-data doesn't need to be distributed in the kernel
>> source
>>    package, so drop it
>>  * Fix a typo
>>  * Split long lines
>>
>> Signed-off-by: Jacob Kroon <jacob.kroon@gmail.com>
>> ---
>>  meta/recipes-kernel/linux/kernel-devsrc.bb | 10 +++++++---
>>  1 file changed, 7 insertions(+), 3 deletions(-)
>>
>> diff --git a/meta/recipes-kernel/linux/kernel-devsrc.bb
>> b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> index 0fdd0ad..2dcf01e 100644
>> --- a/meta/recipes-kernel/linux/kernel-devsrc.bb
>> +++ b/meta/recipes-kernel/linux/kernel-devsrc.bb
>> @@ -41,13 +41,17 @@ do_install() {
>>
>>          #
>>          # Copy the staging dir source (and module build support) into
>> the devsrc structure.
>> -        # We can keep this copy simple and take everything, since a
>> we'll clean up any build
>> +        # We can keep this copy simple and take everything, since we'll
>> clean up any build
>>          # artifacts afterwards, and the extra i/o is not significant
>>          #
>>          cd ${B}
>> -        find . -type d -name '.git*' -prune -o -path '.debug' -prune -o
>> -type f -print0 | cpio --null -pdlu $kerneldir
>> +        find . -type d -name '.git*' -prune -o \
>> +               -path '.debug' -prune -o \
>> +               -type f -print0 | cpio --null -pdlu $kerneldir
>>          cd ${S}
>> -        find . -type d -name '.git*' -prune -o -type f -print0 | cpio
>> --null -pdlu $kerneldir
>> +        find . -type d -name '.git*' -prune -o \
>> +               -type d -name '.kernel-meta' -prune -o \
>> +               -type f -print0 | cpio --null -pdlu $kerneldir
>>
>>          # Explicitly set KBUILD_OUTPUT to ensure that the image
>> directory is cleaned and not
>>          # The main build artifacts. We clean the directory to avoid QA
>> errors on mismatched
>>
>>
> Ignore this patch, I'm suspecting that .kernel-meta/ directory shouldn't
> exist in ${STAGING_KERNEL_DIR} to begin with ?
>

It doesn't hurt anything by being there, but you can either intercept it at
the
time we stage the common kernel parts, or when you package devsrc .. either
will work.

Bruce


> /Jacob
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114fddb8c315990539350d34
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Wed, Aug 3, 2016 at 5:33 AM, Jacob Kroon <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:jacob.kroon@gmail.com" target=3D"_blank">jacob.kroon@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div class=3D"HOEn=
Zb"><div class=3D"h5">On 07/26/2016 06:56 PM, Jacob Kroon wrote:<br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0* The kernel meta-data doesn&#39;t need to be distributed in the kern=
el source<br>
=C2=A0 =C2=A0package, so drop it<br>
=C2=A0* Fix a typo<br>
=C2=A0* Split long lines<br>
<br>
Signed-off-by: Jacob Kroon &lt;<a href=3D"mailto:jacob.kroon@gmail.com" tar=
get=3D"_blank">jacob.kroon@gmail.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a> | 10 +++++++---<br>
=C2=A01 file changed, 7 insertions(+), 3 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" =
rel=3D"noreferrer" target=3D"_blank">kernel-devsrc.bb</a> b/meta/recipes-ke=
rnel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"noreferrer" target=3D=
"_blank">kernel-devsrc.bb</a><br>
index 0fdd0ad..2dcf01e 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://kernel-devsrc.bb" rel=3D"=
noreferrer" target=3D"_blank">kernel-devsrc.bb</a><br>
@@ -41,13 +41,17 @@ do_install() {<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Copy the staging dir source (and module=
 build support) into the devsrc structure.<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We can keep this copy simple and take everyt=
hing, since a we&#39;ll clean up any build<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We can keep this copy simple and take everyt=
hing, since we&#39;ll clean up any build<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# artifacts afterwards, and the extra i/o=
 is not significant<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0#<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${B}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 find . -type d -name &#39;.git*&#39; -prune -o=
 -path &#39;.debug&#39; -prune -o -type f -print0 | cpio --null -pdlu $kern=
eldir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 find . -type d -name &#39;.git*&#39; -prune -o=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-path &#39;.debug&#=
39; -prune -o \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-type f -print0 | c=
pio --null -pdlu $kerneldir<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0cd ${S}<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 find . -type d -name &#39;.git*&#39; -prune -o=
 -type f -print0 | cpio --null -pdlu $kerneldir<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 find . -type d -name &#39;.git*&#39; -prune -o=
 \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-type d -name &#39;=
.kernel-meta&#39; -prune -o \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-type f -print0 | c=
pio --null -pdlu $kerneldir<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Explicitly set KBUILD_OUTPUT to ensure =
that the image directory is cleaned and not<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# The main build artifacts. We clean the =
directory to avoid QA errors on mismatched<br>
<br>
</blockquote>
<br></div></div>
Ignore this patch, I&#39;m suspecting that .kernel-meta/ directory shouldn&=
#39;t exist in ${STAGING_KERNEL_DIR} to begin with ?<span class=3D"HOEnZb">=
<font color=3D"#888888"><br></font></span></blockquote><div><br></div><div>=
It doesn&#39;t hurt anything by being there, but you can either intercept i=
t at the<br></div><div>time we stage the common kernel parts, or when you p=
ackage devsrc .. either <br></div><div>will work.<br><br></div><div>Bruce<b=
r></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:=
0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"HOEn=
Zb"><font color=3D"#888888">
/Jacob</font></span><div class=3D"HOEnZb"><div class=3D"h5"><br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--001a114fddb8c315990539350d34--
