Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f196.google.com (mail-qk0-f196.google.com
	[209.85.220.196])
	by mail.openembedded.org (Postfix) with ESMTP id DE132731DB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Aug 2016 01:19:47 +0000 (UTC)
Received: by mail-qk0-f196.google.com with SMTP id x185so6746539qkc.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2016 18:19:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=9tRFpPUFp6kSj0oY00XK+W0ZZnVB/bHlDcYbDCUVkNQ=;
	b=GZE0NFiI3LseN+QCUK2LAKkExeFKdL+u44gWkWU8UvgxZHnFlTBpWAiFQvV+KjcDHz
	uR7mOO7IkffuEKO3seQWny+wfQJQzz7wKe0rejO5B60ucVviGP1v6uZ15akzwKlVbJKs
	Oxg++APKzQqVhQE5xp9y1VG8ku53PTLlseRnGV7ukF7mCgV2XhMlw94yQOJ+8ojd4Icu
	iypJi3H4oo+Hb2AxTc4QOHhTP7PNbQqBlQtm1XX7yPE9xkIJSnHcnR/z1K026BOyIiBx
	vmPzbmuQNQmzR0qL+VZs/SbckXPdFF5D+zyB96XfF3/j4+wAYEB3EbDgxSwzmuV5+HPG
	EFtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=9tRFpPUFp6kSj0oY00XK+W0ZZnVB/bHlDcYbDCUVkNQ=;
	b=MBygXpHDkF2ZOsEvZg3XqcJEFVFGRC/fwdKAXOx6Vo4xbAFvPGn8ztE0so+l5IUoso
	8E1X+ygp1rhgbYbo/iYGyAw9/pZoaZyu10QtygoaqxD4rKW8zkweRHX6LauYhbK0aq2W
	njsa2oolM0qBrg8AX4w6NFacATnqIDjHJnM3408hSAtl/bOeEXnhEBnP7nJv+RzuEeaa
	SAr7iQP6RpDPyi52+aACVjYp3dUbiVFbsoXt2vh6JK8mKME2ogX4nDpwupdqn/Dj6HyG
	46lHg/2iaXJK5eKl9CKVjJwVDJlZ1CfnvRO+S/3SB8u5EUi9W5psbaseeh3ST/fRoZUB
	3wbQ==
X-Gm-Message-State: AEkoouvWOlxmMEmz21PxY5NKNe/pzypRzAPtnefPHiVPJHHAl6pEj1okIfWdiqREyl3ZHcvzKyYJgBFXjJx+sA==
X-Received: by 10.55.139.4 with SMTP id n4mr10258551qkd.161.1470359988324;
	Thu, 04 Aug 2016 18:19:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Thu, 4 Aug 2016 18:19:47 -0700 (PDT)
In-Reply-To: <dfd0136b-fb2a-51a2-b66a-3d5e63c5d2e1@gmail.com>
References: <1469552171-8500-1-git-send-email-jacob.kroon@gmail.com>
	<1e6c0615-e39a-e2c3-23dd-992a03e06901@gmail.com>
	<CADkTA4MYqHCQ0AiR72dxhVAVw0=K7Ui-F3ip3jS9x6gUE_5VqA@mail.gmail.com>
	<dfd0136b-fb2a-51a2-b66a-3d5e63c5d2e1@gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 4 Aug 2016 21:19:47 -0400
Message-ID: <CADkTA4MdxvOJyP3XurnUd1zvaKvJHbn=5o=sSzrOsJSGRqU2qQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 05 Aug 2016 01:19:51 -0000
Content-Type: multipart/alternative; boundary=001a114f8344cbce64053948dc78

