Return-Path: <rybczynska@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFC4DCA0EDC
	for <webhook@archiver.kernel.org>; Wed, 20 Aug 2025 12:35:31 +0000 (UTC)
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
 by mx.groups.io with SMTP id smtpd.web10.18564.1755693324566332090
 for <openembedded-core@lists.openembedded.org>;
 Wed, 20 Aug 2025 05:35:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=KKxi4Fs/;
 spf=pass (domain: gmail.com, ip: 209.85.214.178, mailfrom: rybczynska@gmail.com)
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-24457f47000so54130055ad.0
        for <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 05:35:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755693324; x=1756298124; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ghETLDmyPYbBC57pgLW89HMZMzMexNySuSkviEjpf1Q=;
        b=KKxi4Fs/1pEpgY+F776OfNIMql7lVHB9dSZe98lxLycNrHUCBxd8zjNc8qX9YzWZY5
         OXWB7fkwQf7b9TeWq7n/KwXc7HFL6DM7n9NF+8y+IvXHiP+SxF/d/hUAU/gpUG2j12Yl
         fw5MXPkgKyONAXp4jYtR/qrtyqWXJ/poYAvC3TYX+lNzU3SzGMxI/dnRtN/sH4k+vqCH
         2ZmzYQxIoNAP7VjBgZm6nI0sMfqsgdChsFAjzr0agMgbwcGgBaUy8ftE+VizxsDfx8iq
         LVemgNRHkHk0buOmcICMcZNG4Ta6em7yaH6X7kVLxYuOnuaZo95OUMF/3+5yBi44c3NN
         8mHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755693324; x=1756298124;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ghETLDmyPYbBC57pgLW89HMZMzMexNySuSkviEjpf1Q=;
        b=mj2RA/FyEQyxIj0NjQden0j+lMsdNlEMU7w9otbDvNzcQX/Hm318++HVbjqhSfrt6F
         ye/Mr4IGUwr9DnnrorkKSD5HeONdZkIxNKO6v3tIOwtf6heZtYiBRXW3ySFWvd9izzRe
         p7jHwWDdLuzXIWusch+/rlOo3mVMebbk6SmYOw0FOz/6w7jUHPKOpRIc0T5SZsHRtOr1
         jzby02eMIkFHFwW23hexJweuGVXcvIrzuaz1fqM+ouSmO+sIayk6C3/g5JD0VczwY9dZ
         plDI5Au1NJZvjg7bt9E7HNP5JjxT7gO5ZDfrZykfwgTO2NtiAdihgBTZxCAFgsV98WVe
         HVyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiSyb6NuVnKmvM73e+53VBX/Wu1NnqZ9p4dVchxPcWSbYmfVgDFXjGH6Y2yxxph3hIu8skbTaqCj1vFrI+kCcN6A==@lists.openembedded.org
X-Gm-Message-State: AOJu0YzM1yZ50bip0tK0vqo+/gUNS0hkL9xzW4xymYQutfI13wsV7PJM
	wn6wS52ucf3rdecZrklsYNuYm5bI6kKbw5h9pdHx1ZqXrKXtpIi4MSogBgJl4r7PD3hHGoonqRY
	ETU6C3BM/4G/5gfzTlVLymj2219zi2PA=
X-Gm-Gg: ASbGncu5l9XBXW73SLsKCxefB+V5VhAvpLWFaHa2PVucDKd+ml8x3UqQTuc0n5YXRG+
	QSBJpLV+KiLspCUlmOoUJUZaVGqEz9v4TxiCit2TeI2vNv5Fp4MwdIL6aBCL04HjIgZWlABr/6a
	C+DnhWx+ETapuvEzCjX15yC1w+m+75BLQ4dreN3JnrOme5vCOfWbErKguS6h4QCkl0gAVBHzH60
	axhGRE=
X-Google-Smtp-Source: AGHT+IGBl1SPykVANtcEPBPkfyDECNUXGUHU0eRdLaq8FWuJLXrh3UI7Rk9LveGPwpzM76nkyA/yYjfDpvwrz9Gyevo=
X-Received: by 2002:a17:902:db0b:b0:242:460f:e4a2 with SMTP id
 d9443c01a7336-245ef14d43fmr38814775ad.23.1755693323778; Wed, 20 Aug 2025
 05:35:23 -0700 (PDT)
