Return-Path: <jester@theyoctojester.info>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FE2C43217
	for <webhook@archiver.kernel.org>; Thu,  1 Dec 2022 13:47:32 +0000 (UTC)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
 by mx.groups.io with SMTP id smtpd.web10.43553.1669902449591153614
 for <openembedded-core@lists.openembedded.org>;
 Thu, 01 Dec 2022 05:47:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theyoctojester-info.20210112.gappssmtp.com header.s=20210112 header.b=Al3KMsh+;
 spf=none, err=permanent DNS error (domain: theyoctojester.info, ip: 209.85.208.48, mailfrom: jester@theyoctojester.info)
Received: by mail-ed1-f48.google.com with SMTP id r26so2397781edc.10
        for <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 05:47:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=theyoctojester-info.20210112.gappssmtp.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=TVWdiihCWRMZ2SMB+3SibtK5NlcBj478MPQ7lyUQiQE=;
        b=Al3KMsh+WdWtmvxlKJfWjxiOjDjX9qmRFWykNxoqMJsJDSfWbX8E5xKIA02/E/5aee
         QkZxjgyQ+rDgzG4cMj/90NaMOfdCzqvCwgfXZMVhjmA14y15gy1lMns7VAL94MDrrk1S
         oq+O3xzqsgdyGPYsjiekPBTgmEojn1RlHTvg/GkV9kSZ5SE1IL4+LOKKEP11nhBpDvfy
         an2pH2r+H/Al7G8F2UXBZPpr5EBPCb5oWdBrn8DyeyZRe+mlHGPSdIUJX77S7ngd+djM
         4tbH7nEEc0vVqU9SfQBOQHJVY0s0NapAwwOXd1QfnhrxqgYhfCKr/U8lAw2xUZcRrvbB
         IbCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=TVWdiihCWRMZ2SMB+3SibtK5NlcBj478MPQ7lyUQiQE=;
        b=nTKnqQsoIRYqO2icHRX8+mVCOaN28aMiOyyq4AaDp+3HE0wvg2YJtWRP0xfqJbQ2NW
         Cb5pJbAEqSUInBW/kAO0Q57eHPsD0eJWWBoH/JFx2zjK7ItnauzBZ+UN85x6FozAgOMp
         Z3VOKyr+YdQjGs46Q0gMSE3ZemYuCJQreOn+M4Zut7ltVa9AgilhSLwsb9himAgpCMpb
         AQyUYRyEcfC4li1uRhAaFNU6ghOf4fla0pk/4ePTmURfGiUkChiaK88TdZSUh//1K7K9
         dNjnJFsidMmoBtCqzbsXyygA2WIQP5K/RZPygrN0C/UWTXIeALSXfnd5HdSP7iUiPc+K
         ZdJw==
X-Gm-Message-State: ANoB5pl4LKsvsPQ2cqVYBJEfV3HB35qrpPBXVso/8JZ5bUqdxKpJlO1O
	1lRTaCagOBxiIbsvoFMbxVgnJTE/dzIzJXoEq2ehxA==
X-Google-Smtp-Source: AA0mqf7Y4ZRhA1QRPzmH4eyWg8oLNE+18/JeuYC53gyAyhOVYEacMGSk2YFDPVwyP6GJkqW35kfssDJ5fsq33g6zlsI=
X-Received: by 2002:aa7:cd8d:0:b0:463:19ca:a573 with SMTP id
 x13-20020aa7cd8d000000b0046319caa573mr59234240edv.31.1669902447800; Thu, 01
 Dec 2022 05:47:27 -0800 (PST)
MIME-Version: 1.0
From: Josef Holzmayr <jester@theyoctojester.info>
Date: Thu, 1 Dec 2022 14:47:01 +0100
Message-ID: <CAEt6NwquPwSfVJM9yQ0OUwjMj3JY3oXUoOzzTWA+GHBm6-DkrQ@mail.gmail.com>
Subject: OEDvM and OpenEmbedded Workshop
To: openembedded-members@lists.openembedded.org, 
	openembedded-architecture <openembedded-architecture@lists.openembedded.org>, 
	openembedded-core@lists.openembedded.org, 
	openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000036088d05eec47611"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 01 Dec 2022 13:47:32 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174060

--00000000000036088d05eec47611
Content-Type: text/plain; charset="UTF-8"

Hello fellow OpenEmbeddeders!

Less than 24 hours until we kick off the OpenEmbedded Developers virtual
Meeting 2022.11! For more details, please see
https://www.openembedded.org/wiki/OEDvM_2022.11

You can join us directly via https://zoom.us/j/99151508871

Also we have great news: adjacent to FOSDEM, a workshop will take place in
Brussels on February 6th. Be sure to check it out at
https://pretalx.com/openembedded-workshop-2023/ and submit your ideas via
https://pretalx.com/openembedded-workshop-2023/cfp

See you real soon!
Josef on behalf of the OE board

--00000000000036088d05eec47611
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello fellow OpenEmbeddeders!<div><br></div><div>Less than=
 24 hours until we kick off the OpenEmbedded Developers virtual Meeting 202=
2.11! For more details, please see=C2=A0<a href=3D"https://www.openembedded=
.org/wiki/OEDvM_2022.11">https://www.openembedded.org/wiki/OEDvM_2022.11</a=
></div><div><br></div><div>You can join us directly via=C2=A0<a rel=3D"nofo=
llow" class=3D"external gmail-free" href=3D"https://zoom.us/j/99151508871" =
style=3D"color:rgb(51,102,187);padding-right:13px;font-family:sans-serif;fo=
nt-size:14px">https://zoom.us/j/99151508871</a></div><div><br></div><div>Al=
so we have great news: adjacent to FOSDEM, a workshop will take place in Br=
ussels on February 6th. Be sure to check it out at=C2=A0<a href=3D"https://=
pretalx.com/openembedded-workshop-2023/">https://pretalx.com/openembedded-w=
orkshop-2023/</a> and submit your ideas via=C2=A0<a href=3D"https://pretalx=
.com/openembedded-workshop-2023/cfp">https://pretalx.com/openembedded-works=
hop-2023/cfp</a></div><div><br></div><div>See you real soon!</div><div>Jose=
f on behalf of the OE board</div></div>

--00000000000036088d05eec47611--

