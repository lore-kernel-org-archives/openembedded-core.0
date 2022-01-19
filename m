Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39181C433EF
	for <webhook@archiver.kernel.org>; Wed, 19 Jan 2022 10:16:12 +0000 (UTC)
Received: from mail-ua1-f53.google.com (mail-ua1-f53.google.com
 [209.85.222.53])
 by mx.groups.io with SMTP id smtpd.web09.4606.1642587371241078221
 for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:16:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=XCeUYvlr;
 spf=pass (domain: gmail.com, ip: 209.85.222.53,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f53.google.com with SMTP id u6so3682048uaq.0
        for <openembedded-core@lists.openembedded.org>;
 Wed, 19 Jan 2022 02:16:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8QXDUjgwKzRFNzGBuesdj2cYu3jzL+3KAxeS2ohTrUg=;
        b=XCeUYvlreKsKG5/W8WqVChfrJYN4bEEw+sxMf3IYWtoJxtU/DL9AnGf7+QlgApZ8Qb
         LOMUSO0AdIHHRIJZB3xVDAh9925Tc2eYuGpy1Xz9ekV5UXiDb56m+414smI/CSAwgYmY
         CE9ssLlC6V7ManpKS7plxhxfEBFEFNcH7aZwPTNFwuIXIOt9GeZr0znQ9YvLXjkHaC0j
         wv+133eG+sXWDrcTheK5mcmj72aXiwVMo/CPewpy9UCB96RLMeIKKuZ45K4ec6tN+trm
         3Txh2NM18E+J7WB1wUEeWxbxFdKd9SX9UNEvcCQqL5gc7mnv0PSFiTuzonNdLiG7yzJt
         +XMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8QXDUjgwKzRFNzGBuesdj2cYu3jzL+3KAxeS2ohTrUg=;
        b=5N2iFSuD9bNAVshjAMsg07zg9Q5UwQmRjovLfLkvWWQMQtquvB93F9t29VVKAS2zsX
         I+ptWnYPVhgowUjFSpfbJoQJswOxv3QLxFUWfsGu6QLULF9X9lTom4RVCDj60a+I4eCx
         KDz8gr73VZOad1JloI2VePsx4DvolTQAuDzKqxemaczySLqzAsnya3nrTv1r2cWNVlfv
         3tdN0Oy9fG55RK6ruCN/pcqKoUk1UtHMFSQ3jpM3NyZZ8ZbMfm9zsjHCTe4rGA+CTMjy
         aceDBBS6Tr24IYVYEU205OSNGkEFmm79bc9i+37NYcjuu9y95OolQOeBtb9j0S4ipKOK
         lzJA==
X-Gm-Message-State: AOAM5314cJgMTIYKw8D08qng0IyD7JJrr/On6Ok+0jZ7/Bx1Mquh3wH0
	2TYgl1TXVWHaX/8f/6WMvmc7+QcncCJuyoqs2zM1+j7u
X-Google-Smtp-Source: 
 ABdhPJwIA+rR9XMhpNgRpDvW01ipFexHOaUWD+uo17DtC0qs4XNecLx1vqlSF8bewnQ9UzhXD3pQHyyxICkYjrNJdec=
X-Received: by 2002:a67:e95a:: with SMTP id p26mr7078045vso.38.1642587370218;
 Wed, 19 Jan 2022 02:16:10 -0800 (PST)
MIME-Version: 1.0
References: <20220119030655.3484026-1-hongxu.jia@windriver.com>
In-Reply-To: <20220119030655.3484026-1-hongxu.jia@windriver.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 19 Jan 2022 11:15:59 +0100
Message-ID: 
 <CANNYZj_07b452gHNi_PhSZPGxQUWqcAZeCejTDzkMzfj4Bo+xA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] package_manager/rpm: conditional remove package
 manager database
To: hongxu <hongxu.jia@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Robert Yang <liezhi.yang@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000b6e7a305d5ecaca6"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 19 Jan 2022 10:16:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/160691

--000000000000b6e7a305d5ecaca6
Content-Type: text/plain; charset="UTF-8"

