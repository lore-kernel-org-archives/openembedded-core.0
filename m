Return-Path: <rwmacleod@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FE8FC4332F
	for <webhook@archiver.kernel.org>; Fri,  9 Dec 2022 08:51:18 +0000 (UTC)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com [209.85.221.175])
 by mx.groups.io with SMTP id smtpd.web11.8702.1670575869974895719
 for <openembedded-core@lists.openembedded.org>;
 Fri, 09 Dec 2022 00:51:10 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=GEv4ERj9;
 spf=pass (domain: gmail.com, ip: 209.85.221.175, mailfrom: rwmacleod@gmail.com)
Received: by mail-vk1-f175.google.com with SMTP id o5so1812454vkn.7
        for <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 00:51:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=jZkG2/Tum6kiaCUMtTV15UMLXBMtrYDQY0LidMTWmQs=;
        b=GEv4ERj9rGDulkF/Zfkc+PishbJmihI1m/xZA6hv8UVpVpvz7ZPJYUlPA8kFcKoFsD
         ffDd7OPzyh4+TmyR74pj209lgrtporOabtVSwpP/9hamwzSHeLQn6yn2lWLgXZ1mBBoB
         R1eB/gFl9pEZrNKFjd6O3mScm9l7ciCCRDrj4OsYsOpK/Kjwi0boqpfKE6ITaFJUxttM
         66tWZaN1/7MYYpJSJZCnwr1P1qHLHc92S0VDMRIR/Bo98B0AH17lFfqxWWBlAEcOKxO7
         TBHVQ3PKr78trGkd+XtMLEgkqq2MmdhpYtG22c1rQtmncP80SL9JkDVFmt6TTIUqMvAO
         uULQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jZkG2/Tum6kiaCUMtTV15UMLXBMtrYDQY0LidMTWmQs=;
        b=bx52YYBwa88B1cOYPzE8T0ty8pxEUFCaR0DoyTWZuEHSOqvoWIdWlvOcPROnNp6wFS
         FHbaw0FNPArPNJ7bgUxuKUQ8Q7nTgDuZw/1DStTg2HBFBFcSEvJUlDLzKZLLZE4mDznO
         xlHp2ipAJO25h/34i1mM4MwUyZMI7FmCchfEuyX4PKGnjTlPPGkkNMaE/jZO0MEP1OjH
         moXozi/T4VgBrhV8iLM0BKpLpNpgmcMFM23XaZdysNwWjObKP8UdvIxlChSeISPmyFeR
         LpINLjFFxE8tRHv4rVy2icIQcFXZ99I7N0rqqcZTlZruRpKXDOoF64Kzfum2HrWxxd8z
         yZ5A==
X-Gm-Message-State: ANoB5pmeva9yxZwxCChbI5w4ucJcDUCYQuTw0jng6KP7U2EMX4YGH8cX
	7qHNUJOktnybDJSCdurqtIZq5cjPUH6kyNdIHfw=
X-Google-Smtp-Source: AA0mqf4AqW6i5CQ2wp7n80Etyo868Z9D6QdCO8pdNZYFsn/1nxNZkOf+1nhLYq0asp0DGp1Dup5mSEzl2xNG0kcAYu4=
X-Received: by 2002:a05:6122:2216:b0:3b7:dfe5:11e8 with SMTP id
 bb22-20020a056122221600b003b7dfe511e8mr43355463vkb.35.1670575868853; Fri, 09
 Dec 2022 00:51:08 -0800 (PST)
MIME-Version: 1.0
References: <20221209070538.72901-1-xiangyu.chen@eng.windriver.com>
In-Reply-To: <20221209070538.72901-1-xiangyu.chen@eng.windriver.com>
From: Randy MacLeod <rwmacleod@gmail.com>
Date: Fri, 9 Dec 2022 03:50:56 -0500
Message-ID: <CAK6=ix4aUJ-Tpfwkd2NXoaTNbxmkFAvheSsw_u5ef7eemA3W8A@mail.gmail.com>
Subject: Re: [OE-Core][master][PATCH] openssh: remove RRECOMMENDS to rng-tools
 for sshd package
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>, 
	Randy MacLeod <randy.macleod@windriver.com>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000003bc40705ef61418f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 09 Dec 2022 08:51:18 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174438

--0000000000003bc40705ef61418f
Content-Type: text/plain; charset="UTF-8"

On Fri., Dec. 9, 2022, 02:05 Xiangyu Chen, <xiangyu.chen@eng.windriver.com>
wrote:

