Return-Path: <alex.kanavin@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C56CEC4332F
	for <webhook@archiver.kernel.org>; Sun, 16 Oct 2022 07:24:44 +0000 (UTC)
Received: from mail-io1-f42.google.com (mail-io1-f42.google.com [209.85.166.42])
 by mx.groups.io with SMTP id smtpd.web09.27915.1665905077172474148
 for <openembedded-core@lists.openembedded.org>;
 Sun, 16 Oct 2022 00:24:37 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=d9/z61ig;
 spf=pass (domain: gmail.com, ip: 209.85.166.42, mailfrom: alex.kanavin@gmail.com)
Received: by mail-io1-f42.google.com with SMTP id 137so6945591iou.9
        for <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 00:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0for4cYAKDcyWE33c+TZJR8yW9GIii8PBQOdCQRJrv4=;
        b=d9/z61igIKmQ6HFZtaiJ5DTP5V4+0Mearu6MAIUvdpA1mRTLTeAsHQ/+zuZMqCyoIy
         eyDNSmZAU1pJxeFJzwWayV4WHZS/rF5m/q8WG0XzsH3XXPN0jyx5k/d7YVg8p3sNixZk
         GamoAEXCaNhgbavmfZO3v1g8NO4zUbw0cYCE6lrsnxa10u497GkipXVm1S2L2JvTtdBa
         VTVVtKkMjN+7oVxZsD6vQ8lu0VDEzQ9+aRISzcfgg0IowoVcm0IE6vU6MAqYceGV+FX8
         g4zL3XpBn8T4eJdLL+8/ZOxxxCEHL/nKO39DKDQYUukJ6llPlABNQ7qDAuuf/7b6SsZL
         k9Jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0for4cYAKDcyWE33c+TZJR8yW9GIii8PBQOdCQRJrv4=;
        b=1W7RIN17VXQEHINHYw4VDmo15re2lpPpM/laJCyr7M9LcoTErK7ndrIlMiezBHUyfw
         5Uv7DoLuOf8YvTrVcEePk8bi56SJoFtt2R2Xo+cqSFYf/xj0pOoZI//vAmOamPs9vL0l
         Hqw8EP1OHvuX+b46mXrliL7BuuwfMgPyic3vevRyng7xkC/8HmwFmmrhkLTuPQSBufUX
         ceEqK2qfzYPI6rWkvoAfqvNq1U0SlgwWTwoi86z8sun2FyBJCZuirMuh7M+Pu7YVEUiR
         D9UeQDk32ECGa6UMuLhGT9i9od40m4XHF40tJvi4rXWAnxM4VTh5UkFGPN0XUbX09AYQ
         LrOg==
X-Gm-Message-State: ACrzQf2sYkJ0TUTCApcBWsllsJHEWlkdVvuJzC4Z0xjKaBAZmFyG0ml9
	r1jRcPMpRSJtxIrnCKYWTrZMZwCss9J2bdclU/o=
X-Google-Smtp-Source: AMsMyM4WfKsL2QT481TFksGoakj/urZo9TiYXrkeSSuJfxMOMyjMGtrw3gPyoD2U7OF7Y6H7QxAx9BtDZ5QYuT5sFi0=
X-Received: by 2002:a05:6638:d04:b0:363:ec0b:8d7d with SMTP id
 q4-20020a0566380d0400b00363ec0b8d7dmr2722072jaj.169.1665905076438; Sun, 16
 Oct 2022 00:24:36 -0700 (PDT)
MIME-Version: 1.0
References: <01010183ddac296d-fddf5612-f98f-47a4-99db-94cd829db3ba-000000@us-west-2.amazonses.com>
 <0171f109-2941-3269-3bd5-adf497e30e59@gmail.com>
In-Reply-To: <0171f109-2941-3269-3bd5-adf497e30e59@gmail.com>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Sun, 16 Oct 2022 09:24:25 +0200
Message-ID: <CANNYZj9a3Ks+P4LCx-A8cLwgku_Qjaw6ePwht1E8CSFuXtR1HA@mail.gmail.com>
Subject: Re: [OE-core] [AUH] acpid: upgrading to 2.0.34 SUCCEEDED
To: Jacob Kroon <jacob.kroon@gmail.com>
Cc: Ross Burton <ross.burton@arm.com>, openembedded-core@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000004f906805eb21c084"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 16 Oct 2022 07:24:44 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/171890

--0000000000004f906805eb21c084
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

We are asking for help here with version updates. Specifically that you
take at least some of these reports and act on them. If you don=E2=80=99t w=
ant to
do this, fine, but demanding that those reports are not produced because
deleting them inconveniences you is both unreasonable and antagonizing.
Keeping core updated should not be =E2=80=98Alex problem=E2=80=99 but it de=
 facto is.

