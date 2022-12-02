Return-Path: <hprajapati@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86637C4332F
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 08:49:40 +0000 (UTC)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com [209.85.221.180])
 by mx.groups.io with SMTP id smtpd.web11.70614.1669970974132170110
 for <openembedded-core@lists.openembedded.org>;
 Fri, 02 Dec 2022 00:49:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=RPi8v8sF;
 spf=pass (domain: mvista.com, ip: 209.85.221.180, mailfrom: hprajapati@mvista.com)
Received: by mail-vk1-f180.google.com with SMTP id v81so2007378vkv.5
        for <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 00:49:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NiaENvQwf5Ewte6einKEWSNOlaHhOCw3uly262nrDIY=;
        b=RPi8v8sFzY3dynZzPZQG/szRTgSJC33gG7qFBOY49jonLUp0+qJNLpSwJLS8CB74bv
         o/jda1ZukOW5FtQDzRKUgOs9RVC+MTmXoJcXKbuP904S4bgOdI0trUuTPnU6hGGVoj8E
         ol6QNPpb2qEFevbpZKOi/sXlJpPj26/Hu5rao=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NiaENvQwf5Ewte6einKEWSNOlaHhOCw3uly262nrDIY=;
        b=5GkVnreBHJ8HMWhdoZioX8YzkZomGuDVO2tOZxO7HPEz2neAwrMEvCbDJeFteWh53v
         Qidt8hmKs1DrrTkq85Y1wOOzUiEUb8DHCSms9QYPL95rJihpcevsRIUL3G7ypucyS3wO
         QqbNXmdsLvqCCjQi9q+F8QHy7CS8g/K9qtxSw9JOWIz8Tp7W0h+v6ifBPyw4np8SY69z
         FSSSxHsEWKihnhn03SY3MCxtXq8MKywUQdb0RY//VYmaUThkq0MhyF83gCQPqXzcsDXc
         3PxGpZxmPN/XPseIQlLuiZbCjOwRBAUhZo6ezmR+OFCOspqmatp9p4c9ibHjZrj/VZm/
         Tr5A==
X-Gm-Message-State: ANoB5pl7fZ5p6wX2Xe1QpCOCPnS5ASKB1jxHUu9pJmYVWVfBNMIGftdo
	nIshM5iSYOV/tlLhQ0vCFAcHtU/L5SHfxa5R0bX2NA==
X-Google-Smtp-Source: AA0mqf7r2vhb4Bd74j5ytbzhW22Djp5NqDCcZulS6IBf6hjBqAIbwNzWbucq1ls2+D01Dc4DpVc9eEItuhTMwRXv5X0=
X-Received: by 2002:a05:6122:1986:b0:3b7:66e5:71e with SMTP id
 bv6-20020a056122198600b003b766e5071emr40866029vkb.37.1669970973167; Fri, 02
 Dec 2022 00:49:33 -0800 (PST)
MIME-Version: 1.0
References: <20221202061812.62788-1-hprajapati@mvista.com> <CA+chaQcJfM_eNN8RZAMMqs=QmpK3jormd1qLEAaDgwKMvxwT-w@mail.gmail.com>
In-Reply-To: <CA+chaQcJfM_eNN8RZAMMqs=QmpK3jormd1qLEAaDgwKMvxwT-w@mail.gmail.com>
From: Hitendra Prajapati <hprajapati@mvista.com>
Date: Fri, 2 Dec 2022 14:19:21 +0530
Message-ID: <CACVbggGrRRc30KE8Xe2jnY9EXWJ3fBEaU8Zno61Bf6Km2e6cxQ@mail.gmail.com>
Subject: Re: [OE-core] [kirkstone][PATCH] libarchive: CVE-2022-36227 NULL
 pointer dereference in archive_write.c
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000a42acf05eed46a33"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Fri, 02 Dec 2022 08:49:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/174228

--000000000000a42acf05eed46a33
Content-Type: text/plain; charset="UTF-8"

Hi Martin/Team,

Yes, I missed that part.

It is my mistake. I'm extremely sorry for that.

I'll correct the patch and resubmit.

Regards,
Hitendra Prajapati

On Fri, 2 Dec 2022, 1:19 pm Martin Jansa, <martin.jansa@gmail.com> wrote:

