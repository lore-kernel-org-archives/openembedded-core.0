Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54920C433EF
	for <webhook@archiver.kernel.org>; Thu,  3 Mar 2022 00:07:05 +0000 (UTC)
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by mx.groups.io with SMTP id smtpd.web12.5347.1646266024291721281
 for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 16:07:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y1qwcJAV;
 spf=pass (domain: gmail.com, ip: 209.85.167.54,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lf1-f54.google.com with SMTP id w27so5594150lfa.5
        for <openembedded-core@lists.openembedded.org>;
 Wed, 02 Mar 2022 16:07:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LOFZYVxhQByb0VTTGgETAMCRYNRVuj9bS4j3umy+F8w=;
        b=Y1qwcJAVTOKltM5CFBFhgdjUr87Tf+szGwRizUdMIF9keoT/acKj98sNDvduYrPw5y
         WdUgewz1T1fVtmPpayrUw62eN2YsY80flXEc/rTH2KyZ8EBffppZa6PVj0vci8mTeZWk
         dRag16Il4YRGObSAosvx6F+w84dqucoDPlfVVY8oMH2Wje7ygi6C/Rvu1VP62GGKTG0x
         dH2eNIVndFJhr250RYPo4kid7V0PdAYxUIogE/NflUcP9NiYW4CKqNJqnha8wT9xUPxV
         yD763MApW0WrUejq8HCMxXAMk4k658Mxt6MSVEsCRi5J1dpKxXFcmEiDkVQM9kyr31ut
         j3Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LOFZYVxhQByb0VTTGgETAMCRYNRVuj9bS4j3umy+F8w=;
        b=KVZp4pqrpEVFkags4YEQpMgKz6skCkj0aJCRkwn8kA3k297W5GNxqEsCxEJBml4zur
         4n10dDUmxXDgAF0o1tfkmCXup5pIbCjrjKOBxzlw7f3xqJgPnEZJEEnDhxpc7xONf/wE
         uqhnDBdBA1AiWOgBMT02IJ9bYndxDfpqCBLGr3zwTNJAUfgBlfDJESc55O03I6QKLJSM
         z0fcrFLneouyPdwCTtF+6VgvADQZ6mHlPTKO/iQnMqMinmhxTVgqrgIqulEESxvYSHiy
         dKfBliYS4EJhFu3CCwXBvUVEz3+/PnG8tmhJAzWhlp7+wmSGkuU6FyafgbGNEo3eo8Xd
         v9NA==
X-Gm-Message-State: AOAM530XxqkSct0W0XJcre4AqmiYmYGv5GUFfbOZWkbeq9Pch/1eYjPE
	XvWIo4zqRnO9wtIq1dle88g7UETV4wuV7m494U0=
X-Google-Smtp-Source: 
 ABdhPJxf2//l2av4hktLzA6BI5oQt0uDlezgAGLOQnKP3qpTm+hTU388jzwbUyCdkC5TSjPvRz8efdcARN2UX0AOVO8=
X-Received: by 2002:a05:6512:511:b0:443:3f9f:5d5c with SMTP id
 o17-20020a056512051100b004433f9f5d5cmr19123108lfb.94.1646266022470; Wed, 02
 Mar 2022 16:07:02 -0800 (PST)
MIME-Version: 1.0
References: <16D869D532B5A22D.25756@lists.openembedded.org>
In-Reply-To: <16D869D532B5A22D.25756@lists.openembedded.org>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 3 Mar 2022 00:06:51 +0000
Message-ID: 
 <CANPvuRk2wx+yXfviZADt8AoF-zR+H89Spj8NcQzAgsFL2LLCfQ@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] buildhistory.bbclass: create the
 buildhistory directory when needed
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Steve Sakoman <steve@sakoman.com>
Content-Type: multipart/alternative; boundary="00000000000079ac5e05d9452d8f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 03 Mar 2022 00:07:05 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/162631

--00000000000079ac5e05d9452d8f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can this patch be backported to dunfell?

Jose

Jose Quaresma via lists.openembedded.org <quaresma.jose=3D
gmail.com@lists.openembedded.org> escreveu no dia quarta, 2/03/2022 =C3=A0(=
s)
00:47:

