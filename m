Return-Path: <alejandro@enedino.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CEF9C433EF
	for <webhook@archiver.kernel.org>; Fri, 18 Feb 2022 06:57:34 +0000 (UTC)
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com
 [209.85.219.44])
 by mx.groups.io with SMTP id smtpd.web10.7964.1645167452908404859
 for <openembedded-core@lists.openembedded.org>;
 Thu, 17 Feb 2022 22:57:33 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: gmail.com, ip: 209.85.219.44, mailfrom: aehs29@gmail.com)
Received: by mail-qv1-f44.google.com with SMTP id e22so13035218qvf.9;
        Thu, 17 Feb 2022 22:57:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=25Dn1KGt/6Qov0Q3DqQGwC4Mh8Lk/0HtOKQXArgrPCE=;
        b=us9kcOvm5Va8aN5DoYgcfBNVZd0eNdmnC4yLeHMoZwM7nR5n7iavdp3PITYfQMkqY3
         xxvYgtbY3s347ch9BPTvpTrAJWEgBF/Pxd0YbIMeWpsZf0tmrnvO/ScVd/vrt0YpvdIN
         oRDu8qbDwtE8oYbtHDrcUyw828LKxm3l8w8V81G/w3WY3cq2Ykr3KauzrdGi3CQ7CPzd
         kJbhUNY436UP/grRiNhTzSXmZlNQ9XdLtQtJrn3+x1pJWaMv1ek+cnKBMpr9wHJIYi2/
         yxWYI/x/TIyVrFvP3XqP6a9HonGyauPLwQZWkJaEMjzpOiAcSW6+/tS3wIzixQ3hXasP
         pB+g==
X-Gm-Message-State: AOAM532tipURUGccEc1xJvbk9l4UQZGxpKSY3n2rb4PPOOfImf0GHhEm
	gMwav8WjBLCzfm1vzEzaVATBTEr80qBcfwVr
X-Google-Smtp-Source: 
 ABdhPJyTqdRaFs/PoXMdHcU7zZVZ+EK24/JaNLVE4lFUHAbCGd0uxOBGjfZTNXo+NjWUigry+ASZJQ==
X-Received: by 2002:ad4:4d8e:0:b0:41c:77e3:24cd with SMTP id
 cv14-20020ad44d8e000000b0041c77e324cdmr4711922qvb.83.1645167451801;
        Thu, 17 Feb 2022 22:57:31 -0800 (PST)
Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com.
 [209.85.222.172])
        by smtp.gmail.com with ESMTPSA id
 s5sm1948344qtn.35.2022.02.17.22.57.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Feb 2022 22:57:31 -0800 (PST)
Received: by mail-qk1-f172.google.com with SMTP id n185so7098422qke.5;
        Thu, 17 Feb 2022 22:57:31 -0800 (PST)
X-Received: by 2002:a05:620a:2913:b0:47e:15da:b041 with SMTP id
 m19-20020a05620a291300b0047e15dab041mr3547976qkp.310.1645167451368; Thu, 17
 Feb 2022 22:57:31 -0800 (PST)
MIME-Version: 1.0
From: Alejandro Enedino Hernandez Samaniego <alejandro@enedino.org>
Date: Fri, 18 Feb 2022 06:57:20 +0000
X-Gmail-Original-Message-ID: 
 <CAHMutra5px9Egp6VXpBqyrxYCSCfX-437so6D+HSXZUPBc62sg@mail.gmail.com>
Message-ID: 
 <CAHMutra5px9Egp6VXpBqyrxYCSCfX-437so6D+HSXZUPBc62sg@mail.gmail.com>
Subject: Kirkstone Layer Compatibility
To: openembedded-architecture
 <openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000088f1a305d8456547"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 18 Feb 2022 06:57:34 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161880

--00000000000088f1a305d8456547
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

There have been a number of failures in the autobuilder today [1] [2] due
to the change currently sitting in master-next that switches
LAYERSERIES_COMPAT from honister to kirkstone[3].

Since the change will soon be merged into master I thought it'd be a good
idea to send an email so layer maintainers become aware of the upcoming
issue and update their corresponding layers accordingly.

Cheers,

Alejandro

[1] https://swatbot.yoctoproject.org/mainindex/swat/
[2] https://autobuilder.yoctoproject.org/typhoon/#/builders/83/builds/3243
[3]
https://git.yoctoproject.org/poky/commit/?h=master-next&id=7145b34de02fffa97bb1238f4777d817efcdc78f

--00000000000088f1a305d8456547
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,sa=
ns-serif;font-size:small">Hello everyone,</div><div class=3D"gmail_default"=
 style=3D"font-family:arial,sans-serif;font-size:small"><br></div><div clas=
s=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:small">=
There have been a number of failures in the autobuilder today [1] [2] due t=
o the change currently sitting in master-next that switches LAYERSERIES_COM=
PAT from honister to kirkstone[3].</div><div class=3D"gmail_default" style=
=3D"font-family:arial,sans-serif;font-size:small"><br></div><div class=3D"g=
mail_default" style=3D"font-family:arial,sans-serif;font-size:small">Since =
the change will soon=C2=A0be merged into master I thought it&#39;d be a goo=
d idea to send an email so layer maintainers become aware of the upcoming i=
ssue and update their corresponding layers accordingly.</div><div class=3D"=
gmail_default" style=3D"font-family:arial,sans-serif;font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;fon=
t-size:small">Cheers,</div><div class=3D"gmail_default" style=3D"font-famil=
y:arial,sans-serif;font-size:small"><br></div><div class=3D"gmail_default" =
style=3D"font-family:arial,sans-serif;font-size:small">Alejandro</div><div =
class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-family:arial,sans-=
serif;font-size:small">[1]=C2=A0<a href=3D"https://swatbot.yoctoproject.org=
/mainindex/swat/">https://swatbot.yoctoproject.org/mainindex/swat/</a></div=
><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;font-si=
ze:small">[2]=C2=A0<a href=3D"https://autobuilder.yoctoproject.org/typhoon/=
#/builders/83/builds/3243">https://autobuilder.yoctoproject.org/typhoon/#/b=
uilders/83/builds/3243</a></div><div class=3D"gmail_default" style=3D"font-=
family:arial,sans-serif;font-size:small">[3] <a href=3D"https://git.yoctopr=
oject.org/poky/commit/?h=3Dmaster-next&amp;id=3D7145b34de02fffa97bb1238f477=
7d817efcdc78f">https://git.yoctoproject.org/poky/commit/?h=3Dmaster-next&am=
p;id=3D7145b34de02fffa97bb1238f4777d817efcdc78f</a><br></div><div class=3D"=
gmail_default" style=3D"font-family:arial,sans-serif;font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-family:arial,sans-serif;fon=
t-size:small"><br></div></div>

--00000000000088f1a305d8456547--

