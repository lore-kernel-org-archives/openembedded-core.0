Return-Path: <vkumbhar@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00DAEC61DA3
	for <webhook@archiver.kernel.org>; Mon,  6 Mar 2023 05:36:32 +0000 (UTC)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
 by mx.groups.io with SMTP id smtpd.web11.27186.1678080986572416734
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Mar 2023 21:36:27 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=G67t2z50;
 spf=pass (domain: mvista.com, ip: 209.85.167.41, mailfrom: vkumbhar@mvista.com)
Received: by mail-lf1-f41.google.com with SMTP id g17so11161524lfv.4
        for <openembedded-core@lists.openembedded.org>; Sun, 05 Mar 2023 21:36:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1678080985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bW0GI9cTJN0R9EhWpMJGprUz+a/evRnwpAS45Xt1ydI=;
        b=G67t2z50sru1prjTkYDwFxZqGItguC98JfyH3viDQnvCOcxpxBSJOOEX9CPp2K9pX6
         Jx97XOitOJS0HBVwxrAktdvE+hmgilh0pr4ZJ+wHqOoJzPsfBc1FVtRKcXmz21nJhGBf
         dtL2wnohIxAaZ2UFuBmAY39KeTG1VXcRGqXfo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678080985;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bW0GI9cTJN0R9EhWpMJGprUz+a/evRnwpAS45Xt1ydI=;
        b=NDPm4T98SERXQxyOx3nViEpKqKShw+LOpQMlcTE4/oAhULez1RgQ7EMVVd5SLcDEy6
         HzVzoCWPIhjbq1cRjFOlN0Wzs9HO4EVfKPwx+NIL28CarB0DYJq6jXoKXNUe2xwFH5xs
         zmrO1XLxs0/Kc2I1gNzPxVKs8rBiBtrJxyIsC1OcvkwNs3fclA7Yf6FgNVh/egrdrs3S
         OEv6/IQvts4ufYHCZdjN5t5EQicsFak4sCVHESGTVu44225mSVWQWfh89H5UfoJOyVQo
         ZswgJ/fjcJMMyqj9ZXKIPzOyvYPdYGh4XVlXYXTAm55Bh4zUd7m39MDJJovT9g+HdpuB
         1Odg==
X-Gm-Message-State: AO0yUKW6jFt3BVTA1nxRhJzeuWX8LQOs8dKpHdFMrfpu/1+LooPDG3X+
	y04uJh50z7KgFXvhhstRG85KrQmLflcq9dy7tXgBag==
X-Google-Smtp-Source: AK7set++wFDdeS2MaQqCvFKasxyF3dQFHWgwzg+AnGA3CaynMzTgeKzW0XaO1BjaSUOSMSHT5U9wHsNgfEMSL73YcQM=
X-Received: by 2002:a19:7517:0:b0:4dd:805b:5b75 with SMTP id
 y23-20020a197517000000b004dd805b5b75mr2809910lfe.7.1678080984603; Sun, 05 Mar
 2023 21:36:24 -0800 (PST)
MIME-Version: 1.0
References: <g24C.1678079873441089494.XMJ4@lists.openembedded.org>
In-Reply-To: <g24C.1678079873441089494.XMJ4@lists.openembedded.org>
From: Vivek Kumbhar <vkumbhar@mvista.com>
Date: Mon, 6 Mar 2023 11:06:13 +0530
Message-ID: <CAPun1rHE7_itbRjbMpBXY+YrG357bBBfQ0BD93zLmV6nkQSj0w@mail.gmail.com>
Subject: Re: [OE-core] [Kirkstone][Patch review] harfbuzz: CVE-2023-25193
 doesn't fix the issue and still exhibits O(n^2) behaviour #kirkstone
To: DC <davidcorbe@outlook.com>
Cc: openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="000000000000fe2e0205f634ac4f"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Mon, 06 Mar 2023 05:36:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/178057

--000000000000fe2e0205f634ac4f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yes, will revert that patch and backport the correct one.

Thanks
vivek

On Mon, Mar 6, 2023 at 10:47=E2=80=AFAM DC <davidcorbe@outlook.com> wrote:

