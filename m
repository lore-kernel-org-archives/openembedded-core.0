Return-Path: <steve@sakoman.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ECAD3C433EF
	for <webhook@archiver.kernel.org>; Sun,  5 Dec 2021 14:06:12 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com
 [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.web08.37694.1638713171900436401
 for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 06:06:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@sakoman-com.20210112.gappssmtp.com header.s=20210112
 header.b=aRNBxxch;
 spf=softfail (domain: sakoman.com, ip: 209.85.221.50,
 mailfrom: steve@sakoman.com)
Received: by mail-wr1-f50.google.com with SMTP id c4so16654204wrd.9
        for <openembedded-core@lists.openembedded.org>;
 Sun, 05 Dec 2021 06:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sakoman-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3LbGbPdwcYhyinhZMafcYtW1oVkC7qx053UplTnpwEY=;
        b=aRNBxxch9N38PtZdB+mL/SES9ULfH8PenJL6LkmDXmrWtdjfrOWyy9ZhokeN3lbYzN
         JanNB2gx5vFAbc1mvYEF+Ix5pMCLWSkMstXV5Gr3H/ZZNh/RWYpfS1/PgGDZCkVRWHoS
         N/d8tn+0d5GDHDlvJSzjuNifDATgqWuiHJkeiswtfMYsZO1PKLQRAPKObmyHH34/b2q6
         UKK6AwnZd7EPhvT+xqIwqEXd4wMVOf08s+Wtse+LnAN5IX+wUgwRjLQha57Qv9fTyXuI
         ujAUecFBWXUJR5JoXa9IBM7pKkmKfHjHquS863A5lmgSYSYN9pz4DR7lsBaIUuoV8qcE
         7+Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3LbGbPdwcYhyinhZMafcYtW1oVkC7qx053UplTnpwEY=;
        b=3Mlyk+tjBy9lQtX++uRHupDBqiLj2bCo2dVcoDE8wxjXZGPkbSrTazlEq4jorLV24G
         CKhn3UhimQDhpifFLMdFQMLxYKfE9vH0G14WrWWllEIaTe6KQTZl1/1BvRQnFgX8uD6o
         cMDCHu5+BgzFEqkoABKy7A1pAyeAHJB1/NMnn0gXGO2wm+85SHU7AH5t7B/RL9hSrSm1
         XL86C7NPEvrV7qX/ihY6Bp0L8jCyb3ZLjMzu9+ecuwKMmwFjKeLYidRTay5N2r7h9Lu3
         iflJogarJV3Fbqd0EYo45aAXZ1TZa442P1RIphjqDAmsO80Sxc38VZw5685Tpg2793sZ
         8lxA==
X-Gm-Message-State: AOAM530fJIfbz0KoWKj4T68h37y76dhvNMyVKLueb1twswWL7uKSjm3H
	UCQMZUv2b/kGnvVwZp2huarBjEboXxjTqDEnMRcdtA==
X-Google-Smtp-Source: 
 ABdhPJxGVEeR8wDu1VJYZWYV8z/Vp564UysF5T3bsnQ2R+jdy03RWsRL50fcSySuerB9weVZ6QugSLlfcvafwYA5mOY=
X-Received: by 2002:a05:6000:92:: with SMTP id
 m18mr36382912wrx.617.1638713170235;
 Sun, 05 Dec 2021 06:06:10 -0800 (PST)
MIME-Version: 1.0
References: <cover.1638555254.git.steve@sakoman.com>
 <2a157263e5632146b28fb3c0678c18c21f357d34.1638555254.git.steve@sakoman.com>
 <778109a1ac6465c3639a8e794cb9613ef472a908.camel@linuxfoundation.org>
In-Reply-To: 
 <778109a1ac6465c3639a8e794cb9613ef472a908.camel@linuxfoundation.org>
From: Steve Sakoman <steve@sakoman.com>
Date: Sun, 5 Dec 2021 04:05:57 -1000
Message-ID: 
 <CAOSpxdbiEAY5f0h_C6Uhggca8RoA-hWYN5bw2hiha7hADm=2Cg@mail.gmail.com>
Subject: Re: [OE-core][dunfell 01/18] cve-extra-exclusions: add db CVEs to
 exclusion list
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
 <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="00000000000066a6d805d266a4ec"
List-Id: <openembedded-core.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-core@lists.openembedded.org>; Sun, 05 Dec 2021 14:06:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-core/message/159193

--00000000000066a6d805d266a4ec
Content-Type: text/plain; charset="UTF-8"

On Sun, Dec 5, 2021, 2:39 AM Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Fri, 2021-12-03 at 08:18 -1000, Steve Sakoman wrote:
> > Since Oracle relicensed bdb, the open source community is slowly but
> surely replacing bdb with
> > supported and open source friendly alternatives. As a result these CVEs
> are unlikely to ever be fixed.
> >
> > Signed-off-by: Steve Sakoman <steve@sakoman.com>
> > ---
> >  meta/conf/distro/include/cve-extra-exclusions.inc | 9 ++++++++-
> >  1 file changed, 8 insertions(+), 1 deletion(-)
> >
> > diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc
> b/meta/conf/distro/include/cve-extra-exclusions.inc
> > index a6f52b5de7..e02a4d1fde 100644
> > --- a/meta/conf/distro/include/cve-extra-exclusions.inc
> > +++ b/meta/conf/distro/include/cve-extra-exclusions.inc
> > @@ -44,7 +44,14 @@ CVE_CHECK_WHITELIST += "CVE-2010-4756"
> >  # exposing this interface in an exploitable way
> >  CVE_CHECK_WHITELIST += "CVE-2020-29509 CVE-2020-29511"
> >
> > -
> > +# db
> > +# Since Oracle relicensed bdb, the open source community is slowly but
> surely replacing bdb with
> > +# supported and open source friendly alternatives. As a result these
> CVEs are unlikely to ever be fixed.
> > +CVE_CHECK_WHITELIST += "CVE-2015-2583 CVE-2015-2624 CVE-2015-2626
> CVE-2015-2640 CVE-2015-2654 \
> > +CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775
> CVE-2015-4776 CVE-2015-4777 \
> > +CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782
> CVE-2015-4783 CVE-2015-4784 \
> > +CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789
> CVE-2015-4790 CVE-2016-0682 \
> > +CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981"
> >
> >  #### CPE update pending ####
> >
>
>
> Do we need to fix this in master first?


Yes, of course!  Thanks for catching this. I'll submit for master, then
cherry-pick.

Steve

--00000000000066a6d805d266a4ec
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sun, Dec 5, 2021, 2:39 AM Richard Purdie &lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie@linuxfoundat=
ion.org</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"=
margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Fri, 2021=
-12-03 at 08:18 -1000, Steve Sakoman wrote:<br>
&gt; Since Oracle relicensed bdb, the open source community is slowly but s=
urely replacing bdb with<br>
&gt; supported and open source friendly alternatives. As a result these CVE=
s are unlikely to ever be fixed.<br>
&gt; <br>
&gt; Signed-off-by: Steve Sakoman &lt;<a href=3D"mailto:steve@sakoman.com" =
target=3D"_blank" rel=3D"noreferrer">steve@sakoman.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 meta/conf/distro/include/cve-extra-exclusions.inc | 9 ++++++++-<=
br>
&gt;=C2=A0 1 file changed, 8 insertions(+), 1 deletion(-)<br>
&gt; <br>
&gt; diff --git a/meta/conf/distro/include/cve-extra-exclusions.inc b/meta/=
conf/distro/include/cve-extra-exclusions.inc<br>
&gt; index a6f52b5de7..e02a4d1fde 100644<br>
&gt; --- a/meta/conf/distro/include/cve-extra-exclusions.inc<br>
&gt; +++ b/meta/conf/distro/include/cve-extra-exclusions.inc<br>
&gt; @@ -44,7 +44,14 @@ CVE_CHECK_WHITELIST +=3D &quot;CVE-2010-4756&quot;<=
br>
&gt;=C2=A0 # exposing this interface in an exploitable way<br>
&gt;=C2=A0 CVE_CHECK_WHITELIST +=3D &quot;CVE-2020-29509 CVE-2020-29511&quo=
t;<br>
&gt;=C2=A0 <br>
&gt; -<br>
&gt; +# db<br>
&gt; +# Since Oracle relicensed bdb, the open source community is slowly bu=
t surely replacing bdb with<br>
&gt; +# supported and open source friendly alternatives. As a result these =
CVEs are unlikely to ever be fixed.<br>
&gt; +CVE_CHECK_WHITELIST +=3D &quot;CVE-2015-2583 CVE-2015-2624 CVE-2015-2=
626 CVE-2015-2640 CVE-2015-2654 \<br>
&gt; +CVE-2015-2656 CVE-2015-4754 CVE-2015-4764 CVE-2015-4774 CVE-2015-4775=
 CVE-2015-4776 CVE-2015-4777 \<br>
&gt; +CVE-2015-4778 CVE-2015-4779 CVE-2015-4780 CVE-2015-4781 CVE-2015-4782=
 CVE-2015-4783 CVE-2015-4784 \<br>
&gt; +CVE-2015-4785 CVE-2015-4786 CVE-2015-4787 CVE-2015-4788 CVE-2015-4789=
 CVE-2015-4790 CVE-2016-0682 \<br>
&gt; +CVE-2016-0689 CVE-2016-0692 CVE-2016-0694 CVE-2016-3418 CVE-2020-2981=
&quot;<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 #### CPE update pending ####<br>
&gt;=C2=A0 <br>
<br>
<br>
Do we need to fix this in master first?</blockquote></div></div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Yes, of course!=C2=A0 Thanks for catchin=
g this. I&#39;ll submit for master, then cherry-pick.</div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Steve</div><div dir=3D"auto"></div></div>

--00000000000066a6d805d266a4ec--

