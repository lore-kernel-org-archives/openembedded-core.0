Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6ECE5C6FA99
	for <webhook@archiver.kernel.org>; Tue,  7 Mar 2023 11:43:54 +0000 (UTC)
Received: from mail-ua1-f51.google.com (mail-ua1-f51.google.com [209.85.222.51])
 by mx.groups.io with SMTP id smtpd.web11.12253.1678189424284053361
 for <openembedded-core@lists.openembedded.org>;
 Tue, 07 Mar 2023 03:43:44 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=fpuuFuXu;
 spf=pass (domain: gmail.com, ip: 209.85.222.51, mailfrom: quaresma.jose@gmail.com)
Received: by mail-ua1-f51.google.com with SMTP id s13so8602732uac.8
        for <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 03:43:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1678189423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=nxz9B06xdbywxlZ7KHp3ii9BDiFKDml/fP61P9cfghk=;
        b=fpuuFuXupb6y7FiuNmyHO3hIFML3MDkHxoU1LZ9g21/h0gk4JSfRc6oRIMMFhVWTFo
         jWyHrS1awwanDoFw6zfgXyBM0X2p8lTHWGDTjLnsGCZr+h4QuT4/PafSCFkJPVrfEcTx
         YpDYHRNQnaTgkf57y8++dhL6KEhEmSemCedoB7gGU3pGwmAwYTTru+AxJbyUPZWP45bG
         FGk6R7Dmz3EsFDDdRMMZc1/EHjK/w4cWtynu2vs9qO8+s5doqyYdqPJUYUZs5W6AUwyB
         kMqJCTA0yurFEjRVOwqDezM3ucKBFqK8VBMsdhW1aU0wkpb6r7cMsyM+yz9Ic3tznUdm
         refQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678189423;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nxz9B06xdbywxlZ7KHp3ii9BDiFKDml/fP61P9cfghk=;
        b=4guVaTa87ptBJaStr0sncpXIzS226U+xSYsQJ5iCBCXSPyJ8P5s9nOE+CMaFNE2M2q
         WFYJQT9CuEpjZp15D/PyWJo3jY3W4ZTAIzIQbBgDgVdxLavzg6S+H5gvpEdy+uaG3kVr
         gRaguHO2Njfa4rGdaoKprrkpGuySH14E695kcNDqfgUfxNIUBSGVbIW8Qc7yLOBaXntM
         TlfwVGGcBP4eZXg/jXRDM1bNlOzOaHB0JmixeakR6GIOFKNEubG4f1Ta9+UvrTANRCQP
         EJjmT5morQctz6pas01Lr52zxiIXf2rFdMFWpg1yLpX8RXittQs99tMkTmyrKU4a0wPm
         m/yA==
X-Gm-Message-State: AO0yUKV7fIfaErPxXo/vSByLHMESjuMw1J6lFXFEQwesjNqSLnDwydqg
	Ctp6cWW2IEOY589Ih/+AanxUDXUb4OJXsaWe2pg=
X-Google-Smtp-Source: AK7set++Xlk7wl4HhQJcJyVPABkiTwgPcrj5niyjyQx+2bZ2SwFLF+Wyr0aQii6XHn7FT0q9J6PfSSpu1a5rebHXzjg=
X-Received: by 2002:a1f:4358:0:b0:429:73a8:6dba with SMTP id
 q85-20020a1f4358000000b0042973a86dbamr3969858vka.0.1678189423246; Tue, 07 Mar
 2023 03:43:43 -0800 (PST)
MIME-Version: 1.0
References: <ccf5bc6b01e8cb93f5357bd2eabcec32af5bfdb9.camel@siemens.com>
 <CANNYZj-Ov6Qswejusp=7F7PJ2cBJ9k119uq5SmTUd5=0-fog1Q@mail.gmail.com>
 <a5271b388e09d6338da258fb97e256e54958b0d1.camel@siemens.com> <CANNYZj-0ESxC8=fT1JJZ2+4gZiHfXvceB3QsS_Ner7UYsNYw+g@mail.gmail.com>