> It appears that rngd is not needed as of linux-5.6 and later[1]
> and should not be installed by default since the purpose of rngd
> is to provide additional trusted sources of entropy.
>
> We did some testing on real hardware, the result seems to support that
> we no longer need rngd by default on kernel v5.6 and later.
>
> Testing result as below:
>
> 1. observing the crng init stage.
>  the "random: crng init done" always available before fs being mounted.
>

Super.


> 2. generating random number without rngd.
>  testing command: dd if=/dev/random of=/dev/null status=progress
>    on Marvell CN96xx RDB board, speed almost 20.4 MB/s without block
>    on NXP i.mx6q board, speed almost 31.9 MB/s without block
>    on qemu x86-64, speed almost 2.6MB/s without block
>
> 3. using rngtest command without rngd
>  testing command: rngtest -c 1000 </dev/random
>    on Marvell CN96xx RDB board:
>       rngtest: input channel speed: (min=4.340; avg=135.364;
> max=146.719)Mibits/s
>       rngtest: FIPS tests speed: (min=8.197; avg=69.020;
> max=72.800)Mibits/s
>       rngtest: Program run time: 418771 microseconds
>
>    on NXP i.mx6q board:
>       rngtest: input channel speed: (min=96.820; avg=326.769;
> max=340.598)Mibits/s
>       rngtest: FIPS tests speed: (min=15.090; avg=37.543;
> max=40.324)Mibits/s
>       rngtest: Program run time: 570229 microseconds
>
>    on qemu x86-64:
>       rngtest: input channel speed: (min=37.769; avg=101.136;
> max=136.239)Mibits/s
>       rngtest: FIPS tests speed: (min=10.288; avg=30.682;
> max=40.155)Mibits/s
>       rngtest: Program run time: 836800 microseconds
>
> 4. observing sshd service.
>   using "systemctl disable rng-tools" disable service and reboot system.
>   system boot up normal, sshd service also start in normal time without
>   block.
>

Nice.

Does openssh have more quantitative tests that can be run?


For the YP autobuilder tests that run in qemu, do we need, or do we already
have, virtio-rng or is that also obsolete ( here's an old link from 2015:
https://www.redhat.com/en/blog/red-hat-enterprise-linux-virtual-machines-access-random-numbers-made-easy
).


Maybe the thing to do is to just try this change in master-next as usual
and see it we get any timeouts from the YP test suite.


Thanks,

../Randy



> Reference:
> [1]
> https://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa51bb4c44e32
>
> Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> ---
>  meta/recipes-connectivity/openssh/openssh_9.1p1.bb | 9 +--------
>  1 file changed, 1 insertion(+), 8 deletions(-)
>
> diff --git a/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
> b/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
> index 85f97b1bbb..23ae8d5b0c 100644
> --- a/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
> +++ b/meta/recipes-connectivity/openssh/openssh_9.1p1.bb
> @@ -52,15 +52,12 @@ SYSTEMD_SERVICE:${PN}-sshd = "sshd.socket"
>
>  inherit autotools-brokensep ptest
>
> -PACKAGECONFIG ??= "rng-tools"
> +PACKAGECONFIG ??= ""
>  PACKAGECONFIG[kerberos] = "--with-kerberos5,--without-kerberos5,krb5"
>  PACKAGECONFIG[ldns] = "--with-ldns,--without-ldns,ldns"
>  PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
>  PACKAGECONFIG[manpages] = "--with-mantype=man,--with-mantype=cat"
>
> -# Add RRECOMMENDS to rng-tools for sshd package
> -PACKAGECONFIG[rng-tools] = ""
> -
>

 EXTRA_AUTORECONF += "--exclude=aclocal"
