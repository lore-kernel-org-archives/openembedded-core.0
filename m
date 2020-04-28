Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com [209.85.221.194])
 by mx.groups.io with SMTP id smtpd.web12.115.1588104063041245339
 for <openembedded-core@lists.openembedded.org>;
 Tue, 28 Apr 2020 13:01:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=VYRFevF6;
 spf=pass (domain: gmail.com, ip: 209.85.221.194, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vk1-f194.google.com with SMTP id 10so30304vkr.7
        for <openembedded-core@lists.openembedded.org>; Tue, 28 Apr 2020 13:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ut7wGETmMVhonHQeSBYkTOX5bAEs/d+aLEtA1ajQSiE=;
        b=VYRFevF672p1sw1o2K9Am6z8ji5YDZDvoU1yc/bdJw/ODVF895/37Ll6vRjNM5IVXf
         ERWtunpKeNxZ3b7TR+MEuywh4xcuTFevx3uVfzTQqZ/GtnCtjapJlPwbeG9uBjvVwPGQ
         w1O+i+muvrEEQBJINY9nrVENyv65n6tTG082jUURJo0goH2cc0MU5U4YldFxKcxZ49dx
         JLm3WBg50GqP4gakgCp7WlfPaEycevJQWczg7LNGTnHK/qu+pJhEEh/63vVX3lUY8TN7
         O0pNkLmdkILXwUn65EpF3u+S1AgJvriZwGKTit+IJJskFTCAymIpsREI1vDJWebTD7FH
         SXdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ut7wGETmMVhonHQeSBYkTOX5bAEs/d+aLEtA1ajQSiE=;
        b=HL3ZCLjSUr4ToIQmeYTCx2/5RPxzE8jY8TPb7ihk6qntN8VarvUoNOEEWJ9An6ImjA
         mtNPCR1uSRdrd3QCKr/hCxQ23pk8X4fc5kOaCQ92/XjzFN5mTLdZf8DrSwj/fzlwIWGb
         Q8kRSVVXUG3pG+CqZxwriknWN9M4F5AgaWndPxwLj6kNOsSoOT/kBx54e3Xmo7upu2PM
         btPXE2JC7MqYlR6Jdn+lHr9LPi+517txrhqf59BqVsdnOiwu40t8jMXVMtPqn17xFOAE
         Silk4IP401Q+YXX8LXcuWuWpS6+9OcM+TRkPnFsZ7mf6GhKZk0bmJWDYejssCxyKu+U+
         Lr3g==
X-Gm-Message-State: AGi0PubBPmax/0tk28l2cnEphrWfe7ol6Bjwsu+zPms4wlsHaMYVXRib
	ebTFqy7fn0KWOsbqhsqWTb6D+Xx5jrUlj6of5lE=
X-Google-Smtp-Source: APiQypJ3cGsDzdmXchBkYzPpczg9uJaHy4uCNdDvvQ7YDhLx4MTF4Sap3oXj/vnF1WwTqMwSmV2+bKwXVPS1quQUC7g=
X-Received: by 2002:a1f:c643:: with SMTP id w64mr17180176vkf.0.1588104062085;
 Tue, 28 Apr 2020 13:01:02 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1587841042.git.alex.kanavin@gmail.com> <05d961392eb30920f441731f662ba0dd6a6bd5db.1587841042.git.alex.kanavin@gmail.com>
 <CAMKF1sopu5jZ_obZ7Qkt6vzCvaHyvbnSKEdLioTzmo87D7bZYw@mail.gmail.com>
 <CANNYZj-5dGKXV45-SfbxopMUy51URsujoyNzQkK_kSyMKD14cA@mail.gmail.com> <160A12747110B802.23919@lists.openembedded.org>
In-Reply-To: <160A12747110B802.23919@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Tue, 28 Apr 2020 22:00:50 +0200
Message-ID: <CANNYZj_WJ=_TWtKRye5PGoqta6jktgUAhcD1=+toCdtYr3g1Fw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 1/3] bitbake.conf: propagate 'opengl' DISTRO_FEATURE to native/nativesdk from target
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Khem Raj <raj.khem@gmail.com>, 
	Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="0000000000007caffd05a45f4aa3"

--0000000000007caffd05a45f4aa3
Content-Type: text/plain; charset="UTF-8"

On Tue, 28 Apr 2020 at 21:28, Alexander Kanavin via lists.openembedded.org
<alex.kanavin=gmail.com@lists.openembedded.org> wrote:

> On Tue, 28 Apr 2020 at 10:52, Alexander Kanavin <alex.kanavin@gmail.com>
> wrote:
>
>> Good point. I will rework the patches to use 'virgl' DISTRO_FEATURE
>> instead. Making it machine specific isn't feasible, because the recipes
>> affected are all native ones.
>>
>
> Actually, on second thought, a separate DISTRO_FEATURE is not needed. What
> I'm going to do is uncouple the native 'opengl' DISTRO_FEATURE from the
> target one, so that either can be set independently of the other.
>

And on third thought, even that is not needed. Just set
DISTRO_FEATURES_FILTER_NATIVE to not include 'opengl' (the default
assignment in bitbake.conf is weak) and this won't be enabled for native.

Note that even if this is enabled, no opengl support from the build host is
needed, and only a few additional bits are built. To use them you need to
pass non-default options to runqemu (but in that case, the host has to have
some kind of GL stack).

So I'd say the patchset is fine.

Alex

--0000000000007caffd05a45f4aa3
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Tue, 28 Apr 2020 at 21:28, Alexander K=
anavin via <a href=3D"http://lists.openembedded.org">lists.openembedded.org=
</a> &lt;alex.kanavin=3D<a href=3D"mailto:gmail.com@lists.openembedded.org"=
>gmail.com@lists.openembedded.org</a>&gt; wrote:<br></div><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr=
"><div dir=3D"ltr">On Tue, 28 Apr 2020 at 10:52, Alexander Kanavin &lt;<a h=
ref=3D"mailto:alex.kanavin@gmail.com" target=3D"_blank">alex.kanavin@gmail.=
com</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex"><div dir=3D"ltr">Good point. I will rework th=
e patches to use &#39;virgl&#39; DISTRO_FEATURE instead. Making it machine =
specific isn&#39;t feasible, because the recipes affected are all native on=
es.</div></blockquote><div><br></div><div>Actually, on second thought, a se=
parate DISTRO_FEATURE is not needed. What I&#39;m going to do is uncouple t=
he native &#39;opengl&#39; DISTRO_FEATURE from the target one, so that eith=
er can be set independently of the other.<br></div></div></div></blockquote=
><div><br></div><div>And on third thought, even that is not needed. Just se=
t DISTRO_FEATURES_FILTER_NATIVE to not include &#39;opengl&#39; (the defaul=
t assignment in bitbake.conf is weak) and this won&#39;t be enabled for nat=
ive. <br></div><div><br></div><div>Note that even if this is enabled, no op=
engl support from the build host is needed, and only a few additional bits =
are built. To use them you need to pass non-default options to runqemu (but=
 in that case, the host has to have some kind of GL stack).<br></div><div><=
br></div><div>So I&#39;d say the patchset is fine.</div><div><br></div><div=
>Alex<br></div></div></div>

--0000000000007caffd05a45f4aa3--
