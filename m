Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f180.google.com (mail-io0-f180.google.com
	[209.85.223.180])
	by mail.openembedded.org (Postfix) with ESMTP id D68CC77140
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 19:52:23 +0000 (UTC)
Received: by mail-io0-f180.google.com with SMTP id i75so79659211ioa.3
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 May 2016 12:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=pBd9SQkByvlL4MaJrLGWCHi6AdGz2Gi5h4rt+0MBb4Q=;
	b=DN/3G5Ck9lwK3szE3zBK9/TFQRlu5VL7tSF6gYMma1+OLyfXb6bEkf8lWbGzRrs+1m
	+9Djz8Ip55sT72aTzJeLYK+U6+sTjk3yvl+5YtRPqfi56UTFRwZYxeQ/id9wvsLk9dVs
	gvBrsgP+r0H1MZCENazAGDv/zNDA4Q5Nu7chntaQNxMf+SnqaShMmEddIbUQtMbqV6/a
	tTKZkcHqXOB9e4YviThfFutsKHzh0HwtxwYglPSWXYhAhbqBcXszX7aokMOam9/Q3w6R
	x6bWd1sL/7hVj8drkAZw8b2xFrB2Ey2iJpkevMmRLLmOqGp763n0mEHTTO6+axNDKNeG
	2RAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=pBd9SQkByvlL4MaJrLGWCHi6AdGz2Gi5h4rt+0MBb4Q=;
	b=gZMEzZRISSfv6C3khoND1slfGUBQGdoiDvWwy0OON41bGGqFtnRVtbfWWCw/78Ra01
	+mb8H5krUl9qUNEM0bhAlvK46UoqYlkoYfDEvrXwT8KggRF5cdvCxYZz+pP5xo1W/fix
	LE9DzFCv3F7Klaz5faXJV7Y/gRbEZjunIap2BLUl7/kk6+3Lct0BSNGoVSpAEZFpdg5Z
	NiTBF0uoqSvWyl4rknEEaKrbsjcxcKQSiuPSl14V4EI6dQb6p8PGQIXoX+EfWOoyWlFO
	iFqNw4iz0RlMXnqRCJwJYbenEnA/1V1tQr4wtxlgpcnCGXlgWOUg3dlBVY37SIhSHPAo
	VJRQ==
X-Gm-Message-State: AOPr4FUv9KvUTolGy0E+PBM+yaZcBlCIAPH7iwtZ3yldbymlOIArEHhAuGakFZ3K0UaiJZgxnI9fz4UBqWc98gYM
X-Received: by 10.107.51.213 with SMTP id z204mr6338385ioz.148.1463601144094; 
	Wed, 18 May 2016 12:52:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Wed, 18 May 2016 12:52:04 -0700 (PDT)
In-Reply-To: <CAP9ODKoA2cHXgSt-AzhdKrhAbYE1MZCGZb4GP73fPZRr71JApw@mail.gmail.com>
References: <1463574817-22238-1-git-send-email-herve.jourdain@neuf.fr>
	<1463574817-22238-2-git-send-email-herve.jourdain@neuf.fr>
	<20160518141444.GC2579@jama>
	<CAJTo0La+1imJmmC5-q6crW7GYDty3iLB77FgvreJ22doYoJ5FA@mail.gmail.com>
	<CAP9ODKoA2cHXgSt-AzhdKrhAbYE1MZCGZb4GP73fPZRr71JApw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 May 2016 20:52:04 +0100
Message-ID: <CAJTo0La_RhH65NC=Tyi1vsDnKh1yj+z6fhHm0=r+4jabyLdr9A@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [mesa][PATCH v2 1/1] Fix mesa_populate_packages() when dri is disabled
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
X-List-Received-Date: Wed, 18 May 2016 19:52:24 -0000
Content-Type: multipart/alternative; boundary=001a11440cd049a39705332332c0

--001a11440cd049a39705332332c0
Content-Type: text/plain; charset=UTF-8

On 18 May 2016 at 20:39, Otavio Salvador <otavio.salvador@ossystems.com.br>
wrote:

> From the previous message it seems it won't work.
>

os.path.join has the "interesting" semantics that ("/foo", "/bar") produces
"/bar", whereas oe.path.join is basically just string joining so will
produce /foo/bar.

Ross

--001a11440cd049a39705332332c0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 18 May 2016 at 20:39, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador@o=
ssystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" =
style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><di=
v id=3D":ady" class=3D"a3s aXjCH">From the previous message it seems it won=
&#39;t work.<br></div></blockquote><div><br></div><div>os.path.join has the=
 &quot;interesting&quot; semantics that (&quot;/foo&quot;, &quot;/bar&quot;=
) produces &quot;/bar&quot;, whereas oe.path.join is basically just string =
joining so will produce /foo/bar.</div><div><br></div><div>Ross=C2=A0</div>=
</div><br></div></div>

--001a11440cd049a39705332332c0--
