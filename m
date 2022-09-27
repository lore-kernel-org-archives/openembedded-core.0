Return-Path: <Martin.Jansa@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66918C6FA82
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 14:17:44 +0000 (UTC)
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by mx.groups.io with SMTP id smtpd.web10.11642.1664288255413326746
 for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 07:17:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Zil+8bMh;
 spf=pass (domain: gmail.com, ip: 209.85.128.49,
 mailfrom: martin.jansa@gmail.com)
Received: by mail-wm1-f49.google.com with SMTP id
 fn7-20020a05600c688700b003b4fb113b86so5557546wmb.0
        for <openembedded-core@lists.openembedded.org>;
 Tue, 27 Sep 2022 07:17:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=nYaTmNSuTA9DFxfNJjD0+niJljumi5K7Ghe0HPo/Tjw=;
        b=Zil+8bMhRHGZj7PczjKUtBjYBMfE4hkWrfH575BipwkoNDBrRcdAghkSJfexrXeGIb
         CAi6SDDpcWuUyBtwiDJL8fihiln9akkB7Q9YhUWCH6n/Iv9dgubotyEAIgKJplDf8L0y
         EF6uBEccjjH7IbZO+GAMqYZOOr5PoA8lpHe16VL1HAoeBp94xEyDLV4Ap6Pit+mjdPFK
         RUikmqPeMavBl0cKB2usJuSaimPFaHPqkxfv/krVSEstCvkhN/kt6qMFtVmj3sVbNZyU
         p38VkVak92sKjNU42l5nwbaPXUqw7r42Nuxw1gKPYjEKCQPbZzB0EUaw9lp4kABh8j7B
         jOfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=nYaTmNSuTA9DFxfNJjD0+niJljumi5K7Ghe0HPo/Tjw=;
        b=ocetbjbZiOw+DP/S3m/zDxfSleywRlOviI539v4eAxg75XgBx7jPS9RtL7eFsdPkmp
         HfZpJtndcSUFvH32ZKI8dRhRdIlkPtcq43uyq5czzKOihBoqSfa6fKYjeFZHXbN9QZZr
         KtMGnADBy6+c1oB2a/2zHnhCY6YQEGStreBS6i61DiYWC5i4L+fVbXsQki8OoO2JuVnE
         xB+kLrBhzfxYQkMY7eNkz22aKtl4rALUTVws5NvbfMTmFNnD9+Oq+Y0ibrOOTE8UJ1z9
         UqP/c4/2tQ0Kf8g67Yua4PAxc7zC0tqQ+TYOzVYO3lgy44Zs4GRdKoGlRnHaI5TYDyqh
         aN4A==
X-Gm-Message-State: ACrzQf1X50B/hDK52F63bRpzpg09XnaTXw3oat824YYEJc2LomdyRc2r
	3Fbj0srJ0nXogkSiDHsqGwz4hAqCuHkEnGgRYhc=
X-Google-Smtp-Source: 
 AMsMyM5Lm68vJJPKhuZ8OcIOQfULMh5VZ3GUJXPhC8yWXPdIbkpcSI+lckU13+oK14kqJP9oURC+NheZiPLNFf9tKiI=
X-Received: by 2002:a7b:c40e:0:b0:3b3:3faa:10c2 with SMTP id
 k14-20020a7bc40e000000b003b33faa10c2mr2974179wmi.32.1664288253532; Tue, 27
 Sep 2022 07:17:33 -0700 (PDT)
MIME-Version: 1.0
References: <6ldv.1652875317100283313.cW0Y@lists.openembedded.org>
In-Reply-To: <6ldv.1652875317100283313.cW0Y@lists.openembedded.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 27 Sep 2022 16:17:21 +0200
Message-ID: 
 <CA+chaQdyO1_QSvd00RrHPqCZUr4ik_hPVEEejAtoYKvxsySAtA@mail.gmail.com>
Subject: Re: [OE-core] Wiki re submitting patches
To: mangodan2003@gmail.com
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="00000000000027dfa405e9a94e58"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Tue, 27 Sep 2022 14:17:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/171102

