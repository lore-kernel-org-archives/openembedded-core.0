Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f170.google.com (mail-io0-f170.google.com
	[209.85.223.170])
	by mail.openembedded.org (Postfix) with ESMTP id 68D66731D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 15:43:22 +0000 (UTC)
Received: by mail-io0-f170.google.com with SMTP id 9so218763627iom.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Feb 2016 07:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=mWgrlyel/FqFbHX/cV0ja3nUqQd02DErO6SAe+EWc0k=;
	b=KSCDVO69k0FBu7BiTjfzjqkH5TiH7vxqWJoPkSNy/FxY/a1Ra0Zw06LNB6OPeThDPY
	0JJPB37TB3YhN9nkbT7CS2Da4lALRM/rhkDYq9uA6y0pLVYzGWGTLWE36YNLp49ZjMHh
	H47HI2WJ4GuFkUMbYubkZmWvMYRjSxBa8x8/knebLs+8kE7ppSsZHjVoqLSzFoHFSTjz
	5pIPm+UfEL2YEjdxVTno3gLQZhLDqzKA+0BhaoD0OgjMMVFdXZQPbPIolW7WBSS/bEkD
	F3INJ2jZprTGwhbIHFWsahOJC9EurU0G+Wglg2qnI9aAw0XV6YaLo5OFUTMXJeiK3PX7
	kRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=mWgrlyel/FqFbHX/cV0ja3nUqQd02DErO6SAe+EWc0k=;
	b=iOJDBwcytJJmRfcs9Flih+PSGCpaA54ZR3znIe6+R5L3VR4JrATrzZC1x1GvpTVMxI
	qGvH5ozmzDZIkIb/d6itvSKyUcSY6MT5ALreI+kb8aqgjSIepgUNLbwkeDxWNgvHXa3/
	qUmR/JwTaACxXPcQtLmx3bOxY16KDCQ2h/UgHFsslLQnxyXH8cUsZdMKK8OTJPHbOBzM
	YlHn4+Qx+4mq7eSEd9A8/JBi/SefDE9e1g4NODG5YUDQPqkZj6tQ+cjPfzEINHSBnfRi
	zwqwBtLp5HC+gvd8Kfm2z8MZpso3GKG3+0QOsWBA9FMvpWQ8y2h6AsyhmFdgUCqUhi0a
	3grQ==
X-Gm-Message-State: AG10YOTt0SiJLTgbOGLpyHxKxQYPHhKFJSY6mxcRdgBiYVnu3JzLC1KADfAZslYxAo8kF9h8bcHMQiV/O0fONJbp
X-Received: by 10.107.3.220 with SMTP id e89mr32381042ioi.99.1456242202935;
	Tue, 23 Feb 2016 07:43:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Tue, 23 Feb 2016 07:43:03 -0800 (PST)
In-Reply-To: <CAMKF1sox=Q5KCSZq01jkDxBphd45wFo0+eKqi=tF6D6xdHc9cw@mail.gmail.com>
References: <1456240902-31768-1-git-send-email-maxin.john@intel.com>
	<CAMKF1sox=Q5KCSZq01jkDxBphd45wFo0+eKqi=tF6D6xdHc9cw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Feb 2016 15:43:03 +0000
Message-ID: <CAJTo0LbEKCDpFjffTiVwhC4E6jkUA3FydUcBC5LUgp4rnEm=Lw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] argp-standalone: make it available for non-musl systems too
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
X-List-Received-Date: Tue, 23 Feb 2016 15:43:22 -0000
Content-Type: multipart/alternative; boundary=001a113f0e7c369cce052c71cf3c

--001a113f0e7c369cce052c71cf3c
Content-Type: text/plain; charset=UTF-8

On 23 February 2016 at 15:40, Khem Raj <raj.khem@gmail.com> wrote:

> Uclibc has its own argp implemented as libuargp so please use that you
> dont need yet another implementation
>
So the proper fix is to change rng-tools so it doesn't depend on
argp-standalone on uclibc I guess.

Ross

--001a113f0e7c369cce052c71cf3c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On 23 February 2016 at 15:40, K=
hem Raj <span dir=3D"ltr">&lt;<a href=3D"mailto:raj.khem@gmail.com" target=
=3D"_blank">raj.khem@gmail.com</a>&gt;</span> wrote:<br><div class=3D"gmail=
_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border=
-left:1px #ccc solid;padding-left:1ex"><p dir=3D"ltr">Uclibc has its own ar=
gp implemented as libuargp so please use that you dont need yet another imp=
lementation</p></blockquote></div>So the proper fix is to change rng-tools =
so it doesn&#39;t depend on argp-standalone on uclibc I guess.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113f0e7c369cce052c71cf3c--
