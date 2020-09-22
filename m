Received: from mail-ej1-f65.google.com (mail-ej1-f65.google.com [209.85.218.65])
 by mx.groups.io with SMTP id smtpd.web12.845.1600787479165100300
 for <openembedded-core@lists.openembedded.org>;
 Tue, 22 Sep 2020 08:11:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mepH+78d;
 spf=pass (domain: gmail.com, ip: 209.85.218.65, mailfrom: martin.jansa@gmail.com)
Received: by mail-ej1-f65.google.com with SMTP id j11so23475573ejk.0
        for <openembedded-core@lists.openembedded.org>; Tue, 22 Sep 2020 08:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=n2AwFJn6XhG+hu2zZ1mvU5HP4gmV+IIK8bp/rCOsiTI=;
        b=mepH+78d03nUjYB1AICsjwUb0s5MgecSOY9FoC/mh1Dd5FHLSBLnyCb49zAPNd7OE1
         U3K0EQtLgCo6zNy0WYFGAP99k2AwwSOUo7bjd3Hrm56rcsXmF97VwhD5v7nJNwwDKCVp
         T30U1TpD5pfemqheauv+1bqcV3twtSx3ut+63PwOlwG4l/fWk+CPmOJq0YV9leXhTPms
         gb/DjAiIF4lMi/QoREmmSsIxqYwjE7dY04MwLv0Dd/OaOEpOxVu78kVsFuPU9XqD0P1M
         ULuEpKQPC2q/Jb9h8Ra4Y7bfUJNgDBvTvuCRaMg0NcAZS3Im90scCv/D/XPZ+xzdkvOL
         sCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=n2AwFJn6XhG+hu2zZ1mvU5HP4gmV+IIK8bp/rCOsiTI=;
        b=Uk1BsPU0MKWIFitomMsGaHlJDoS9tmcpNOMW+W9eyBTIycY3vpbWbQqqBMirGBocRM
         9nF2Spbr5FiGhLgnhIWXk/jf4QYeIx20ek14DJwX86ayJ8IWorpJMZxKcAgIIDV1dgwa
         KEGl0hFynhFA9fDp0dY759W9UuJN0NbI1T6jgd2oYHyg4i7lJMh2jFyGxnLswNbh2QGD
         zHK9QqAETCqGnvcx/XdqpduPYMkvqLApa5YTSf79q/OFmKF7BYZzhk1WxzrQTByK0Omk
         3yJSijnaMAQ6G0RH17jEOWfF0g3sqA0RXoGW7HoY8yJ5hJ7kt5cJu0Oa7JcylE7NIo+L
         UcFA==
X-Gm-Message-State: AOAM530LTJU73/SEXL1rzm4p9+lniAudyOA9CxQ+BVRaSgLSq0hm8vda
	213k6lpiNz3yu8A02DZZTMP07wUtR8uGCnKogKY=
X-Google-Smtp-Source: ABdhPJwQ1HIjZ3iBMGrpYxHCBi5Yj4wl5lBSNWbbUuTcdSPDZLqvJZvGHKDOasyNZO/hWIYSrOnczt92seQK8v7EXPE=
X-Received: by 2002:a17:906:7f15:: with SMTP id d21mr5566137ejr.470.1600787477366;
 Tue, 22 Sep 2020 08:11:17 -0700 (PDT)
MIME-Version: 1.0
References: <1573778407-13250-1-git-send-email-denis@denix.org>
 <CALbNGRQFFrkNuv8---ck=16VLaN09_9G+=r1Ppb-yAerQYEbEw@mail.gmail.com>
 <6396b0dfd5c33ac1633eecd3a2f6d519d87438df.camel@linuxfoundation.org>
 <20191122231639.GN4735@denix.org> <20191122233810.GO4735@denix.org>
In-Reply-To: <20191122233810.GO4735@denix.org>
From: "Martin Jansa" <Martin.Jansa@gmail.com>
Date: Tue, 22 Sep 2020 17:11:06 +0200
Message-ID: <CA+chaQfC8YAWgfBsbMm_8yFasP6iVt04FSYbjQrN8QKJSvAZMw@mail.gmail.com>
Subject: Re: [OE-core] [PATCH v2] distro_features_check: expand with MACHINE_FEATURES and COMBINED_FEATURES, rename
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000f30d6705afe860f9"

--000000000000f30d6705afe860f9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Can you please update the documentation to reflect this bbclass rename?

Patrick Vacek maintainer of meta-updater mentioned in one PR that the
documentation doesn't mention features_check.bbclass:
https://github.com/advancedtelematic/meta-updater/pull/771#issuecomment-683=
618949

It's mentioned in the "Moving to the Yocto Project 3.1 Release" section:
https://www.yoctoproject.org/docs/3.1.2/mega-manual/mega-manual.html#migrat=
ion-3.1-features-check

but then all related variables and class reference only mention the old
distro_features_check name
https://www.yoctoproject.org/docs/3.1.2/mega-manual/mega-manual.html#var-RE=
QUIRED_DISTRO_FEATURES
https://www.yoctoproject.org/docs/3.1.2/mega-manual/mega-manual.html#var-CO=
NFLICT_DISTRO_FEATURES
https://www.yoctoproject.org/docs/3.1.2/mega-manual/mega-manual.html#ref-cl=
asses-distro_features_check

Not sure how this looks in the new sphinx generated documentation.

Thanks

On Sat, Nov 23, 2019 at 12:38 AM Denys Dmytriyenko <denis@denix.org> wrote:

