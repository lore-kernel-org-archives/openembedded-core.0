Return-Path: <wak@google.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15AFCECAAD2
	for <webhook@archiver.kernel.org>; Tue, 30 Aug 2022 00:39:21 +0000 (UTC)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by mx.groups.io with SMTP id smtpd.web08.6043.1661819956004480885
 for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 17:39:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@google.com header.s=20210112 header.b=YtBIIRi8;
 spf=pass (domain: google.com, ip: 209.85.208.176, mailfrom: wak@google.com)
Received: by mail-lj1-f176.google.com with SMTP id k18so3298342lji.13
        for <openembedded-core@lists.openembedded.org>;
 Mon, 29 Aug 2022 17:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=mxvTCFIVWUNOj4PrJRSe9aLGfw51tj7Xfcr4/NA8Oxw=;
        b=YtBIIRi8ETGxipYkg6x/8mGoVmE0V+fxP+IoUFzl2mQther3RX+sTOqXm15PCT1nWx
         ahxt9pUTtC5mRoK+WRu6VYpAIPCoIG/KGNXmPDj8DzoXtDCiphbW5bHjBgrJxLRUT4E5
         /UO0iTJykv1Pr1IhLCYFArjJl70V2akgpP2wJwSXWQSyFDqqO94rvfegJik45n+JYon8
         jeErfMWGvW6L9LrqGiyha8cPY0MSgHSxOdQjDaQFAz4owhlI8fwnxmWxq7hMibzrBE1u
         DfmO8jN7Qb7+eDLoE6GG8yl7mGYaXMEt4DK17lkMq8i5DOrzVmEhbdSmFTpEYsbXL83v
         exeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=mxvTCFIVWUNOj4PrJRSe9aLGfw51tj7Xfcr4/NA8Oxw=;
        b=t7xgOsunrwCoJ6TZEw4jTWlQg2rt/mex6qcGWxmYcSKMmihkVyMSEIG17ETE1djXRl
         9csMsiz4YaktocBlJ5bsmf2N4rWYkp4Yg7vwp3hz3QjU+TweDlfvF7pKGQ9HBhbAV5uv
         RtXwCJzP8nR6I6+Je4EOcAXEEG3XcA0vWVKS5EAIfeF4gUvyFvbKe7ugHgQkNI+GrGWx
         12FEqM/6CbxgerT5jFvSAv/M0lGUm3KxFQSBI7GCz0XYaJyFAlErAPZgomqqOwlS5Jis
         2PH1qeUAFxSnA4gEY9qVNHCja18S6RleN3sPm6HrhrwWaAnjYQrg12Wyhv8z2u/t6wKo
         EU3w==
X-Gm-Message-State: ACgBeo0rCQW2hhKn+bdpwX+FhOLpT5dHCQuO5zbiIwzFZGq852wd4B9R
	Gjon/P/XwLqx4R15NM+++MeQKkjvFBWCPfHVPYYu5Q==
X-Google-Smtp-Source: 
 AA6agR7qfE25caR7pio9trsgiVwABR/9cjEbXco/5/2/R5DqoIZFsK14gjVvaVxhCqstBz2uUv6VliST4Xz6fNV7+Eg=
X-Received: by 2002:a05:651c:1cd:b0:261:bef9:ada8 with SMTP id
 d13-20020a05651c01cd00b00261bef9ada8mr6003885ljn.387.1661819954100; Mon, 29
 Aug 2022 17:39:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220829235935.670738-1-wak@google.com>
 <fc5ef086-5e6b-854d-4686-d39a07aeef8f@kernel.crashing.org>
In-Reply-To: <fc5ef086-5e6b-854d-4686-d39a07aeef8f@kernel.crashing.org>
From: William Kennington <wak@google.com>
Date: Mon, 29 Aug 2022 17:39:02 -0700
Message-ID: 
 <CAPnigKnT5RfUqC8TiJw7RVhjzU42Co27Bbw2RtjQ2XamgXusEg@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] rootfs-postcommands: Make /etc/timestamp
 consistent with image
To: Mark Hatle <mark.hatle@kernel.crashing.org>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000000c16b905e76a9ca8"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 30 Aug 2022 00:39:21 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/170043

--0000000000000c16b905e76a9ca8
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 29, 2022 at 5:19 PM Mark Hatle <mark.hatle@kernel.crashing.org>
wrote:

>
>
> On 8/29/22 6:59 PM, William A. Kennington III via lists.openembedded.org
> wrote:
> > This makes the determination of the timestamp for the /etc/timestamp
> > file consistent with mtimes in the generated image. This is desirable to
> > make the built image reproducible with the git commit date instead of
> > the current date.
>
> This is only going to pay attention to poky, or oe-core...  the rootfs
> will vary
> with a change to ANY layer in the system.


