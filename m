Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f176.google.com (mail-pf0-f176.google.com
	[209.85.192.176])
	by mail.openembedded.org (Postfix) with ESMTP id 54E807899C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 22:18:43 +0000 (UTC)
Received: by mail-pf0-f176.google.com with SMTP id l27so3092645pfk.12
	for <openembedded-core@lists.openembedded.org>;
	Mon, 19 Mar 2018 15:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=QhMmkDbYQ7neWTLX6EgrTM3/mwvh4dWTKvsPpk94I3Q=;
	b=WWgq3w0pMyG6f1h59X4QMLmzhz9tJ0LkTjJnL/fbAZiOoZANvreufRDtJcolzrLCYR
	J+VUjvUAMpQd04fvCT2gE4tX/mrdV2OliRGHbbL5Y2BVUFRsdZ7bdwLcrUI8SIXo8zP1
	mOOWe+ebZiSdPhI6+w4wNE+zA625pXjT0wl0usnwg1+ildlDdB0rt7vr+aBsEFqOMiK+
	xM9P5lhIjJbpKVe03aXyYxoZeVHqRUdaG0Q1zJZLXccOa5uhYz6rerpM+6iHndRB39yG
	MQc4xgkqSIaOTmYy2x7uESRP245T0nGI//WkXZWt8zqbutGCJNL3zgLlapS9INsYxdL4
	Pk0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=QhMmkDbYQ7neWTLX6EgrTM3/mwvh4dWTKvsPpk94I3Q=;
	b=Lo7U64FcrUkEjTHzYIebtGOU1EOZTYLdufvSrc/R3hH8qB5FBpaWgfw6vpJ5jbksEw
	ZhZCAySlYeLmVmUWAtLfpXRSj5zh0ercUfejqxBqjTKkXKXycis536ebumxudXLvhLML
	3UZPCYCtC6KRkG4JdUa3u237whha6uUpl3/ssEM64lXFoiJXAZ+ZBwhtfuoyxXAqkugd
	dULFd5CVigiFhUcAp8hfwST2x3R/tCR3QW9Yk5p9QrOMZWJ5V6IDchcbU1Vyb+Q5riMQ
	bdnjFHe4IyPbhMGZw6o7B/pN3bBXbObQKPgE5R2OKzwxHuUMtDCenb2WYz3CoRjzNmib
	k4lQ==
X-Gm-Message-State: AElRT7E0k5LnfuU6KVSE8jLbkRoG1zMTVgiCeTUFrKICwoKqnif7esqp
	qPpZa+zUf56BfhcduiVszxxweTrx+JHbKelrrcs=
X-Google-Smtp-Source: AG47ELuys6bcivX9xPtjZCtIySnVY0c5bmhpWl+4drM+DuHowzy0MWKw1QYDUaclo81Sp0sRli/t5M2Pvf0jFCY5XFc=
X-Received: by 10.101.73.207 with SMTP id t15mr9734309pgs.204.1521497925230;
	Mon, 19 Mar 2018 15:18:45 -0700 (PDT)
MIME-Version: 1.0
References: <CAPGMVzHyhFkP8Udz8PXT76rW4-ZJAZxm8+vZPa6_2iAPQULqgQ@mail.gmail.com>
In-Reply-To: <CAPGMVzHyhFkP8Udz8PXT76rW4-ZJAZxm8+vZPa6_2iAPQULqgQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 19 Mar 2018 22:18:34 +0000
Message-ID: <CAMKF1srnoJOraLP_aXkQVtsq0xEU=RVdSeDRgTQRwkAoXwj2DA@mail.gmail.com>
To: Rajath C S <rajathcs.1996@gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: Branch shifting [image-build]
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 19 Mar 2018 22:18:44 -0000
Content-Type: multipart/alternative; boundary="089e082222145c2aa60567cb57b5"

--089e082222145c2aa60567cb57b5
Content-Type: text/plain; charset="UTF-8"

On Mon, Mar 19, 2018 at 12:29 PM Rajath C S <rajathcs.1996@gmail.com> wrote:

> What is the reason that we shift to a branch called rocko while installing
> poky?
>  The reason I ask this is , I was getting an error named classes/.pypi
> inherit not found.. So I shifted the branch to master and ran bitbake and
> it doesn't show any errors.
> Will I have any problems later or is shifting branch fine?
>

Branches are important to know, the release branches are what you want to
use for production work master is meant for development so choose wisely

> Thanks
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

--089e082222145c2aa60567cb57b5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div><br><div class=3D"gmail_quote"><div dir=3D"auto">On Mon, Mar 19, 2018 =
at 12:29 PM Rajath C S &lt;<a href=3D"mailto:rajathcs.1996@gmail.com">rajat=
hcs.1996@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div dir=3D"auto"><div dir=3D"auto">What is the reason that we shift to a br=
anch called rocko while installing poky?</div><div dir=3D"auto">=C2=A0The r=
eason I ask this is , I was getting an error named classes/.pypi inherit no=
t found.. So I shifted the branch to master and ran bitbake and it doesn&#3=
9;t show any errors.</div><div dir=3D"auto">Will I have any problems later =
or is shifting branch fine?</div></div></blockquote><div dir=3D"auto"><br><=
/div><div dir=3D"auto">Branches are important to know, the release branches=
 are what you want to use for production work master is meant for developme=
nt so choose wisely=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"a=
uto"><div dir=3D"auto"></div><div dir=3D"auto">Thanks</div></div>
--<br>
_______________________________________________<br>
Openembedded-core mailing list<br>
<a href=3D"mailto:Openembedded-core@lists.openembedded.org" target=3D"_blan=
k">Openembedded-core@lists.openembedded.org</a><br>
<a href=3D"http://lists.openembedded.org/mailman/listinfo/openembedded-core=
" rel=3D"noreferrer" target=3D"_blank">http://lists.openembedded.org/mailma=
n/listinfo/openembedded-core</a><br>
</blockquote></div></div>

--089e082222145c2aa60567cb57b5--