--00000000000027dfa405e9a94e58
Content-Type: text/plain; charset="UTF-8"

see https://git.openembedded.org/openembedded-core/commit/

On Wed, May 18, 2022 at 2:01 PM <mangodan2003@gmail.com> wrote:

> Is this page still relevant?
>
> https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded
>
> I have just tried to submit a patch via both the email and git methods and
> both fail. Google blocks the script when trying the email method saying it
> is not secure and when trying the git method I get a timeout from the
> script for github, tho I can access github just fine in my browser.
>
> dan@melon ~/workspace_ssd/kas/openembedded-core $
> ./scripts/create-pull-request -u git@github.com:mangodan2003/openembedded-core.git
>
> NOTE: Assuming remote branch 'gst-1.20.2', use -b to override.
> NOTE: Assuming local branch HEAD, use -l to override.
> fatal: unable to connect to github.com:
> github.com[0: 140.82.121.4]: errno=Connection timed out
>
> warn: No match for commit 38b9d17c45c15087d484559595b04c7b61fd8fbb found
> at git://github.com/mangodan2003/openembedded-core
> warn: Are you sure you pushed 'gst-1.20.2' there?
> ERROR: git request-pull reported an error
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#165848):
> https://lists.openembedded.org/g/openembedded-core/message/165848
> Mute This Topic: https://lists.openembedded.org/mt/91184410/3617156
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> Martin.Jansa@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
>

--00000000000027dfa405e9a94e58
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">see=C2=A0<a href=3D"https://git.openembed=
ded.org/openembedded-core/commit/">https://git.openembedded.org/openembedde=
d-core/commit/</a></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">On Wed, May 18, 2022 at 2:01 PM &lt;<a href=3D"mailto:man=
godan2003@gmail.com">mangodan2003@gmail.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Is this page still relevant?<br>=
<br><a href=3D"https://www.openembedded.org/wiki/How_to_submit_a_patch_to_O=
penEmbedded" rel=3D"noopener" target=3D"_blank">https://www.openembedded.or=
g/wiki/How_to_submit_a_patch_to_OpenEmbedded</a><br><br>I have just tried t=
o submit a patch via both the email and git methods and both fail. Google b=
locks the script when trying the email method saying it is not secure and w=
hen trying the git method I get a timeout from the script for github, tho I=
 can access github just fine in my browser.<br><span style=3D"font-family:m=
onospace"><span style=3D"font-weight:bold;color:rgb(84,255,84)"><br>dan@mel=
on</span><span style=3D"font-weight:bold;color:rgb(84,84,255)"> ~/workspace=
_ssd/kas/openembedded-core $</span><span style=3D"color:rgb(0,0,0)"> ./scri=
pts/create-pull-request -u git@github.com:mangodan2003/openembedded-core.gi=
t =C2=A0</span><br>NOTE: Assuming remote branch &#39;gst-1.20.2&#39;, use -=
b to override. <br>NOTE: Assuming local branch HEAD, use -l to override. <b=
r>fatal: unable to connect to <a href=3D"http://github.com" target=3D"_blan=
k">github.com</a>: <br><a href=3D"http://github.com" target=3D"_blank">gith=
ub.com</a>[0: 140.82.121.4]: errno=3DConnection timed out <br><br>warn: No =
match for commit 38b9d17c45c15087d484559595b04c7b61fd8fbb found at git://<a=
 href=3D"http://github.com/mangodan2003/openembedded-core" target=3D"_blank=
">github.com/mangodan2003/openembedded-core</a> <br>warn: Are you sure you =
pushed &#39;gst-1.20.2&#39; there? <br>ERROR: git request-pull reported an =
error<br><br></span>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#165848): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/165848" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/165848</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/91184410/3617=
156" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/91184410/3617156</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:Martin.Jansa@gmail.com" ta=
rget=3D"_blank">Martin.Jansa@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div></div>

--00000000000027dfa405e9a94e58--

