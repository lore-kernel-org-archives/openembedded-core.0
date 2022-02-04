Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9B8C433EF
	for <webhook@archiver.kernel.org>; Fri,  4 Feb 2022 19:12:37 +0000 (UTC)
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com
 [209.85.221.174])
 by mx.groups.io with SMTP id smtpd.web10.13690.1644001955887399213
 for <openembedded-core@lists.openembedded.org>;
 Fri, 04 Feb 2022 11:12:36 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=RvFYf2MR;
 spf=pass (domain: gmail.com, ip: 209.85.221.174,
 mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f174.google.com with SMTP id j185so4277790vkc.1;
        Fri, 04 Feb 2022 11:12:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sdfjcaoEFdagniSEzy3w7qcidYW6MKKQeZlDPIEobqI=;
        b=RvFYf2MRPK8vOT461qmZJ5O7Qc5HPIfKMnNtoKYcQB/dzgEhRUEN51wRlZINXZK2S9
         N5ZkJeAMOdDR2F09YCuLwOCdBQz/uvGXBBH9Au89LdWkG2LXuvZurZ/qGKEw2eOWzMq3
         ecyJ0ffTF+fub/lzvbU6dPdAKdYBOqMlZt/db1AF9I/RGUfLuUe4P/FbMd/wXq5Xs01F
         OM91bRJHY4y7r8ln5OCej5ACtGHuN7IrFU0wTX0rerR32WFkYJZRNE/uTK3wea7SDWas
         3xxI8oOcrZQWP3QcD2FmMAaRexwcF+I5uwtaNlpyM/U0MZE+O/OM6VDiFi18xvuPTjVF
         9Tfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sdfjcaoEFdagniSEzy3w7qcidYW6MKKQeZlDPIEobqI=;
        b=K2wT9Byc4VMHqs4g2XJJJUyespKvGLaNC4v32RqBP6eG/eePH7oYQzEtz3id16JED8
         dufbo8Bjdv9DqDGET3kbok9UWxEx5v5R4Wi7AJ3JIikh/f6FUD9E9m/rIhlDOQ6/AiSA
         RtjN1cy1NlNDPQ4jN6O2NsvPYJ7M9ewUo3x5fyr4uvfh8sHbzyIWFKD9gMXe1L8Cz18K
         lGNuom8ZTA4cs5M3fwjRSwZ/j7My4F1xkAUoNZz+gv8Q7uQJXtdcrvSQL862jrJf31pO
         kwqZJ+jtFNdUqb6LB1cDIYl679F5C8E6Rg/x0po5ziX/coapD2HiKY/E5g5KUdXqj357
         kjQw==
X-Gm-Message-State: AOAM531cFYKxxplgJMbsGail51fbuhaPdxZHFb7DfXpqV/UBgls+yePb
	MaTPHngVA5Res0MzSb9upBxaIE4YpGFpRxL62zA=
X-Google-Smtp-Source: 
 ABdhPJwtaflkSPeCyliVSl2XG8Grbwkl+MunwMShhtC5f2bVWd2ggQqE1GxplZNp+j9SnHtm0KQROwQJ4eIZ6/NYQTQ=
X-Received: by 2002:a05:6122:2190:: with SMTP id
 j16mr1729647vkd.21.1644001955006;
 Fri, 04 Feb 2022 11:12:35 -0800 (PST)
MIME-Version: 1.0
References: 
 <CAPoiz9wL16OTzxNHdw_5-L72GOHkhhM0--WZF7An071cx6sr_A@mail.gmail.com>
 <lyiltukbsk.fsf@ensc-virt.intern.sigma-chemnitz.de>
 <CANNYZj9wOzJ-gp+HVP-915AQp9d-D_PN4GrgPqaC0ZLVvzbgqg@mail.gmail.com>
 <lyee4ik98t.fsf@ensc-virt.intern.sigma-chemnitz.de>
 <CH0PR20MB3948522D8A65FE1CED08EA37BB299@CH0PR20MB3948.namprd20.prod.outlook.com>
 <lya6f6jx36.fsf@ensc-virt.intern.sigma-chemnitz.de>
In-Reply-To: <lya6f6jx36.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Fri, 4 Feb 2022 20:12:23 +0100
Message-ID: 
 <CANNYZj86eHSn=5gcryZeVBS-qqqKKiafq5XyDO=nup-QdcF7iw@mail.gmail.com>
Subject: Re: [oe] [OE-core] Inclusive Language Proposal for YP/OE
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
Cc: Bryan Evenson <bevenson@melinkcorp.com>, Jon Mason <jdmason@kudzu.us>,
	Yocto-mailing-list <yocto@lists.yoctoproject.org>,
	Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000089ccfd05d73608c0"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 04 Feb 2022 19:12:37 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/161380

--00000000000089ccfd05d73608c0
Content-Type: text/plain; charset="UTF-8"

On Fri, 4 Feb 2022 at 19:39, Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
wrote:

> > Would CANCEL be clearer to you than HALT?
>
> mmmh.... for me as a developer (and non-native english speaker), "cancel"
> means some ordered ending of an operation.
>
> But the condition above causes an emergency abort.
>

Cancel is the same as abort: a request to immediately stop the operation
(or not even start it) without reaching the originally requested outcome.

Halt implies the operation is not going to continue (Alan Turing was as
English as it gets, just to remind you).

I don't think any of this is remotely confusing.

Alex

--00000000000089ccfd05d73608c0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Fri, 4 Feb 2022 at 19:39, Enrico Scholz &lt;<a href=3D"mailto:enr=
ico.scholz@sigma-chemnitz.de" target=3D"_blank">enrico.scholz@sigma-chemnit=
z.de</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">&gt; Would CANCEL be clearer to you than HALT?<br>
<br>
mmmh.... for me as a developer (and non-native english speaker), &quot;canc=
el&quot;<br>
means some ordered ending of an operation.<br>
<br>
But the condition above causes an emergency abort.<br></blockquote><div><br=
></div><div>Cancel is the same as abort: a request to immediately stop the =
operation (or not even start it) without reaching the originally requested =
outcome. <br></div><div><br></div><div>Halt implies the operation is not go=
ing to continue (Alan Turing was as English as it gets, just to remind you)=
. <br></div><div><br></div><div>I don&#39;t think any of this is remotely c=
onfusing.<br></div><div><br></div><div>Alex</div></div></div>

--00000000000089ccfd05d73608c0--

