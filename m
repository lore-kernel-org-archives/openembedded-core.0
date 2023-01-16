Return-Path: <pzalewski@thegoodpenguin.co.uk>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A66DC54EBE
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 11:14:27 +0000 (UTC)
Received: from mail-io1-f45.google.com (mail-io1-f45.google.com [209.85.166.45])
 by mx.groups.io with SMTP id smtpd.web10.163975.1673867658627147686
 for <openembedded-core@lists.openembedded.org>;
 Mon, 16 Jan 2023 03:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@thegoodpenguin-co-uk.20210112.gappssmtp.com header.s=20210112 header.b=jpYbGIPV;
 spf=pass (domain: thegoodpenguin.co.uk, ip: 209.85.166.45, mailfrom: pzalewski@thegoodpenguin.co.uk)
Received: by mail-io1-f45.google.com with SMTP id b127so5402709iof.8
        for <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 03:14:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=YgyYfZplV/bvJ0Z30jM0DTejIfhMbqRMgWbZbFLv1ac=;
        b=jpYbGIPVK0nHKSGiY9aGur4Pz+mHAnIsj4KXbYqn/WULrY7ihfrcsDdg/H6HsHqwju
         Iei99KSspuCdtbBVJ3GnorAD2PaUO+eVZSSIQa8H+9jcUIEOVq/DIO4YaqDBYIvuCh6v
         SgEOZU0Lxj6r5pprYVcgOdAKK84m178gyBKXi4Y+JjetN4Z55hzuoz2G1BOSm0XE14O+
         vRnJ2Jutsvj5NGCXUQS9mbhVk2716mXop0pWZ0Zpkl5fjTU7uPy2InM3vHPCiy0sUF2a
         PlLoJNLwfcTslcVPnS9o9BGSu8viq67aoqBjPv198sbKN0BaL96LIhqc+1M3c6BiLEdD
         ldsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=YgyYfZplV/bvJ0Z30jM0DTejIfhMbqRMgWbZbFLv1ac=;
        b=GxK0h+3kPD83zBRd+cfaEIfL1MZA198QKjlhwWVL9l6wa7IuyDRi/M4CQpiHR8GSl3
         Cdjsk4TaPhTlfH+r+tHn+26sJ/IyiOZwUM9FVViGBggjtgrPgxSdynD+9ZM8LsNd6FGL
         jILuayjr0SB+RHKCRO4FRomww0JI1L+HYOQYnEpkQgaiHT9OUUltRGUYf/Vcr6vbDFim
         9m3aZ6lF3viC8wy9I+VCtARiM1GU/8UaXUdvCAAc3pZNvpQjMpt5tqLUJzjFrGcylHvk
         58/rOZ5YrmNH4GgeEdnquMeC3hpBSuND5iflOYvRSahNKIcBE4eiX06nHgENN4M/7HXW
         JJjA==
X-Gm-Message-State: AFqh2kpG9eERtvj602DU5RrtASQtOJmxN0azZOsJU07TQaozAyMelnTX
	WFooq92jhrexb71H1fwJsghp2sany9pOt/BVZYTcrCEp8IxuNJIg
X-Google-Smtp-Source: AMrXdXvhqi/lokOtCMEB6l8YpI3rNb6lEljpMM8xJ1C7dIwXRmMedddIE1JfUNfpwYuUI88Se1L17hotzLVdQF9VYfU=
X-Received: by 2002:a02:9144:0:b0:3a5:58a3:9c4e with SMTP id
 b4-20020a029144000000b003a558a39c4emr186853jag.41.1673867657635; Mon, 16 Jan
 2023 03:14:17 -0800 (PST)
MIME-Version: 1.0
References: <20221222103829.55230-1-pzalewski@thegoodpenguin.co.uk> <b982ed0c230158f65a58c3714a308ab6dfb6f5ae.camel@linuxfoundation.org>
In-Reply-To: <b982ed0c230158f65a58c3714a308ab6dfb6f5ae.camel@linuxfoundation.org>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Mon, 16 Jan 2023 11:14:06 +0000
Message-ID: <CAA6zWZJnwsuuL2nVxADONpw2W7zK4=KpfQ099k88gvRUSRwzyA@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] classes: decode output data to text
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000227f7205f25faf14"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 16 Jan 2023 11:14:27 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/175973

