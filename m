Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id 3629F77D16
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 17:23:19 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id p188so5604160ioe.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Jan 2018 09:23:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=5rapAtedbDBwL3GlkSAOaJdWOyP6n/tuOUqc621HYyM=;
	b=KkmJh4zR6nPD8MhBPv3mo3WRBF4Fjm2dUPpwcfQA7Sa4RmJdDMyR4KsGOLLzyUxDk4
	1v4XBzQU0dWqUlnYG/DWTJ1337tWQ/Ccx2andWnQbIsc6Xa6NGbaP3nshWho+dW43Kau
	mcGkWFvOcalCuoX/zfmR134bCIM9zUzlb/Qoo5kRrgzQEkfk/An+n7WFpz1THzmKNvbb
	Chbb2jWGNfb+9y6AXaABfgAjP+7BjjP3h3dCAYu3FyGCjRnayjAPDp1xQAYqNA7ZgiRG
	4nA9f9LBR82796kBdIDCxX8pROF8p2PveR4SCbLfjtmaB9a1/y5RaBTNOnQ1a62Bl/Pq
	oiKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=5rapAtedbDBwL3GlkSAOaJdWOyP6n/tuOUqc621HYyM=;
	b=U21A52sqVGk0FPvMfyqQaYu4vNqGJIl/3PendHwGjufht49cfAupRDUHIvGUdOFNmr
	aJjY4k2l6+yeWWyre/wVYGpYCZCuBcLkWpOPiGrDZgyB5aojfbrVoCfEi8e202rT8vD5
	F8ryWBjbW9JwVP+Sd1vsdC17wXfwBb6UW3R4rFcf59JIujsOMjOqb7QJ0R7Fr6o1F7qi
	1f7mByywTLqReBijmCvwLZq60QSIb3xk89W0wiLrahgzTsDjCrDDhZbiLjh31i7GM01A
	3lUZk+bfXE4f6M0z82bQCPfKHT9OjoLm53pYJcsQOgD4fjStOn2SOpJV1oTEr73pkutP
	3jqQ==
X-Gm-Message-State: AKwxytdG60W6YkBqXHyiJILzigFyCBRXZZsWeD44c9zopZzx0FpLz6BD
	H0DL2noKX8yq3d1dGAPZiNPodebE7CUUvcAs2bFasw==
X-Google-Smtp-Source: AH8x227pG+cvMCeztRXJgAxmnAoMnXB4rhccP6o0EzcBFxXZ2qHAX5YvbgSVQ1jiFRtJZ20Fj9XqsiLfU+zsqtiDahA=
X-Received: by 10.107.175.8 with SMTP id y8mr9329590ioe.37.1516814601258; Wed,
	24 Jan 2018 09:23:21 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.17.206 with HTTP; Wed, 24 Jan 2018 09:23:00 -0800 (PST)
In-Reply-To: <1516762897-11869-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1516762897-11869-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1516762897-11869-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Jan 2018 17:23:00 +0000
Message-ID: <CAJTo0LbyRMCC5sP5vOGBGsfja9vAw7BnaAU3fKnDuNtZuCyw4A@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] e2fsprogs: 1.43.7 -> 1.43.8
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
X-List-Received-Date: Wed, 24 Jan 2018 17:23:20 -0000
Content-Type: multipart/alternative; boundary="001a1144a2687fa3c9056388eb33"

--001a1144a2687fa3c9056388eb33
Content-Type: text/plain; charset="UTF-8"

This is failing on the autobuilder:

../../../git/lib/ext2fs/swapfs.c: In function 'ext2fs_swap_inode_full':
../../../git/lib/ext2fs/swapfs.c:361:29: error: 'ext2_inode_large'
undeclared (first use in this function)
  EXT2FS_BUILD_BUG_ON(sizeof(ext2_inode_large) != 160);
                             ^~~~~~~~~~~~~~~~

http://errors.yoctoproject.org/Errors/Details/165696/

Ross

On 24 January 2018 at 03:01, Huang Qiyu <huangqy.fnst@cn.fujitsu.com> wrote:
>
> Upgrade e2fsprogs from 1.43.7 to 1.43.8.
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  .../e2fsprogs/{e2fsprogs_1.43.7.bb => e2fsprogs_1.43.8.bb}
 | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>  rename meta/recipes-devtools/e2fsprogs/{e2fsprogs_1.43.7.bb =>
e2fsprogs_1.43.8.bb} (98%)
>
> diff --git a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb
b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
> similarity index 98%
> rename from meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb
> rename to meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
> index 168eecf..c42260c 100644
> --- a/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.7.bb
> +++ b/meta/recipes-devtools/e2fsprogs/e2fsprogs_1.43.8.bb
> @@ -11,7 +11,7 @@ SRC_URI += "file://remove.ldconfig.call.patch \
>
>  SRC_URI_append_class-native = "
file://e2fsprogs-fix-missing-check-for-permission-denied.patch"
>
> -SRCREV = "4c5e6cd6defb83f1b35a5ef6fccd68c86874ee06"
> +SRCREV = "af2eac481cf426c05ae12b946396980e16c8ab19"
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+\.\d+(\.\d+)*)$"
>
>  EXTRA_OECONF += "--libdir=${base_libdir} --sbindir=${base_sbindir} \
> --
> 2.7.4
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

