Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com [209.85.128.67])
 by mx.groups.io with SMTP id smtpd.web12.4270.1591127028036372837
 for <openembedded-core@lists.openembedded.org>;
 Tue, 02 Jun 2020 12:43:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=usNwqy7U;
 spf=pass (domain: gmail.com, ip: 209.85.128.67, mailfrom: gzatko@gmail.com)
Received: by mail-wm1-f67.google.com with SMTP id r9so4074504wmh.2
        for <openembedded-core@lists.openembedded.org>; Tue, 02 Jun 2020 12:43:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version;
        bh=KpsZTPuybxabVVGnjGDy2m6K5g71ZKBCy0sOMOe/BQA=;
        b=usNwqy7Uwh/Wpkj5s6+ib0MPBdsb7fGT76nTYHTHbNFiMLs+0jd/SbFWBN+tD5W6lb
         XVqOZOwR+Ax/hTPGMwN1x5gVdz81OkGoMTgi5U9/krBdMcA98paigDtaQav6bsNqUvlZ
         ZbjkyZ3dGrYak7qtp4jKxikFwFGrWpF6hKgn0Zfg18SOgeDp46Lwuz6DwRMMm8JRPP+g
         2cBtvJUtQXk95GnlK2dS5n8MKPpvOwteMN2eqVkfbRBOgF/Bc+tcVTG1G9F6+begBmMG
         vrPhWCf4zneCUTZbfwx5b5nJUr+b7yMQ9KDOLqws+5LrZfNrYvOpPWUzTKoQE3IfkgDg
         g3CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version;
        bh=KpsZTPuybxabVVGnjGDy2m6K5g71ZKBCy0sOMOe/BQA=;
        b=T2FU6FvY8DKl+bbghpZk9BOjWTqaaIXb+Po0zq/GP2kqxQ7aFvzkyfctvnHI+cB8sY
         7OL7RlJVUGNM/yMlH3jraCfp66V9QkCgHt/ZYv+fWd4v+MLvRk/TtHeRlnY2CycGOhJv
         /Rra4QMCVPJ8yKPN4nFR2HoCMwGMyUmvG9O+KGDvOLeKiuYvYW+/hm63+jLt67DOB9NE
         5tuJGZeNbPqWyRJ/bEFnzE+1pPU0CRN/1vc54MKJ4Rkfq3QGc5KHVg8qGOPdunVrARZ6
         HPe/6anRBFKkbun2w54yVd/revZ0oFua4yRCOnZkXPy/M8pw9dhTZxxPwnwoUPieNyzX
         bq/g==
X-Gm-Message-State: AOAM531PdKgbCGgw/LNUJeFm1QqZot/mB9ZFZcMEyYNQNlntz7/NpHmf
	7/kECvp482foVt3GNPcciZs=
X-Google-Smtp-Source: ABdhPJzqy4MR8uxKTS2By89KRgsIvE4N6IAI0G4l9He/vNENH+tqsMlqndu1aUh/Gkuud9Gx70W6KQ==
X-Received: by 2002:a1c:46c3:: with SMTP id t186mr5229742wma.36.1591127026436;
        Tue, 02 Jun 2020 12:43:46 -0700 (PDT)
Return-Path: <gzatko@gmail.com>
Received: from blizzard-1040g6.local (93.184.67.240.host.vnet.sk. [93.184.67.240])
        by smtp.gmail.com with ESMTPSA id 5sm1170284wmd.19.2020.06.02.12.43.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2020 12:43:45 -0700 (PDT)
Message-ID: <70201ad445cf106e80c44c3c5fb831501a2efda8.camel@gmail.com>
Subject: Re: [OE-core] [PATCH] update-alternatives: introduce new package as a opkg-utils spin-off
From: "Gregor Zatko" <gzatko@gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: openembedded-core@lists.openembedded.org
Date: Tue, 02 Jun 2020 21:43:45 +0200
In-Reply-To: <20200602192721.GU17660@denix.org>
References: <20200602190925.384853-1-gzatko@gmail.com>
	 <20200602192721.GU17660@denix.org>
User-Agent: Evolution 3.36.3 
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-6Obq48i4W4UtZaFE1ScN"

--=-6Obq48i4W4UtZaFE1ScN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2020-06-02 at 15:27 -0400, Denys Dmytriyenko wrote:
> On Tue, Jun 02, 2020 at 09:09:25PM +0200, Gregor Zatko wrote:
> > In some cases there is a need for update-alternatives script which gets built
> > within opkg-utils recipe into a standalone package. However, this causes to
> > many unnecessary dependencies, including Python, bc, OpenSSL etc. to be built.
> > 
> > In this commit a standalone lightweight recipe for update-alternatives that
> > shouldn't be dependent on nothing other than bash.
> 
> (R)Depending on bash doesn't make it lightweight anymore. This means you 
> cannot do tiny bash-less images with alternatives?

Well, if I understand everyting correct then yes, it's not possible.
However, I've
mostly been a user of Yocto so please check my reasoning:

- first, I made a comment here
https://bugzilla.yoctoproject.org/show_bug.cgi?id=8879#c4

- if you take a look at 
http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/tree/update-alternatives
you'll simply see it's a shellscript; if we wanted to have it without
bash we'd need a C++
implementation, am I right?

--=-6Obq48i4W4UtZaFE1ScN
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

<html dir=3D"ltr"><head></head><body style=3D"text-align:left; direction:lt=
r;"><div>On Tue, 2020-06-02 at 15:27 -0400, Denys Dmytriyenko wrote:</div><=
blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex; border-left:2px #729fc=
f solid;padding-left:1ex"><pre>On Tue, Jun 02, 2020 at 09:09:25PM +0200, Gr=
egor Zatko wrote:</pre><blockquote type=3D"cite" style=3D"margin:0 0 0 .8ex=
; border-left:2px #729fcf solid;padding-left:1ex"><pre>In some cases there =
is a need for update-alternatives script which gets built</pre><pre>within =
opkg-utils recipe into a standalone package. However, this causes to</pre><=
pre>many unnecessary dependencies, including Python, bc, OpenSSL etc. to be=
 built.</pre><pre><br></pre><pre>In this commit a standalone lightweight re=
cipe for update-alternatives that</pre><pre>shouldn't be dependent on nothi=
ng other than bash.</pre></blockquote><pre><br></pre><pre>(R)Depending on b=
ash doesn't make it lightweight anymore. This means you </pre><pre>cannot d=
o tiny bash-less images with alternatives?</pre></blockquote><div><br></div=
><div>Well, if I understand everyting correct then yes, it's not possible. =
However, I've</div><div>mostly been a user of Yocto so please check my reas=
oning:</div><div><br></div><div>- first, I made a comment here</div><div><a=
 href=3D"https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8879#c4">https=
://bugzilla.yoctoproject.org/show_bug.cgi?id=3D8879#c4</a></div><div><br></=
div><div>- if you take a look at&nbsp;<a href=3D"http://git.yoctoproject.or=
g/cgit/cgit.cgi/opkg-utils/tree/update-alternatives">http://git.yoctoprojec=
t.org/cgit/cgit.cgi/opkg-utils/tree/update-alternatives</a></div><div>you'l=
l simply see it's a shellscript; if we wanted to have it without bash we'd =
need a C++</div><div>implementation, am I right?</div></body></html>

--=-6Obq48i4W4UtZaFE1ScN--