>
>> +From afa85b75607649f3a89cb4d17cf3f003738d3576 Mon Sep 17 00:00:00 2001
>> +From: Hitendra Prajapati <hprajapati@mvista.com>
>> +Date: Fri, 2 Dec 2022 11:22:39 +0530
>> +Subject: [PATCH] CVE-2022-36227
>> +
>> +Upstream-Status: Backport [
>> https://github.com/libarchive/libarchive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5
>> ]
>> +CVE: CVE-2022-36227
>>
>
> Please don't change the Author of the patch when backporting something,
> the original change says:
>
> From bff38efe8c110469c5080d387bec62a6ca15b1a5 Mon Sep 17 00:00:00 2001
> From: obiwac <obiwac@gmail.com>
> Date: Fri, 22 Jul 2022 22:41:10 +0200
> Subject: [PATCH] libarchive: Handle a `calloc` returning NULL (fixes #1754)
>
> And you should keep it.
>
> Also please check your e-mail, my previous 2 reply were returned with 550
> (hopefully you might see them in the ML:
> https://lists.openembedded.org/g/openembedded-core/message/174225
> https://lists.openembedded.org/g/openembedded-core/message/174224
> that might explain why you haven't noticed the answer from Steve).
>
>  ** Address not found **
>
> Your message wasn't delivered to hpprajapati@mvista.com because the
> address=
>  couldn't be found, or is unable to receive mail.
>
> Learn more here: https://support.google.com/mail/?p=3DNoSuchUser
>
> The response was:
>
> 550 5.1.1 The email account that you tried to reach does not exist. Please
> =
> try double-checking the recipient's email address for typos or unnecessary
> =
> spaces. Learn more at https://support.google.com/mail/?p=3DNoSuchUser
> u6-20=
> 020adfc646000000b0024187597f81sor4016963wrg.5 - gsmtp
>

--000000000000a42acf05eed46a33
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><span style=3D"font-size:12.8px">Hi Martin/Team,</span><d=
iv dir=3D"auto" style=3D"font-size:12.8px"><br></div><div dir=3D"auto" styl=
e=3D"font-size:12.8px">Yes, I missed that part.=C2=A0</div><div dir=3D"auto=
" style=3D"font-size:12.8px"><br></div><div dir=3D"auto" style=3D"font-size=
:12.8px">It is my mistake. I&#39;m extremely sorry for that.</div><div dir=
=3D"auto" style=3D"font-size:12.8px"><br></div><div dir=3D"auto" style=3D"f=
ont-size:12.8px">I&#39;ll correct the patch and resubmit.</div><div dir=3D"=
auto" style=3D"font-size:12.8px"><br></div><div dir=3D"auto" style=3D"font-=
size:12.8px">Regards,</div><div dir=3D"auto" style=3D"font-size:12.8px">Hit=
endra Prajapati=C2=A0</div></div><br><div class=3D"gmail_quote"><div dir=3D=
"ltr" class=3D"gmail_attr">On Fri, 2 Dec 2022, 1:19 pm Martin Jansa, &lt;<a=
 href=3D"mailto:martin.jansa@gmail.com">martin.jansa@gmail.com</a>&gt; wrot=
e:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bo=
rder-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr"><div class=3D"g=
mail_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0=
.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>+From afa=
85b75607649f3a89cb4d17cf3f003738d3576 Mon Sep 17 00:00:00 2001<br>
+From: Hitendra Prajapati &lt;<a href=3D"mailto:hprajapati@mvista.com" targ=
et=3D"_blank" rel=3D"noreferrer">hprajapati@mvista.com</a>&gt;<br>
+Date: Fri, 2 Dec 2022 11:22:39 +0530<br>
+Subject: [PATCH] CVE-2022-36227<br>
+<br>
+Upstream-Status: Backport [<a href=3D"https://github.com/libarchive/libarc=
hive/commit/bff38efe8c110469c5080d387bec62a6ca15b1a5" rel=3D"noreferrer nor=
eferrer" target=3D"_blank">https://github.com/libarchive/libarchive/commit/=
bff38efe8c110469c5080d387bec62a6ca15b1a5</a>]<br>
+CVE: CVE-2022-36227<br></blockquote><div><br></div><div>Please don&#39;t c=
hange the Author of the patch when backporting something, the original chan=
ge says:</div><div><br></div><div>From bff38efe8c110469c5080d387bec62a6ca15=
b1a5 Mon Sep 17 00:00:00 2001<br>From: obiwac &lt;<a href=3D"mailto:obiwac@=
gmail.com" target=3D"_blank" rel=3D"noreferrer">obiwac@gmail.com</a>&gt;<br=
>Date: Fri, 22 Jul 2022 22:41:10 +0200<br>Subject: [PATCH] libarchive: Hand=
le a `calloc` returning NULL (fixes #1754)<br></div><div><br></div><div>And=
 you should keep it.</div><div><br></div><div>Also please check your e-mail=
, my previous 2 reply were returned with 550 (hopefully you might see them =
in the ML:</div><div><a href=3D"https://lists.openembedded.org/g/openembedd=
ed-core/message/174225" target=3D"_blank" rel=3D"noreferrer">https://lists.=
openembedded.org/g/openembedded-core/message/174225</a><br></div><div><a hr=
ef=3D"https://lists.openembedded.org/g/openembedded-core/message/174224" ta=
rget=3D"_blank" rel=3D"noreferrer">https://lists.openembedded.org/g/openemb=
edded-core/message/174224</a><br></div><div>that might explain why you have=
n&#39;t noticed the answer from Steve).</div><div><br></div><div>=C2=A0** A=
ddress not found **</div><br>Your message wasn&#39;t delivered to <a href=
=3D"mailto:hpprajapati@mvista.com" target=3D"_blank" rel=3D"noreferrer">hpp=
rajapati@mvista.com</a> because the address=3D<br>=C2=A0couldn&#39;t be fou=
nd, or is unable to receive mail.<br><br>Learn more here: <a href=3D"https:=
//support.google.com/mail/?p=3D3DNoSuchUser" target=3D"_blank" rel=3D"noref=
errer">https://support.google.com/mail/?p=3D3DNoSuchUser</a><br><br>The res=
ponse was:<br><br>550 5.1.1 The email account that you tried to reach does =
not exist. Please =3D<br>try double-checking the recipient&#39;s email addr=
ess for typos or unnecessary =3D<br>spaces. Learn more at <a href=3D"https:=
//support.google.com/mail/?p=3D3DNoSuchUser" target=3D"_blank" rel=3D"noref=
errer">https://support.google.com/mail/?p=3D3DNoSuchUser</a> u6-20=3D<br>02=
0adfc646000000b0024187597f81sor4016963wrg.5 - gsmtp</div></div>
</blockquote></div>

--000000000000a42acf05eed46a33--

