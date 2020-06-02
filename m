Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com [209.85.128.65])
 by mx.groups.io with SMTP id smtpd.web11.4282.1591127130978650817
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 12:45:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=dkqBqkj+;
 spf=pass (domain: gmail.com, ip: 209.85.128.65, mailfrom: gzatko@gmail.com)
Received: by mail-wm1-f65.google.com with SMTP id f185so4342931wmf.3
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 12:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=XyZfUcRxLov8ziw5OQxDGMeRUgeBI9COo8GjCOcbUQc=;
        b=dkqBqkj+z1U/1VFOvQW66ePpfQwWPRqc0xqJ5wDohiEG+ETGUB5qZ7uqm99mKXbfsB
         TgsUsgcv2ohV37n/Q+S+/fItD+5+cTSbcc9lCH+RBFwAbARY7l+qUTa3Ii9IeUY4KMKr
         QAvFWPdJgtMJ71uT5dax6+bgq3KSO/Jv3qH5Sm22zCacxeRiE/DLiyhioCnXCXYLg3x9
         Q2jc8wC3LPMrqrmKtJbhcEWnjfy8579SSzeRrFGesvuLvpMZM4A3+EU1R017xWCOmsH2
         1OqoL8Q+EVRzVBZrTf7/1v8FOlvFPJKh51CtcV+TruVrR0yOkCLp6R9F5bRcL4K2VL8/
         bKdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=XyZfUcRxLov8ziw5OQxDGMeRUgeBI9COo8GjCOcbUQc=;
        b=qYNr0puBUl7twt5tyFUeXwizsm4xZqjGl12jLRoufoFy8r5DJxS2XAqLw1CAvWjGNW
         kkSDBPgACkzmlbJkXmEoEu/BlgHcztxiEwvQ7SDngrAbXf6tYj8kKdU3NuNuqe+zWwYu
         5a3UvWndjU4QdR+/HBciMdh0HaFFgGmaIzIhA6ZZ7zjkZ2O0HNIVzwwzeBloJB/nQaiy
         VXkeVD5vzq7OcOyYXiedLTvb4hYlWHWAgv0ZlWreYvCXdkekvgUFTYxMQK906J+1PEaZ
         OOOF8A9ohZ4rNCiGKrQkDUX3ucsLR2ix/0Mur3AJiq7cgrD+goYtpVszV4dYQfcnvZ67
         tn+w==
X-Gm-Message-State: AOAM532t9edwe1m5r15vDGnhsv+WpaP6kRvouRGzHSgtsKlqQVZx3sWJ
	Q0jMGlM+A1dvCj+gLohCjPOysHG6O+EIBg==
X-Google-Smtp-Source: ABdhPJx6cmVpndwEgeo3nl6PJKks06+1zynqgOI+fOxRKe4nxws9ygjzpAKyY8wgInlRWml9J4zZcA==
X-Received: by 2002:a05:600c:23ce:: with SMTP id p14mr5504066wmb.77.1591127129634;
        Tue, 02 Jun 2020 12:45:29 -0700 (PDT)
Return-Path: <gzatko@gmail.com>
Received: from blizzard-1040g6.local (93.184.67.240.host.vnet.sk. [93.184.67.240])
        by smtp.gmail.com with ESMTPSA id j68sm11875wrj.28.2020.06.02.12.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 12:45:29 -0700 (PDT)
Message-ID: <bded0f0277713e63b4df6f8657acee567229e0eb.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] update-alternatives: introduce new package as a opkg-utils spin-off
From: "Gregor Zatko" <gzatko@gmail.com>
To: Andreas Oberritter <obi@opendreambox.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 02 Jun 2020 21:45:28 +0200
In-Reply-To: <20200602214305.6a3500f2@opendreambox.org>
References: <20200602190925.384853-1-gzatko@gmail.com>
	 <20200602214305.6a3500f2@opendreambox.org>
User-Agent: Evolution 3.36.3 
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-gbHLEdC0CtSXih0c/KEF"