Yes, this is what I expect. It is following the same behavior as
image.bbclass.


> If you really want to be consistent you would need to iterate over all of
> the
> layers and look at every file in the system for the timestamp (or if
> they're git
> repositories last commit in each layer..)
>
>
I'm just looking for consistency with the image generation side of things
that set the timestamp based on the same logic flow. It's weird that they
used different logic for setting timestamps in the output image. Sure we
could improve the most recent timestamp by looking at all the git repos of
all the meta layers, but that's not the point of this change.


> All of this doesn't seem like it really makes sense to me which is why a
> static
> timestamp was defined previously.
>

That's fine too, we just want our builds to have reasonably recent
timestamps that are deterministic when REPRODUCIBLE_TIMESTAMP_ROOTFS is
unset.


>
> (with the previous change to the time stamps, I've had more then one user
> get
> concerned they were 'using old software' when they just built something
> from
> scratch -- this will get even more confusing if it's only based on the
> oe-core/poky repository.)
>
> --Mark
>
> > Change-Id: I7d9fe32906aa93baf53948aa40b7a98fb05dd384
> > Signed-off-by: William A. Kennington III <wak@google.com>
> > ---
> >   meta/classes-recipe/rootfs-postcommands.bbclass | 12 +++++++-----
> >   1 file changed, 7 insertions(+), 5 deletions(-)
> >
> > diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass
> b/meta/classes-recipe/rootfs-postcommands.bbclass
> > index 215e38e33d..8d710186d7 100644
> > --- a/meta/classes-recipe/rootfs-postcommands.bbclass
> > +++ b/meta/classes-recipe/rootfs-postcommands.bbclass
> > @@ -312,12 +312,14 @@ python write_image_manifest () {
> >   # Can be used to create /etc/timestamp during image construction to
> give a reasonably
> >   # sane default time setting
> >   rootfs_update_timestamp () {
> > -     if [ "${REPRODUCIBLE_TIMESTAMP_ROOTFS}" != "" ]; then
> > -             # Convert UTC into %4Y%2m%2d%2H%2M%2S
> > -             sformatted=`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS}
> +%4Y%2m%2d%2H%2M%2S`
> > -     else
> > -             sformatted=`date -u +%4Y%2m%2d%2H%2M%2S`
> > +     if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> > +             REPRODUCIBLE_TIMESTAMP_ROOTFS=`git -C "${COREBASE}" log -1
> --pretty=%ct 2>/dev/null` || true
> > +             if [ "$REPRODUCIBLE_TIMESTAMP_ROOTFS" = "" ]; then
> > +                     REPRODUCIBLE_TIMESTAMP_ROOTFS=`stat -c%Y
> ${@bb.utils.which(d.getVar("BBPATH"), "conf/bitbake.conf")}`
> > +             fi
> >       fi
> > +     # Convert UTC into %4Y%2m%2d%2H%2M%2S
> > +     sformatted=`date -u -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS}
> +%4Y%2m%2d%2H%2M%2S`
> >       echo $sformatted > ${IMAGE_ROOTFS}/etc/timestamp
> >       bbnote "rootfs_update_timestamp: set /etc/timestamp to $sformatted"
> >   }
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#170041):
> https://lists.openembedded.org/g/openembedded-core/message/170041
> > Mute This Topic: https://lists.openembedded.org/mt/93339153/3616948
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> mark.hatle@kernel.crashing.org]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >
>

--0000000000000c16b905e76a9ca8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Mon, Aug 29, 2022 at 5:19 PM Mark Hatl=
e &lt;<a href=3D"mailto:mark.hatle@kernel.crashing.org">mark.hatle@kernel.c=
rashing.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex"><br>
<br>
On 8/29/22 6:59 PM, William A. Kennington III via <a href=3D"http://lists.o=
penembedded.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.or=
g</a> wrote:<br>
&gt; This makes the determination of the timestamp for the /etc/timestamp<b=
r>
&gt; file consistent with mtimes in the generated image. This is desirable =
to<br>
&gt; make the built image reproducible with the git commit date instead of<=
br>
&gt; the current date.<br>
<br>
This is only going to pay attention to poky, or oe-core...=C2=A0 the rootfs=
 will vary <br>