>
>  # login path is hardcoded in sshd
> @@ -160,10 +157,6 @@ FILES:${PN}-keygen = "${bindir}/ssh-keygen"
>
>  RDEPENDS:${PN} += "${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen
> ${PN}-sftp-server"
>  RDEPENDS:${PN}-sshd += "${PN}-keygen
> ${@bb.utils.contains('DISTRO_FEATURES', 'pam', 'pam-plugin-keyinit
> pam-plugin-loginuid', '', d)}"
> -RRECOMMENDS:${PN}-sshd:append:class-target = "\
> -    ${@bb.utils.filter('PACKAGECONFIG', 'rng-tools', d)} \
> -"
> -
>  # gdb would make attach-ptrace test pass rather than skip but not worth
> the build dependencies
>  RDEPENDS:${PN}-ptest += "${PN}-sftp ${PN}-misc ${PN}-sftp-server make sed
> sudo coreutils"
>
> --
> 2.34.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#174434):
> https://lists.openembedded.org/g/openembedded-core/message/174434
> Mute This Topic: https://lists.openembedded.org/mt/95556189/953399
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> rwmacleod@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003bc40705ef61418f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Fri., Dec. 9, 2022, 02:05 Xiangyu Chen, &lt;<a href=
=3D"mailto:xiangyu.chen@eng.windriver.com">xiangyu.chen@eng.windriver.com</=
a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 =
0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">It appears that rngd =
is not needed as of linux-5.6 and later[1]<br>
and should not be installed by default since the purpose of rngd<br>
is to provide additional trusted sources of entropy.<br>
<br>
We did some testing on real hardware, the result seems to support that<br>
we no longer need rngd by default on kernel v5.6 and later.<br>
<br>
Testing result as below:<br>
<br>
1. observing the crng init stage.<br>
=C2=A0the &quot;random: crng init done&quot; always available before fs bei=
ng mounted.<br></blockquote></div></div><div dir=3D"auto"><br></div><div di=
r=3D"auto">Super.</div><div dir=3D"auto"><br></div><div dir=3D"auto"><div c=
lass=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
2. generating random number without rngd.<br>
=C2=A0testing command: dd if=3D/dev/random of=3D/dev/null status=3Dprogress=
<br>
=C2=A0 =C2=A0on Marvell CN96xx RDB board, speed almost 20.4 MB/s without bl=
ock<br>
=C2=A0 =C2=A0on NXP i.mx6q board, speed almost 31.9 MB/s without block<br>
=C2=A0 =C2=A0on qemu x86-64, speed almost 2.6MB/s without block<br>
<br>
3. using rngtest command without rngd<br>
=C2=A0testing command: rngtest -c 1000 &lt;/dev/random<br>
=C2=A0 =C2=A0on Marvell CN96xx RDB board:<br>
=C2=A0 =C2=A0 =C2=A0 rngtest: input channel speed: (min=3D4.340; avg=3D135.=
364; max=3D146.719)Mibits/s<br>
=C2=A0 =C2=A0 =C2=A0 rngtest: FIPS tests speed: (min=3D8.197; avg=3D69.020;=
 max=3D72.800)Mibits/s<br>
=C2=A0 =C2=A0 =C2=A0 rngtest: Program run time: 418771 microseconds<br>
<br>
=C2=A0 =C2=A0on NXP i.mx6q board:<br>
=C2=A0 =C2=A0 =C2=A0 rngtest: input channel speed: (min=3D96.820; avg=3D326=
.769; max=3D340.598)Mibits/s<br>
=C2=A0 =C2=A0 =C2=A0 rngtest: FIPS tests speed: (min=3D15.090; avg=3D37.543=
; max=3D40.324)Mibits/s<br>
=C2=A0 =C2=A0 =C2=A0 rngtest: Program run time: 570229 microseconds<br>
<br>
=C2=A0 =C2=A0on qemu x86-64:<br>
=C2=A0 =C2=A0 =C2=A0 rngtest: input channel speed: (min=3D37.769; avg=3D101=
.136; max=3D136.239)Mibits/s<br>
=C2=A0 =C2=A0 =C2=A0 rngtest: FIPS tests speed: (min=3D10.288; avg=3D30.682=
; max=3D40.155)Mibits/s<br>
=C2=A0 =C2=A0 =C2=A0 rngtest: Program run time: 836800 microseconds<br>
<br>
4. observing sshd service.<br>
=C2=A0 using &quot;systemctl disable rng-tools&quot; disable service and re=
boot system.<br>
=C2=A0 system boot up normal, sshd service also start in normal time withou=
t<br>
=C2=A0 block.<br></blockquote></div></div><div dir=3D"auto"><br></div><div =
dir=3D"auto">Nice.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Does =
openssh have more quantitative tests that can be run?</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">For the YP autobu=
ilder tests that run in qemu, do we need, or do we already have, virtio-rng=
 or is that also obsolete ( here&#39;s an old link from 2015:=C2=A0<a href=
=3D"https://www.redhat.com/en/blog/red-hat-enterprise-linux-virtual-machine=
s-access-random-numbers-made-easy">https://www.redhat.com/en/blog/red-hat-e=
nterprise-linux-virtual-machines-access-random-numbers-made-easy</a> ).</di=
v><div dir=3D"auto"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Maybe the thing to do is to just try this change in master-next as usual a=
nd see it we get any timeouts from the YP test suite.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks,</div><div=
 dir=3D"auto"><br></div><div dir=3D"auto">../Randy</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gmail_=
quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">
<br>
Reference:<br>
[1] <a href=3D"https://github.com/torvalds/linux/commit/30c08efec8884fb106b=
8e57094baa51bb4c44e32" rel=3D"noreferrer noreferrer" target=3D"_blank">http=
s://github.com/torvalds/linux/commit/30c08efec8884fb106b8e57094baa51bb4c44e=
32</a><br>
<br>
Signed-off-by: Xiangyu Chen &lt;<a href=3D"mailto:xiangyu.chen@windriver.co=
m" target=3D"_blank" rel=3D"noreferrer">xiangyu.chen@windriver.com</a>&gt;<=
br>
---<br>
=C2=A0meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.1p1.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">openssh_9.1p1.bb</a> | 9 +=
--------<br>
=C2=A01 file changed, 1 insertion(+), 8 deletions(-)<br>
<br>
diff --git a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.=
1p1.bb" rel=3D"noreferrer noreferrer" target=3D"_blank">openssh_9.1p1.bb</a=
> b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.1p1.bb" r=
el=3D"noreferrer noreferrer" target=3D"_blank">openssh_9.1p1.bb</a><br>
index 85f97b1bbb..23ae8d5b0c 100644<br>
--- a/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.1p1.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">openssh_9.1p1.bb</a><br>
+++ b/meta/recipes-connectivity/openssh/<a href=3D"http://openssh_9.1p1.bb"=
 rel=3D"noreferrer noreferrer" target=3D"_blank">openssh_9.1p1.bb</a><br>
@@ -52,15 +52,12 @@ SYSTEMD_SERVICE:${PN}-sshd =3D &quot;sshd.socket&quot;<=
br>
<br>
=C2=A0inherit autotools-brokensep ptest<br>
<br>
-PACKAGECONFIG ??=3D &quot;rng-tools&quot;<br>
+PACKAGECONFIG ??=3D &quot;&quot;<br>
=C2=A0PACKAGECONFIG[kerberos] =3D &quot;--with-kerberos5,--without-kerberos=
5,krb5&quot;<br>
=C2=A0PACKAGECONFIG[ldns] =3D &quot;--with-ldns,--without-ldns,ldns&quot;<b=
r>
=C2=A0PACKAGECONFIG[libedit] =3D &quot;--with-libedit,--without-libedit,lib=
edit&quot;<br>
=C2=A0PACKAGECONFIG[manpages] =3D &quot;--with-mantype=3Dman,--with-mantype=
=3Dcat&quot;<br>
<br>
-# Add RRECOMMENDS to rng-tools for sshd package<br>
-PACKAGECONFIG[rng-tools] =3D &quot;&quot;<br>
-<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
=C2=A0EXTRA_AUTORECONF +=3D &quot;--exclude=3Daclocal&quot;<br>
<br>
=C2=A0# login path is hardcoded in sshd<br>
@@ -160,10 +157,6 @@ FILES:${PN}-keygen =3D &quot;${bindir}/ssh-keygen&quot=
;<br>
<br>
=C2=A0RDEPENDS:${PN} +=3D &quot;${PN}-scp ${PN}-ssh ${PN}-sshd ${PN}-keygen=
 ${PN}-sftp-server&quot;<br>
=C2=A0RDEPENDS:${PN}-sshd +=3D &quot;${PN}-keygen ${@bb.utils.contains(&#39=
;DISTRO_FEATURES&#39;, &#39;pam&#39;, &#39;pam-plugin-keyinit pam-plugin-lo=
ginuid&#39;, &#39;&#39;, d)}&quot;<br>
-RRECOMMENDS:${PN}-sshd:append:class-target =3D &quot;\<br>
-=C2=A0 =C2=A0 ${@bb.utils.filter(&#39;PACKAGECONFIG&#39;, &#39;rng-tools&#=
39;, d)} \<br>
-&quot;<br>
-<br>
=C2=A0# gdb would make attach-ptrace test pass rather than skip but not wor=
th the build dependencies<br>
=C2=A0RDEPENDS:${PN}-ptest +=3D &quot;${PN}-sftp ${PN}-misc ${PN}-sftp-serv=
er make sed sudo coreutils&quot;<br>
<br>
-- <br>
2.34.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#174434): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/174434" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/174434</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/95556189/9533=
99" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openembed=
ded.org/mt/95556189/953399</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:rwmacleod@gmail=
.com" target=3D"_blank" rel=3D"noreferrer">rwmacleod@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--0000000000003bc40705ef61418f--