> When the BUILDHISTORY_RESET is enabled we need to move the
> content from BUILDHISTORY_DIR to BUILDHISTORY_OLD_DIR but
> when we start a clean build in the first run we don't have the
> BUILDHISTORY_DIR so the move of files will fail.
>
> | ERROR: Command execution failed: Traceback (most recent call last):
> |  File "/xxx/poky/bitbake/lib/bb/command.py", line 110, in runAsyncComma=
nd
> |    commandmethod(self.cmds_async, self, options)
> |  File "/xxx/poky/bitbake/lib/bb/command.py", line 564, in buildTargets
> |    command.cooker.buildTargets(pkgs_to_build, task)
> |  File "/xxx/poky/bitbake/lib/bb/cooker.py", line 1481, in buildTargets
> |    bb.event.fire(bb.event.BuildStarted(buildname, ntargets),
> self.databuilder.mcdata[mc])
> |  File "/xxx/home/builder/src/base/poky/bitbake/lib/bb/event.py", line
> 214, in fire
> |    fire_class_handlers(event, d)
> |  File "/xxx/poky/bitbake/lib/bb/event.py", line 121, in
> fire_class_handlers
> |    execute_handler(name, handler, event, d)
> |  File "/xxx/poky/bitbake/lib/bb/event.py", line 93, in execute_handler
> |    ret =3D handler(event)
> |  File "/xxx/poky/meta/classes/buildhistory.bbclass", line 919, in
> buildhistory_eventhandler
> |    entries =3D [ x for x in os.listdir(rootdir) if not x.startswith('.'=
) ]
> | FileNotFoundError: [Errno 2] No such file or directory:
> '/xxx/buildhistory'
>
> Signed-off-by: Jose Quaresma <quaresma.jose@gmail.com>
> ---
>  V2: remove the check to see if the directory exists
>
>  meta/classes/buildhistory.bbclass | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/meta/classes/buildhistory.bbclass
> b/meta/classes/buildhistory.bbclass
> index 49797a6701..8db79a4829 100644
> --- a/meta/classes/buildhistory.bbclass
> +++ b/meta/classes/buildhistory.bbclass
> @@ -896,6 +896,7 @@ python buildhistory_eventhandler() {
>                  if os.path.isdir(olddir):
>                      shutil.rmtree(olddir)
>                  rootdir =3D e.data.getVar("BUILDHISTORY_DIR")
> +                bb.utils.mkdirhier(rootdir)
>                  entries =3D [ x for x in os.listdir(rootdir) if not
> x.startswith('.') ]
>                  bb.utils.mkdirhier(olddir)
>                  for entry in entries:
> --
> 2.35.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#162587):
> https://lists.openembedded.org/g/openembedded-core/message/162587
> Mute This Topic: https://lists.openembedded.org/mt/89491842/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000079ac5e05d9452d8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Can this patch be backported to dunfell?</div><div><b=
r></div><div>Jose</div><br><div class=3D"gmail_quote"><div dir=3D"ltr" clas=
s=3D"gmail_attr">Jose Quaresma via <a href=3D"http://lists.openembedded.org=
">lists.openembedded.org</a> &lt;quaresma.jose=3D<a href=3D"mailto:gmail.co=
m@lists.openembedded.org">gmail.com@lists.openembedded.org</a>&gt; escreveu=
 no dia quarta, 2/03/2022 =C3=A0(s) 00:47:<br></div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">When the BUILDHISTORY_RESET is enabled we need t=
o move the<br>
content from BUILDHISTORY_DIR to BUILDHISTORY_OLD_DIR but<br>
when we start a clean build in the first run we don&#39;t have the<br>
BUILDHISTORY_DIR so the move of files will fail.<br>
<br>
| ERROR: Command execution failed: Traceback (most recent call last):<br>
|=C2=A0 File &quot;/xxx/poky/bitbake/lib/bb/command.py&quot;, line 110, in =
runAsyncCommand<br>
|=C2=A0 =C2=A0 commandmethod(self.cmds_async, self, options)<br>
|=C2=A0 File &quot;/xxx/poky/bitbake/lib/bb/command.py&quot;, line 564, in =
buildTargets<br>
|=C2=A0 =C2=A0 command.cooker.buildTargets(pkgs_to_build, task)<br>
|=C2=A0 File &quot;/xxx/poky/bitbake/lib/bb/cooker.py&quot;, line 1481, in =
buildTargets<br>
|=C2=A0 =C2=A0 bb.event.fire(bb.event.BuildStarted(buildname, ntargets), se=
lf.databuilder.mcdata[mc])<br>
|=C2=A0 File &quot;/xxx/home/builder/src/base/poky/bitbake/lib/bb/event.py&=
quot;, line 214, in fire<br>
|=C2=A0 =C2=A0 fire_class_handlers(event, d)<br>
|=C2=A0 File &quot;/xxx/poky/bitbake/lib/bb/event.py&quot;, line 121, in fi=
re_class_handlers<br>
|=C2=A0 =C2=A0 execute_handler(name, handler, event, d)<br>
|=C2=A0 File &quot;/xxx/poky/bitbake/lib/bb/event.py&quot;, line 93, in exe=
cute_handler<br>
|=C2=A0 =C2=A0 ret =3D handler(event)<br>
|=C2=A0 File &quot;/xxx/poky/meta/classes/buildhistory.bbclass&quot;, line =
919, in buildhistory_eventhandler<br>
|=C2=A0 =C2=A0 entries =3D [ x for x in os.listdir(rootdir) if not x.starts=
with(&#39;.&#39;) ]<br>
| FileNotFoundError: [Errno 2] No such file or directory: &#39;/xxx/buildhi=
story&#39;<br>
<br>
Signed-off-by: Jose Quaresma &lt;<a href=3D"mailto:quaresma.jose@gmail.com"=
 target=3D"_blank">quaresma.jose@gmail.com</a>&gt;<br>
---<br>
=C2=A0V2: remove the check to see if the directory exists<br>
<br>
=C2=A0meta/classes/buildhistory.bbclass | 1 +<br>
=C2=A01 file changed, 1 insertion(+)<br>
<br>
diff --git a/meta/classes/buildhistory.bbclass b/meta/classes/buildhistory.=
bbclass<br>
index 49797a6701..8db79a4829 100644<br>
--- a/meta/classes/buildhistory.bbclass<br>
+++ b/meta/classes/buildhistory.bbclass<br>
@@ -896,6 +896,7 @@ python buildhistory_eventhandler() {<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if os.path.is=
dir(olddir):<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0shutil.rmtree(olddir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rootdir =3D e=
.data.getVar(&quot;BUILDHISTORY_DIR&quot;)<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bb.utils.mkdirhier=
(rootdir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0entries =3D [=
 x for x in os.listdir(rootdir) if not x.startswith(&#39;.&#39;) ]<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0bb.utils.mkdi=
rhier(olddir)<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0for entry in =
entries:<br>
-- <br>
2.35.1<br>
<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#162587): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/162587" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/162587</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/89491842/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/89491842/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--00000000000079ac5e05d9452d8f--

