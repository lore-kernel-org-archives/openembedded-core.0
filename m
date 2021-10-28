Return-Path: <quaresma.jose@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A44EBC433EF
	for <webhook@archiver.kernel.org>; Thu, 28 Oct 2021 08:29:15 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by mx.groups.io with SMTP id smtpd.web09.9923.1635409754245154674
 for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 01:29:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=C/AsjE+F;
 spf=pass (domain: gmail.com, ip: 209.85.208.175,
 mailfrom: quaresma.jose@gmail.com)
Received: by mail-lj1-f175.google.com with SMTP id h11so9391011ljk.1
        for <openembedded-core@lists.openembedded.org>;
 Thu, 28 Oct 2021 01:29:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jlJdUmnCJOhbIJwewyMFeyf52bNP89vWBv93L63mujo=;
        b=C/AsjE+FkENTrI86lKGxdkdEDFQ9teYEFTzTVQUxIaDP6vNG0idKZZ+fxX72RwcByS
         afywMOg99FzhKe12hOL8Kk6T4++ikM98aZwtGpEPSCgma7/PttEZFVzR5//6jMmz8Sxf
         voQ2AdiLx6Y39UfybwErYTiUtuqlnnVgVoJNRuYpwKFXyQi9n2VpB1WioQKB0NUdWwXC
         jq7/Z3AMI7G1bdSQRkOFguCQsS14bfdKhWvM7UM0dMJAg/qePF7N+X31FPZORe3PKRG2
         cU/pwcEjFL2lWjDaG497wTGN5YJiSsXsp80zNB9eHpxH3WX6HTnZz2Bx9cWLshUyUOf/
         HJ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jlJdUmnCJOhbIJwewyMFeyf52bNP89vWBv93L63mujo=;
        b=ewx26qCEFp3JqE5SczqzWr1g/s51+wDk2TR8IhVkZG8HziZmVqiMWcmdd5IPDPHwi5
         hzlbQRAktV9OubkVKXXmZ14pmKPm08PgAlXjalbj8JCjZnW3Oc5TkL9otE8YYhxNV9km
         y1VfIF6bDH+T8ZXN1pkrOL6pt9XOFkejUatpeyNIBihHTTEI5ObryxY/dvQOrG+cSQNk
         3JiCdRt3Aoe3cEix7kVgR0tbncDRvzrkSYiZGOpS8mVi5J/p4F+WbBzIErN5isU2cpQV
         5COxttnqmFzVMSzLXDZS32Qpgxpo7KaCNdW96nDwA3ASZRiFuJp3KxyklgXL0PTVihr7
         D1uw==
X-Gm-Message-State: AOAM531Qq/8JybO8y8sr9eFuYkGccJhjSV9j8Nmu/0C6/VeN9quwM6BF
	bVkiEJmNF3c6cuk6k0mcyzOHk4CwidcPhmW/Mq8=
X-Google-Smtp-Source: 
 ABdhPJx4os8BD4ISrBXnVHEP22sVmV47HXGZYPUgJZshJE69gvh9c+tfjkaGTz3j5IpuYtaKESBDyl5X7Ktz8SW0EyY=
X-Received: by 2002:a2e:874b:: with SMTP id q11mr3172740ljj.369.1635409752467;
 Thu, 28 Oct 2021 01:29:12 -0700 (PDT)
MIME-Version: 1.0
References: <20211027091252.5781-1-jay.shen.teoh@intel.com>
 <CANPvuRmrxFqVk4Mmz=cDrbwUZ1RPLRpD8=aF241LguR=uFjrDQ@mail.gmail.com>
 <CAMKF1sqCVwThX=i1LzTF52u8oGzNmJ7gA7VJxYg9eqnOt7GGzg@mail.gmail.com>
In-Reply-To: 
 <CAMKF1sqCVwThX=i1LzTF52u8oGzNmJ7gA7VJxYg9eqnOt7GGzg@mail.gmail.com>
From: Jose Quaresma <quaresma.jose@gmail.com>
Date: Thu, 28 Oct 2021 09:29:02 +0100
Message-ID: 
 <CANPvuR=z9sHNM8NzouXbUVGixnuDFQfFcdvfmExhcPt6udGt2Q@mail.gmail.com>
Subject: Re: [OE-core] [PATCH] oeqa/runtime/parselogs: whitelist drm failure
 in common errors list
To: Khem Raj <raj.khem@gmail.com>
Cc: "Teoh, Jay Shen" <jay.shen.teoh@intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000005bab0305cf658126"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Thu, 28 Oct 2021 08:29:15 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/157580

--0000000000005bab0305cf658126
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Khem Raj <raj.khem@gmail.com> escreveu no dia quarta, 27/10/2021 =C3=A0(s) =
17:17:

> On Wed, Oct 27, 2021 at 2:24 AM Jose Quaresma <quaresma.jose@gmail.com>
> wrote:
> >
> >
> >
> > Teoh, Jay Shen <jay.shen.teoh@intel.com> escreveu no dia quarta,
> 27/10/2021 =C3=A0(s) 10:12:
> >>
> >> From: Teoh Jay Shen <jay.shen.teoh@intel.com>
> >>
> >> Add the following line to common_errors list.
> >>
> >>   [drm] Cannot find any crtc or sizes
> >>
> >> This message is not harmful, it extended the coverage for drm error
> message.
> >>
> >> Signed-off-by: Teoh Jay Shen <jay.shen.teoh@intel.com>
> >> ---
> >>  meta/lib/oeqa/runtime/cases/parselogs.py | 1 +
> >>  1 file changed, 1 insertion(+)
> >>
> >> diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py
> b/meta/lib/oeqa/runtime/cases/parselogs.py
> >> index 2b8893d842..96da0b4f5c 100644
> >> --- a/meta/lib/oeqa/runtime/cases/parselogs.py
> >> +++ b/meta/lib/oeqa/runtime/cases/parselogs.py
> >> @@ -32,6 +32,7 @@ common_errors =3D [
> >>      "Failed to load module \"fbdev\"",
> >>      "Failed to load module fbdev",
> >>      "Failed to load module glx",
> >> +    "[drm] Cannot find any crtc or sizes",
> >>      "[drm] Cannot find any crtc or sizes - going 1024x768",
> >
> >
> > I think this one ^ can be removed
>
> will the first entry cover the case when a fallback size is set ?
>

 I think yes, "[drm] Cannot find any crtc or sizes" is a substring of
"[drm] Cannot find any crtc or sizes - going 1024x768"


> >
> >>
> >>      "_OSC failed (AE_NOT_FOUND); disabling ASPM",
> >>      "Open ACPI failed (/var/run/acpid.socket) (No such file or
> directory)",
> >> --
> >> 2.33.1
> >>
> >>
> >>
> >>
> >
> >
> > --
> > Best regards,
> >
> > Jos=C3=A9 Quaresma
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#157508):
> https://lists.openembedded.org/g/openembedded-core/message/157508
> > Mute This Topic: https://lists.openembedded.org/mt/86623483/1997914
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> raj.khem@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>


--=20
Best regards,

Jos=C3=A9 Quaresma

--0000000000005bab0305cf658126
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Khem Raj &lt;<a href=3D"mailto:raj.kh=
em@gmail.com">raj.khem@gmail.com</a>&gt; escreveu no dia quarta, 27/10/2021=
 =C3=A0(s) 17:17:<br></div><blockquote class=3D"gmail_quote" style=3D"margi=
n:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex=
">On Wed, Oct 27, 2021 at 2:24 AM Jose Quaresma &lt;<a href=3D"mailto:quare=
sma.jose@gmail.com" target=3D"_blank">quaresma.jose@gmail.com</a>&gt; wrote=
:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; Teoh, Jay Shen &lt;<a href=3D"mailto:jay.shen.teoh@intel.com" target=
=3D"_blank">jay.shen.teoh@intel.com</a>&gt; escreveu no dia quarta, 27/10/2=
021 =C3=A0(s) 10:12:<br>
&gt;&gt;<br>
&gt;&gt; From: Teoh Jay Shen &lt;<a href=3D"mailto:jay.shen.teoh@intel.com"=
 target=3D"_blank">jay.shen.teoh@intel.com</a>&gt;<br>
&gt;&gt;<br>
&gt;&gt; Add the following line to common_errors list.<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0[drm] Cannot find any crtc or sizes<br>
&gt;&gt;<br>
&gt;&gt; This message is not harmful, it extended the coverage for drm erro=
r message.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Teoh Jay Shen &lt;<a href=3D"mailto:jay.shen.teoh@i=
ntel.com" target=3D"_blank">jay.shen.teoh@intel.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 meta/lib/oeqa/runtime/cases/parselogs.py | 1 +<br>
&gt;&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;&gt;<br>
&gt;&gt; diff --git a/meta/lib/oeqa/runtime/cases/parselogs.py b/meta/lib/o=
eqa/runtime/cases/parselogs.py<br>
&gt;&gt; index 2b8893d842..96da0b4f5c 100644<br>
&gt;&gt; --- a/meta/lib/oeqa/runtime/cases/parselogs.py<br>
&gt;&gt; +++ b/meta/lib/oeqa/runtime/cases/parselogs.py<br>
&gt;&gt; @@ -32,6 +32,7 @@ common_errors =3D [<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;Failed to load module \&quot;fbdev\&quot=
;&quot;,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;Failed to load module fbdev&quot;,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;Failed to load module glx&quot;,<br>
&gt;&gt; +=C2=A0 =C2=A0 &quot;[drm] Cannot find any crtc or sizes&quot;,<br=
>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;[drm] Cannot find any crtc or sizes - go=
ing 1024x768&quot;,<br>
&gt;<br>
&gt;<br>
&gt; I think this one ^ can be removed<br>
<br>
will the first entry cover the case when a fallback size is set ?<br></bloc=
kquote><div><br></div><div>=C2=A0I think yes, &quot;[drm] Cannot find any c=
rtc or sizes&quot; is a substring of=C2=A0</div><div>&quot;[drm] Cannot fin=
d any crtc or sizes - going 1024x768&quot;<br></div><div><br></div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;<br>
&gt;&gt;<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;_OSC failed (AE_NOT_FOUND); disabling AS=
PM&quot;,<br>
&gt;&gt;=C2=A0 =C2=A0 =C2=A0 &quot;Open ACPI failed (/var/run/acpid.socket)=
 (No such file or directory)&quot;,<br>
&gt;&gt; --<br>
&gt;&gt; 2.33.1<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;<br>
&gt;<br>
&gt; --<br>
&gt; Best regards,<br>
&gt;<br>
&gt; Jos=C3=A9 Quaresma<br>
&gt;<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#157508): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/157508" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/157508</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/86623483=
/1997914" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/86623483/1997914</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:raj.khem@gmail.com" t=
arget=3D"_blank">raj.khem@gmail.com</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt;<br>
</blockquote></div><br clear=3D"all"><div><br></div>-- <br><div dir=3D"ltr"=
 class=3D"gmail_signature"><div dir=3D"ltr">Best regards,<div><br>Jos=C3=A9=
 Quaresma</div></div></div></div>

--0000000000005bab0305cf658126--

