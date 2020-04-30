Received: from mail-vs1-f67.google.com (mail-vs1-f67.google.com [209.85.217.67])
 by mx.groups.io with SMTP id smtpd.web10.2818.1588277833455552516
 for <openembedded-core@lists.openembedded.org>;
 Thu, 30 Apr 2020 13:17:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=fh55nlto;
 spf=pass (domain: gmail.com, ip: 209.85.217.67, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f67.google.com with SMTP id h30so4991539vsr.5
        for <openembedded-core@lists.openembedded.org>; Thu, 30 Apr 2020 13:17:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YTIyXv9ikaOLNe9mwYoXx+Y07LxXgR3aHNJk1JBl4a4=;
        b=fh55nlto8bguva1lsc1deiAJIyXTRUavVcz7YM5i1dAfoJdumnBFAirzp0b4Q1ZcRn
         ne3fimYz28pHbH1f41R2x0yOu8YwVyu+kYnQTA+KeC9Iexu2on32TywHl29IBCC8CQxs
         GLMVcddBV7pIK2eYC0NRa4x18rFAbC7p3U/V3IxHeTtJtyWSlibntU17wie2Wf1mvvo2
         lQbjJnp0dn2+0kx6bkAjjANHfB4bVNRySDmv9jwf1xMp9eZ1W4V0Yl4hUy1DMZabijc5
         WVsAYHAeAiXTjPkszI3RH0ed2U4UOrzjZqkt9cgcrv7hpR3q2spnneinUSTi70CD3IwQ
         yZaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YTIyXv9ikaOLNe9mwYoXx+Y07LxXgR3aHNJk1JBl4a4=;
        b=OyTK3ck8GL0whKeVxAgIvCn4xFEt3PKWc4ntdWfty9dNrKiFn485m2rvZAHFhutuhq
         wi+6ntbmmQ5zhVNsW2hJ6ZrShnAU1xL3xDG4Lj27dWwjp9f6oBZXOWLotdt4yv7J4BZ9
         TeQZP+gedv+dbB/pNLrfD5v+dYOetiBoksHUss2EN0wJYvWVADiLfHpmqmI6Z2bqcXC2
         VBTpSR7nrFxeM/BFkB13/jTuI4VsHHnC2eTp2S7VXlcSxedLbah4r/tBG19cEAHlvAVz
         OOfo10+3rHvLEl/jobmSshChwu8cju8rJ7TD2y3yTe0b5N3iB6SmRbifvo83oL0m8fQK
         LhFA==
X-Gm-Message-State: AGi0PuaJ+dw9u7igYqa/jFjltEUFJO3XX/IhLOM4ki0KbLxRJpHYXIDv
	rk3ByqbiY1OTIuE3QDPPw65pnybBYQ12CKsYjtM=
X-Google-Smtp-Source: APiQypLkMaKDMckNqntH6HbRv7T1Hh3FRkVOzuJ7xi1MbZCwNf154CGyOa1wspInCnsEUUoaIUwiH2czYVz6XdNDZIE=
X-Received: by 2002:a67:8b46:: with SMTP id n67mr626639vsd.35.1588277832560;
 Thu, 30 Apr 2020 13:17:12 -0700 (PDT)
MIME-Version: 1.0
References: <20200430095815.2824-1-alex.kanavin@gmail.com> <20200430095815.2824-5-alex.kanavin@gmail.com>
 <3bf99c3f-7ab1-d4ad-e8e1-c462222c34a8@gmail.com> <CANNYZj90=e_zRbAcUT5zNZ-S5StHgPTJg_EJwp_4jdQ15ykWuA@mail.gmail.com>
 <6a314323-ec76-5375-c37e-dfb5f32cfb71@gmail.com> <CAJ86T=XR+CWD8T=HLXUrfwUoiOjcwf2sifb1B4OWT=76OzKjQA@mail.gmail.com>
In-Reply-To: <CAJ86T=XR+CWD8T=HLXUrfwUoiOjcwf2sifb1B4OWT=76OzKjQA@mail.gmail.com>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 30 Apr 2020 22:17:01 +0200
Message-ID: <CANNYZj-TcGD6QJ1Vnjme4fpZ4uwQB-LAZ-coaSm+jXsjiPHe4g@mail.gmail.com>
Subject: Re: [OE-core] [PATCH 05/17] kmscube: update to latest commit
To: Andre McCurdy <armccurdy@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000003b58505a487c09c"

--00000000000003b58505a487c09c
Content-Type: text/plain; charset="UTF-8"

On Thu, 30 Apr 2020 at 22:05, Andre McCurdy <armccurdy@gmail.com> wrote:

>
> "No way to understand it" seems a little over dramatic :-) It's
> testing for the availability of a function (gbm_bo_map) within a
> library (libgbm) and then making some code and one of the source files
> conditional on the result of the test.
>
>
> https://www.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Libraries.html
>

Andre, I would be more sympathetic to this, if more people would actually
work on core recipe upgrades, but alas, it seems like it's now me alone,
despite all the mail that AUH sends to supposed 'maintainers'. I have about
60 updates queued [1], and 60 more yet to come, so when I see a patch like
this (not trivial to rebase, abandoned by original submitter, not possible
to test), I simply drop it so that progress can be made. If you can help,
please do.

[1]
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates

Alex

--00000000000003b58505a487c09c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Thu, 30 Apr 2020 at 22:05, Andre McCur=
dy &lt;<a href=3D"mailto:armccurdy@gmail.com">armccurdy@gmail.com</a>&gt; w=
rote:<br></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><br>
&quot;No way to understand it&quot; seems a little over dramatic :-) It&#39=
;s<br>
testing for the availability of a function (gbm_bo_map) within a<br>
library (libgbm) and then making some code and one of the source files<br>
conditional on the result of the test.<br>
<br>
=C2=A0 <a href=3D"https://www.gnu.org/software/autoconf/manual/autoconf-2.6=
7/html_node/Libraries.html" rel=3D"noreferrer" target=3D"_blank">https://ww=
w.gnu.org/software/autoconf/manual/autoconf-2.67/html_node/Libraries.html</=
a><br></blockquote><div><br></div><div>Andre, I would be more sympathetic t=
o this, if more people would actually work on core recipe upgrades, but ala=
s, it seems like it&#39;s now me alone, despite all the mail that AUH sends=
 to supposed &#39;maintainers&#39;. I have about 60 updates queued [1], and=
 60 more yet to come, so when I see a patch like this (not trivial to rebas=
e, abandoned by original submitter, not possible to test), I simply drop it=
 so that progress can be made. If you can help, please do.<br></div><div><b=
r></div><div>[1] <a href=3D"http://git.yoctoproject.org/cgit/cgit.cgi/poky-=
contrib/log/?h=3Dakanavin/package-version-updates">http://git.yoctoproject.=
org/cgit/cgit.cgi/poky-contrib/log/?h=3Dakanavin/package-version-updates</a=
></div><div><br></div><div>Alex<br></div></div></div>

--00000000000003b58505a487c09c--