> The patches submitted to
> dunfell ->
> https://lists.openembedded.org/g/openembedded-core/message/177768
> Kirkstone ->
> https://lists.openembedded.org/g/openembedded-core/message/177767
> <https://lists.openembedded.org/g/openembedded-core/message/177767>
>
> Still exhibits O(n^2) behaviour upon testing with applications and fonts
> and in worst cases Harfbuzz is not printing anything.
> Upon closer examination, looks to me that a wrong fix is pushed for the
> issue.
>
> The patch [
> https://github.com/harfbuzz/harfbuzz/commit/85be877925ddbf34f74a1229f3ca1=
716bb6170dc
> ] is known to causes erroneous results and regression already reverted by
> Behdad as a developer of Harfbuzz in the commit [
> https://github.com/harfbuzz/harfbuzz/commit/661050b4659ee490dfe622821bc7f=
de7d1c40510
> ].
>
> (ref->
> https://github.com/harfbuzz/harfbuzz/commit/85be877925ddbf34f74a1229f3ca1=
716bb6170dc#commitcomment-101326711
> )
>
> The new fix was already introduced (
> https://github.com/harfbuzz/harfbuzz/commit/85be877925ddbf34f74a1229f3ca1=
716bb6170dc#commitcomment-101335712)
> and needs to be backported properly.
>
> It doesn't look correct to patch Harfbuzz with code already reverted.
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#178056):
> https://lists.openembedded.org/g/openembedded-core/message/178056
> Mute This Topic: https://lists.openembedded.org/mt/97419449/7129709
> Mute #kirkstone:
> https://lists.openembedded.org/g/openembedded-core/mutehashtag/kirkstone
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> vkumbhar@mvista.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--000000000000fe2e0205f634ac4f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Yes, will revert that patch and backport the correct =
one.</div><div><br></div><div>Thanks</div><div>vivek<br></div></div><br><di=
v class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Mar 6=
, 2023 at 10:47=E2=80=AFAM DC &lt;<a href=3D"mailto:davidcorbe@outlook.com"=
>davidcorbe@outlook.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex"><p>The patches submitted to=C2=A0<br>dunfell -&gt;=
=C2=A0<a href=3D"https://lists.openembedded.org/g/openembedded-core/message=
/177768" rel=3D"noopener" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/message/177768</a><br>Kirkstone -&gt;=C2=A0<a href=3D"h=
ttps://lists.openembedded.org/g/openembedded-core/message/177767" rel=3D"no=
opener" target=3D"_blank">https://lists.openembedded.org/g/openembedded-cor=
e/message/177767=C2=A0</a><br><br>Still exhibits=C2=A0O(n^2) behaviour upon=
 testing with applications and fonts and in worst cases Harfbuzz is not pri=
nting anything.<br>Upon closer examination, looks to me that a wrong fix is=
 pushed for the issue.<br><br>The patch [ <a href=3D"https://github.com/har=
fbuzz/harfbuzz/commit/85be877925ddbf34f74a1229f3ca1716bb6170dc" rel=3D"noop=
ener" target=3D"_blank">https://github.com/harfbuzz/harfbuzz/commit/85be877=
925ddbf34f74a1229f3ca1716bb6170dc</a> ] is known to causes erroneous result=
s and regression already reverted by Behdad as a developer of Harfbuzz in t=
he commit [ <a href=3D"https://github.com/harfbuzz/harfbuzz/commit/661050b4=
659ee490dfe622821bc7fde7d1c40510" rel=3D"noopener" target=3D"_blank">https:=
//github.com/harfbuzz/harfbuzz/commit/661050b4659ee490dfe622821bc7fde7d1c40=
510</a> ].</p>
<p>(ref-&gt;=C2=A0<a href=3D"https://github.com/harfbuzz/harfbuzz/commit/85=
be877925ddbf34f74a1229f3ca1716bb6170dc#commitcomment-101326711" rel=3D"noop=
ener" target=3D"_blank">https://github.com/harfbuzz/harfbuzz/commit/85be877=
925ddbf34f74a1229f3ca1716bb6170dc#commitcomment-101326711</a>)<br><br>The n=
ew fix was already introduced (<a href=3D"https://github.com/harfbuzz/harfb=
uzz/commit/85be877925ddbf34f74a1229f3ca1716bb6170dc#commitcomment-101335712=
" rel=3D"noopener" target=3D"_blank">https://github.com/harfbuzz/harfbuzz/c=
ommit/85be877925ddbf34f74a1229f3ca1716bb6170dc#commitcomment-101335712</a>)=
 and needs to be backported properly.</p>
<p>It doesn&#39;t look correct to patch Harfbuzz with code already reverted=
.</p>
<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#178056): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/178056" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/178056</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/97419449/7129=
709" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/mt=
/97419449/7129709</a><br>
Mute #kirkstone:<a href=3D"https://lists.openembedded.org/g/openembedded-co=
re/mutehashtag/kirkstone" rel=3D"noreferrer" target=3D"_blank">https://list=
s.openembedded.org/g/openembedded-core/mutehashtag/kirkstone</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:vkumbhar@mvista.com" targe=
t=3D"_blank">vkumbhar@mvista.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div>

--000000000000fe2e0205f634ac4f--