--000000000000227f7205f25faf14
Content-Type: text/plain; charset="UTF-8"

That is a good point, looking at the codebase I think that the go-to for
dealing with it is using the call to ".decode('utf8')".

Thanks,
Pawel

On Mon, 16 Jan 2023 at 11:01, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Thu, 2022-12-22 at 10:38 +0000, Pawel Zalewski wrote:
> > The default return value from subprocess.check_output is an encoded byte.
> > The applied fix will decode the value to a string.
> >
> > Signed-off-by: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
> > ---
> >  meta/classes/fs-uuid.bbclass | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbclass
> > index 9b53dfba7a..731ea575bd 100644
> > --- a/meta/classes/fs-uuid.bbclass
> > +++ b/meta/classes/fs-uuid.bbclass
> > @@ -4,7 +4,7 @@
> >  def get_rootfs_uuid(d):
> >      import subprocess
> >      rootfs = d.getVar('ROOTFS')
> > -    output = subprocess.check_output(['tune2fs', '-l', rootfs])
> > +    output = subprocess.check_output(['tune2fs', '-l', rootfs],
> text=True)
> >      for line in output.split('\n'):
> >          if line.startswith('Filesystem UUID:'):
> >              uuid = line.split()[-1]
>
> You mentioned running into this on kirkstone. One problem is that
> text=True is python 3.7 syntax so whilst this is fine for master,
> kirkstone supports older versions of python.
>
> Cheers,
>
> Richard
>

--000000000000227f7205f25faf14
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>That is a good point, looking at the codebase I think=
 that the go-to for dealing with it is using the call to &quot;.decode(&#39=
;utf8&#39;)&quot;.</div><div><br></div><div>Thanks,<br></div><div>Pawel<br>=
</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_=
attr">On Mon, 16 Jan 2023 at 11:01, Richard Purdie &lt;<a href=3D"mailto:ri=
chard.purdie@linuxfoundation.org">richard.purdie@linuxfoundation.org</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Thu,=
 2022-12-22 at 10:38 +0000, Pawel Zalewski wrote:<br>
&gt; The default return value from subprocess.check_output is an encoded by=
te.<br>
&gt; The applied fix will decode the value to a string.<br>
&gt; <br>
&gt; Signed-off-by: Pawel Zalewski &lt;<a href=3D"mailto:pzalewski@thegoodp=
enguin.co.uk" target=3D"_blank">pzalewski@thegoodpenguin.co.uk</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/classes/fs-uuid.bbclass | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes/fs-uuid.bbclass b/meta/classes/fs-uuid.bbcla=
ss<br>
&gt; index 9b53dfba7a..731ea575bd 100644<br>
&gt; --- a/meta/classes/fs-uuid.bbclass<br>
&gt; +++ b/meta/classes/fs-uuid.bbclass<br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 def get_rootfs_uuid(d):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 import subprocess<br>
&gt;=C2=A0 =C2=A0 =C2=A0 rootfs =3D d.getVar(&#39;ROOTFS&#39;)<br>
&gt; -=C2=A0 =C2=A0 output =3D subprocess.check_output([&#39;tune2fs&#39;, =
&#39;-l&#39;, rootfs])<br>
&gt; +=C2=A0 =C2=A0 output =3D subprocess.check_output([&#39;tune2fs&#39;, =
&#39;-l&#39;, rootfs], text=3DTrue)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 for line in output.split(&#39;\n&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if line.startswith(&#39;Filesystem U=
UID:&#39;):<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 uuid =3D line.split()[=
-1]<br>
<br>
You mentioned running into this on kirkstone. One problem is that<br>
text=3DTrue is python 3.7 syntax so whilst this is fine for master,<br>
kirkstone supports older versions of python. <br>
<br>
Cheers,<br>
<br>
Richard<br>
</blockquote></div>

--000000000000227f7205f25faf14--