Apologies, but please no. This adds complexity, isn't possible to disable
and is difficult to understand. You can simply remove the unneeded files
from ROOTFS_POSTPROCESS_COMMAND in your image class.

Alex

On Wed, 19 Jan 2022 at 04:07, hongxu <hongxu.jia@windriver.com> wrote:

> In order to save spaces in target rootfs, the user wants to remove dnf and
> keep rpm, in this situation, we should remove dnf database only
>
> If rpm was installed, keep rpm database, after applying this commit:
>
> Edit conf/local.conf
> ...
> IMAGE_FEATURES:remove = "package-management"
> IMAGE_INSTALL:append= " rpm"
> ...
>
> Build image and boot, run rpm -qa on target:
> Without this commit
> ...
> root@intel-x86-64:~# rpm -qa | wc -l
> 0
> ...
>
> Apply this commit
> ...
> root@intel-x86-64:~# rpm -qa | wc -l
> 1865
> ...
>
> With this commit, the rpm -qa works as expected.
>
> It does not make sense to keep dnf and remove rpm, so this commit
> does not consider the scenario
>
> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> ---
>  meta/lib/oe/package_manager/rpm/__init__.py | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/meta/lib/oe/package_manager/rpm/__init__.py
> b/meta/lib/oe/package_manager/rpm/__init__.py
> index b392581069..dce5912329 100644
> --- a/meta/lib/oe/package_manager/rpm/__init__.py
> +++ b/meta/lib/oe/package_manager/rpm/__init__.py
> @@ -80,7 +80,9 @@ class RpmPM(PackageManager):
>          self.saved_packaging_data =
> self.d.expand('${T}/saved_packaging_data/%s' % self.task_name)
>          if not os.path.exists(self.d.expand('${T}/saved_packaging_data')):
>              bb.utils.mkdirhier(self.d.expand('${T}/saved_packaging_data'))
> -        self.packaging_data_dirs = ['etc/rpm', 'etc/rpmrc', 'etc/dnf',
> 'var/lib/rpm', 'var/lib/dnf', 'var/cache/dnf']
> +        self.packaging_data_rpm_dirs = ['etc/rpm', 'etc/rpmrc',
> 'var/lib/rpm']
> +        self.packaging_data_dnf_dirs = ['etc/dnf', 'var/lib/dnf',
> 'var/cache/dnf']
> +        self.packaging_data_dirs = self.packaging_data_rpm_dirs +
> self.packaging_data_dnf_dirs
>          self.solution_manifest = self.d.expand('${T}/saved/%s_solution' %
>                                                 self.task_name)
>          if not os.path.exists(self.d.expand('${T}/saved')):
> @@ -237,8 +239,11 @@ class RpmPM(PackageManager):
>          self._invoke_dnf(["autoremove"])
>
>      def remove_packaging_data(self):
> +        remove_packaging_data_dirs = self.packaging_data_dnf_dirs
> +        if "rpm" not in self.list_installed():
> +            remove_packaging_data_dirs += self.packaging_data_rpm_dirs
>          self._invoke_dnf(["clean", "all"])
> -        for dir in self.packaging_data_dirs:
> +        for dir in remove_packaging_data_dirs:
>              bb.utils.remove(oe.path.join(self.target_rootfs, dir), True)
>
>      def backup_packaging_data(self):
> --
> 2.27.0
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#160688):
> https://lists.openembedded.org/g/openembedded-core/message/160688
> Mute This Topic: https://lists.openembedded.org/mt/88527238/1686489
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kanavin@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000b6e7a305d5ecaca6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Apologies, but please no. This adds complexity, isn&#=
39;t possible to disable and is difficult to understand. You can simply rem=
ove the unneeded files from ROOTFS_POSTPROCESS_COMMAND in your image class.=
</div><div><br></div><div>Alex<br></div></div><br><div class=3D"gmail_quote=
"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 19 Jan 2022 at 04:07, hongx=
u &lt;<a href=3D"mailto:hongxu.jia@windriver.com">hongxu.jia@windriver.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">I=
n order to save spaces in target rootfs, the user wants to remove dnf and<b=
r>
keep rpm, in this situation, we should remove dnf database only<br>
<br>
If rpm was installed, keep rpm database, after applying this commit:<br>
<br>
Edit conf/local.conf<br>
...<br>
IMAGE_FEATURES:remove =3D &quot;package-management&quot;<br>
IMAGE_INSTALL:append=3D &quot; rpm&quot;<br>
...<br>
<br>
Build image and boot, run rpm -qa on target:<br>
Without this commit<br>
...<br>
root@intel-x86-64:~# rpm -qa | wc -l<br>
0<br>
...<br>
<br>
Apply this commit<br>
...<br>
root@intel-x86-64:~# rpm -qa | wc -l<br>
1865<br>
...<br>
<br>
With this commit, the rpm -qa works as expected.<br>
<br>
It does not make sense to keep dnf and remove rpm, so this commit<br>
does not consider the scenario<br>
<br>
Signed-off-by: Hongxu Jia &lt;<a href=3D"mailto:hongxu.jia@windriver.com" t=
arget=3D"_blank">hongxu.jia@windriver.com</a>&gt;<br>
---<br>
=C2=A0meta/lib/oe/package_manager/rpm/__init__.py | 9 +++++++--<br>
=C2=A01 file changed, 7 insertions(+), 2 deletions(-)<br>
<br>
diff --git a/meta/lib/oe/package_manager/rpm/__init__.py b/meta/lib/oe/pack=
age_manager/rpm/__init__.py<br>
index b392581069..dce5912329 100644<br>
--- a/meta/lib/oe/package_manager/rpm/__init__.py<br>
+++ b/meta/lib/oe/package_manager/rpm/__init__.py<br>
@@ -80,7 +80,9 @@ class RpmPM(PackageManager):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.saved_packaging_data =3D self.d.expa=
nd(&#39;${T}/saved_packaging_data/%s&#39; % self.task_name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.exists(self.d.expand(&#39;=
${T}/saved_packaging_data&#39;)):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdirhier(self.d.e=
xpand(&#39;${T}/saved_packaging_data&#39;))<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.packaging_data_dirs =3D [&#39;etc/rpm&#39=
;, &#39;etc/rpmrc&#39;, &#39;etc/dnf&#39;, &#39;var/lib/rpm&#39;, &#39;var/=
lib/dnf&#39;, &#39;var/cache/dnf&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.packaging_data_rpm_dirs =3D [&#39;etc/rpm=
&#39;, &#39;etc/rpmrc&#39;, &#39;var/lib/rpm&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.packaging_data_dnf_dirs =3D [&#39;etc/dnf=
&#39;, &#39;var/lib/dnf&#39;, &#39;var/cache/dnf&#39;]<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 self.packaging_data_dirs =3D self.packaging_da=
ta_rpm_dirs + self.packaging_data_dnf_dirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self.solution_manifest =3D self.d.expand(=
&#39;${T}/saved/%s_solution&#39; %<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 self.task_name)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if not os.path.exists(self.d.expand(&#39;=
${T}/saved&#39;)):<br>
@@ -237,8 +239,11 @@ class RpmPM(PackageManager):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._invoke_dnf([&quot;autoremove&quot;]=
)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def remove_packaging_data(self):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 remove_packaging_data_dirs =3D self.packaging_=
data_dnf_dirs<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 if &quot;rpm&quot; not in self.list_installed(=
):<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 remove_packaging_data_dirs +=3D =
self.packaging_data_rpm_dirs<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0self._invoke_dnf([&quot;clean&quot;, &quo=
t;all&quot;])<br>
-=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dir in self.packaging_data_dirs:<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 for dir in remove_packaging_data_dirs:<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.remove(oe.path.joi=
n(self.target_rootfs, dir), True)<br>
<br>
=C2=A0 =C2=A0 =C2=A0def backup_packaging_data(self):<br>
-- <br>
2.27.0<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#160688): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/160688" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/160688</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/88527238/1686=
489" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/88527238/1686489</a><br>
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

--000000000000b6e7a305d5ecaca6--

