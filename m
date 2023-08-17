Return-Path: <alex.kiernan@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9B3BC30633
	for <webhook@archiver.kernel.org>; Thu, 17 Aug 2023 14:59:09 +0000 (UTC)
Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
 by mx.groups.io with SMTP id smtpd.web10.189935.1692284347775098556
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Aug 2023 07:59:07 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YUPHc3wf;
 spf=pass (domain: gmail.com, ip: 209.85.166.171, mailfrom: alex.kiernan@gmail.com)
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3490f207680so32398075ab.2
        for <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 07:59:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692284347; x=1692889147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ycwfZLpo67wv+C5YHK4cW9pQSX3HjSRR63Pun51Hs4=;
        b=YUPHc3wfH3WrrcmvsqD/oOdFVGUGkSJsJjZD6Jj+FnJ55kWr+gmVt8XeQ1iD1Huh/7
         m/qi2fd2bFfnuuYSR+fpGD+rLJx/3EA8GfeRQzDKgtyWBeBqDI4opPhmJhy7c4lCDy+c
         mu19Froey96BJyPG9GCHjvQtwmD28jeVrwsfEZYQZu7iPWU5BT4nZ27NxVYeOhSZxqvK
         YWvvuAZgAo4aaXy38hqJw9q6vLhKocKtUNQDsWfAMecMUSveZ1+TYxDBgKY6PFfeRI1p
         bl0W+mB+0XGxy+zxIKH2fIVTaXZ+MlU4VHfPngSUp/iZinbLZr7+gHBFxlyD84yuEONo
         /RdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692284347; x=1692889147;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ycwfZLpo67wv+C5YHK4cW9pQSX3HjSRR63Pun51Hs4=;
        b=grY8hsKCIHeKkbC9/A3YtElQ4MUIjXAf9N4cfbxhaqjuxAC2dBLxN50b1ObuS1I19k
         cwA9nS3cS62EPAxWgZerx3dgcRXUduL3vlvuDavweNXhitsddWJnnnfPfe8bctH1EZ0x
         0B09kGSMK95vOijetjx4L6KpwTeRANN4AkHnV/O4dFhTDDmel/1hbpJfxI3R00ScB9RU
         J5CW7fQd5gSqZevkJe4cfbwIOtjowJI9jfN5dc/3Lp5SQwY/dj+92lmN+YpTRGqrUKdg
         Zhr5XfE0aMFv0o+RO6CCQ/TKANAeMMoX2D/gQLGGme7eVNimEydLXi5QS87s7zjUGf4q
         Db5A==
X-Gm-Message-State: AOJu0Yy/S9Cd/MbOmtKjj1MzhsoegWkvRU8ZSJtepRb9EDLGCg03WZ7S
	8pwybh0cD+mTnsLRld/hm97lDI0zTpngt9/8MMlxdu+DPH4=
X-Google-Smtp-Source: AGHT+IGsUzH+g3qoepVs+H2OD75aGAl3K+9NW70S4KVk370C/pJLCyLr0lvAgfZLyP7Tvs5rSbeekeT+lmmLg2nFbmQ=
X-Received: by 2002:a05:6e02:dca:b0:346:8b4:34c with SMTP id
 l10-20020a056e020dca00b0034608b4034cmr6003053ilj.16.1692284346799; Thu, 17
 Aug 2023 07:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_WLs2V=DtsaG7XH862Xn2rJnn+bZZBbVd+5J=Wh_StXg@mail.gmail.com>
 <4191.1692280258442699624@lists.openembedded.org> <9d57a013-9737-f119-2e43-e8dd1a71684b@windriver.com>
In-Reply-To: <9d57a013-9737-f119-2e43-e8dd1a71684b@windriver.com>
From: Alex Kiernan <alex.kiernan@gmail.com>
Date: Thu, 17 Aug 2023 16:58:55 +0200
Message-ID: <CAO5Uq5SGgQ7vJ0HFSDXO8LPZTHUBV5tJH_R6d8yZS-NT5VO_Ow@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] rust: Upgrade 1.70.0 -> 1.71.0
To: Randy MacLeod <randy.macleod@windriver.com>
Cc: "Shinde, Yash" <Yash.Shinde@windriver.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>, 
	"Kokkonda, Sundeep" <Sundeep.Kokkonda@windriver.com>
Content-Type: multipart/alternative; boundary="000000000000599ce106031fa701"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 17 Aug 2023 14:59:09 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/186324

--000000000000599ce106031fa701
Content-Type: text/plain; charset="UTF-8"

Hi

Yeah, you're correct... Currently sitting beside a pool in France,  having
discovered that the DSL where we're staying is basically useless :)

I've been buried in an ESP32 project before we went away, so not
meaningfully got back to this.