--=-gbHLEdC0CtSXih0c/KEF
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-02 at 21:43 +0200, Andreas Oberritter wrote:
> Hello Gregor,
> On Tue,  2 Jun 2020 21:09:25 +0200"Gregor Zatko" <gzatko@gmail.com>
> wrote:
> > In some cases there is a need for update-alternatives script which
> > gets builtwithin opkg-utils recipe into a standalone package.
> > However, this causes tomany unnecessary dependencies, including
> > Python, bc, OpenSSL etc. to be built.
> > In this commit a standalone lightweight recipe for update-
> > alternatives thatshouldn't be dependent on nothing other than bash.
> > https://bugzilla.yoctoproject.org/show_bug.cgi?id=8879
> > 
> > Signed-off-by: Gregor Zatko <gzatko@gmail.com>---
> > .../conf/distro/include/default-providers.inc |  6 +--
> > meta/conf/layer.conf                          |  3 +-
> > .../packagegroups/packagegroup-self-hosted.bb |  1 + .../opkg-
> > utils/opkg-utils_0.4.2.bb            | 25 +--------- .../update-
> > alternatives_0.4.2.bb              | 49 +++++++++++++++++++
> 
> why did you change the name from update-alternatives-opkg to update-
> alternatives? I would prefer to keep the suffix in order to be able
> to distinguish it more easily from other implementations, e.g.
> dpkg's.
> Best regards,Andreas

I have no problem to revert the name back to original. However, I'm not
sure whether this patch will be accepted because it seems to solve only
a minimal part of the problem or nothing at all :-)

--=-gbHLEdC0CtSXih0c/KEF
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Tue, 2020-06-02 at 21:43 +0200, Andreas Oberritter wrote:</div>=
<blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729f=
cf solid;padding-left:1ex"><pre>Hello Gregor,</pre><pre><br></pre><pre>On T=
ue,  2 Jun 2020 21:09:25 +0200</pre><pre>"Gregor Zatko" &lt;</pre><a href=
=3D"mailto:gzatko@gmail.com"><pre>gzatko@gmail.com</pre></a><pre>&gt; wrote=
:</pre><pre><br></pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex;=
 border-left:2px #729fcf solid;padding-left:1ex"><pre>In some cases there i=
s a need for update-alternatives script which gets built</pre><pre>within o=
pkg-utils recipe into a standalone package. However, this causes to</pre><p=
re>many unnecessary dependencies, including Python, bc, OpenSSL etc. to be =
built.</pre><pre><br></pre><pre>In this commit a standalone lightweight rec=
ipe for update-alternatives that</pre><pre>shouldn't be dependent on nothin=
g other than bash.</pre><pre><br></pre><a href=3D"https://bugzilla.yoctopro=
ject.org/show_bug.cgi?id=3D8879"><pre>https://bugzilla.yoctoproject.org/sho=
w_bug.cgi?id=3D8879</pre></a><pre><br></pre><pre><br></pre><pre>Signed-off-=
by: Gregor Zatko &lt;</pre><a href=3D"mailto:gzatko@gmail.com"><pre>gzatko@=
gmail.com</pre></a><pre>&gt;</pre><pre>---</pre><pre> .../conf/distro/inclu=
de/default-providers.inc |  6 +--</pre><pre> meta/conf/layer.conf          =
                |  3 +-</pre><pre> .../packagegroups/packagegroup-self-host=
ed.bb |  1 +</pre><pre> .../opkg-utils/opkg-utils_0.4.2.bb            | 25 =
+---------</pre><pre> .../update-alternatives_0.4.2.bb              | 49 ++=
+++++++++++++++++</pre></blockquote><pre><br></pre><pre>why did you change =
the name from update-alternatives-opkg to update-alternatives? I would pref=
er to keep the suffix in order to be able to distinguish it more easily fro=
m other implementations, e.g. dpkg's.</pre><pre><br></pre><pre>Best regards=
,</pre><pre>Andreas</pre></blockquote><div><br></div><div>I have no problem=
 to revert the name back to original. However, I'm not sure whether this pa=
tch will be accepted because it seems to solve only a minimal part of the p=
roblem or nothing at all :-)</div></body></html>

--=-gbHLEdC0CtSXih0c/KEF--
