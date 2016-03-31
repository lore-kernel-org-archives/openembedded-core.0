Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-oi0-f50.google.com (mail-oi0-f50.google.com
	[209.85.218.50])
	by mail.openembedded.org (Postfix) with ESMTP id E27096E660
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 12:05:31 +0000 (UTC)
Received: by mail-oi0-f50.google.com with SMTP id p188so24424972oih.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Mar 2016 05:05:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=+Cq3dx/ZgoPeUjucDlAGC9f9OJ8+K5gUiEVPgCuWZKM=;
	b=NakaqNLoTu4jj0Z+tALU6wH5TcptoaUY1g8pLhqL3VJ/DtNcflqeQjO6q50JoDNdmi
	eUdmF2csl+Rmp1dl6+NT5QV0uPdJaBBvUwbxDLCpcb+uVQVPdL3V5Hu7o/PlR2haQhM9
	hdGW+Xo2uxLBR2TFwrJB6QlcqkHQLimPVE/Rci/s0meECbh47IWRjOqQf7KTCIn/JO9c
	3vq2YEnMKyrqQsH3TGm/xpMaMEGO5swVAKsMqxMN86/+6HbBmOq6M0SFKgLTKeSBmy85
	bhOoqRGZPqlmei5Sc55VS9zXuLMex9oAWwTFLfI8p8s7rsW0m7FPUJjRBRPPZYj1NNLK
	S0gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=+Cq3dx/ZgoPeUjucDlAGC9f9OJ8+K5gUiEVPgCuWZKM=;
	b=UjaCwh8t7mxZBqlkKgEbBkPQ6OqgjvKEoIUgIfA9z5dsT5RnWKXXRdBa5oBWsV0tt+
	tzILsQ491Wg1V+HYv9+acLsp/RxIk/KI2FGY8cbujDI2BIeZJQBEgSKV9Zq8iy8Poerb
	4x7+DCaTXrvQ+iqL4NAtRa5aR5XOPh0wydHwsA+2bQyaDP0tGJdfXeJF0hAD8og8/J69
	KR0nRNKRyUcXas924qmzH+djvHIr+DtDVAhGNKz+uosBthY4M1nUUuzwNscOffPzRlTt
	kyjIx8iEgRAgQOePge5yCv9Ovm68SUuoDzcKUiKMaZvmxNE/QRZQ0eId+Z0n2+V3HC26
	VVmw==
X-Gm-Message-State: AD7BkJIsY0Ac6GDpK9ijtoN/93n3+8cDuPLNMLK3leGKWsSaVRPfUnDEdGgf405RKfn/0g5DBBxBejfWlSAlXg==
MIME-Version: 1.0
X-Received: by 10.157.47.208 with SMTP id b16mr8218366otd.118.1459425931935;
	Thu, 31 Mar 2016 05:05:31 -0700 (PDT)
Received: by 10.157.5.101 with HTTP; Thu, 31 Mar 2016 05:05:31 -0700 (PDT)
In-Reply-To: <e821fe90eb5b650d5e43b3465ce4eaffee766a5d.1459413941.git.paul.eggleton@linux.intel.com>
References: <cover.1459413941.git.paul.eggleton@linux.intel.com>
	<e821fe90eb5b650d5e43b3465ce4eaffee766a5d.1459413941.git.paul.eggleton@linux.intel.com>
Date: Thu, 31 Mar 2016 08:05:31 -0400
Message-ID: <CADkTA4OHSayhSfAz8z4=Z6f9x4f7MrmZGZExQWUPZuUUXn-aEQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] linux-yocto: add patch in existing SRC_URI value rather than using _append
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
X-List-Received-Date: Thu, 31 Mar 2016 12:05:34 -0000
Content-Type: multipart/alternative; boundary=001a113ded003fc68d052f5714f6

--001a113ded003fc68d052f5714f6
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 31, 2016 at 4:47 AM, Paul Eggleton <
paul.eggleton@linux.intel.com> wrote:

> Of course SRC_URI_append works just fine for building here, but it does
> introduce two problems:
>
> 1) It's not really very tidy and you could look at the SRC_URI value and
>    miss the fact that there's a patch appended at the end.
> 2) devtool update-recipe will end up duplicating the appended item
>    (covered under [YOCTO #9360]).
>
> Given the above it seems reasonable to squash the appended value into
> the main SRC_URI value.
>

This is only temporary, which is why it's an _append, and I'm about to get
rid of the need for this patch completely
since upstream has finally produced a 7 patch series to fix the regression.

So I'd rather not churn this, and leave it as-is for another few days.

Bruce


>
> Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
> ---
>  meta/recipes-kernel/linux/linux-yocto_4.4.bb | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> index 3d6991e..2832876 100644
> --- a/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> +++ b/meta/recipes-kernel/linux/linux-yocto_4.4.bb
> @@ -22,7 +22,9 @@ SRCREV_machine ?=
> "c43425f73287757a166d74464fddf1f5389c9f59"
>  SRCREV_meta ?= "770996a263e22562c81f48fde0f0dc647156abce"
>
>  SRC_URI = "git://
> git.yoctoproject.org/linux-yocto-4.4.git;name=machine;branch=${KBRANCH}; \
> -           git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}
> "
> +           git://
> git.yoctoproject.org/yocto-kernel-cache;type=kmeta;name=meta;branch=yocto-4.4;destsuffix=${KMETA}
> \
> +           file://0001-Fix-qemux86-pat-issue.patch \
> +           "
>
>  LINUX_VERSION ?= "4.4.3"
>
> @@ -41,4 +43,3 @@ KERNEL_FEATURES_append_qemux86=" cfg/sound.scc
> cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append_qemux86-64=" cfg/sound.scc cfg/paravirt_kvm.scc"
>  KERNEL_FEATURES_append = " ${@bb.utils.contains("TUNE_FEATURES", "mx32",
> " cfg/x32.scc", "" ,d)}"
>
> -SRC_URI_append = " file://0001-Fix-qemux86-pat-issue.patch"
> --
> 2.5.5
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

