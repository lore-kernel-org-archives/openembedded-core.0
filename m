Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E983FC433EF
	for <webhook@archiver.kernel.org>; Mon,  6 Dec 2021 17:14:50 +0000 (UTC)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com
 [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web12.54673.1638810889654601967
 for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 09:14:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=CSWXXKNv;
 spf=pass (domain: gmail.com, ip: 209.85.222.47,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id r15so21051139uao.3
        for <openembedded-core@lists.openembedded.org>;
 Mon, 06 Dec 2021 09:14:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ix10pMkchDtiZlgbh8QrrPNphQIVNzP5Xw11o/c2OIU=;
        b=CSWXXKNv5A7BooRxkYSuAlOS257BCQ7e98BEA6dS8TZneVNs9mBRddDVrpsaKIt1o9
         M2pR3IFytfgaMzCzHyJomw9yJ/6mtMclN9YvMdv2STrlnUiP+PrvWklSZEKpI8G9IkWB
         ThthX3BHxhgM+5ViQOKtbMSzIqaF97WeUOqwAMgSaOJoXN/F0kQ51tllg35g5TrmUBjI
         JTK9bXHehZW0vSqfeuZ/u9wO6jv1NvgaUK/zcBr7yVHEJCrA4e9XYZA8SVMea5Et2TA7
         tMGaygozmroVpI8+E7B5V94r7Gcvoja2fpOXyo43pJRE8Cw7JT2xYIzebzs/zUFhG9p+
         zW2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ix10pMkchDtiZlgbh8QrrPNphQIVNzP5Xw11o/c2OIU=;
        b=jKoGBC02p9fWG2VhzWXdU/fnKjqCfzOMegGPMk/BzTQc/kJUedh9nXHxkLhJyj+Q8B
         s/oQHA0AYjfJwXAX7Y4Jo8SF4+x6fPXUqJI4LqNLFvRIXcttyuonE7I9w/BC7w6Qv7aW
         Zo9j9tLtBgCmsIgSay8B3vNy82E0YsBdoSTT6vgxBl+mtBcDDNUtnAPz/t8oUww0l977
         rzCQ3gLayoQLfX7PTDS7UT0NzJuogA0/Bw83v7omIMbng5lcy244ZH+u3PA/5+hGie5n
         7zBCpxZT/SyRO7SR4O+LsLNHUsjyZAs+b94IVwoIR45zytf4aMXuOplGf5tXode/QBf8
         KONQ==
X-Gm-Message-State: AOAM531L1mMmkyKCvznHXmQcXxBQI4QqjWxhquK+Yv06y7Glzq3Z6Uer
	R4zztuVh0dalbJgVfqTfwDgCTRxFe3O4TSA6K2w=
X-Google-Smtp-Source: 
 ABdhPJwx8kEzCa1Q3Qy735Tc/fCKcP8pAm21X2nNa3qsiz9cRtPBBab/I8o8o6BctS/RPPV5Al5KFT5q/zECUMaH+Oc=
X-Received: by 2002:a05:6102:38d4:: with SMTP id
 k20mr37191873vst.42.1638810888732;
 Mon, 06 Dec 2021 09:14:48 -0800 (PST)
MIME-Version: 1.0
References: <20211206153511.34838-1-foss+yocto@0leil.net>
 <20211206153511.34838-4-foss+yocto@0leil.net>
In-Reply-To: <20211206153511.34838-4-foss+yocto@0leil.net>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Mon, 6 Dec 2021 18:14:37 +0100
Message-ID: 
 <CANNYZj-8V+XvUrWuRcmG7K+G=m6FNTdd+eESuhxty=ebGCZspQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 3/4] oeqa: rename masterimage into goldenimage
To: Quentin Schulz <foss@0leil.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Quentin Schulz <foss+yocto@0leil.net>
Content-Type: multipart/alternative; boundary="000000000000e0866e05d27d6458"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Dec 2021 17:14:50 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159263

--000000000000e0866e05d27d6458
Content-Type: text/plain; charset="UTF-8"

Nevermind ;)

Alex

On Mon, 6 Dec 2021 at 16:35, Quentin Schulz <foss@0leil.net> wrote:

> Golden image has a more explicit meaning than masterimage and is not an
> issue wrt inclusivity.
>
> Signed-off-by: Quentin Schulz <foss+yocto@0leil.net>
> ---
>  .../{masterimage.py => goldenimage.py}        | 32 +++++++++----------
>  1 file changed, 16 insertions(+), 16 deletions(-)
>  rename meta/lib/oeqa/controllers/{masterimage.py => goldenimage.py} (91%)
>
> diff --git a/meta/lib/oeqa/controllers/masterimage.py
> b/meta/lib/oeqa/controllers/goldenimage.py
> similarity index 91%
> rename from meta/lib/oeqa/controllers/masterimage.py
> rename to meta/lib/oeqa/controllers/goldenimage.py
> index feb30366323..fb1ac7a53a0 100644
> --- a/meta/lib/oeqa/controllers/masterimage.py
> +++ b/meta/lib/oeqa/controllers/goldenimage.py
> @@ -24,12 +24,12 @@ from oeqa.utils import CommandError
>
>  from abc import ABCMeta, abstractmethod
>
> -class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget,
> metaclass=ABCMeta):
> +class GoldenImageHardwareTarget(oeqa.targetcontrol.BaseTarget,
> metaclass=ABCMeta):
>
>      supported_image_fstypes = ['tar.gz', 'tar.bz2']
>
>      def __init__(self, d):
> -        super(MasterImageHardwareTarget, self).__init__(d)
> +        super(GoldenImageHardwareTarget, self).__init__(d)
>
>          # target ip
>          addr = d.getVar("TEST_TARGET_IP") or bb.fatal('Please set
> TEST_TARGET_IP with the IP address of the machine you want to run the tests
> on.')
> @@ -61,8 +61,8 @@ class
> MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
>          if not os.path.isfile(self.kernel):
>              bb.fatal("No kernel found. Expected path: %s" % self.kernel)
>
> -        # master ssh connection
> -        self.master = None
> +        # golden ssh connection
> +        self.golden = None
>          # if the user knows what they are doing, then by all means...
>          self.user_cmds = d.getVar("TEST_DEPLOY_CMDS")
>          self.deploy_cmds = None
> @@ -119,9 +119,9 @@ class
> MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
>
>      def deploy(self):
>          # base class just sets the ssh log file for us
> -        super(MasterImageHardwareTarget, self).deploy()
> -        self.master = sshcontrol.SSHControl(ip=self.ip,
> logfile=self.sshlog, timeout=600, port=self.port)
> -        status, output = self.master.run("cat /etc/goldenimage")
> +        super(GoldenImageHardwareTarget, self).deploy()
> +        self.golden = sshcontrol.SSHControl(ip=self.ip,
> logfile=self.sshlog, timeout=600, port=self.port)
> +        status, output = self.golden.run("cat /etc/goldenimage")
>          if status != 0:
>              # We're not booted into the golden image, so try rebooting
>              bb.plain("%s - booting into the golden image" % self.pn)
> @@ -129,7 +129,7 @@ class
> MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
>              self._wait_until_booted()
>
>          bb.plain("%s - deploying image on target" % self.pn)
> -        status, output = self.master.run("cat /etc/goldenimage")
> +        status, output = self.golden.run("cat /etc/goldenimage")
>          if status != 0:
>              bb.fatal("No ssh connectivity or target isn't running a
> golden image.\n%s" % output)
>          if self.user_cmds:
> @@ -156,10 +156,10 @@ class
> MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=ABCMeta
>
>      def stop(self):
>          bb.plain("%s - reboot/powercycle target" % self.pn)
> -        self.power_cycle(self.master)
> +        self.power_cycle(self.golden)
>
>
> -class SystemdbootTarget(MasterImageHardwareTarget):
> +class SystemdbootTarget(GoldenImageHardwareTarget):
>
>      def __init__(self, d):
>          super(SystemdbootTarget, self).__init__(d)
> @@ -184,16 +184,16 @@ class SystemdbootTarget(MasterImageHardwareTarget):
>
>      def _deploy(self):
>          # make sure these aren't mounted
> -        self.master.run("umount /boot; umount /mnt/testrootfs; umount
> /sys/firmware/efi/efivars;")
> +        self.golden.run("umount /boot; umount /mnt/testrootfs; umount
> /sys/firmware/efi/efivars;")
>          # from now on, every deploy cmd should return 0
>          # else an exception will be thrown by sshcontrol
> -        self.master.ignore_status = False
> -        self.master.copy_to(self.rootfs, "~/test-rootfs." +
> self.image_fstype)
> -        self.master.copy_to(self.kernel, "~/test-kernel")
> +        self.golden.ignore_status = False
> +        self.golden.copy_to(self.rootfs, "~/test-rootfs." +
> self.image_fstype)
> +        self.golden.copy_to(self.kernel, "~/test-kernel")
>          for cmd in self.deploy_cmds:
> -            self.master.run(cmd)
> +            self.golden.run(cmd)
>
>      def _start(self, params=None):
> -        self.power_cycle(self.master)
> +        self.power_cycle(self.golden)
>          # there are better ways than a timeout but this should work for
> now
>          time.sleep(120)
> --
> 2.33.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#159245):
> https://lists.openembedded.org/g/openembedded-core/message/159245
> Mute This Topic: https://lists.openembedded.org/mt/87542275/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000e0866e05d27d6458
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Nevermind ;)</div><div><br></div><div>Alex<br></div><=
/div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">O=
n Mon, 6 Dec 2021 at 16:35, Quentin Schulz &lt;<a href=3D"mailto:foss@0leil=
.net">foss@0leil.net</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Golden image has a more explicit meaning than masterima=
ge and is not an<br>
issue wrt inclusivity.<br>
<br>
Signed-off-by: Quentin Schulz &lt;<a href=3D"mailto:foss%2Byocto@0leil.net"=
 target=3D"_blank">foss+yocto@0leil.net</a>&gt;<br>
---<br>
=C2=A0.../{masterimage.py =3D&gt; goldenimage.py}=C2=A0 =C2=A0 =C2=A0 =C2=
=A0 | 32 +++++++++----------<br>
=C2=A01 file changed, 16 insertions(+), 16 deletions(-)<br>
=C2=A0rename meta/lib/oeqa/controllers/{masterimage.py =3D&gt; goldenimage.=
py} (91%)<br>
<br>
diff --git a/meta/lib/oeqa/controllers/masterimage.py b/meta/lib/oeqa/contr=
ollers/goldenimage.py<br>
similarity index 91%<br>
rename from meta/lib/oeqa/controllers/masterimage.py<br>
rename to meta/lib/oeqa/controllers/goldenimage.py<br>
index feb30366323..fb1ac7a53a0 100644<br>
--- a/meta/lib/oeqa/controllers/masterimage.py<br>
+++ b/meta/lib/oeqa/controllers/goldenimage.py<br>
@@ -24,12 +24,12 @@ from oeqa.utils import CommandError<br>
<br>
=C2=A0from abc import ABCMeta, abstractmethod<br>
<br>
-class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=
=3DABCMeta):<br>
+class GoldenImageHardwareTarget(oeqa.targetcontrol.BaseTarget, metaclass=
=3DABCMeta):<br>
<br>
=C2=A0 =C2=A0 =C2=A0supported_image_fstypes =3D [&#39;tar.gz&#39;, &#39;tar=
.bz2&#39;]<br>
<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, d):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 super(MasterImageHardwareTarget, self).__init_=
_(d)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super(GoldenImageHardwareTarget, self).__init_=
_(d)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# target ip<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0addr =3D d.getVar(&quot;TEST_TARGET_IP&qu=
ot;) or bb.fatal(&#39;Please set TEST_TARGET_IP with the IP address of the =
machine you want to run the tests on.&#39;)<br>
@@ -61,8 +61,8 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.BaseTa=
rget, metaclass=3DABCMeta<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.isfile(self.kernel):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal(&quot;No kernel fo=
und. Expected path: %s&quot; % self.kernel)<br>
<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 # master ssh connection<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.master =3D None<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 # golden ssh connection<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.golden =3D None<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# if the user knows what they are doing, =
then by all means...<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.user_cmds =3D d.getVar(&quot;TEST_DE=
PLOY_CMDS&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.deploy_cmds =3D None<br>
@@ -119,9 +119,9 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.Base=
Target, metaclass=3DABCMeta<br>
<br>
=C2=A0 =C2=A0 =C2=A0def deploy(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# base class just sets the ssh log file f=
or us<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 super(MasterImageHardwareTarget, self).deploy(=
)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.master =3D sshcontrol.SSHControl(ip=3Dsel=
f.ip, logfile=3Dself.sshlog, timeout=3D600, port=3Dself.port)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.master.run(&quot;cat /=
etc/goldenimage&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 super(GoldenImageHardwareTarget, self).deploy(=
)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.golden =3D sshcontrol.SSHControl(ip=3Dsel=
f.ip, logfile=3Dself.sshlog, timeout=3D600, port=3Dself.port)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.golden.run(&quot;cat /=
etc/goldenimage&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if status !=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# We&#39;re not booted into=
 the golden image, so try rebooting<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.plain(&quot;%s - booting=
 into the golden image&quot; % <a href=3D"http://self.pn" rel=3D"noreferrer=
" target=3D"_blank">self.pn</a>)<br>
@@ -129,7 +129,7 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.Base=
Target, metaclass=3DABCMeta<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._wait_until_booted()<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.plain(&quot;%s - deploying image on ta=
rget&quot; % <a href=3D"http://self.pn" rel=3D"noreferrer" target=3D"_blank=
">self.pn</a>)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.master.run(&quot;cat /=
etc/goldenimage&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 status, output =3D self.golden.run(&quot;cat /=
etc/goldenimage&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if status !=3D 0:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.fatal(&quot;No ssh conne=
ctivity or target isn&#39;t running a golden image.\n%s&quot; % output)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if self.user_cmds:<br>
@@ -156,10 +156,10 @@ class MasterImageHardwareTarget(oeqa.targetcontrol.Ba=
seTarget, metaclass=3DABCMeta<br>
<br>
=C2=A0 =C2=A0 =C2=A0def stop(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.plain(&quot;%s - reboot/powercycle tar=
get&quot; % <a href=3D"http://self.pn" rel=3D"noreferrer" target=3D"_blank"=
>self.pn</a>)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.power_cycle(self.master)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.power_cycle(self.golden)<br>
<br>
<br>
-class SystemdbootTarget(MasterImageHardwareTarget):<br>
+class SystemdbootTarget(GoldenImageHardwareTarget):<br>
<br>
=C2=A0 =C2=A0 =C2=A0def __init__(self, d):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0super(SystemdbootTarget, self).__init__(d=
)<br>
@@ -184,16 +184,16 @@ class SystemdbootTarget(MasterImageHardwareTarget):<b=
r>
<br>
=C2=A0 =C2=A0 =C2=A0def _deploy(self):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# make sure these aren&#39;t mounted<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.master.run(&quot;umount /boot; umount /mn=
t/testrootfs; umount /sys/firmware/efi/efivars;&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.golden.run(&quot;umount /boot; umount /mn=
t/testrootfs; umount /sys/firmware/efi/efivars;&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# from now on, every deploy cmd should re=
turn 0<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# else an exception will be thrown by ssh=
control<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.master.ignore_status =3D False<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.master.copy_to(self.rootfs, &quot;~/test-=
rootfs.&quot; + self.image_fstype)<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.master.copy_to(self.kernel, &quot;~/test-=
kernel&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.golden.ignore_status =3D False<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.golden.copy_to(self.rootfs, &quot;~/test-=
rootfs.&quot; + self.image_fstype)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.golden.copy_to(self.kernel, &quot;~/test-=
kernel&quot;)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for cmd in self.deploy_cmds:<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.master.run(cmd)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 self.golden.run(cmd)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def _start(self, params=3DNone):<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.power_cycle(self.master)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.power_cycle(self.golden)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# there are better ways than a timeout bu=
t this should work for now<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0time.sleep(120)<br>
-- <br>
2.33.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#159245): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/159245" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/159245</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/87542275/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/87542275/1686489</a><br>
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

--000000000000e0866e05d27d6458--

