Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com [209.85.217.52])
 by mx.groups.io with SMTP id smtpd.web10.2416.1593538301948130094
 for <openembedded-core@lists.openembedded.org>;
 Tue, 30 Jun 2020 10:31:42 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=OD8ixnP4;
 spf=pass (domain: gmail.com, ip: 209.85.217.52, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f52.google.com with SMTP id k7so10324263vso.2
        for <openembedded-core@lists.openembedded.org>; Tue, 30 Jun 2020 10:31:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=KMfGWJvGWqea2AWBL65Ux0FmGWt6VGhO90eTJ9ip67s=;
        b=OD8ixnP4GgpEzYcTTnkJQlYebNzs/f1cdBB7h3oIbqFXn+/YkLZ7igCcRBBNDRCAyE
         IEfgWTUcRYZ+NxEw4dh+r0Bl4mJ4TzRXAWsWkVUyPzsqweXd8gGhuu1TK76fkWxZDOm+
         fgHn7SeWRzhGOfdYl7Qv2TMzuOksiwjt/5WhS+MYjWhOgtMOcnYBbF028WLBTvHgi6DY
         k8YX+i2urpzzvYkgkTjU4Pz7kjb561NMx/Q6FJ3RMapjKZmM4DTZC3q95rHURE/Hvhrh
         Luuj1LWwqfOyMpz2EYA7LB/PlfgoYXB42bL6wYqTYQ7clJD2poq/7U0Ur06YZW51rm7h
         EmFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=KMfGWJvGWqea2AWBL65Ux0FmGWt6VGhO90eTJ9ip67s=;
        b=Snc0rHEV2z/SFr1A06/NeuxbRNmP1acGVCR8QVppgblKEMlN9jwpJuyC/hRE3Iu9Yd
         28A4TgNmBkjO/Ejh367NNiCQuAcMfgBJb3HasAUdXuJmVLsLoRYbohovV/+E0uCzAa8j
         GjozkCUWcefhSOySbduxfqpRR2Dsn1EkgCfFU63yLFPTDcJ6AH7YLWgZ8G2r0Vg4tN7P
         OlwgaLA+cstQbjOCnIescAx5O/8z4W097PauiLbWYhcQex3HnNw30BDF0sqQWsn6FmO2
         hWsOPcxeSj1zPdsXr2HPf6A7927+5afG+F0cFwPAQpV90UAVll4j1WoT6jUJoQSVNnrX
         JztQ==
X-Gm-Message-State: AOAM533GMJ70yQo0Z/G3VDxrsINhKdXiOmLk/+KrPcUYuLXfUVVwzJ98
	iYCUeqscLwqpMIgyx8ZvkJdJATRnasNyFhI1aW8=
X-Google-Smtp-Source: ABdhPJzLFe3sZm+zAu0fvwjUQbqkPR8an4FGwG678hJhYVicF2htPKWkLKNe/LO++eUWEXHSetgHjYzqWnuDy3QPWK4=
X-Received: by 2002:a67:8c09:: with SMTP id o9mr16446065vsd.23.1593538301105;
 Tue, 30 Jun 2020 10:31:41 -0700 (PDT)
MIME-Version: 1.0
References: <e5Dw.1593365236614554114.mV8j@lists.openembedded.org>
 <CANNYZj8ondQew3MqtyLr1k-EyBLG52KfT_wu3mRabZRpjecQEg@mail.gmail.com>
 <f0fc34bfb15642bdab4a1def06639238@multitech.com> <CANNYZj_L2fE=j2o7pZ+_i_UH8GgVEZQR3kmg=obJi5vxjWnKqA@mail.gmail.com>
 <67ef24cd6a614dafb4245c9454854247@multitech.com>
In-Reply-To: <67ef24cd6a614dafb4245c9454854247@multitech.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 30 Jun 2020 19:31:29 +0200
Message-ID: <CANNYZj-07gCydk6TYD36RQvALh6vj2exG2LA34CkPx2BBSyB0g@mail.gmail.com>
Subject: Re: [OE-core] git do_unpack
To: John Klug <John.Klug@multitech.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005f985a05a9508ccf"

--0000000000005f985a05a9508ccf
Content-Type: text/plain; charset="UTF-8"

SRCREV should be the actual commit hash that matches the tag, then
do_unpack will not do git ls-remote. Tags can, and do move around.

Alex

On Tue, 30 Jun 2020 at 19:24, John Klug <John.Klug@multitech.com> wrote:

> We typically use tags to match PV and name our recipes NAME_TAG.bb
>
> Recipe name:
>
> dhq-client_0.39.bb
>
> from bitbake -e dhq-client output:
>
> # pre-expansion value:
> #   "${PN}-${PV}"
> P="dhq-client-0.39"
>
> In recipe:
>
> SRCREV = "${PV}"
> SRC_URI = "git://
> git@gitlab.multitech.net/devicehq/mAPI-dhq-client.git;protocol=ssh;nobranch=1
> \            file://config.json.sample \            file://dhqclient.init
> \            file://dhqclient \            file://dhq-rootCA.pem \ "
>
> Sanity check:
>
> jklug@trustytahrdm1:~$ git clone git@gitlab.multitech.net:
> devicehq/mAPI-dhq-client
> Cloning into 'mAPI-dhq-client'...
> remote: Counting objects: 485, done.
> remote: Compressing objects: 100% (199/199), done.
> remote: Total 485 (delta 285), reused 450 (delta 265)
> Receiving objects: 100% (485/485), 84.73 KiB | 14.12 MiB/s, done.
> Resolving deltas: 100% (285/285), done.
> jklug@trustytahrdm1:~$ cd mAPI-dhq-client/
> jklug@trustytahrdm1:~/mAPI-dhq-client$ git log -1 --format=%ai 0.39 | head
> 2020-05-05 09:47:03 -0500
> jklug@trustytahrdm1:~/mAPI-dhq-client$ git checkout 0.39
> Note: checking out '0.39'.
>
> You are in 'detached HEAD' state. You can look around, make experimental
> changes and commit them, and you can discard any commits you make in this
> state without impacting any branches by performing another checkout.
>
> If you want to create a new branch to retain commits you create, you may
> do so (now or later) by using -b with the checkout command again. Example:
>
>   git checkout -b <new-branch-name>
>
> HEAD is now at d21aab3 Merge branch 'vp/fix_logs' into 'master'
>

--0000000000005f985a05a9508ccf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>SRCREV should be the actual commit hash that matches =
the tag, then do_unpack will not do git ls-remote. Tags can, and do move ar=
ound.<br></div><div><br></div><div>Alex<br></div></div><br><div class=3D"gm=
ail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, 30 Jun 2020 at 19:=
24, John Klug &lt;<a href=3D"mailto:John.Klug@multitech.com">John.Klug@mult=
itech.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">We typically use tags to match PV and name our recipes NAME_TAG.=
bb<br>
<br>
Recipe name:<br>
<br>
<a href=3D"http://dhq-client_0.39.bb" rel=3D"noreferrer" target=3D"_blank">=
dhq-client_0.39.bb</a> <br>
<br>
from bitbake -e dhq-client output:<br>
<br>
# pre-expansion value:<br>
#=C2=A0 =C2=A0&quot;${PN}-${PV}&quot;<br>
P=3D&quot;dhq-client-0.39&quot;<br>
<br>
In recipe:<br>
<br>
SRCREV =3D &quot;${PV}&quot;<br>
SRC_URI =3D &quot;git://<a href=3D"http://git@gitlab.multitech.net/devicehq=
/mAPI-dhq-client.git;protocol=3Dssh;nobranch=3D1" rel=3D"noreferrer" target=
=3D"_blank">git@gitlab.multitech.net/devicehq/mAPI-dhq-client.git;protocol=
=3Dssh;nobranch=3D1</a> \=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://c=
onfig.json.sample \=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dhqclie=
nt.init \=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dhqclient \=C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 file://dhq-rootCA.pem \ &quot;<br>
<br>
Sanity check:<br>
<br>
jklug@trustytahrdm1:~$ git clone git@gitlab.multitech.net:devicehq/mAPI-dhq=
-client<br>
Cloning into &#39;mAPI-dhq-client&#39;...<br>
remote: Counting objects: 485, done.<br>
remote: Compressing objects: 100% (199/199), done.<br>
remote: Total 485 (delta 285), reused 450 (delta 265)<br>
Receiving objects: 100% (485/485), 84.73 KiB | 14.12 MiB/s, done.<br>
Resolving deltas: 100% (285/285), done.<br>
jklug@trustytahrdm1:~$ cd mAPI-dhq-client/<br>
jklug@trustytahrdm1:~/mAPI-dhq-client$ git log -1 --format=3D%ai 0.39 | hea=
d<br>
2020-05-05 09:47:03 -0500<br>
jklug@trustytahrdm1:~/mAPI-dhq-client$ git checkout 0.39<br>
Note: checking out &#39;0.39&#39;.<br>
<br>
You are in &#39;detached HEAD&#39; state. You can look around, make experim=
ental<br>
changes and commit them, and you can discard any commits you make in this<b=
r>
state without impacting any branches by performing another checkout.<br>
<br>
If you want to create a new branch to retain commits you create, you may<br=
>
do so (now or later) by using -b with the checkout command again. Example:<=
br>
<br>
=C2=A0 git checkout -b &lt;new-branch-name&gt;<br>
<br>
HEAD is now at d21aab3 Merge branch &#39;vp/fix_logs&#39; into &#39;master&=
#39;<br>
</blockquote></div>

--0000000000005f985a05a9508ccf--