--001a1144a2687fa3c9056388eb33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">This is failing on the autobuilder:<br><br>../../../git/li=
b/ext2fs/swapfs.c: In function &#39;ext2fs_swap_inode_full&#39;:<br>../../.=
./git/lib/ext2fs/swapfs.c:361:29: error: &#39;ext2_inode_large&#39; undecla=
red (first use in this function)<br>=C2=A0 EXT2FS_BUILD_BUG_ON(sizeof(ext2_=
inode_large) !=3D 160);<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~~~~~~~~~~~<br=
><br><a href=3D"http://errors.yoctoproject.org/Errors/Details/165696/">http=
://errors.yoctoproject.org/Errors/Details/165696/</a><br><br>Ross<br><br>On=
 24 January 2018 at 03:01, Huang Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn=
.fujitsu.com">huangqy.fnst@cn.fujitsu.com</a>&gt; wrote:<br>&gt;<br>&gt; Up=
grade e2fsprogs from 1.43.7 to 1.43.8.<br>&gt;<br>&gt; Signed-off-by: Huang=
 Qiyu &lt;<a href=3D"mailto:huangqy.fnst@cn.fujitsu.com">huangqy.fnst@cn.fu=
jitsu.com</a>&gt;<br>&gt; ---<br>&gt; =C2=A0.../e2fsprogs/{<a href=3D"http:=
//e2fsprogs_1.43.7.bb">e2fsprogs_1.43.7.bb</a> =3D&gt; <a href=3D"http://e2=
fsprogs_1.43.8.bb">e2fsprogs_1.43.8.bb</a>} =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0| 2 +-<br>&gt; =C2=A01 file changed, 1 insertion(+), 1 del=
etion(-)<br>&gt; =C2=A0rename meta/recipes-devtools/e2fsprogs/{<a href=3D"h=
ttp://e2fsprogs_1.43.7.bb">e2fsprogs_1.43.7.bb</a> =3D&gt; <a href=3D"http:=
//e2fsprogs_1.43.8.bb">e2fsprogs_1.43.8.bb</a>} (98%)<br>&gt;<br>&gt; diff =
--git a/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.43.7.=
bb">e2fsprogs_1.43.7.bb</a> b/meta/recipes-devtools/e2fsprogs/<a href=3D"ht=
tp://e2fsprogs_1.43.8.bb">e2fsprogs_1.43.8.bb</a><br>&gt; similarity index =
98%<br>&gt; rename from meta/recipes-devtools/e2fsprogs/<a href=3D"http://e=
2fsprogs_1.43.7.bb">e2fsprogs_1.43.7.bb</a><br>&gt; rename to meta/recipes-=
devtools/e2fsprogs/<a href=3D"http://e2fsprogs_1.43.8.bb">e2fsprogs_1.43.8.=
bb</a><br>&gt; index 168eecf..c42260c 100644<br>&gt; --- a/meta/recipes-dev=
tools/e2fsprogs/<a href=3D"http://e2fsprogs_1.43.7.bb">e2fsprogs_1.43.7.bb<=
/a><br>&gt; +++ b/meta/recipes-devtools/e2fsprogs/<a href=3D"http://e2fspro=
gs_1.43.8.bb">e2fsprogs_1.43.8.bb</a><br>&gt; @@ -11,7 +11,7 @@ SRC_URI +=
=3D &quot;file://remove.ldconfig.call.patch \<br>&gt;<br>&gt; =C2=A0SRC_URI=
_append_class-native =3D &quot; file://e2fsprogs-fix-missing-check-for-perm=
ission-denied.patch&quot;<br>&gt;<br>&gt; -SRCREV =3D &quot;4c5e6cd6defb83f=
1b35a5ef6fccd68c86874ee06&quot;<br>&gt; +SRCREV =3D &quot;af2eac481cf426c05=
ae12b946396980e16c8ab19&quot;<br>&gt; =C2=A0UPSTREAM_CHECK_GITTAGREGEX =3D =
&quot;v(?P&lt;pver&gt;\d+\.\d+(\.\d+)*)$&quot;<br>&gt;<br>&gt; =C2=A0EXTRA_=
OECONF +=3D &quot;--libdir=3D${base_libdir} --sbindir=3D${base_sbindir} \<b=
r>&gt; --<br>&gt; 2.7.4<br>&gt;<br>&gt;<br>&gt;<br>&gt; --<br>&gt; ________=
_______________________________________<br>&gt; Openembedded-core mailing l=
ist<br>&gt; <a href=3D"mailto:Openembedded-core@lists.openembedded.org">Ope=
nembedded-core@lists.openembedded.org</a><br>&gt; <a href=3D"http://lists.o=
penembedded.org/mailman/listinfo/openembedded-core">http://lists.openembedd=
ed.org/mailman/listinfo/openembedded-core</a></div>

--001a1144a2687fa3c9056388eb33--