I did start looking at rebasing the patches, but there's massive churn and
my suspicion is taking the changes to parameterise the test exclusions will
be the way to go.

There biggest fix I had in the 1.71 update was to use the sysroot target
for libstd, which is a much cleaner interface.

Alex


On Thu, 17 Aug 2023, 16:15 Randy MacLeod via lists.openembedded.org,
<randy.macleod=windriver.com@lists.openembedded.org> wrote:

> Add Alex back to the To list.
>
> On 2023-08-17 09:50, Shinde, Yash via lists.openembedded.org wrote:
>
> Alex,
>
> I will look into rust upgrade 1.70 -> 1.71. What's the timeline for this?
> I guess it's 2 weeks for feature freeze for 4.3.
>
> We talked about this offline and concluded that the best approach would be:
>
> 1. do the rebase of 1.71 but don't send to be merged. (keep it aside
> safely)
>
> 2. when 1.72 is released on August 24 2023, do that update, test and
> submit.
>
>
> Alex, I assume that you are on vacation but if you happen to read this,
> please
> do let us know if we'd be duplicating any of  your work.
>
> ../Randy
>
>
>
>
> --
> # Randy MacLeod
> # Wind River Linux
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#186320):
> https://lists.openembedded.org/g/openembedded-core/message/186320
> Mute This Topic: https://lists.openembedded.org/mt/100230901/3618097
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> alex.kiernan@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--000000000000599ce106031fa701
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi</div><div dir=3D"auto"><br></div><div dir=3D"auto=
">Yeah, you&#39;re correct... Currently sitting beside a pool in France,=C2=
=A0 having discovered that the DSL where we&#39;re staying is basically use=
less :)</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;ve been bu=
ried in an ESP32 project before we went away, so not meaningfully got back =
to this.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I did start loo=
king at rebasing the patches, but there&#39;s massive churn and my suspicio=
n is taking the changes to parameterise the test exclusions will be the way=
 to go.</div><div dir=3D"auto"><br></div><div dir=3D"auto">There biggest fi=
x I had in the 1.71 update was to use the sysroot target for libstd, which =
is a much cleaner interface.</div><div dir=3D"auto"><br></div><div dir=3D"a=
uto">Alex</div><div dir=3D"auto"><br><br><div class=3D"gmail_quote" dir=3D"=
auto"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, 17 Aug 2023, 16:15 Rand=
y MacLeod via <a href=3D"http://lists.openembedded.org">lists.openembedded.=
org</a>, &lt;randy.macleod=3D<a href=3D"mailto:windriver.com@lists.openembe=
dded.org">windriver.com@lists.openembedded.org</a>&gt; wrote:<br></div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #c=
cc solid;padding-left:1ex">

 =20
  <div>
    <div>Add Alex back to the To list.</div>
    <div><br>
    </div>
    <div>On 2023-08-17 09:50, Shinde, Yash via
      <a href=3D"http://lists.openembedded.org" target=3D"_blank" rel=3D"no=
referrer">lists.openembedded.org</a> wrote:<br>
    </div>
    <blockquote type=3D"cite">
     =20
      <p>Alex,</p>
      <p>I will look into rust upgrade 1.70 -&gt; 1.71. What&#39;s the
        timeline for this? I guess it&#39;s 2 weeks for feature freeze for
        4.3. <br>
      </p>
    </blockquote>
    <p>We talked about this offline and concluded that the best approach
      would be:<br>
    </p>
    <p>1. do the rebase of 1.71 but don&#39;t send to be merged. (keep it
      aside safely)</p>
    <p>2. when 1.72 is released <span id=3D"m_-2721839437766433423beta-rele=
ase-date">on August
        24 2023, do that update</span>, test and submit.</p>
    <p><br>
    </p>
    <p>Alex, I assume that you are on vacation but if you happen to read
      this, please<br>
      do let us know if we&#39;d be duplicating any of=C2=A0 your work.</p>
    <p>../Randy<br>
    </p>
    <p><br>
    </p>
    <blockquote type=3D"cite">
      <br>
      <fieldset></fieldset>
      <pre></pre>
    </blockquote>
    <p><br>
    </p>
    <pre cols=3D"72">--=20
# Randy MacLeod
# Wind River Linux</pre>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#186320): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/186320" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://lists.openembedded.org/g/openembedded-core/message/186320</a><=
br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/100230901/361=
8097" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openemb=
edded.org/mt/100230901/3618097</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank" rel=3D"noreferrer">openembedded-core+owner@lists.op=
enembedded.org</a><br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.openem=
bedded.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:alex.kiernan@gm=
ail.com" target=3D"_blank" rel=3D"noreferrer">alex.kiernan@gmail.com</a>]<b=
r>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div></div>

--000000000000599ce106031fa701--