with a change to ANY layer in the system.</blockquote><div>=C2=A0</div><div=
>Yes, this is what I expect. It is following the same behavior as image.bbc=
lass.</div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
If you really want to be consistent you would need to iterate over all of t=
he <br>
layers and look at every file in the system for the timestamp (or if they&#=
39;re git <br>
repositories last commit in each layer..)<br>
<br></blockquote><div><br></div><div>I&#39;m just looking for consistency w=
ith the image generation side of things that set the timestamp based on the=
 same logic flow. It&#39;s weird that they used different logic for setting=
 timestamps in the=C2=A0output image. Sure we could improve the most recent=
 timestamp by looking at all the git repos of all the meta layers, but that=
&#39;s not the point of this change.</div><div>=C2=A0</div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">
All of this doesn&#39;t seem like it really makes sense to me which is why =
a static <br>
timestamp was defined previously.<br></blockquote><div><br></div><div>That&=
#39;s fine too, we just want our builds to have reasonably recent timestamp=
s that are deterministic when REPRODUCIBLE_TIMESTAMP_ROOTFS is unset.</div>=
<div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
(with the previous change to the time stamps, I&#39;ve had more then one us=
er get <br>
concerned they were &#39;using old software&#39; when they just built somet=
hing from <br>
scratch -- this will get even more confusing if it&#39;s only based on the =
<br>
oe-core/poky repository.)<br>
<br>
--Mark<br>
<br>
&gt; Change-Id: I7d9fe32906aa93baf53948aa40b7a98fb05dd384<br>
&gt; Signed-off-by: William A. Kennington III &lt;<a href=3D"mailto:wak@goo=
gle.com" target=3D"_blank">wak@google.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 =C2=A0meta/classes-recipe/rootfs-postcommands.bbclass | 12 +++++=
++-----<br>
&gt;=C2=A0 =C2=A01 file changed, 7 insertions(+), 5 deletions(-)<br>
&gt; <br>
&gt; diff --git a/meta/classes-recipe/rootfs-postcommands.bbclass b/meta/cl=
asses-recipe/rootfs-postcommands.bbclass<br>
&gt; index 215e38e33d..8d710186d7 100644<br>
&gt; --- a/meta/classes-recipe/rootfs-postcommands.bbclass<br>
&gt; +++ b/meta/classes-recipe/rootfs-postcommands.bbclass<br>
&gt; @@ -312,12 +312,14 @@ python write_image_manifest () {<br>
&gt;=C2=A0 =C2=A0# Can be used to create /etc/timestamp during image constr=
uction to give a reasonably<br>
&gt;=C2=A0 =C2=A0# sane default time setting<br>
&gt;=C2=A0 =C2=A0rootfs_update_timestamp () {<br>
&gt; -=C2=A0 =C2=A0 =C2=A0if [ &quot;${REPRODUCIBLE_TIMESTAMP_ROOTFS}&quot;=
 !=3D &quot;&quot; ]; then<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0# Convert UTC into %4=
Y%2m%2d%2H%2M%2S<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sformatted=3D`date -u=
 -d @${REPRODUCIBLE_TIMESTAMP_ROOTFS} +%4Y%2m%2d%2H%2M%2S`<br>
&gt; -=C2=A0 =C2=A0 =C2=A0else<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0sformatted=3D`date -u=
 +%4Y%2m%2d%2H%2M%2S`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0if [ &quot;$REPRODUCIBLE_TIMESTAMP_ROOTFS&quot; =
=3D &quot;&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0REPRODUCIBLE_TIMESTAM=
P_ROOTFS=3D`git -C &quot;${COREBASE}&quot; log -1 --pretty=3D%ct 2&gt;/dev/=
null` || true<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if [ &quot;$REPRODUCI=
BLE_TIMESTAMP_ROOTFS&quot; =3D &quot;&quot; ]; then<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0REPRODUCIBLE_TIMESTAMP_ROOTFS=3D`stat -c%Y ${@bb.utils.which(d.getVa=
r(&quot;BBPATH&quot;), &quot;conf/bitbake.conf&quot;)}`<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0fi<br>
&gt; +=C2=A0 =C2=A0 =C2=A0# Convert UTC into %4Y%2m%2d%2H%2M%2S<br>
&gt; +=C2=A0 =C2=A0 =C2=A0sformatted=3D`date -u -d @${REPRODUCIBLE_TIMESTAM=
P_ROOTFS} +%4Y%2m%2d%2H%2M%2S`<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0echo $sformatted &gt; ${IMAGE_ROOTFS}/etc/ti=
mestamp<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bbnote &quot;rootfs_update_timestamp: set /e=
tc/timestamp to $sformatted&quot;<br>
&gt;=C2=A0 =C2=A0}<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#170041): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/170041" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/170041</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/93339153=
/3616948" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/93339153/3616948</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:mark.hatle@kernel.cra=
shing.org" target=3D"_blank">mark.hatle@kernel.crashing.org</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--0000000000000c16b905e76a9ca8--