MIME-Version: 1.0
References: <CAApg2=TZnJGDvBN8LBEoVbRcTJ6k1fGdOXVzss3bQmjZH4WknA@mail.gmail.com>
 <63a28aea-58c9-453b-9b03-3df29118044b@ibeeto.com> <CADfgfoZKuU2uMcPZFO3nMrXYJQMA66qL_b3O-1LJhWVdq13sQA@mail.gmail.com>
 <5430a536-ff40-43c3-a2f0-5df8f91d5e0c@balister.org>
In-Reply-To: <5430a536-ff40-43c3-a2f0-5df8f91d5e0c@balister.org>
From: Marta Rybczynska <rybczynska@gmail.com>
Date: Wed, 20 Aug 2025 14:35:11 +0200
X-Gm-Features: Ac12FXyDI4WtRnXI92Zp0X0zRnWakYnK2xavk9fYW0WqZI-rRJl0FFIJFPPDiQ0
Message-ID: <CAApg2=SzTW70zZ7qbSON1=AA_Hn34r6K8vWKwiB2XFj8r35u5Q@mail.gmail.com>
Subject: Re: [OE-core] [yocto] Renaming the yocto-security mailing list
To: Philip Balister <philip@balister.org>
Cc: mhalstead@linuxfoundation.org, yocto@lists.yoctoproject.org, 
	rudolf.streif@ibeeto.com, yocto-security@yoctoproject.org, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000e5ffcd063ccb3462"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 20 Aug 2025 12:35:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/222177

--000000000000e5ffcd063ccb3462
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This is an excellent question. We do want new discussions around security
topics, so this moderation should be efficient.

Kind regards,
Marta

On Wed, Aug 20, 2025 at 11:53=E2=80=AFAM Philip Balister <philip@balister.o=
rg>
wrote:

> Michael,
>
> Who are the moderators?
>
> Philip
>
> On 8/19/25 6:41 PM, Michael Halstead via lists.openembedded.org wrote:
> > I've updated yocto-security@lists.yoctoproject.org to require
> > moderator approval for new topics. This should prevent private
> > security reports from being posted publicly by mistake.
> > security@yoctoproject.org is not a private list but instead forwards
> > email received to members of the security team.
> >
> > I believe this solves the issue without requiring changes to the list
> > name or documentation.
> >
> > On Tue, Aug 19, 2025 at 2:50=E2=80=AFPM Rudolf J Streif via
> > lists.yoctoproject.org
> > <rudolf.streif=3Dibeeto.com@lists.yoctoproject.org> wrote:
> >>
> >> I don't any specifics about the incident. I suppose security-relevant
> >> information was submitted to a public mailing list. A private mailing
> >> list may help but in the end it's security-by-obfuscation. A mailing
> >> list for submitting CVEs is not the best choice imho. A secure web for=
m
> >> should be better. We have a CVE Status page
> >> (https://wiki.yoctoproject.org/wiki/CVE_Status) that lists the current
> >> acknowledged CVEs but of course reported CVEs should go through an
> >> investigative filter and potentially sanitizing first before put on th=
at
> >> page.
> >>
> >> :rjs
> >>
> >> On 8/19/25 8:08 AM, Marta Rybczynska via lists.yoctoproject.org wrote:
> >>> Hello all,
> >>> yesterday's incident confirms that yocto-security has a confusing nam=
e
> >>> that might cause confidential reports to arrive there.
> >>>
> >>> What about renaming the list to yocto-security-discussion or similar?
> >>> And eventually redirect yocto-security to the private security list.
> >>>
> >>> My reasoning: we shouldn't rename the private list as people might us=
e
> >>> old versions of documentation and we want them to address the correct
> >>> private list when needed. It is less critical if a message expected
> >>> for the public list reaches the private one, than otherwise.
> >>>
> >>> What do you think? What is the process to do the change?
> >>>
> >>> Kind regards,
> >>> Marta
> >>>
> >>>
> >>>
> >>
> >>
> >>
> >
> >
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#222151):
> https://lists.openembedded.org/g/openembedded-core/message/222151
> > Mute This Topic: https://lists.openembedded.org/mt/114790185/384425
> > Group Owner: openembedded-core+owner@lists.openembedded.org
> > Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> philip@balister.org]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>