Alex

On Sun 16. Oct 2022 at 8.50, Jacob Kroon <jacob.kroon@gmail.com> wrote:

> Another AUH mail bomb, another time where I am pressing "delete" 148
> times in my email client. I don't review machine generated emails.
> I would not cry if AUH mails were sent to a designated mailing list, one
> that I am not subscribed to.
>
> Jacob
>
> On 10/16/22 00:03, Auto Upgrade Helper wrote:
> > Hello,
> >
> > this email is a notification from the Auto Upgrade Helper
> > that the automatic attempt to upgrade the recipe *acpid* to *2.0.34* ha=
s
> Succeeded.
> >
> > Next steps:
> >      - apply the patch: git am 0001-acpid-upgrade-2.0.33-2.0.34.patch
> >      - check the changes to upstream patches and summarize them in the
> commit message,
> >      - compile an image that contains the package
> >      - perform some basic sanity tests
> >      - amend the patch and sign it off: git commit -s --reset-author
> --amend
> >      - send it to the appropriate mailing list
> >
> > Alternatively, if you believe the recipe should not be upgraded at this
> time,
> > you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that
> > automatic upgrades would no longer be attempted.
> >
> > Please review the attached files for further information and
> build/update failures.
> > Any problem please file a bug at
> https://bugzilla.yoctoproject.org/enter_bug.cgi?product=3DAutomated%20Upd=
ate%20Handler
> >
> > Regards,
> > The Upgrade Helper
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#171742):
> https://lists.openembedded.org/g/openembedded-core/message/171742
> > Mute This Topic: https://lists.openembedded.org/mt/94354924/4454410
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> jacob.kroon@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>

--0000000000004f906805eb21c084
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">We are asking for help here with version updates. Specifi=
cally that you take at least some of these reports and act on them. If you =
don=E2=80=99t want to do this, fine, but demanding that those reports are n=
ot produced because deleting them inconveniences you is both unreasonable a=
nd antagonizing. Keeping core updated should not be =E2=80=98Alex problem=
=E2=80=99 but it de facto is.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">Alex</div><div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">On Sun 16. Oct 2022 at 8.50, Jacob Kroon &lt;<a href=3D"mai=
lto:jacob.kroon@gmail.com">jacob.kroon@gmail.com</a>&gt; wrote:<br></div><b=
lockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-le=
ft-width:1px;border-left-style:solid;padding-left:1ex;border-left-color:rgb=
(204,204,204)">Another AUH mail bomb, another time where I am pressing &quo=
t;delete&quot; 148 <br>
times in my email client. I don&#39;t review machine generated emails.<br>
I would not cry if AUH mails were sent to a designated mailing list, one <b=
r>
that I am not subscribed to.<br>
<br>
Jacob<br>
<br>
On 10/16/22 00:03, Auto Upgrade Helper wrote:<br>
&gt; Hello,<br>
&gt; <br>
&gt; this email is a notification from the Auto Upgrade Helper<br>
&gt; that the automatic attempt to upgrade the recipe *acpid* to *2.0.34* h=
as Succeeded.<br>
&gt; <br>
&gt; Next steps:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - apply the patch: git am 0001-acpid-upgrade-2.0.3=
3-2.0.34.patch<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - check the changes to upstream patches and summar=
ize them in the commit message,<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - compile an image that contains the package<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - perform some basic sanity tests<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - amend the patch and sign it off: git commit -s -=
-reset-author --amend<br>
&gt;=C2=A0 =C2=A0 =C2=A0 - send it to the appropriate mailing list<br>
&gt; <br>
&gt; Alternatively, if you believe the recipe should not be upgraded at thi=
s time,<br>
&gt; you can fill RECIPE_NO_UPDATE_REASON in respective recipe file so that=
<br>
&gt; automatic upgrades would no longer be attempted.<br>
&gt; <br>
&gt; Please review the attached files for further information and build/upd=
ate failures.<br>
&gt; Any problem please file a bug at <a href=3D"https://bugzilla.yoctoproj=
ect.org/enter_bug.cgi?product=3DAutomated%20Update%20Handler" rel=3D"norefe=
rrer" target=3D"_blank">https://bugzilla.yoctoproject.org/enter_bug.cgi?pro=
duct=3DAutomated%20Update%20Handler</a><br>
&gt; <br>
&gt; Regards,<br>
&gt; The Upgrade Helper<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#171742): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/171742" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/171742</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/94354924=
/4454410" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/94354924/4454410</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:jacob.kroon@gmail.com=
" target=3D"_blank">jacob.kroon@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
</blockquote></div></div>

--0000000000004f906805eb21c084--

