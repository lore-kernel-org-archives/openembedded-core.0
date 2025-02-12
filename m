Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAA86C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 15:08:07 +0000 (UTC)
Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
 by mx.groups.io with SMTP id smtpd.web11.18023.1739372850143253980
 for <openembedded-core@lists.openembedded.org>;
 Wed, 12 Feb 2025 07:07:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=LS80HMav;
 spf=pass (domain: gmail.com, ip: 209.85.216.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-2fa2eb7eb45so1582163a91.1
        for <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 07:07:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739372849; x=1739977649; darn=lists.openembedded.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=WotcA1aPyN1OM8/T5cyaC71Wku7KbQ0z+uoib6FuOjU=;
        b=LS80HMavv6MAtTYH4Ys/sFTUDy3aglyDQJENjHIQOJrk+ETdLZkR4i630QcNfPm107
         FD9UzlkgTya2hDOmp88L4zu8sF/nmqFy2rpAUmf3ObNjfbjTfq2hgFYYNNkEk1Bjf3Gz
         HABa6dEdjRdgOKrxtNsNQsh4gpYU+z9oLvPqFtlVsD0jEq+5HtLvWdiqB7FWDqQKMYb1
         bCcKozIlcmsdWVTECF5X62GJsxzaGM6K7w6fTIOnfoYprALFQHd+IQZDA/5LUkKYZx3p
         3j8hysQonVJy52KG4ZcK7nhkpzTCGW6oamnygte+O+kkOE3hdoiMEap9pjOjikAoQGCA
         E3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739372849; x=1739977649;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WotcA1aPyN1OM8/T5cyaC71Wku7KbQ0z+uoib6FuOjU=;
        b=LkOUcB0aR4e5GJFKk6hgmr33B+guEEJW4tAT9Wp1Tk8CdYdX3oReOGPSJYF9dGZFJx
         O/buPBGwvwqWj6H/38bH4xnklpygojW0eJkkV6qvArT/nHkvpXsofrbZl+Tv2pc7fILR
         MXKFYi2UHJ+93OEzQE2i4YkN4zxz7ICw4tpgQQwgFdb5cQcfqrHdthPSKe9Y1TQt/Zv3
         9Gu7RqcE/wPq1sCRdonX79ZMRXL14DezfbYcRjr6jiMtEhiEYp8EYbeNMelSpb3+ncFA
         8GkpXAjfiRiHPAn5FElg0u3gntSIen9fvI/g/Gp/CrP9q0Ens4DQtxaalzrDMcAzIppO
         txlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUXIpf0UXlDyJ4PL1S5jKe4jUGgID8+JhecQanWAl4OUgeg4DG3jIoERK6HRxJDQIGN0/YfAoSeFmNjdU/Pm5/gUg==@lists.openembedded.org
X-Gm-Message-State: AOJu0YyxPjegkiCeAEAc2bSY9j4+9Ag7xApFs8hMJ1i/A5dMRaDGrkyU
	tQFdeFHdM4RRVA0BnQmwNQxJj3HNqoEFA+7ECuI5RZ/QbClmRKEwmdcDv3VTeexCeAWSm98Qlgj
	FSjwO66dCT8Pf4JfN2PFob9XqjOvqfatGAmE=
X-Gm-Gg: ASbGnctr3XZ1G957MjOygkt+nNNYTyz06WYURKkEkICDnebkfqSXIqZLBXuimNUgJgL
	RfolJLCDKEdl6wRk2dWfe5L2fm074MFGY9kgFl0Z3s/7rvQYT3cb4RrVa+LxESf1uEeW8bbev7A
	==
X-Google-Smtp-Source: AGHT+IGOoX8PJK80OklytDgd3gQgNDYdIZ5omg16p2Mn+10neWv/Te4UajDQ/dfkpP51y+EDqgNqcSiMUTdG8kWDsEs=
X-Received: by 2002:a17:90b:4d0c:b0:2fa:17e4:b1cf with SMTP id
 98e67ed59e1d1-2fbf5be095bmr5706536a91.2.1739372849316; Wed, 12 Feb 2025
 07:07:29 -0800 (PST)
MIME-Version: 1.0
References: <20250211150034.18696-1-stefan.herbrechtsmeier-oss@weidmueller.com>
 <20250211150034.18696-21-stefan.herbrechtsmeier-oss@weidmueller.com>
 <d933e37f2be3e98c72f99191b504efe607d50c96.camel@linuxfoundation.org> <f2a970ab-14da-4108-a050-04851a7bd480@weidmueller.com>
In-Reply-To: <f2a970ab-14da-4108-a050-04851a7bd480@weidmueller.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 12 Feb 2025 10:07:17 -0500
X-Gm-Features: AWEUYZnFJoRusQxGSxoGhQGzuR6F32zoKXvvIjGecn7KH10fHr1z2PMiX4BRGE8
Message-ID: <CADkTA4MZozK1oBwM6-=FShj2N-kke4w9=FDkTrd668XkvjsTbw@mail.gmail.com>
Subject: Re: [OE-core] [RFC PATCH 21/30] python3-bcrypt: mirgrate to vendor
 cargo class
To: stefan.herbrechtsmeier-oss@weidmueller.com
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>, 
	openembedded-core@lists.openembedded.org, 
	Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com>
Content-Type: multipart/alternative; boundary="000000000000d0cb68062df34cae"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Wed, 12 Feb 2025 15:08:07 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-core/message/211248

--000000000000d0cb68062df34cae
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 12, 2025 at 9:36=E2=80=AFAM Stefan Herbrechtsmeier via
lists.openembedded.org <stefan.herbrechtsmeier-oss=3D
weidmueller.com@lists.openembedded.org> wrote:

> Am 11.02.2025 um 22:46 schrieb Richard Purdie:
>
> On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via lists.opene=
mbedded.org wrote:
>
> From: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller.com> <st=
efan.herbrechtsmeier@weidmueller.com>
>
> Signed-off-by: Stefan Herbrechtsmeier <stefan.herbrechtsmeier@weidmueller=
.com> <stefan.herbrechtsmeier@weidmueller.com>
> ---
>
>  .../python/python3-bcrypt-crates.inc          | 84 -------------------
>  .../python/python3-bcrypt_4.2.1.bb            |  4 +-
>  2 files changed, 1 insertion(+), 87 deletions(-)
>  delete mode 100644 meta/recipes-devtools/python/python3-bcrypt-crates.in=
c
>
> So let me as the silly question. This removes the crates.inc file and
> doesn't appear to add any kind of new list of locked down modules.
>
> The list is generated on the fly like gitsm and doesn't require an extra
> step.
>
> This means that inspection tools just using the metadata can't see
> "into" this recipe any longer for component information.
>
> We support and use python code inside the variables and thereby need a
> preprocessing of the metadata in any case.
>
> What do you mean by "component information"?
>
> This was
> something that some people felt strongly that was a necessary part of
> recipe metadata, for license, security and other manifest activities.
>
> Why can't they use the SBOM for this?
>
> Are we basically saying that information is now only available after
> the build takes place?
>
> They are only available after a special task run.
>
> I'm very worried that the previous discussions didn't reach a
> conclusion and this is moving the "magic" out of bitbake and into some
> vendor classes without addressing the concerns previously raised about
> transparency into the manifests of what is going on behind the scenes.
>
> I try to address the concerns but don't realize that the missing
> information in the recipe is a blocker.
>
> This version gives the user the possibility to influence the dependencies
> via patches or alternative lock file. It creates a vendor folder for easy
> patch and debug. It integrates the dependencies into the SBOM for securit=
y
> tracking.
>
> I skipped the license topic for now because the package managers don't
> handle license integrity. We have to keep the information in the recipe b=
ut
> hopefully the license information doesn't change with each update.
>
> I don't understand the requirement for the plain inspection. In my opinio=
n
> external tools should always use a defined output and shouldn't depend on
> the project internal details. I adapt the existing users of the SRC_URI t=
o
> include the dynamic SRC_URIs.
>
> I appreciate some of the requirements are conflicting.
>
> For the record in some recent meetings, I was promised that help would
> be forthcoming in helping guide this discussion. I therefore left
> things alone in the hope that would happen. It simply hasn't, probably
> due to time/work issues, which I can sympathise with but it does mean
> I'm left doing a bad job of trying to respond to your patches whilst
> trying to do too many other things badly too. That leaves us both very
> frustrated.
>
> I really want to see you succeed in reworking this and I appreciate the
> time and effort put into the patches. To make this successful, I know
> there are key stakeholders who need to buy into it and right now,
> they're more likely just to keep doing their own things as it is easier
> since this isn't going the direction they want. A key piece of making
> this successful is negotiating something which can work for a
> significant portion of them. I'm spelling all this out since I do at
> least want to make the situation clear.
>
> Yes, I'm very upset the OE community is putting me in this position
> despite me repeatedly asking for help and that isn't your fault, which
> just frustrates me more.
>
> My problem is the double standards. We support a fetcher which dynamic
> resolve dependencies and without manual update step since years. Nobody
> suggests to make the gitsm fetcher obsolete and requests the users to run
> an update task after a SRC_URI change to create a .inc file with the
> SRC_URIs of all the recursive submodules. Nobody complains about the
> missing components in the recipe.
>
There's no double standard, I'd simply say that design decisions of the
past doesn't mean that there aren't better ways to do something new.

Richard went out of his way to explain the status and what sort of review
needs to happen, I'll add that while getting frustrated with it is natural,
pushing back on people doing reviews isn't going to help get things merged,
it will do the opposite.

There have been plenty of complaints and issues with the gitsm fetcher, but
the reality is that if someone wants to get at the base components of what
it is doing, they can do so. I've had to take several of my maintained
recipes out of gitsm and back to the base git fetches. The submodules were
simply fetching code that didn't build and there was no way to fetch it.
The gitsm fetcher is also relatively lightly used, much less complicated
and doesn't need much extra in infrastructure to support it.


> Whether we have hard requirements and introduce a git submodule support
> which satisfy the requirements or we accept the advantages of a simple us=
er
> interface and minimize the disadvantages.
>
Unfortunately in my experience the simple interfaces hiding complexity
don't help when things go wrong. That's how I ended up where I am with my
go recipes, and why I ended up tearing my gitsm recipe back into its
components. There was no way to influence / fix the build otherwise, and
they didn't support bleeding edge development very well.

I'm definitely one of the people Richard is mentioning as a stakeholder,
and one that could likely just ignore all of this .. but I'm attempting to
wade into it again.

None of us have the hands on, daily experience with the components at play
as you do right now, so patience on your part will be needed as we ask many
not-so-intelligent questions.


> It doesn't matter if we run the resolve function inside a resolve, fetch
> or update task. The questions is do we want to support dynamic SRC_URIs o=
r
> do we want an manual update task. The task needs to be manual run after a
> SRC_URI change and can produces a lot of noise in the update commit. In a=
ny
> case the manual editing of the SRC_URI isn't practical and the users will
> use the package manager to update dependencies and its recursive
> dependencies.
>
I don't understand the series quite enough yet to say "why can't we do
both", if there was a way to abstract / componentize what is generating
those dynamic SCR_URIS in such a way that an external tool or update task
could generate them, and if they were already in place the dynamic
generation wouldn't run at build time, that should keep both modes working.

I admit to not understanding why we'd be overly concerned about noise in
the commits (for the dependencies) if they are split into separate files in
the recipe. More information is always better when I'm dealing with the
updates. I just scroll past it if I'm not interested and filter it if I am.

I feel the pain (and your pain) of this after supporting complicated
go/mixed language recipes through multiple major releases (and through go's
changing dependency model + bleeding edge code, etc) and needing to track
what has changed, so I definitely encourage you to keep working on this.

As a compromise we could add a new feature to generate .inc cache files
> before the main bitbake run. This would eliminate the manual update run a=
nd
> the commit noise as well as special fetch, unpack and patch task.
>
> Can you elaborate on what you mean by before the main bitbake run ? Would
it be still under a single bitbake invokation or would it be multiple runs
(I support multiple runs, so don't take that as a leading question).

Bruce

>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#211243):
> https://lists.openembedded.org/g/openembedded-core/message/211243
> Mute This Topic: https://lists.openembedded.org/mt/111123548/1050810
> Group Owner: openembedded-core+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-core/unsub [
> bruce.ashfield@gmail.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>
>

--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await thee
at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000d0cb68062df34cae
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote gmail_quote_con=
tainer"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Feb 12, 2025 at 9:36=
=E2=80=AFAM Stefan Herbrechtsmeier via <a href=3D"http://lists.openembedded=
.org">lists.openembedded.org</a> &lt;stefan.herbrechtsmeier-oss=3D<a href=
=3D"mailto:weidmueller.com@lists.openembedded.org">weidmueller.com@lists.op=
enembedded.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><u></u>

 =20
  <div>
    <div>Am 11.02.2025 um 22:46 schrieb Richard
      Purdie:<br>
    </div>
    <blockquote type=3D"cite">
      <pre>On Tue, 2025-02-11 at 16:00 +0100, Stefan Herbrechtsmeier via <a=
 href=3D"http://lists.openembedded.org" target=3D"_blank">lists.openembedde=
d.org</a> wrote:
</pre>
      <blockquote type=3D"cite">
        <pre>From: Stefan Herbrechtsmeier <a href=3D"mailto:stefan.herbrech=
tsmeier@weidmueller.com" target=3D"_blank">&lt;stefan.herbrechtsmeier@weidm=
ueller.com&gt;</a>

Signed-off-by: Stefan Herbrechtsmeier <a href=3D"mailto:stefan.herbrechtsme=
ier@weidmueller.com" target=3D"_blank">&lt;stefan.herbrechtsmeier@weidmuell=
er.com&gt;</a>
---

=C2=A0.../python/python3-bcrypt-crates.inc=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 84 -------------------
=C2=A0.../python/<a href=3D"http://python3-bcrypt_4.2.1.bb" target=3D"_blan=
k">python3-bcrypt_4.2.1.bb</a>=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 4 +-
=C2=A02 files changed, 1 insertion(+), 87 deletions(-)
=C2=A0delete mode 100644 meta/recipes-devtools/python/python3-bcrypt-crates=
.inc
</pre>
      </blockquote>
      <pre>So let me as the silly question. This removes the crates.inc fil=
e and
doesn&#39;t appear to add any kind of new list of locked down modules.
</pre>
    </blockquote>
    The list is generated on the fly like gitsm and doesn&#39;t require an
    extra step.<br>
    <br>
    <blockquote type=3D"cite">
      <pre>This means that inspection tools just using the metadata can&#39=
;t see
&quot;into&quot; this recipe any longer for component information.
</pre>
    </blockquote>
    <p>We support and use python code inside the variables and thereby
      need a preprocessing of the metadata in any case.<br>
      <br>
      What do you mean by &quot;component information&quot;?<br>
      <br>
    </p>
    <blockquote type=3D"cite">
      <pre>This was
something that some people felt strongly that was a necessary part of
recipe metadata, for license, security and other manifest activities.</pre>
    </blockquote>
    <p>Why can&#39;t they use the SBOM for this?<br>
      <span style=3D"white-space:pre-wrap">

</span></p>
    <blockquote type=3D"cite">
      <pre>Are we basically saying that information is now only available a=
fter
the build takes place?
</pre>
    </blockquote>
    They are only available after a special task run.<br>
    <br>
    <blockquote type=3D"cite">
      <pre>I&#39;m very worried that the previous discussions didn&#39;t re=
ach a
conclusion and this is moving the &quot;magic&quot; out of bitbake and into=
 some
vendor classes without addressing the concerns previously raised about
transparency into the manifests of what is going on behind the scenes.
</pre>
    </blockquote>
    <p>I try to address the concerns but don&#39;t realize that the missing
      information in the recipe is a blocker.<br>
      <br>
      This version gives the user the possibility to influence the
      dependencies via patches or alternative lock file. It creates a
      vendor folder for easy patch and debug. It integrates the
      dependencies into the SBOM for security tracking.<br>
      <br>
      I skipped the license topic for now because the package managers
      don&#39;t handle license integrity. We have to keep the information i=
n
      the recipe but hopefully the license information doesn&#39;t change
      with each update.<br>
      <br>
      I don&#39;t understand the requirement for the plain inspection. In m=
y
      opinion external tools should always use a defined output and
      shouldn&#39;t depend on the project internal details. I adapt the
      existing users of the SRC_URI to include the dynamic SRC_URIs. <br>
      <br>
    </p>
    <blockquote type=3D"cite">
      <pre>I appreciate some of the requirements are conflicting.

For the record in some recent meetings, I was promised that help would
be forthcoming in helping guide this discussion. I therefore left
things alone in the hope that would happen. It simply hasn&#39;t, probably
due to time/work issues, which I can sympathise with but it does mean
I&#39;m left doing a bad job of trying to respond to your patches whilst
trying to do too many other things badly too. That leaves us both very
frustrated.

I really want to see you succeed in reworking this and I appreciate the
time and effort put into the patches. To make this successful, I know
there are key stakeholders who need to buy into it and right now,
they&#39;re more likely just to keep doing their own things as it is easier
since this isn&#39;t going the direction they want. A key piece of making
this successful is negotiating something which can work for a
significant portion of them. I&#39;m spelling all this out since I do at
least want to make the situation clear.

Yes, I&#39;m very upset the OE community is putting me in this position
despite me repeatedly asking for help and that isn&#39;t your fault, which
just frustrates me more.
</pre>
    </blockquote>
    <p>My problem is the double standards. We support a fetcher which
      dynamic resolve dependencies and without manual update step since
      years. Nobody suggests to make the gitsm fetcher obsolete and
      requests the users to run an update task after a SRC_URI change to
      create a .inc file with the SRC_URIs of all the recursive
      submodules. Nobody=C2=A0complains about the missing components in the
      recipe.<br></p></div></blockquote><div><div class=3D"gmail_default" s=
tyle=3D"font-size:small">There&#39;s no double standard, I&#39;d simply say=
 that design decisions of the past doesn&#39;t mean that there aren&#39;t b=
etter ways to do something new.</div><div class=3D"gmail_default" style=3D"=
font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:=
small">Richard went out of his way to explain the status and what sort of r=
eview needs to happen, I&#39;ll add that while getting frustrated with it i=
s natural, pushing back on people doing reviews isn&#39;t going to help get=
 things merged, it will do the opposite.</div><div class=3D"gmail_default" =
style=3D"font-size:small"><br></div><div class=3D"gmail_default" style=3D"f=
ont-size:small">There have been plenty of complaints and issues with the gi=
tsm fetcher, but the reality is that if someone wants to get at the base co=
mponents of what it is doing, they can do so. I&#39;ve had to take several =
of my maintained recipes out of gitsm and back to the base git fetches. The=
 submodules were simply fetching code that didn&#39;t build and there was n=
o way to fetch it.=C2=A0 The gitsm fetcher is also relatively lightly used,=
 much less complicated and doesn&#39;t need much extra in infrastructure to=
 support it.</div></div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex"><div><p>
      <br>
      Whether we have hard requirements and introduce a git submodule
      support which satisfy the requirements or we accept the advantages
      of a simple user interface and minimize the disadvantages.<br></p></d=
iv></blockquote><div><div class=3D"gmail_default" style=3D"font-size:small"=
>Unfortunately in my experience the simple interfaces hiding complexity don=
&#39;t help when things go wrong. That&#39;s how I ended up where I am with=
 my go recipes, and why I ended up tearing my gitsm recipe back into its co=
mponents. There was no way to influence / fix the build otherwise, and they=
 didn&#39;t support bleeding edge development very well.</div><div class=3D=
"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_def=
ault" style=3D"font-size:small">I&#39;m definitely one of the people Richar=
d is mentioning as a stakeholder, and one that could likely just ignore all=
 of this .. but I&#39;m attempting to wade into it again.</div></div><div c=
lass=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gm=
ail_default" style=3D"font-size:small">None of us have the hands on, daily =
experience with the components at play as you do right now, so patience on =
your part will be needed as we ask many not-so-intelligent questions.</div>=
<div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div><p>
      <br>
      It doesn&#39;t matter if we run the resolve function inside a resolve=
,
      fetch or=C2=A0update task. The questions is do we want to support
      dynamic SRC_URIs or do we want an manual update task. The task
      needs to be manual run after a SRC_URI change and can produces a
      lot of noise in the update commit. In any case the manual editing
      of the SRC_URI isn&#39;t practical and the users will use the package
      manager to update dependencies and its recursive dependencies.<br></p=
></div></blockquote><div><div class=3D"gmail_default" style=3D"font-size:sm=
all">I don&#39;t understand the series quite enough yet to say &quot;why ca=
n&#39;t we do both&quot;, if there was a way to abstract / componentize=C2=
=A0what is generating those dynamic=C2=A0SCR_URIS in such a way that an ext=
ernal tool or update task could generate them, and if they were already in =
place the dynamic generation wouldn&#39;t run at build time, that should ke=
ep both modes working.</div></div><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size:sma=
ll">I admit to not understanding why we&#39;d be overly concerned about noi=
se in the commits (for the dependencies) if they are split into separate fi=
les in the recipe. More information is always better when I&#39;m dealing w=
ith the updates. I just scroll past it if I&#39;m not interested and filter=
 it if I am.=C2=A0</div><div class=3D"gmail_default" style=3D"font-size:sma=
ll"><br></div><div class=3D"gmail_default" style=3D"font-size:small">I feel=
 the pain (and your pain) of this after supporting complicated go/mixed lan=
guage recipes through multiple=C2=A0major releases (and through go&#39;s ch=
anging dependency model + bleeding edge code, etc) and needing to track wha=
t has changed, so I definitely encourage you to keep working on this.</div>=
<div class=3D"gmail_default" style=3D"font-size:small"><br></div><blockquot=
e class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px s=
olid rgb(204,204,204);padding-left:1ex"><div><p>
    </p>
    <p>As a compromise we could add a new feature to generate .inc cache
      files before the main bitbake run. This would eliminate the manual
      update run and the commit noise as well as special fetch, unpack
      and patch task.<br>
      <br></p></div></blockquote><div class=3D"gmail_default" style=3D"font=
-size:small">Can you elaborate on what you mean by before the main bitbake =
run ? Would it be still under a single bitbake invokation or would it be mu=
ltiple runs (I support multiple runs, so don&#39;t take that as a leading q=
uestion).</div><div class=3D"gmail_default" style=3D"font-size:small"><br><=
/div><div class=3D"gmail_default" style=3D"font-size:small">Bruce</div><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex"><div><p>
    </p>
    <span style=3D"white-space:pre-wrap">
</span>
  </div>

<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
Links: You receive all messages sent to this group.<br>
View/Reply Online (#211243): <a href=3D"https://lists.openembedded.org/g/op=
enembedded-core/message/211243" rel=3D"noreferrer" target=3D"_blank">https:=
//lists.openembedded.org/g/openembedded-core/message/211243</a><br>
Mute This Topic: <a href=3D"https://lists.openembedded.org/mt/111123548/105=
0810" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/m=
t/111123548/1050810</a><br>
Group Owner: <a href=3D"mailto:openembedded-core%2Bowner@lists.openembedded=
.org" target=3D"_blank">openembedded-core+owner@lists.openembedded.org</a><=
br>
Unsubscribe: <a href=3D"https://lists.openembedded.org/g/openembedded-core/=
unsub" rel=3D"noreferrer" target=3D"_blank">https://lists.openembedded.org/=
g/openembedded-core/unsub</a> [<a href=3D"mailto:bruce.ashfield@gmail.com" =
target=3D"_blank">bruce.ashfield@gmail.com</a>]<br>
-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-<br>
<br>
</blockquote></div><div><br clear=3D"all"></div><div><br></div><span class=
=3D"gmail_signature_prefix">-- </span><br><div dir=3D"ltr" class=3D"gmail_s=
ignature">- Thou shalt not follow the NULL pointer, for chaos and madness a=
wait thee at its end<br>- &quot;Use the force Harry&quot; - Gandalf, Star T=
rek II<br><br></div></div>

--000000000000d0cb68062df34cae--

