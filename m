Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id B8F8E772D1
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2017 00:16:50 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id u25so25752147qki.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 16:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=ar6Nlq9wqNfI9JQj1ElXwxRCKjbzKkN/4RQvFHbrkmU=;
	b=EKyeG1GAAfTl2U6Hdav06ULbVYC15jq4tfxbXG7Vv/gaGfylTXWWMsaVM1LOgCrqN0
	EHp7OZtndyUljDDeYnlw4pcJ7aR6GQGE5dcaKQWjld7ZznUiBaMFxhaKaVsGS87MaxW1
	rfTt+IxWIevlIU1dsnGhzG6Uq4X32nQAffpBOB6QTkFQf4NsIpCF7dMnz1i4DXSJ1U8T
	JQP/kTIFt0sVbOsFA3Zw5cJLm/hf3IYKBHRJ6qyr2570tO+NngqPofVulj9c1kwE79bJ
	PGItXNWr9Xf8N69A5ujNGZrP8yps3HRkzQnVWrZAig3jUhtqhq1GcEuHjysrBrWJaGvy
	0gYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=ar6Nlq9wqNfI9JQj1ElXwxRCKjbzKkN/4RQvFHbrkmU=;
	b=eT61bOVT0jIoeCFg7VRQXCFok9k0UAnKjh6zHoQ0ZLUkpRdgUbzfTHBhENCZm+58ci
	qkoADkHqhitexmWMjYmMjZysPCCz1Uy5mPJncJ2jZoOA/L0OtTokJMNVq8eOApJn059x
	cFuKUbjsJx9aIz8zYzWGfwsWzKnt+n7dew8hWnMLe1M1NxeI4nb27/xp89MUeVYk25jQ
	5g7SBvU1sNUuPpQGVXJ8p4lIzPQYp6cBkE9t3ZIZpWB/UvQ2KZJ/feJhBy6EoKOBrrix
	0k2IuyWOwPQjjXzPmWK30d084jvYKI0riWEozXVR/dsZL8OPxRl43bxuswvTj4PTe0pR
	gvEg==
X-Gm-Message-State: AIkVDXLCZA3zTKdxxFLV48sqlFaCYiwSk9fPpzOGQfw4jJZn4BXZ1OxSg1cohhbhR+1dtry9tHXPdInUuPq5Dic6
X-Received: by 10.237.54.1 with SMTP id e1mr13884031qtb.68.1484957810790; Fri,
	20 Jan 2017 16:16:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Fri, 20 Jan 2017 16:16:30 -0800 (PST)
In-Reply-To: <CAJTo0LbjMd+wJtgGePXRTy7YZVBb4rfr69jhcfeawiUGAYLrCQ@mail.gmail.com>
References: <1484917866-24351-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LbjMd+wJtgGePXRTy7YZVBb4rfr69jhcfeawiUGAYLrCQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 21 Jan 2017 00:16:30 +0000
Message-ID: <CAJTo0LazMARfg0pFQjC8+=v3xnQcD0P=-8ByrrSnddOSUmriNg@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] alsa-lib: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Sat, 21 Jan 2017 00:16:51 -0000
Content-Type: multipart/alternative; boundary=001a1142dcf0d1add805468faebd

--001a1142dcf0d1add805468faebd
Content-Type: text/plain; charset=UTF-8

On 21 January 2017 at 00:12, Burton, Ross <ross.burton@intel.com> wrote:

> Computing transaction...warning: Can't install
> alsa-lib-dev-1.1.3-r0.0@core2_32: Can't install
> alsa-lib-dev-1.1.3-r0.0@core2_32: no package provides alsa-lib =
> 1.1.3-r0.0
>

Had a ten second look at 1.1.2, there's an alsa-lib package that contains
/usr/lib/alsa-lib/smixer/*.so.  If these disappeared (or were
non-deterministic) in the 1.1.3 build alsa-lib itself would be empty, and
the dependency would break.

Ross

--001a1142dcf0d1add805468faebd
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 21 January 2017 at 00:12, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D"=
mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&g=
t;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0=
 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div dir=3D"ltr">Computi=
ng transaction...warning: Can&#39;t install alsa-lib-dev-1.1.3-r0.0@core2_<=
wbr>32: Can&#39;t install alsa-lib-dev-1.1.3-r0.0@core2_<wbr>32: no package=
 provides alsa-lib =3D 1.1.3-r0.0<br></div></blockquote></div><br>Had a ten=
 second look at 1.1.2, there&#39;s an alsa-lib package that contains /usr/l=
ib/alsa-lib/smixer/*.so.=C2=A0 If these disappeared (or were non-determinis=
tic) in the 1.1.3 build alsa-lib itself would be empty, and the dependency =
would break.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_=
extra">Ross</div></div>

--001a1142dcf0d1add805468faebd--
