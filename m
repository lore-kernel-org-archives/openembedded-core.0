Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
 by mx.groups.io with SMTP id smtpd.web09.1897.1620936425089780059
 for <openembedded-core@lists.openembedded.org>;
 Thu, 13 May 2021 13:07:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=k0if8QLb;
 spf=pass (domain: gmail.com, ip: 209.85.217.47, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f47.google.com with SMTP id m17so14239836vsn.10
        for <openembedded-core@lists.openembedded.org>; Thu, 13 May 2021 13:07:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=LQZAUTVQhKM0xon4xHStB1DeQHnACrWNPU5lKpFlaIk=;
        b=k0if8QLbop7TJNQlgx2PRicZnIz+RbGE08nIMXjAsCwsuucwz2UykKli2RzSp0xvj2
         bgmI6C5FCSf5Dz/vwvPZtH80W2be6RQI7mwSYEDP2N6UGRrQ03cOa/0+WzdeiEO6eDgJ
         pW682MB8pEuhECAkgTCEwj4YLzCGIOlYBwH4+N9kXlTMYBgYXEuDj8moene9O3KySRYY
         RDAjyzeIgMTKSJE7sReAEUnWj0YTLZt4YumUFEzyNcXyrUWpbPCumctk4tEQMDLjkieV
         jw0i5au+wbODk482y0Sk4lyOA42Vbi6rzIPmjIvk0klQ2cc1KE05fji0y3mGYxixqVaq
         Hx/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=LQZAUTVQhKM0xon4xHStB1DeQHnACrWNPU5lKpFlaIk=;
        b=f4aHG4UkLIWIvnn5P1HsNiBzgntI2nlbQXJ6il+RQDjcd6c+BejFcy3GdzsiGu5aSk
         NJPHHSrZ7dlUPK6AH9NUlL/Uy/qJ0YL6veOh3OxoEDUw45ILaAABq+mKGqDqs50B+TVd
         j6eKhCouucQ+QkHBFvwGeiaUrRAGAMUpZcIAwTo1M9zftnJm6uyulbllzPLeBZGAzFUW
         oSW9DAx73/Z5gdRFe2rFTFvf6tX+sFup5iLJDjExGSxXbpgXSSP1r4JiqxBLZNZxdOHp
         6ZuP5lW/huj+Ucn6Bfklknc38VmVWBPFgXM1jXgevYUz7zyicgmq86VBKT8W3bpJn3yj
         QqIw==
X-Gm-Message-State: AOAM53174PSBYrH8MM6dQJa0T4wdw8HWiTXJeE6olexh1YvAKb3Rew+9
	PtmCn5XN0IJb45YfB8A2Voe/80YqxpFzohTPLf8=
X-Google-Smtp-Source: ABdhPJwe4GSNdxs5rB2W98H5pHPpjeT//Dl148udDS/GM6iFpA0vhat55EzkGa/WFK0NgQ+X8BcJyA2s/DFcf+MH2mk=
X-Received: by 2002:a67:c401:: with SMTP id c1mr38855928vsk.51.1620936424204;
 Thu, 13 May 2021 13:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <CANNYZj_LDz9xV9iCW-N03xcGho0S12AaCQEvLb54UJw40FYPMw@mail.gmail.com>
 <5132.1620935649772798876@lists.openembedded.org>
In-Reply-To: <5132.1620935649772798876@lists.openembedded.org>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Thu, 13 May 2021 22:06:52 +0200
Message-ID: <CANNYZj9K2m7ucmPihEzSyjXw7Cno-cnX9jgzP081-VeObbmJmg@mail.gmail.com>
Subject: Re: [OE-core] master/main branch renaming and bitbake
To: Benjamin Gilbert <bgilbert@backtick.net>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000c4ad1305c23babf1"

--000000000000c4ad1305c23babf1
Content-Type: text/plain; charset="UTF-8"

On Thu, 13 May 2021 at 21:54, Benjamin Gilbert <bgilbert@backtick.net>
wrote:

> They're not useless though. As a layer maintainer I absolutely want those
> checks, as I want to be aware of any branch configuration changes upstream,
> and to ensure I'm not accepting a change in source revision that points to
> an unattached commit, or one from a branch that's not supposed to be used
> at all.
>
> Yup, if downstream packagers want to manually review such cases, no
> objection from me.  My concern is upstream getting bug reports that say
> "please reinstate this branch and never delete it again or you'll break our
> builds".  See https://github.com/ostreedev/ostree/issues/2360 and
> https://github.com/coreos/go-systemd/issues/371 for examples.
>

It's not that different from deleting or archiving old tarball downloads -
yes it keeps things clean and tidy for upstream, but it will break
someone's automated build that way, no matter how obsolete the code being
downloaded.

Alex

--000000000000c4ad1305c23babf1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">On Thu, 13 May 2021 at 21:54, Benjamin Gilbert &lt;<a href=3D"mailto=
:bgilbert@backtick.net">bgilbert@backtick.net</a>&gt; wrote:<br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">They&#39;re not useless though=
. As a layer maintainer I absolutely want those checks, as I want to be awa=
re of any branch configuration changes upstream, and to ensure I&#39;m not =
accepting a change in source revision that points to an unattached commit, =
or one from a branch that&#39;s not supposed to be used at all.<blockquote>
</blockquote>
Yup, if downstream packagers want to manually review such cases, no objecti=
on from me.=C2=A0 My concern is upstream getting bug reports that say &quot=
;please reinstate this branch and never delete it again or you&#39;ll break=
 our builds&quot;.=C2=A0 See <a href=3D"https://github.com/ostreedev/ostree=
/issues/2360" rel=3D"noopener" target=3D"_blank">https://github.com/ostreed=
ev/ostree/issues/2360</a> and <a href=3D"https://github.com/coreos/go-syste=
md/issues/371" rel=3D"noopener" target=3D"_blank">https://github.com/coreos=
/go-systemd/issues/371</a> for examples.<br></blockquote><div><br></div><di=
v>It&#39;s not that different from deleting or archiving old tarball downlo=
ads -=C2=A0 yes it keeps things clean and tidy for upstream, but it will br=
eak someone&#39;s automated build that way, no matter how obsolete the code=
 being downloaded.</div><div><br></div><div>Alex<br></div></div></div>

--000000000000c4ad1305c23babf1--