--001a113ded003fc68d052f5714f6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><div class=3D"gmail_extra"><br><div class=3D"gmail_quo=
te">On Thu, Mar 31, 2016 at 4:47 AM, Paul Eggleton <span dir=3D"ltr">&lt;<a=
 href=3D"mailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggle=
ton@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quo=
te" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"=
>Of course SRC_URI_append works just fine for building here, but it does<br=
>
introduce two problems:<br>
<br>
1) It&#39;s not really very tidy and you could look at the SRC_URI value an=
d<br>
=C2=A0 =C2=A0miss the fact that there&#39;s a patch appended at the end.<br=
>
2) devtool update-recipe will end up duplicating the appended item<br>
=C2=A0 =C2=A0(covered under [YOCTO #9360]).<br>
<br>
Given the above it seems reasonable to squash the appended value into<br>
the main SRC_URI value.<br></blockquote><div><br></div><div>This is only te=
mporary, which is why it&#39;s an _append, and I&#39;m about to get rid of =
the need for this patch completely</div><div>since upstream has finally pro=
duced a 7 patch series to fix the regression.</div><div><br></div><div>So I=
&#39;d rather not churn this, and leave it as-is for another few days.</div=
><div><br></div><div>Bruce</div><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">
<br>
Signed-off-by: Paul Eggleton &lt;<a href=3D"mailto:paul.eggleton@linux.inte=
l.com">paul.eggleton@linux.intel.com</a>&gt;<br>
---<br>
=C2=A0meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a> | 5 +++--<br>
=C2=A01 file changed, 3 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb=
" rel=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a> b/meta/recipe=
s-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=3D"noreferrer" tar=
get=3D"_blank">linux-yocto_4.4.bb</a><br>
index 3d6991e..2832876 100644<br>
--- a/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
+++ b/meta/recipes-kernel/linux/<a href=3D"http://linux-yocto_4.4.bb" rel=
=3D"noreferrer" target=3D"_blank">linux-yocto_4.4.bb</a><br>
@@ -22,7 +22,9 @@ SRCREV_machine ?=3D &quot;c43425f73287757a166d74464fddf1f=
5389c9f59&quot;<br>
=C2=A0SRCREV_meta ?=3D &quot;770996a263e22562c81f48fde0f0dc647156abce&quot;=
<br>
<br>
=C2=A0SRC_URI =3D &quot;git://<a href=3D"http://git.yoctoproject.org/linux-=
yocto-4.4.git;name=3Dmachine;branch=3D${KBRANCH}" rel=3D"noreferrer" target=
=3D"_blank">git.yoctoproject.org/linux-yocto-4.4.git;name=3Dmachine;branch=
=3D${KBRANCH}</a>; \<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;=
destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoprojec=
t.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;destsu=
ffix=3D${KMETA}</a>&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0git://<a href=3D"http://git.yocto=
project.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;=
destsuffix=3D${KMETA}" rel=3D"noreferrer" target=3D"_blank">git.yoctoprojec=
t.org/yocto-kernel-cache;type=3Dkmeta;name=3Dmeta;branch=3Dyocto-4.4;destsu=
ffix=3D${KMETA}</a> \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0file://0001-Fix-qemux86-pat-issue=
.patch \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;<br>
<br>
=C2=A0LINUX_VERSION ?=3D &quot;4.4.3&quot;<br>
<br>
@@ -41,4 +43,3 @@ KERNEL_FEATURES_append_qemux86=3D&quot; cfg/sound.scc cfg=
/paravirt_kvm.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append_qemux86-64=3D&quot; cfg/sound.scc cfg/paravirt=
_kvm.scc&quot;<br>
=C2=A0KERNEL_FEATURES_append =3D &quot; ${@bb.utils.contains(&quot;TUNE_FEA=
TURES&quot;, &quot;mx32&quot;, &quot; cfg/x32.scc&quot;, &quot;&quot; ,d)}&=
quot;<br>
<br>
-SRC_URI_append =3D &quot; file://0001-Fix-qemux86-pat-issue.patch&quot;<br=
>
<span class=3D"HOEnZb"><font color=3D"#888888">--<br>
2.5.5<br>
<br>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org">Openembedded-co=
re@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</font></span></blockquote></div><br><br clear=3D"all"><div><br></div>-- <b=
r><div class=3D"gmail_signature">&quot;Thou shalt not follow the NULL point=
er, for chaos and madness await thee at its end&quot;</div>
</div></div>

--001a113ded003fc68d052f5714f6--
