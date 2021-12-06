Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B4E2C433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 17:14:23 +0000 (UTC)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com
 [209.85.222.45])
 by mx.groups.io with SMTP id smtpd.web09.54402.1638810861879097230
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 09:14:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=qM7bAYRM;
 spf=pass (domain: gmail.com, ip: 209.85.222.45,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f45.google.com with SMTP id p2so20994437uad.11
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 09:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kmb0pOAGzJ/67LFqd1n3IIHYC6huoKyRkXBsr21JKaU=;
        b=qM7bAYRMqAhzFOFS9scnm7X/TJu2uD5AlkrSqxaFw6BpcAiqq6bAyQd7uAKlBq8a+G
         kv59P5qn2EyyIkRGdwzshOSluTBV9UhCEKclmiUyME7+1+wLRTsroS3DYwclfjNSVpAP
         N44wHEF1Rmtba45sBBWZqGuwOpSrBkx0uAy8VaniCsIouVUdNsFb6eZ6UWsOC1iMwQYz
         maAj7UbHDV5Az47q8hs6zqLak8FMf0lKYHpwWmi0Eao1/9q89/ck6usUxqCfZR7zq7vH
         FHoQYRcsgA9eKUz3tq5J7O/UX4rpkGO2PdN3LbDrzlMW5OQmSL7iptzUctPaabutnfhb
         7Vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kmb0pOAGzJ/67LFqd1n3IIHYC6huoKyRkXBsr21JKaU=;
        b=tMi0fPtyKWkh8zlFOT9OAD63ZhdBAMAx1oil04KORVmWPI+Jz4NXnXz9iSUQAn/aNq
         AMMEYEE0/kdVRilEFEG6wngMA4hwLnwxmY0olSEHvRPPSobGNJ/pkA7bLGMaSOeutpeo
         Lkav7a6OEPY05/KDTJUM73RoQZY9Wiapk3ihG9r0fcz0emOHYEzjIML3DXAQdvigdka/
         Ttqq7HK19jXZl++9NMwx30OuOohwjqfAouRrfy6CYdXqDsgrK2yUctcHUk1apZYaV4ya
         DcMe7KNyRxtHNkEWREVor3y+93bwZhWYQxBOEmYYWg2ct/afozdj3u6UNzfswbTZXGLp
         E23A==
X-Gm-Message-State: AOAM532s4CaPaelo10oep7rzjlp0xPTipTx1AFGIddEu5/thDbLBPZQQ
	SPf5oDXM2WRyFFjedY61oLIkqKkEbmCgk7E58w5ZUMn/qTs=
X-Google-Smtp-Source: 
 ABdhPJzLnjvaFKvL+OBdSaBUS8lpIsTmYRAQIGNFmQ+DDxs0A7i9q0gG7gVtvghQ33EVJE/8L797EAXBMsS921Y/ups=
X-Received: by 2002:a67:efd5:: with SMTP id s21mr37947290vsp.73.1638810861049;
 Mon, 06 Dec 2021 09:14:21 -0800 (PST)
MIME-Version: 1.0
References: <20211206153511.34838-1-foss+yocto@0leil.net>
 <20211206153511.34838-3-foss+yocto@0leil.net>
In-Reply-To: <20211206153511.34838-3-foss+yocto@0leil.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 18:14:09 +0100
Message-ID: 
 <CANNYZj_uDbtdopDYg=nJsnuOETg6SOsUEQLMjkE6iBrQKiK59w@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 2/4] core: initrdscripts:
 init-install{-efi,}-testfs.sh:
 rename masterimage into goldenimage
To: Quentin Schulz <foss@0leil.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Quentin Schulz <foss+yocto@0leil.net>
Content-Type: multipart/alternative; boundary="0000000000003a193605d27d6377"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 17:14:23 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159262

--0000000000003a193605d27d6377
Content-Type: text/plain; charset="UTF-8"

I'd use grep here and (case-insensitively) find all references to
masterimage in poky/. It's likely the file and the class can be renamed as
well without significant damage.

Alex

On Mon, 6 Dec 2021 at 16:35, Quentin Schulz <foss@0leil.net> wrote:

> golden image has a more explicit meaning in addition of not being an
> issue wrt inclusivity.
>
> Signed-off-by: Quentin Schulz <foss+yocto@0leil.net>
> ---
>  meta/lib/oeqa/controllers/masterimage.py               | 10 +++++-----
>  meta/lib/oeqa/runtime/cases/ssh.py                     |  4 ++--
>  .../initrdscripts/files/init-install-efi-testfs.sh     |  2 +-
>  .../initrdscripts/files/init-install-testfs.sh         |  2 +-
>  4 files changed, 9 insertions(+), 9 deletions(-)
>
> diff --git a/meta/lib/oeqa/controllers/masterimage.py
> b/meta/lib/oeqa/controllers/masterimage.py
> index 2eff6d05ef9..feb30366323 100644
> --- a/meta/lib/oeqa/controllers/masterimage.py
> +++ b/meta/lib/oeqa/controllers/masterimage.py
> @@ -121,17 +121,17 @@ class
> MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
>          # base class just sets the ssh log file for us
>          super(MasterImageHardwareTarget, self).deploy()
>          self.master = sshcontrol.SSHControl(ip=self.ip,
> logfile=self.sshlog, timeout=600, port=self.port)
> -        status, output = self.master.run("cat /etc/masterimage")
> +        status, output = self.master.run("cat /etc/goldenimage")
>          if status != 0:
> -            # We're not booted into the master image, so try rebooting
> -            bb.plain("%s - booting into the master image" % self.pn)
> +            # We're not booted into the golden image, so try rebooting
> +            bb.plain("%s - booting into the golden image" % self.pn)
>              self.power_ctl("cycle")
>              self._wait_until_booted()
>
>          bb.plain("%s - deploying image on target" % self.pn)
> -        status, output = self.master.run("cat /etc/masterimage")
> +        status, output = self.master.run("cat /etc/goldenimage")
>          if status != 0:
> -            bb.fatal("No ssh connectivity or target isn't running a
> master image.\n%s" % output)
> +            bb.fatal("No ssh connectivity or target isn't running a
> golden image.\n%s" % output)
>          if self.user_cmds:
>              self.deploy_cmds = self.user_cmds.split("\n")
>          try:
> diff --git a/meta/lib/oeqa/runtime/cases/ssh.py
> b/meta/lib/oeqa/runtime/cases/ssh.py
> index 60a5fbbfbfd..a0bbed0b581 100644
> --- a/meta/lib/oeqa/runtime/cases/ssh.py
> +++ b/meta/lib/oeqa/runtime/cases/ssh.py
> @@ -13,7 +13,7 @@ class SSHTest(OERuntimeTestCase):
>      def test_ssh(self):
>          (status, output) = self.target.run('uname -a')
>          self.assertEqual(status, 0, msg='SSH Test failed: %s' % output)
> -        (status, output) = self.target.run('cat /etc/masterimage')
> -        msg = "This isn't the right image  - /etc/masterimage " \
> +        (status, output) = self.target.run('cat /etc/goldenimage')
> +        msg = "This isn't the right image  - /etc/goldenimage " \
>                "shouldn't be here %s" % output
>          self.assertEqual(status, 1, msg=msg)
> diff --git
> a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
> b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
> index b351985a61c..6f554f62967 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh
> @@ -133,7 +133,7 @@ mount -o rw,loop,noatime,nodiratime /run/media/$1/$2
> /rootmnt
>  echo "Copying rootfs files..."
>  cp -a /rootmnt/* /ssd
>
> -touch /ssd/etc/masterimage
> +touch /ssd/etc/goldenimage
>
>  if [ -d /ssd/etc/ ] ; then
>      # We dont want udev to mount our root device while we're booting...
> diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
> b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
> index ac621605287..df3a7767319 100644
> --- a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
> +++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh
> @@ -158,7 +158,7 @@ mount -o rw,loop,noatime,nodiratime /run/media/$1/$2
> /src_root
>  echo "Copying rootfs files..."
>  cp -a /src_root/* /tgt_root
>
> -touch /tgt_root/etc/masterimage
> +touch /tgt_root/etc/goldenimage
>
>  if [ -d /tgt_root/etc/ ] ; then
>      echo "$bootfs              /boot            ext3       defaults
>         1  2" >> /tgt_root/etc/fstab
> --
> 2.33.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159244):
> https://lists.openembedded.org/g/openembedded-core/message/159244
> Mute This Topic: https://lists.openembedded.org/mt/87542274/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--0000000000003a193605d27d6377
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>I&#39;d use grep here and (case-insensitively) find a=
ll references to masterimage in poky/. It&#39;s likely the file and the cla=
ss can be renamed as well without significant damage.</div><div><br></div><=
div>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Mon, 6 Dec 2021 at 16:35, Quentin Schulz &lt;<a href=
=3D"mailto:foss@0leil.net">foss@0leil.net</a>&gt; wrote:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">golden image has a more explicit m=
eaning in addition of not being an<br>
issue wrt inclusivity.<br>
<br>
Signed-off-by: Quentin Schulz &lt;<a href=3D"mailto:foss%2Byocto@0leil.net"=
 target=3D"_blank">foss+yocto@0leil.net</a>&gt;<br>
---<br>
=C2=A0meta/lib/oeqa/controllers/masterimage.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0| 10 +++++-----<br>
=C2=A0meta/lib/oeqa/runtime/cases/ssh.py=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
=C2=A0.../initrdscripts/files/init-install-efi-testfs.sh=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 2 +-<br>
=C2=A0.../initrdscripts/files/init-install-testfs.sh=C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0|=C2=A0 2 +-<br>
=C2=A04 files changed, 9 insertions(+), 9 deletions(-)<br>
<br>
diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/contr=
ollers/masterimage.py<br>
index 2eff6d05ef9..feb30366323 100644<br>
--- a/meta/lib/oeqa/controllers/masterimage.py<br>
+++ b/meta/lib/oeqa/controllers/masterimage.py<br>
@@ -121,17 +121,17 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.Ba=
seTarget, metaclass=3DABCMeta<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# base class just sets the ssh log file f=
or us<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super(MasterImageHardwareTarget, self).de=
ploy()<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.master =3D sshcontrol.SSHControl(ip=
=3Dself.ip, logfile=3Dself.sshlog, timeout=3D600, port=3Dself.port)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.master.run(&quot;cat /=
etc/masterimage&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.master.run(&quot;cat /=
etc/goldenimage&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if status !=3D 0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We&#39;re not booted into the =
master image, so try rebooting<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.plain(&quot;%s - booting into=
 the master image&quot; % <a href=3D"http://self.pn" rel=3D"noreferrer" tar=
get=3D"_blank">self.pn</a>)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 # We&#39;re not booted into the =
golden image, so try rebooting<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.plain(&quot;%s - booting into=
 the golden image&quot; % <a href=3D"http://self.pn" rel=3D"noreferrer" tar=
get=3D"_blank">self.pn</a>)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.power_ctl(&quot;cycle&=
quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._wait_until_booted()<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.plain(&quot;%s - deploying image on ta=
rget&quot; % <a href=3D"http://self.pn" rel=3D"noreferrer" target=3D"_blank=
">self.pn</a>)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.master.run(&quot;cat /=
etc/masterimage&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.master.run(&quot;cat /=
etc/goldenimage&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if status !=3D 0:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;No ssh connectivi=
ty or target isn&#39;t running a master image.\n%s&quot; % output)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.fatal(&quot;No ssh connectivi=
ty or target isn&#39;t running a golden image.\n%s&quot; % output)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.user_cmds:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.deploy_cmds =3D self.u=
ser_cmds.split(&quot;\n&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0try:<br>
diff --git a/meta/lib/oeqa/runtime/cases/ssh.py b/meta/lib/oeqa/runtime/cas=
es/ssh.py<br>
index 60a5fbbfbfd..a0bbed0b581 100644<br>
--- a/meta/lib/oeqa/runtime/cases/ssh.py<br>
+++ b/meta/lib/oeqa/runtime/cases/ssh.py<br>
@@ -13,7 +13,7 @@ class SSHTest(OERuntimeTestCase):<br>
=C2=A0 =C2=A0 =C2=A0def test_ssh(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0(status, output) =3D self.target.run(&#39=
;uname -a&#39;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(status, 0, msg=3D&#39;SS=
H Test failed: %s&#39; % output)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&#39;cat =
/etc/masterimage&#39;)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &quot;This isn&#39;t the right image=
=C2=A0 - /etc/masterimage &quot; \<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 (status, output) =3D self.target.run(&#39;cat =
/etc/goldenimage&#39;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 msg =3D &quot;This isn&#39;t the right image=
=C2=A0 - /etc/goldenimage &quot; \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&quot;shouldn&#39;t =
be here %s&quot; % output<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.assertEqual(status, 1, msg=3Dmsg)<br=
>
diff --git a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.=
sh b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh<br>
index b351985a61c..6f554f62967 100644<br>
--- a/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh<br>
+++ b/meta/recipes-core/initrdscripts/files/init-install-efi-testfs.sh<br>
@@ -133,7 +133,7 @@ mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /r=
ootmnt<br>
=C2=A0echo &quot;Copying rootfs files...&quot;<br>
=C2=A0cp -a /rootmnt/* /ssd<br>
<br>
-touch /ssd/etc/masterimage<br>
+touch /ssd/etc/goldenimage<br>
<br>
=C2=A0if [ -d /ssd/etc/ ] ; then<br>
=C2=A0 =C2=A0 =C2=A0# We dont want udev to mount our root device while we&#=
39;re booting...<br>
diff --git a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh b=
/meta/recipes-core/initrdscripts/files/init-install-testfs.sh<br>
index ac621605287..df3a7767319 100644<br>
--- a/meta/recipes-core/initrdscripts/files/init-install-testfs.sh<br>
+++ b/meta/recipes-core/initrdscripts/files/init-install-testfs.sh<br>
@@ -158,7 +158,7 @@ mount -o rw,loop,noatime,nodiratime /run/media/$1/$2 /s=
rc_root<br>
=C2=A0echo &quot;Copying rootfs files...&quot;<br>
=C2=A0cp -a /src_root/* /tgt_root<br>
<br>
-touch /tgt_root/etc/masterimage<br>
+touch /tgt_root/etc/goldenimage<br>
<br>
=C2=A0if [ -d /tgt_root/etc/ ] ; then<br>
=C2=A0 =C2=A0 =C2=A0echo &quot;$bootfs=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 /boot=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 ext3=C2=A0 =C2=
=A0 =C2=A0 =C2=A0defaults=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 1=
=C2=A0 2&quot; &gt;&gt; /tgt_root/etc/fstab<br>
-- <br>
2.33.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159244): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159244" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159244</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87542274/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87542274/1686489</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kanavin@gmail.com" ta=
rget=3D"_blank">alex.kanavin@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--0000000000003a193605d27d6377--

