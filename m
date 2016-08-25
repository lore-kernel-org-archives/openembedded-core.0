Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6BB496FF7B
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 15:52:43 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id o1so3901854qkd.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 25 Aug 2016 08:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=puVh/vnQSDljUu7+UfGgYEZU4vy/316v5OLLS6W1tjI=;
	b=lauF9mDQkrXWQrdOkyzCWMrv61PsM4IVrMKqowTu7b3v1fzmAGItsMNQ+xCT61Iykd
	hMNY1WpLvRmBKN9yAnmuQ89mOhbv/cJJgRCCS/RO/0Yyqj4o6l0SnZkp6M2CEyACKNQz
	Oq80NNF5AYgDw7U3Xmp+pDu2PA2RWxnl0J+924/6Mno4/XXqjrIoK6VQrJmv0yn+9Zh+
	/tAcRSns9Y6nQYDyL7qsXaKP3X8Jbc0F7xicYRyhLCoMg/8OMh8CSC3G0zm8YjRjTxq1
	Da3iBoE8bnE14sfUC+hPmgfpwAkQsNa69JOnR22a5YHnfcxZpGOQG5V4pMbIQDSMi4Ul
	PxQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=puVh/vnQSDljUu7+UfGgYEZU4vy/316v5OLLS6W1tjI=;
	b=ciXBzQNNiqwAqaJiO1RzTJUKmr2bvQio2fHU1X65bDdyOknM4AwUlj0e1793jzGbKS
	bRu+oUVlt0z2Ats6b/2IVfr81qCTMoSdGnr8rlTPHbCFTAsNYGZ31wR3LpByQtKgA6jl
	rAVkAPGHy9xFuKHQfOLC6acYJdm8EL6ji0DLSF2uIKijhbEkU7jdIKfoWiWdI0BhYBA6
	s0taXXfiiBzDH0VfBTg6+L0jLRxFbl/cAq/4K/DF8j+kJzhUhmWTXx5bWzLZRVCfejIm
	7xFSi2SE0CWbbkovKuat14ik1Grib+VNCmT8uy4dYA5vuaRE15e1QhXT8JrvcbHdVcDR
	cTnQ==
X-Gm-Message-State: AE9vXwOYiYtmqos/Lr1wwvVxwiaz7K+HZ8fjs5Q8+GmOsEELuSoCyqlVw4abzbZuad4MBJEaCs75RISFV0fotw==
X-Received: by 10.55.166.137 with SMTP id p131mr11159739qke.161.1472140364401; 
	Thu, 25 Aug 2016 08:52:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.50.137 with HTTP; Thu, 25 Aug 2016 08:52:43 -0700 (PDT)
In-Reply-To: <1472137991773.23686@saabgroup.com>
References: <1472137991773.23686@saabgroup.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Thu, 25 Aug 2016 11:52:43 -0400
Message-ID: <CADkTA4PaWd4Gm7P=u+xB5M9yBxz6yitk11nK4qN76dSOar5ExA@mail.gmail.com>
To: Waldo Mattias <Mattias.Waldo@saabgroup.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] kernel.bbclass: include signing keys when copying files required for module builds
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
X-List-Received-Date: Thu, 25 Aug 2016 15:52:44 -0000
Content-Type: multipart/alternative; boundary=94eb2c06eda07ad133053ae763f8

--94eb2c06eda07ad133053ae763f8
Content-Type: text/plain; charset=UTF-8

On Thu, Aug 25, 2016 at 11:13 AM, Waldo Mattias <Mattias.Waldo@saabgroup.com
> wrote:

> The absence of certs/signing_key.* in $kerneldir made signing of
> out-of-tree kernel modules fail (silently). Add copying of these
> files during the shared_workdir task.
>

I had been pinged on one of the earlier revisions of this, and I can say
that this looks
fine to me.

Acked-by: Bruce Ashfield <bruce.ashfield@windriver.com>

Bruce


>
> Signed-off-by: Mattias Waldo <mattias.waldo@saabgroup.com>
> ---
>  meta/classes/kernel.bbclass | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass
> index db42744..07761e7 100644
> --- a/meta/classes/kernel.bbclass
> +++ b/meta/classes/kernel.bbclass
> @@ -364,6 +364,8 @@ do_shared_workdir () {
>         cp .config $kerneldir/
>         mkdir -p $kerneldir/include/config
>         cp include/config/kernel.release $kerneldir/include/config/
> kernel.release
> +       mkdir -p $kerneldir/certs
> +       cp certs/signing_key.* $kerneldir/certs
>
>         # We can also copy over all the generated files and avoid special
> cases
>         # like version.h, but we've opted to keep this small until file
> creep starts
> --
> 2.9.3
>
>
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

--94eb2c06eda07ad133053ae763f8
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Aug 25, 2016 at 11:13 AM, Waldo Mattias <span dir=3D"ltr">&lt;<=
a href=3D"mailto:Mattias.Waldo@saabgroup.com" target=3D"_blank">Mattias.Wal=
do@saabgroup.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><s=
pan class=3D"">The absence of certs/signing_key.* in $kerneldir made signin=
g of<br>
out-of-tree kernel modules fail (silently). Add copying of these<br>
files during the shared_workdir task.<br></span></blockquote><div><br></div=
><div>I had been pinged on one of the earlier revisions of this, and I can =
say that this looks<br></div><div>fine to me.<br><br></div><div>Acked-by: B=
ruce Ashfield &lt;<a href=3D"mailto:bruce.ashfield@windriver.com">bruce.ash=
field@windriver.com</a>&gt;<br><br></div><div>Bruce<br></div><div>=C2=A0</d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left=
:1px #ccc solid;padding-left:1ex"><span class=3D"">
<br>
</span><span class=3D"">Signed-off-by: Mattias Waldo &lt;<a href=3D"mailto:=
mattias.waldo@saabgroup.com">mattias.waldo@saabgroup.com</a>&gt;<br>
---<br>
=C2=A0meta/classes/kernel.bbclass | 2 ++<br>
=C2=A01 file changed, 2 insertions(+)<br>
<br>
diff --git a/meta/classes/kernel.bbclass b/meta/classes/kernel.bbclass<br>
</span>index db42744..07761e7 100644<br>
--- a/meta/classes/kernel.bbclass<br>
+++ b/meta/classes/kernel.bbclass<br>
@@ -364,6 +364,8 @@ do_shared_workdir () {<br>
<div class=3D"HOEnZb"><div class=3D"h5">=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp .con=
fig $kerneldir/<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 mkdir -p $kerneldir/include/config<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 cp include/config/kernel.release $kerneldir/inc=
lude/config/<wbr>kernel.release<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0mkdir -p $kerneldir/certs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0cp certs/signing_key.* $kerneldir/certs<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # We can also copy over all the generated files=
 and avoid special cases<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 # like version.h, but we&#39;ve opted to keep t=
his small until file creep starts<br>
--<br>
2.9.3<br>
<br>
<br>
<br>
--<br>
______________________________<wbr>_________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.<wbr>openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/<wbr>m=
ailman/listinfo/openembedded-<wbr>core</a><br>
</div></div></blockquote></div><br><br clear=3D"all"><br>-- <br><div class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">&quot;Thou shalt no=
t follow the NULL pointer, for chaos and madness await thee at its end&quot=
;</div>
</div></div>

--94eb2c06eda07ad133053ae763f8--