--001a114f8344cbce64053948dc78
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 4, 2016 at 3:48 AM, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> On 08/04/2016 03:41 AM, Bruce Ashfield wrote:
>
>> On Wed, Aug 3, 2016 at 5:33 AM, Jacob Kroon <jacob.kroon@gmail.com
>> <mailto:jacob.kroon@gmail.com>> wrote:
>>
> [...]
>
>>     Ignore this patch, I'm suspecting that .kernel-meta/ directory
>>     shouldn't exist in ${STAGING_KERNEL_DIR} to begin with ?
>>
>>
>> It doesn't hurt anything by being there, but you can either intercept it
>> at the
>> time we stage the common kernel parts, or when you package devsrc ..
>> either
>> will work.
>>
>
> Since commit 3b49416fc7a7ee9bfe722f2e6089aa18df41dc58, linux-yocto.inc
> does:
>
> do_install_append(){
>         if [ -n "${KMETA}" ]; then
>                 rm -rf ${STAGING_KERNEL_DIR}/${KMETA}
>         fi
> }
>
> But I think this accidentally got broken by a later commit
> 3b2b4eef0fd06099342fcc2dfa35ecf37840c090, which changed the directory
> name by conditionally prepending a ".":
>
> kmeta = d.getVar( "KMETA", True ) or "meta"
> if not os.path.exists(kmeta):
>     kmeta = "." + kmeta
>
> So it seems to me that the right thing to do here would be to fix and
> move the do_install_append() to kernel-yocto.bbclass. Bruce, what do
> you think ?
>

Yep, that rm -rf could be both ${KMETA} and .${KMETA}. If either exist,
they should be removed. Whether it is in the .inc or the bbclass isn't
significant. I'd leave it where it is as smallest footprint action.

Bruce


>
> Regards Jacob
>



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end"

--001a114f8344cbce64053948dc78
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Aug 4, 2016 at 3:48 AM, Jacob Kroon <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:jacob.kroon@gmail.com" target=3D"_blank">jacob.kroon@gmail.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">O=
n 08/04/2016 03:41 AM, Bruce Ashfield wrote:<br>
</span><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex"><span class=3D"">
On Wed, Aug 3, 2016 at 5:33 AM, Jacob Kroon &lt;<a href=3D"mailto:jacob.kro=
on@gmail.com" target=3D"_blank">jacob.kroon@gmail.com</a><br></span>
&lt;mailto:<a href=3D"mailto:jacob.kroon@gmail.com" target=3D"_blank">jacob=
.kroon@gmail.com</a>&gt;&gt; wrote:<br>
</blockquote>
[...]<span class=3D""><br>
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex">
=C2=A0 =C2=A0 Ignore this patch, I&#39;m suspecting that .kernel-meta/ dire=
ctory<br>
=C2=A0 =C2=A0 shouldn&#39;t exist in ${STAGING_KERNEL_DIR} to begin with ?<=
br>
<br>
<br>
It doesn&#39;t hurt anything by being there, but you can either intercept i=
t<br>
at the<br>
time we stage the common kernel parts, or when you package devsrc .. either=
<br>
will work.<br>
</blockquote>
<br></span>
Since commit 3b49416fc7a7ee9bfe722f2e6089aa18df41dc58, linux-yocto.inc<br>
does:<br>
<br>
do_install_append(){<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 if [ -n &quot;${KMETA}&quot; ]; then<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 rm -rf ${STAGING_KE=
RNEL_DIR}/${KMETA}<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 fi<br>
}<br>
<br>
But I think this accidentally got broken by a later commit<br>
3b2b4eef0fd06099342fcc2dfa35ecf37840c090, which changed the directory<br>
name by conditionally prepending a &quot;.&quot;:<br>
<br>
kmeta =3D d.getVar( &quot;KMETA&quot;, True ) or &quot;meta&quot;<br>
if not os.path.exists(kmeta):<br>
=C2=A0 =C2=A0 kmeta =3D &quot;.&quot; + kmeta<br>
<br>
So it seems to me that the right thing to do here would be to fix and<br>
move the do_install_append() to kernel-yocto.bbclass. Bruce, what do<br>
you think ?<br></blockquote><div><br></div><div>Yep, that rm -rf could be b=
oth ${KMETA} and .${KMETA}. If either exist, they should be removed. Whethe=
r it is in the .inc or the bbclass isn&#39;t significant. I&#39;d leave it =
where it is as smallest footprint action.<br><br></div><div>Bruce<br></div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
Regards Jacob<br>
</blockquote></div><br><br clear=3D"all"><br>-- <br><div class=3D"gmail_sig=
nature" data-smartmail=3D"gmail_signature">&quot;Thou shalt not follow the =
NULL pointer, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a114f8344cbce64053948dc78--