In-Reply-To: <CANNYZj-0ESxC8=fT1JJZ2+4gZiHfXvceB3QsS_Ner7UYsNYw+g@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Tue, 7 Mar 2023 11:43:32 +0000
Message-ID: <CANPvuRnky4k=Lb3WnarWXi8mbLX5CfDOxQxxgggZh6pec4bHTw@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone] Google go CVEs
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: "Valek, Andrej" <andrej.valek@siemens.com>, 
	"openembedded-core@lists.openembedded.org" <openembedded-core@lists.openembedded.org>, 
	"Freihofer, Adrian" <adrian.freihofer@siemens.com>, Ricardo Salveti <ricardo@foundries.io>
Content-Type: multipart/alternative; boundary="00000000000070434605f64dec12"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 07 Mar 2023 11:43:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178103

--00000000000070434605f64dec12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

At Foundries.io we intend to update the docker version on the kirkstone
branch to the latest available upstream, currently v23.
Looks like the better approach can be doing that in the mixin layer,
for that a new kirstone lts branch will be required.

This requires a golang update as well but the golang on master is broken
for some cases when -linkshared is in use and we are still debugging this
issue.
I pretend to start this backport when I can stabilize first the golang 1.20
on master.

Do you think this approach for updating docker is appropriate
and acceptable?

Jose


Alexander Kanavin <alex.kanavin@gmail.com> escreveu no dia ter=C3=A7a, 7/03=
/2023
=C3=A0(s) 09:34:

> If you understand the code well, and can be confident that your
> backports address the issue correctly and do not introduce new issues,
> then by all means go ahead.
>
> My personal position should be known: I see the whole 'CVE
> backporting' industry as a colossal waste. We need to learn to update
> to supported upstream versions, and not be scared of breaking
> production with that.
>
> Alex
>
> On Tue, 7 Mar 2023 at 10:05, Valek, Andrej <andrej.valek@siemens.com>
> wrote:
> >
> > Hello Alex,
> >
> > Yes, that would an option, but afaik it wasn't working quite well. So I
> > would still prefer a straight forward solution.
> >
> > Should I spend some time for creating such patches? Means if there will
> > be a potential option for being accepted?
> >
> > Andrej
> >
> > On Tue, 2023-03-07 at 07:37 +0100, Alexander Kanavin wrote:
> > > You probably should make a kirkstone mixin layer like we did for
> > > dunfell.
> > > https://git.yoctoproject.org/meta-lts-mixins/
> > >
> > > Alex
> > >
> > > On Tue, 7 Mar 2023 at 07:32, Andrej Valek <andrej.valek@siemens.com>
> > > wrote:
> > > >
> > > > Hello everyone,
> > > >
> > > > I would like to ask you how to proceed with multiple CVEs for
> > > > Google Go
> > > > component in kirkstone branch.
> > > >
> > > > CVEs in current version 1.17.13:
> > > > - CVE-2022-41722
> > > > - CVE-2022-41725
> > > > - CVE-2022-41724
> > > > - CVE-2022-41723
> > > >
> > > > They are fixed in 1.19.6/1.20.1 branches, but a fixing patches are
> > > > available for all of them too. Unfortunately there is more then
> > > > ~1000
> > > > changed LOC. So not sure if this is the right approach to apply
> > > > them.
> > > > Not sure if the upgrade is acceptable.
> > > >
> > > > So how to proceed with this?
> > > >
> > > > I know, that they aren't a critical one, but would be nice to have
> > > > them
> > > > fixed.
> > > >
> > > > Regards,
> > > > Andrej
> > > >
> > > >
> > > >
> >
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178097):
> https://lists.openembedded.org/g/openembedded-core/message/178097
> Mute This Topic: https://lists.openembedded.org/mt/97444547/5052612
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> quaresma.jose@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
Best regards,

Jos=C3=A9 Quaresma

--00000000000070434605f64dec12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi,<div><br>At Foundries.io=C2=A0we intend to=C2=A0update =
the docker version on the kirkstone</div><div>branch to the latest availabl=
e upstream, currently v23.</div><div>Looks like the better approach=C2=A0ca=
n be doing that in the mixin layer,<br>for that a new kirstone lts branch w=
ill be required.<div><br>This requires a golang update as well=C2=A0but the=
 golang on master is broken<br><div>for some cases when -linkshared is in u=
