Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47])
 by mx.groups.io with SMTP id smtpd.web10.4356.1620854572616096859
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 14:22:52 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cmLCmkJe;
 spf=pass (domain: gmail.com, ip: 209.85.222.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-ua1-f47.google.com with SMTP id x22so7946077uav.8
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 14:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=wO+e37ZvJRaeK/D+p2f8PAL5DflrBfRpm0WwDX65LIA=;
        b=cmLCmkJenBqq3Wf6fBTTodi3X22+dYgyMbDcFm7yxcLUxAyYxYxKpA/6vPOL+do+78
         9lVWW7DA7t3hkT/+HFr/gg4olM1yh0c6+ClebQgtSzhJa5KNMCYv6K5UvZSo6tiING6S
         pzjQ//8xSkZwY+k52kfNgqEJ037owO+hBwTo3dedSIjIpx6U+2Mv96JBAlIfwqSX6kCT
         u2E1Mw+gMstLK4Lle4LCA7uX//W0sCC6qB+xsdATuVRRrIOX9KbD6+1viUiy4NVAPIhc
         1+ujOyv2xIk/KU3G0GwamC5vyAKbLyj6HK1QmdEu5Am9DCEvge17w5D8B67x+bIA558+
         RmiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=wO+e37ZvJRaeK/D+p2f8PAL5DflrBfRpm0WwDX65LIA=;
        b=ikEZbYKYZl/0YPJ18FNWYcDrvygV88dpr6IiXKwDTtu8QYO7dLUnJUjghWgak4O9vu
         b7OVe7mtSvR5QloV1jtyuKmIYtTHNztI9Y3O+4eR6liqWzl9CMQgt5SF8Yi+beWu7EFB
         bmpyOVUq7M9dKJ5TjjEAcoRj0Y8jQoo+JSFOFGfgg0Qmf/vWs23i/LbQ2ZufVoFsM5WF
         n7h0AXSmkFr4/U4Yv+8fGExKjPBNuIGBb+NuD+JaCGHj0D1q0xvVGpmWH8d+JtV7vx0b
         GCdnYhmpsTF7WK9uuUkzX4kxz+0vV3O8P35lYdVQQyCVBolUxv3ujtpyXHdwKBZRtt/c
         za1A==
X-Gm-Message-State: AOAM530r9KRU4Z/eHyVls5G9BjQA2Ig71YhRFiyWxMJO/J9MEcX1aTbo
	dUfX7Il30v6kRHVOHB4ClwcIh1iuaVPboLxtT2Q=
X-Google-Smtp-Source: ABdhPJwTmNBS3B3fg8Rw4yHZzhEenRCqULSAaYfFq3SGWi1Ft/KenUQhYBACBfsEf1zgrWbBuafUmEoIhQ8N5pjMJGg=
X-Received: by 2002:ab0:59cb:: with SMTP id k11mr20660423uad.100.1620854571805;
 Wed, 12 May 2021 14:22:51 -0700 (PDT)
MIME-Version: 1.0
References: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
 <CANNYZj9_4WC91DoTeXcsVAJi=kS2DRXHTHE5L6Wgbb2PJfTimA@mail.gmail.com>
 <255c6c61-af04-4866-bb2f-0ddc50ca6391@www.fastmail.com> <CANNYZj-PSq4bAQpy3s=8Vuqk-PcstZZFPzr710VXfS3Lj8Aiow@mail.gmail.com>
In-Reply-To: <CANNYZj-PSq4bAQpy3s=8Vuqk-PcstZZFPzr710VXfS3Lj8Aiow@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Wed, 12 May 2021 23:22:40 +0200
Message-ID: <CANNYZj8yZ5Ays2dsPV5jkptLea0faY2uqd5_n6SeOFZdoqV8Gw@mail.gmail.com>
Subject: Re: [OE-core] master/main branch renaming and bitbake
To: Colin Walters <walters@verbum.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000fc2ec605c2289c36"

--000000000000fc2ec605c2289c36
Content-Type: text/plain; charset="UTF-8"

And by the way, another reason to check that revision is linked to a branch
is when SRCREV is updated - we need some reassurance that the updated
SRCREV comes from the same branch as previous SRCREV, or that if the branch
has changed, it's explicitly visible in the diff and explained in the
commit message.

Alex

On Wed, 12 May 2021 at 23:17, Alexander Kanavin <alex.kanavin@gmail.com>
wrote:

> On Wed, 12 May 2021 at 22:44, Colin Walters <walters@verbum.org> wrote:
>
>> On Wed, May 12, 2021, at 4:40 PM, Alexander Kanavin wrote:
>> > For ostree, yes:
>> > http://git.openembedded.org/meta-openembedded/log/?h=master-next
>> >
>> > For the generic case, no. It's not a good idea to start guessing what
>> > the upstream did.
>>
>> What is the goal of the `branch=` specification?  I can understand it
>> being *informative* for humans specifically when things like
>> non-master/main branches e.g. `release-4.x`, `lts-`, `stable-` etc. are
>> involved.
>>
>> But why is bitbake explicitly checking it?  Is it to validate what the
>> human expressed, or is it to try to cover some security aspect?  Something
>> else?
>>
>
> To ensure the specified revision is actually linked with the specified
> branch, and not just free-floating, and catch branch renames, deletions and
> force pushes. You can override that behaviour with nobranch=1, at your own
> risk - free-floating revisions can be 'garbage collected'.
>
> Yes, it's annoying when the upstream renames branches, but it's no
> different than upstreams clearing up old tarballs, or disappearing
> altogether. Ensure you have proper download mirrors.
>
> Alex
>

--000000000000fc2ec605c2289c36
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>And by the way, another reason to check that revision=
 is linked to a branch is when SRCREV is updated - we need some reassurance=
 that the updated SRCREV comes from the same branch as previous SRCREV, or =
that if the branch has changed, it&#39;s explicitly visible in the diff and=
 explained in the commit message.</div><div><br></div><div>Alex<br></div></=
div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On=
 Wed, 12 May 2021 at 23:17, Alexander Kanavin &lt;<a href=3D"mailto:alex.ka=
navin@gmail.com">alex.kanavin@gmail.com</a>&gt; wrote:<br></div><blockquote=
 class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px so=
lid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, 12 May 2021 at 22:44,=
 Colin Walters &lt;<a href=3D"mailto:walters@verbum.org" target=3D"_blank">=
walters@verbum.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">On Wed, May 12, 2021, at 4:40 PM, Alexander Kanavin wrote=
:<br>
&gt; For ostree, yes:<br>
&gt; <a href=3D"http://git.openembedded.org/meta-openembedded/log/?h=3Dmast=
er-next" rel=3D"noreferrer" target=3D"_blank">http://git.openembedded.org/m=
eta-openembedded/log/?h=3Dmaster-next</a><br>
&gt; <br>
&gt; For the generic case, no. It&#39;s not a good idea to start guessing w=
hat <br>
&gt; the upstream did.<br>
<br>
What is the goal of the `branch=3D` specification?=C2=A0 I can understand i=
t being *informative* for humans specifically when things like non-master/m=
ain branches e.g. `release-4.x`, `lts-`, `stable-` etc. are involved.<br>
<br>
But why is bitbake explicitly checking it?=C2=A0 Is it to validate what the=
 human expressed, or is it to try to cover some security aspect?=C2=A0 Some=
thing else?<br></blockquote><div><br></div><div>To ensure the specified rev=
ision is actually linked with the specified branch, and not just free-float=
ing, and catch branch renames, deletions and force pushes. You can override=
 that behaviour with nobranch=3D1, at your own risk - free-floating revisio=
ns can be &#39;garbage collected&#39;.</div><div><br></div><div>Yes, it&#39=
;s annoying when the upstream renames branches, but it&#39;s no different t=
han upstreams clearing up old tarballs, or disappearing altogether. Ensure =
you have proper download mirrors.<br></div><div><br></div><div>Alex<br></di=
v></div></div>
</blockquote></div>

--000000000000fc2ec605c2289c36--
