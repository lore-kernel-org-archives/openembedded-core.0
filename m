Return-Path: <david.c.nystrom@gmail.com>
Received: from mail-oa0-f42.google.com (mail-oa0-f42.google.com
	[209.85.219.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1A9676EE5C
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 19:40:05 +0000 (UTC)
Received: by mail-oa0-f42.google.com with SMTP id j17so2747890oag.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 21 Feb 2014 11:40:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=zSpgs+/lYpbZVyAH3JD2ibA3E+sTFqO92XVFAkzefU4=;
	b=C9StdmSIz61N1kqcgAkJNRBhpr0zLDvCbXGHqx3aY5Tea4omDfGeOsPx5iaWqnQDIH
	ywWFLYC2vJrsAJs+bApuqM1zObdGTofGxeK2FvH8VNtMt+dqIgQApEuReI8rpbSE76CV
	imtROFTK+CLebYfpNs8zORuMiZ3GjZdnjK7gwuwc7ICtxyTlAi+JMiACWLPdyQdkuEGO
	N4lf6BJHmm45quoL+ho7fsdbq9C3tm5WeyyNz5eomplaJ9eC0kpJ90LEOuRdDtgVNLHG
	ebi/faiZFqM1kr7AGdDkYxXUYT88uLNnFqvYtTQcJLJ9DZ75hfcownFUQZ4Jps75t/mw
	HQ6Q==
MIME-Version: 1.0
X-Received: by 10.60.246.70 with SMTP id xu6mr2673354oec.33.1393011606595;
	Fri, 21 Feb 2014 11:40:06 -0800 (PST)
Received: by 10.60.40.200 with HTTP; Fri, 21 Feb 2014 11:40:06 -0800 (PST)
Received: by 10.60.40.200 with HTTP; Fri, 21 Feb 2014 11:40:06 -0800 (PST)
In-Reply-To: <53079ABF.2090204@linux.intel.com>
References: <1392991017-3524-1-git-send-email-david.c.nystrom@gmail.com>
	<53079ABF.2090204@linux.intel.com>
Date: Fri, 21 Feb 2014 20:40:06 +0100
Message-ID: <CAAKB1h2Etg6DixU6fpO79GEhkV1mu5noDuXdzrjE9NmrnmPKvw@mail.gmail.com>
From: David Nystrom <david.c.nystrom@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] x264: SPE is not compatible with Altivec
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
X-List-Received-Date: Fri, 21 Feb 2014 19:40:06 -0000
Content-Type: multipart/alternative; boundary=001a11369c56faaf1004f2efc9ca

--001a11369c56faaf1004f2efc9ca
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Feb 21, 2014 7:28 PM, "Saul Wold" <sgw@linux.intel.com> wrote:
>
> On 02/21/2014 05:56 AM, David Nystr=F6m wrote:
>>
>> Signed-off-by: David Nystr=F6m <david.c.nystrom@gmail.com>
>> ---
>>   meta/recipes-multimedia/x264/x264_git.bb | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/meta/recipes-multimedia/x264/x264_git.bbb/meta/recipes-mult=
imedia/x264/
x264_git.bb
>> index 5ebf885..782c26e 100644
>> --- a/meta/recipes-multimedia/x264/x264_git.bb
>> +++ b/meta/recipes-multimedia/x264/x264_git.bb
>> @@ -23,6 +23,7 @@ inherit lib_package pkgconfig
>>   X264_DISABLE_ASM =3D ""
>>   X264_DISABLE_ASM_armv4 =3D "--disable-asm"
>>   X264_DISABLE_ASM_armv5 =3D "--disable-asm"
>> +X264_DISABLE_ASM_e500v2 =3D "--disable-asm"
>>
> I think that this change really belongs in the e500v2 BSP, it's not
generic enough to include in core.

Perhaps you know this already, but e500v2 is a cpu arch, same as armv5.

For future reference, should all ppc related CPU-arch specific stuff be
directed to the FSL bsp ?

Br,
David

>
> Thanks
>         Sau!
>
>
>
>>   EXTRA_OECONF =3D '--prefix=3D${prefix} \
>>                   --host=3D${HOST_SYS} \
>>

--001a11369c56faaf1004f2efc9ca
Content-Type: text/html; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

<p dir=3D"ltr"><br>
On Feb 21, 2014 7:28 PM, &quot;Saul Wold&quot; &lt;<a href=3D"mailto:sgw@li=
nux.intel.com">sgw@linux.intel.com</a>&gt; wrote:<br>
&gt;<br>
&gt; On 02/21/2014 05:56 AM, David Nystr=F6m wrote:<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: David Nystr=F6m &lt;<a href=3D"mailto:david.c.nystr=
om@gmail.com">david.c.nystrom@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt; =A0 meta/recipes-multimedia/x264/<a href=3D"http://x264_git.bb">x2=
64_git.bb</a> | 1 +<br>
&gt;&gt; =A0 1 file changed, 1 insertion(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/recipes-multimedia/x264/<a href=3D"http://x264_g=
it.bb">x264_git.bb</a> b/meta/recipes-multimedia/x264/<a href=3D"http://x26=
4_git.bb">x264_git.bb</a><br>
&gt;&gt; index 5ebf885..782c26e 100644<br>
&gt;&gt; --- a/meta/recipes-multimedia/x264/<a href=3D"http://x264_git.bb">=
x264_git.bb</a><br>
&gt;&gt; +++ b/meta/recipes-multimedia/x264/<a href=3D"http://x264_git.bb">=
x264_git.bb</a><br>
&gt;&gt; @@ -23,6 +23,7 @@ inherit lib_package pkgconfig<br>
&gt;&gt; =A0 X264_DISABLE_ASM =3D &quot;&quot;<br>
&gt;&gt; =A0 X264_DISABLE_ASM_armv4 =3D &quot;--disable-asm&quot;<br>
&gt;&gt; =A0 X264_DISABLE_ASM_armv5 =3D &quot;--disable-asm&quot;<br>
&gt;&gt; +X264_DISABLE_ASM_e500v2 =3D &quot;--disable-asm&quot;<br>
&gt;&gt;<br>
&gt; I think that this change really belongs in the e500v2 BSP, it&#39;s no=
t generic enough to include in core.</p>
<p dir=3D"ltr">Perhaps you know this already, but e500v2 is a cpu arch, sam=
e as armv5. </p>
<p dir=3D"ltr">For future reference, should all ppc related CPU-arch specif=
ic stuff be directed to the FSL bsp ?</p>
<p dir=3D"ltr">Br,<br>
David</p>
<p dir=3D"ltr">&gt;<br>
&gt; Thanks<br>
&gt; =A0 =A0 =A0 =A0 Sau!<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt;&gt; =A0 EXTRA_OECONF =3D &#39;--prefix=3D${prefix} \<br>
&gt;&gt; =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --host=3D${HOST_SYS} \<br>
&gt;&gt;<br>
</p>

--001a11369c56faaf1004f2efc9ca--