--000000000000e5ffcd063ccb3462
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This is an excellent question. We do want new discuss=
ions around security topics, so this moderation should be efficient.</div><=
div><br></div><div>Kind regards,</div><div>Marta<br></div></div><br><div cl=
ass=3D"gmail_quote gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Wed, Aug 20, 2025 at 11:53=E2=80=AFAM Philip Balister &lt;<a href=
=3D"mailto:philip@balister.org">philip@balister.org</a>&gt; wrote:<br></div=
><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border=
-left:1px solid rgb(204,204,204);padding-left:1ex">Michael,<br>
<br>
Who are the moderators?<br>
<br>
Philip<br>
<br>
On 8/19/25 6:41 PM, Michael Halstead via <a href=3D"http://lists.openembedd=
ed.org" rel=3D"noreferrer" target=3D"_blank">lists.openembedded.org</a> wro=
te:<br>
&gt; I&#39;ve updated <a href=3D"mailto:yocto-security@lists.yoctoproject.o=
rg" target=3D"_blank">yocto-security@lists.yoctoproject.org</a> to require<=
br>
&gt; moderator approval for new topics. This should prevent private<br>
&gt; security reports from being posted publicly by mistake.<br>
&gt; <a href=3D"mailto:security@yoctoproject.org" target=3D"_blank">securit=
y@yoctoproject.org</a> is not a private list but instead forwards<br>
&gt; email received to members of the security team.<br>
&gt; <br>
&gt; I believe this solves the issue without requiring changes to the list<=
br>
&gt; name or documentation.<br>
&gt; <br>
&gt; On Tue, Aug 19, 2025 at 2:50=E2=80=AFPM Rudolf J Streif via<br>
&gt; <a href=3D"http://lists.yoctoproject.org" rel=3D"noreferrer" target=3D=
"_blank">lists.yoctoproject.org</a><br>
&gt; &lt;rudolf.streif=3D<a href=3D"mailto:ibeeto.com@lists.yoctoproject.or=
g" target=3D"_blank">ibeeto.com@lists.yoctoproject.org</a>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; I don&#39;t any specifics about the incident. I suppose security-r=
elevant<br>
&gt;&gt; information was submitted to a public mailing list. A private mail=
ing<br>
&gt;&gt; list may help but in the end it&#39;s security-by-obfuscation. A m=
ailing<br>
&gt;&gt; list for submitting CVEs is not the best choice imho. A secure web=
 form<br>
&gt;&gt; should be better. We have a CVE Status page<br>
&gt;&gt; (<a href=3D"https://wiki.yoctoproject.org/wiki/CVE_Status" rel=3D"=
noreferrer" target=3D"_blank">https://wiki.yoctoproject.org/wiki/CVE_Status=
</a>) that lists the current<br>
&gt;&gt; acknowledged CVEs but of course reported CVEs should go through an=
<br>
&gt;&gt; investigative filter and potentially sanitizing first before put o=
n that<br>
&gt;&gt; page.<br>
&gt;&gt;<br>
&gt;&gt; :rjs<br>
&gt;&gt;<br>
&gt;&gt; On 8/19/25 8:08 AM, Marta Rybczynska via <a href=3D"http://lists.y=
octoproject.org" rel=3D"noreferrer" target=3D"_blank">lists.yoctoproject.or=
g</a> wrote:<br>
&gt;&gt;&gt; Hello all,<br>
&gt;&gt;&gt; yesterday&#39;s incident confirms that yocto-security has a co=
nfusing name<br>
&gt;&gt;&gt; that might cause confidential reports to arrive there.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; What about renaming the list to yocto-security-discussion or s=
imilar?<br>
&gt;&gt;&gt; And eventually redirect yocto-security to the private security=
 list.<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; My reasoning: we shouldn&#39;t rename the private list as peop=
le might use<br>
&gt;&gt;&gt; old versions of documentation and we want them to address the =
correct<br>
&gt;&gt;&gt; private list when needed. It is less critical if a message exp=
ected<br>
&gt;&gt;&gt; for the public list reaches the private one, than otherwise.<b=
r>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; What do you think? What is the process to do the change?<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; Kind regards,<br>
&gt;&gt;&gt; Marta<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; Links: You receive all messages sent to this group.<br>
&gt; View/Reply Online (#222151): <a href=3D"https://lists.openembedded.org=
/g/openembedded-core/message/222151" rel=3D"noreferrer" target=3D"_blank">h=
ttps://lists.openembedded.org/g/openembedded-core/message/222151</a><br>
&gt; Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/11479018=
5/384425" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.o=
rg/mt/114790185/384425</a><br>
&gt; Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openemb=
edded.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org=
</a><br>
&gt; Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-=
core/unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded=
.org/g/openembedded-core/unsub</a> [<a href=3D"mailto:philip@balister.org" =
target=3D"_blank">philip@balister.org</a>]<br>
&gt; -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000e5ffcd063ccb3462--

