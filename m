Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
 by mx.groups.io with SMTP id smtpd.web09.6403.1620864729258820409
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 May 2021 17:12:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=aYrn5XUC;
 spf=pass (domain: gmail.com, ip: 209.85.167.44, mailfrom: armccurdy@gmail.com)
Received: by mail-lf1-f44.google.com with SMTP id h4so36272260lfv.0
        for <openembedded-core@lists.openembedded.org>; Wed, 12 May 2021 17:12:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=gZuGfgLRQCfU2tlEUChwJLcZEQZ8xgg04+fFHiVCcWc=;
        b=aYrn5XUCawxiHZHwJgZbXVHNT0u7CKYPGSeGpMIoBYsd+7htWLOK+Z6PNMXGy0PiNg
         v1ob71fW8sgZnAlkrpwn51s2T8dWPHESe4ilExOIcYwcdKVy9QpfJiDvmZCc/D2cZ0ox
         sNkEGki9VXs/cb+AtMCgGqnt3vsdSRltYCtOKANTr5J2dV1ikAErlWQmHrfcN0FMM0k8
         AOcyQozx6EuKRDPorOmVYkY8tA+bfQifjXLk20XukkTKNLdZHeMdXa/raBzBejnqqCzf
         H/t5bpmVedp0UqpmO6t9un7HmuXKLpEfow3a8F/1WeuTR30p6l+jSQD6evcaMFdnAuY0
         6p7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=gZuGfgLRQCfU2tlEUChwJLcZEQZ8xgg04+fFHiVCcWc=;
        b=l7oZpJRTOy0TSc0FalqSBRA1X40HgQW57VYQ2+uXtZrU0qdjtKux3/nxJEkp7fI5F+
         73zsQl/Fo+Z4Uzrv27wYDOrs6CKPTDL5ObAjnbTrfaTn5+u8x1ggH2ZjM/5on854Q1yp
         QWp2JRn2QJ0eJQ/JkD2SXJpcKV9T+OXU7tBZHWp3v/RCQxgQbKuaR8+B4oSGmLRfRtB6
         IFoGMjIJ4pLT4oeCdCpBhXMKoxsYU2vTMWHWmeJQR+MQVN757ryIywEmO9MqaAHPlrIZ
         2uBFBvIds/4FUGPEvD86EmDWy+sASCs/Z/L/LeOK7BI+tmMry6mp0WCYWAtJJWwYUvtb
         0iPQ==
X-Gm-Message-State: AOAM532IA1Y6RrFhkTblWsImufnUswj4CYRyEcp7qotbWZzu9TUS/K+q
	1A+zrcudLNRdvaj3lYA9ajLODw1aWnHS2IIug9c=
X-Google-Smtp-Source: ABdhPJwpCr2mS3xuPuVC0CHa5JfUr0jU4uTaMrdAxUqGMklj9aigJs6bh+dD3oUpp8PEN1t9Rre1ziMo0cyDxqAYXHI=
X-Received: by 2002:a05:6512:1388:: with SMTP id p8mr27900500lfa.269.1620864727420;
 Wed, 12 May 2021 17:12:07 -0700 (PDT)
MIME-Version: 1.0
References: <ca363208-ab63-44c4-92e7-98b1788a8a8c@www.fastmail.com>
 <CANNYZj9_4WC91DoTeXcsVAJi=kS2DRXHTHE5L6Wgbb2PJfTimA@mail.gmail.com>
 <255c6c61-af04-4866-bb2f-0ddc50ca6391@www.fastmail.com> <CANNYZj-PSq4bAQpy3s=8Vuqk-PcstZZFPzr710VXfS3Lj8Aiow@mail.gmail.com>
 <CANNYZj8yZ5Ays2dsPV5jkptLea0faY2uqd5_n6SeOFZdoqV8Gw@mail.gmail.com>
In-Reply-To: <CANNYZj8yZ5Ays2dsPV5jkptLea0faY2uqd5_n6SeOFZdoqV8Gw@mail.gmail.com>
From: "Andre McCurdy" <armccurdy@gmail.com>
Date: Wed, 12 May 2021 17:11:56 -0700
Message-ID: <CAJ86T=UjJ8J3aUL7YX03oa1fy7zAwPk9vp+=yYxGNfEKsNt6oQ@mail.gmail.com>
Subject: Re: [OE-core] master/main branch renaming and bitbake
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: Colin Walters <walters@verbum.org>, OE-core <openembedded-core@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 12, 2021 at 2:23 PM Alexander Kanavin
<alex.kanavin@gmail.com> wrote:
>
> And by the way, another reason to check that revision is linked to a bra=
nch is when SRCREV is updated - we need some reassurance that the updated S=
RCREV comes from the same branch as previous SRCREV, or that if the branch =
has changed, it's explicitly visible in the diff and explained in the commi=
t message.

None of the answers given so far seem very convincing...

If the git revision that a recipe wants is available on an unexpected
branch in the upstream repo then it's not really different from a tar
file being fetched from a mirror rather than whatever is in SRC_URI.
If we want the fetcher to fail as an indication that an upstream git
repo has renamed branches then don't we also want it to fail if a tar
file disappears from an upstream server? It seems odd that one should
be a fatal error and the other to be something we try to cover up and
hide from the end user.

Anyway, for recipes which don't explicitly specify a branch in SRC_URI
it would seem quite reasonable for the fetcher to check what the
default branch is set to in the upstream repo and search for the
required git revision in that branch (rather than rely on a hardcoded
default of "master" as we do now). Going forward, there's going to be
less standardisation on what upstream repos call their default branch,
so we're either going to have to explicitly specify a branch in more
and more recipes or teach the fetcher to automatically figure out what
the default branch in the upstream repo is.

> Alex
>
> On Wed, 12 May 2021 at 23:17, Alexander Kanavin <alex.kanavin@gmail.com>=
 wrote:
>>
>> On Wed, 12 May 2021 at 22:44, Colin Walters <walters@verbum.org> wrote:
>>>
>>> On Wed, May 12, 2021, at 4:40 PM, Alexander Kanavin wrote:
>>> > For ostree, yes:
>>> > http://git.openembedded.org/meta-openembedded/log/?h=3Dmaster-next
>>> >
>>> > For the generic case, no. It's not a good idea to start guessing wha=
t
>>> > the upstream did.
>>>
>>> What is the goal of the `branch=3D` specification?  I can understand i=
t being *informative* for humans specifically when things like non-master/m=
ain branches e.g. `release-4.x`, `lts-`, `stable-` etc. are involved.
>>>
>>> But why is bitbake explicitly checking it?  Is it to validate what the=
 human expressed, or is it to try to cover some security aspect?  Something=
 else?
>>
>>
>> To ensure the specified revision is actually linked with the specified =
branch, and not just free-floating, and catch branch renames, deletions and=
 force pushes. You can override that behaviour with nobranch=3D1, at your o=
wn risk - free-floating revisions can be 'garbage collected'.
>>
>> Yes, it's annoying when the upstream renames branches, but it's no diff=
erent than upstreams clearing up old tarballs, or disappearing altogether. =
Ensure you have proper download mirrors.
>>
>> Alex
>
>
>=20
>
