Return-Path: <jan.vermaete@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47548C25B08
	for <webhook@archiver.kernel.org>; Sat, 13 Aug 2022 10:11:33 +0000 (UTC)
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by mx.groups.io with SMTP id smtpd.web09.3497.1660385489726400476
 for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 03:11:30 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=num8wcls;
 spf=pass (domain: gmail.com, ip: 209.85.218.49,
 mailfrom: jan.vermaete@gmail.com)
Received: by mail-ej1-f49.google.com with SMTP id dc19so5726813ejb.12
        for <openembedded-core@lists.openembedded.org>;
 Sat, 13 Aug 2022 03:11:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc;
        bh=1GJ/4kQGT/Nxeeqr1WuMdLbpJ0fNr1rRQCLjaoerb4w=;
        b=num8wcls5suTr3S2pRCw4Zye3A+boa8KgD09/2dZ2ux3Z+q7rhKf9B/JZdIyL8hlX/
         HZ5KmMbUshoKRJKFMAPjkqZ3ExnXgdvtOhFz+4H8vUKhmGjz+z0FV9B8GBqvo3qx1xag
         YP/E6xZ4KkE3rID3zG2/C1X4mVm1s9xZUZG33qPQ0AfwynZ6uDbpizct09tZFD3F4JFj
         VNv2WnTA/NIp/6Gmbd7NVcMnK8FBdSB0FpnXnjdKKud2wwCDPaG5cn9IYwqolmqyevoF
         yLYpCYD2CmoKrlOeC0mJsEtSzqhtRzjxMV9hyA3bRVLXvb3AANBe4EvRrnsADFw/HGND
         CY6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc;
        bh=1GJ/4kQGT/Nxeeqr1WuMdLbpJ0fNr1rRQCLjaoerb4w=;
        b=h6tci9CUjKmytYsY1E5Ffa3GyZya/IvNp+e3uRvtPg0qIG6LSTwt91JFR4HLPeoadu
         ueWHYeXA+qil7ajqsB0HU/et+NjstYeCyuzCCL5Bn8P9msPXoOiXy4yh+gZ51NrWMgBe
         cI6xSFQY+WaEtvQZ0daPBBIt/oQ6e555AgzCfbneZxQ+w4mgqL+dgq00hpd7pnAIG/li
         RthOPYGG0x+diYpTReKABFGHFRnwGydroeHdF8UTwZbbM1GZ/cEdjxG7dhVMYlUO5U2+
         Euni49s/SwpV1mcI3DlJMgFqH8r8NB8xVYpz0NZZiQiu0jTMAZepkLMkWyCohRJgkcKF
         ZK7A==
X-Gm-Message-State: ACgBeo1GASyli5298iMNaVJ3IM5RS676hjPF69N8dqPMHuTSXgV0r6Lo
	YALHBxp8X6EW5CtqJJKcjB8j7OzuEEkLRMDkh5KfpBbDVpFYnw==
X-Google-Smtp-Source: 
 AA6agR5q4Zi0Lfr6/h+RbQ3WOqNphX6RecHr4U4xC/k598XzfaeUmBcK6pYeyK/qcM90Y0FNpKqGPi2TxkrTtNErQ6k=
X-Received: by 2002:a17:906:8b81:b0:733:183b:988e with SMTP id
 nr1-20020a1709068b8100b00733183b988emr5111104ejc.457.1660385487742; Sat, 13
 Aug 2022 03:11:27 -0700 (PDT)
MIME-Version: 1.0
From: jan vermaete <jan.vermaete@gmail.com>
Date: Sat, 13 Aug 2022 12:11:15 +0200
Message-ID: 
 <CABF_=yi9-vQ4b-4qnOz+W5bbJmjRmk72YOog+GvDVBVyQ160+Q@mail.gmail.com>
Subject: makeself
To: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000002feb2005e61c9ff3"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sat, 13 Aug 2022 10:11:33 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/169301

--0000000000002feb2005e61c9ff3
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Could it be useful to transfer the makeself recipe from the no longer
maintained intel-iot-refkit into meta-openembedded?

https://github.com/intel/intel-iot-refkit/blob/master/meta-refkit-core/reci=
pes-core/makeself/makeself_2.2.0.bb

https://github.com/megastep/makeself

It's useful as a native recipe to create self extracting installers for
firmware updates, as an example.

br,

--=20
Jan Vermaete
=E2=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel

--0000000000002feb2005e61c9ff3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Could it be useful=C2=A0to transfer=C2=A0the makeself reci=
pe from the no longer maintained intel-iot-refkit into meta-openembedded?<d=
iv><br></div><div><a href=3D"https://github.com/intel/intel-iot-refkit/blob=
/master/meta-refkit-core/recipes-core/makeself/makeself_2.2.0.bb">https://g=
ithub.com/intel/intel-iot-refkit/blob/master/meta-refkit-core/recipes-core/=
makeself/makeself_2.2.0.bb</a></div><div><br></div><div><a href=3D"https://=
github.com/megastep/makeself">https://github.com/megastep/makeself</a></div=
><div><br></div><div>It&#39;s useful as a native recipe to create self extr=
acting=C2=A0installers for firmware updates, as an example.</div><div><br><=
/div><div>br,<br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature">Jan Vermaete<br>=E2=
=80=9CSuccess is a self-correcting phenomenom.=E2=80=9D -- Gary Hamel</div>=
</div></div>

--0000000000002feb2005e61c9ff3--