> On Fri, Nov 22, 2019 at 06:16:39PM -0500, Denys Dmytriyenko wrote:
> > On Fri, Nov 22, 2019 at 11:10:14PM +0000, Richard Purdie wrote:
> > > On Fri, 2019-11-22 at 23:58 +0100, Andreas M=C3=BCller wrote:
> > > > Whatever this patch does renaming does nothing but causing me lots =
of
> > > > useles (rebasing) efforts. To me ist is simlpy the worst patch of
> > > > this
> > > > year and thanks for blocking me with this. I am really really
> > > > upset!!!!!!!
> > >
> > > FWIW you can probably unblock yourself by adding a local copy of the
> > > compatibility bbclass with the warning removed. That will then let yo=
u
> > > fix the fallout at a time of your choosing.
> >
> > I thought warning would be relatively harmless... Why would it be
> blocking?
> > Do you want this to be a notice instead?
> >
> >
> > > I was in two minds about the change to be honest but nobody commented
> > > in review and I get really tired of a reputation for saying "no" to
> > > "everything". What probably swung the balance is the ways you can wor=
k
> > > around the change at least temporarily.
> >
> > I was also surprised by relative silence in review. Plus, it was in
> > master-next for over a week and nobody complained either...
>
> And to be fair, this is almost right after the release, so is the best
> time
> for such invasive changes - I did wait and held off submitting it for
> several
> months to not disrupt the release process!
> So such overreaction is rather unwarranted...
>
> --
> Denys
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--000000000000f30d6705afe860f9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Can you please update the documentation to reflect this bb=
class rename?<div><br></div><div>Patrick Vacek maintainer of meta-updater m=
entioned=C2=A0in one PR that the documentation doesn&#39;t mention features=
_check.bbclass:</div><div><a href=3D"https://github.com/advancedtelematic/m=
eta-updater/pull/771#issuecomment-683618949">https://github.com/advancedtel=
ematic/meta-updater/pull/771#issuecomment-683618949</a><br><div><br></div><=
div>It&#39;s mentioned in the &quot;Moving to the Yocto Project 3.1 Release=
&quot; section:</div><div><a href=3D"https://www.yoctoproject.org/docs/3.1.=
2/mega-manual/mega-manual.html#migration-3.1-features-check">https://www.yo=
ctoproject.org/docs/3.1.2/mega-manual/mega-manual.html#migration-3.1-featur=
es-check</a><br></div><div><br></div><div>but then all related variables an=
d class reference only mention the old distro_features_check name</div><div=
><a href=3D"https://www.yoctoproject.org/docs/3.1.2/mega-manual/mega-manual=
.html#var-REQUIRED_DISTRO_FEATURES">https://www.yoctoproject.org/docs/3.1.2=
/mega-manual/mega-manual.html#var-REQUIRED_DISTRO_FEATURES</a><br></div><di=
v><a href=3D"https://www.yoctoproject.org/docs/3.1.2/mega-manual/mega-manua=
l.html#var-CONFLICT_DISTRO_FEATURES">https://www.yoctoproject.org/docs/3.1.=
2/mega-manual/mega-manual.html#var-CONFLICT_DISTRO_FEATURES</a><br></div><d=
iv><a href=3D"https://www.yoctoproject.org/docs/3.1.2/mega-manual/mega-manu=
al.html#ref-classes-distro_features_check">https://www.yoctoproject.org/doc=
s/3.1.2/mega-manual/mega-manual.html#ref-classes-distro_features_check</a><=
br></div><div><br></div><div>Not sure how this looks in the new sphinx gene=
rated documentation.</div></div><div><br></div><div>Thanks</div></div><br><=
div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Nov=
 23, 2019 at 12:38 AM Denys Dmytriyenko &lt;<a href=3D"mailto:denis@denix.o=
rg">denis@denix.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">On Fri, Nov 22, 2019 at 06:16:39PM -0500, Denys Dmytriye=
nko wrote:<br>
&gt; On Fri, Nov 22, 2019 at 11:10:14PM +0000, Richard Purdie wrote:<br>
&gt; &gt; On Fri, 2019-11-22 at 23:58 +0100, Andreas M=C3=BCller wrote:<br>
&gt; &gt; &gt; Whatever this patch does renaming does nothing but causing m=
e lots of<br>
&gt; &gt; &gt; useles (rebasing) efforts. To me ist is simlpy the worst pat=
ch of<br>
&gt; &gt; &gt; this<br>
&gt; &gt; &gt; year and thanks for blocking me with this. I am really reall=
y<br>
&gt; &gt; &gt; upset!!!!!!!<br>
&gt; &gt; <br>
&gt; &gt; FWIW you can probably unblock yourself by adding a local copy of =
the<br>
&gt; &gt; compatibility bbclass with the warning removed. That will then le=
t you<br>
&gt; &gt; fix the fallout at a time of your choosing.<br>
&gt; <br>
&gt; I thought warning would be relatively harmless... Why would it be bloc=
king?<br>
&gt; Do you want this to be a notice instead?<br>
&gt; <br>
&gt; <br>
&gt; &gt; I was in two minds about the change to be honest but nobody comme=
nted<br>
&gt; &gt; in review and I get really tired of a reputation for saying &quot=
;no&quot; to<br>
&gt; &gt; &quot;everything&quot;. What probably swung the balance is the wa=
ys you can work<br>
&gt; &gt; around the change at least temporarily.<br>
&gt; <br>
&gt; I was also surprised by relative silence in review. Plus, it was in <b=
r>
&gt; master-next for over a week and nobody complained either...<br>
<br>
And to be fair, this is almost right after the release, so is the best time=
 <br>
for such invasive changes - I did wait and held off submitting it for sever=
al <br>
months to not disrupt the release process!<br>
So such overreaction is rather unwarranted...<br>
<br>
-- <br>
Denys<br>
-- <br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div>

--000000000000f30d6705afe860f9--