se and we are still debugging this issue.</div></div><div>I pretend to star=
t this backport when I can stabilize first the golang 1.20 on master.</div>=
<div><br></div><div>Do you think this approach for updating docker is appro=
priate and=C2=A0acceptable?<br><br>Jose<br><br></div></div></div><br><div c=
lass=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Alexander Kanavi=
n &lt;<a href=3D"mailto:alex.kanavin@gmail.com">alex.kanavin@gmail.com</a>&=
gt; escreveu no dia ter=C3=A7a, 7/03/2023 =C3=A0(s) 09:34:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">If you understand the code well,=
 and can be confident that your<br>
backports address the issue correctly and do not introduce new issues,<br>
then by all means go ahead.<br>
<br>
My personal position should be known: I see the whole &#39;CVE<br>
backporting&#39; industry as a colossal waste. We need to learn to update<b=
r>
to supported upstream versions, and not be scared of breaking<br>
production with that.<br>
<br>
Alex<br>
<br>
On Tue, 7 Mar 2023 at 10:05, Valek, Andrej &lt;<a href=3D"mailto:andrej.val=
ek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt; wrote:<b=
r>
&gt;<br>
&gt; Hello Alex,<br>
&gt;<br>
&gt; Yes, that would an option, but afaik it wasn&#39;t working quite well.=
 So I<br>
&gt; would still prefer a straight forward solution.<br>
&gt;<br>
&gt; Should I spend some time for creating such patches? Means if there wil=
l<br>
&gt; be a potential option for being accepted?<br>
&gt;<br>
&gt; Andrej<br>
&gt;<br>
&gt; On Tue, 2023-03-07 at 07:37 +0100, Alexander Kanavin wrote:<br>
&gt; &gt; You probably should make a kirkstone mixin layer like we did for<=
br>
&gt; &gt; dunfell.<br>
&gt; &gt; <a href=3D"https://git.yoctoproject.org/meta-lts-mixins/" rel=3D"=
noreferrer" target=3D"_blank">https://git.yoctoproject.org/meta-lts-mixins/=
</a><br>
&gt; &gt;<br>
&gt; &gt; Alex<br>
&gt; &gt;<br>
&gt; &gt; On Tue, 7 Mar 2023 at 07:32, Andrej Valek &lt;<a href=3D"mailto:a=
ndrej.valek@siemens.com" target=3D"_blank">andrej.valek@siemens.com</a>&gt;=
<br>
&gt; &gt; wrote:<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Hello everyone,<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I would like to ask you how to proceed with multiple CVEs fo=
r<br>
&gt; &gt; &gt; Google Go<br>
&gt; &gt; &gt; component in kirkstone branch.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; CVEs in current version 1.17.13:<br>
&gt; &gt; &gt; - CVE-2022-41722<br>
&gt; &gt; &gt; - CVE-2022-41725<br>
&gt; &gt; &gt; - CVE-2022-41724<br>
&gt; &gt; &gt; - CVE-2022-41723<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; They are fixed in 1.19.6/1.20.1 branches, but a fixing patch=
es are<br>
&gt; &gt; &gt; available for all of them too. Unfortunately there is more t=
hen<br>
&gt; &gt; &gt; ~1000<br>
&gt; &gt; &gt; changed LOC. So not sure if this is the right approach to ap=
ply<br>
&gt; &gt; &gt; them.<br>
&gt; &gt; &gt; Not sure if the upgrade is acceptable.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; So how to proceed with this?<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; I know, that they aren&#39;t a critical one, but would be ni=
ce to have<br>
&gt; &gt; &gt; them<br>
&gt; &gt; &gt; fixed.<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; Regards,<br>
&gt; &gt; &gt; Andrej<br>
&gt; &gt; &gt;<br>
&gt; &gt; &gt; <br>
&gt; &gt; &gt;<br>
&gt;<br>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#178097): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178097" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/178097</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97444547/5052=
612" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97444547/5052612</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:quaresma.jose@gmail.com" t=
arget=3D"_blank">quaresma.jose@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><br clear=3D"all"><div><br></div><span class=3D"gmail_si=
gnature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><d=
iv dir=3D"ltr">Best regards,<div><br>Jos=C3=A9 Quaresma</div></div></div>

--00000000000070434605f64dec12--

