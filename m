Return-Path: <kergoth@gmail.com>
Received: from mail-la0-f50.google.com (mail-la0-f50.google.com
	[209.85.215.50])
	by mail.openembedded.org (Postfix) with ESMTP id B2AD16EE2F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 21:10:15 +0000 (UTC)
Received: by mail-la0-f50.google.com with SMTP id ec20so12440225lab.23
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Feb 2014 13:10:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=8RQhlTuUWFvYryRhlYagmjsitoEJSPkZguQvFcZDJk0=;
	b=t6weWLoWPXkg0I4xifSSGvQuz4nENfiUBS1TpI7lVDozRGsjY6uu41o/Fm7HS965Yc
	lvEiofk2tiVOLCjtZrwbUmPnHgAbvTm9pHPZZjiuzGGmLKh3SC0E9E8Tr+lxVTNkPQe/
	mAl5ASBvVE3tijCCnlvVHNTmNN1VohM+H8GqG8bjeZ1BXVoxPmyFHcYhax53pXt+F9CQ
	YfIciONRL5MAq9ErVSvwTC4kp7pyZg5EiocWG/MCscadY2jUYf+WYA1BFRgX613ylgXH
	OVtTLV51WW5xYLA96W16eudYWi3vILU3yYfuKZQb9bf8Jp0PIQws4H3FcvAQYnC10n+S
	5uvA==
X-Received: by 10.112.204.104 with SMTP id kx8mr22097822lbc.12.1392757815114; 
	Tue, 18 Feb 2014 13:10:15 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.112.35.200 with HTTP; Tue, 18 Feb 2014 13:09:55 -0800 (PST)
In-Reply-To: <1392726422-6634-1-git-send-email-Martin.Jansa@gmail.com>
References: <1392726422-6634-1-git-send-email-Martin.Jansa@gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 18 Feb 2014 14:09:55 -0700
X-Google-Sender-Auth: kjMpsI87cq6VcZVM2sRCrgek50U
Message-ID: <CABcZAN=PaZ+J4XQ6jp6GbTVTDmA2_pGTfdrA2mC52d7ZH2KdGw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package.py: log rpmdeps call
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
X-List-Received-Date: Tue, 18 Feb 2014 21:10:16 -0000
Content-Type: multipart/alternative; boundary=001a11c3c7f0d404fd04f2b4b220

--001a11c3c7f0d404fd04f2b4b220
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 18, 2014 at 5:27 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

>   Maybe we should change meta/classes/package.bbclass to
>   fail when some filedeprunner call fails like this and fix
>   filedeprunner to escape '()' and other possibly dangerous chars
>   it's called like this:
>   processed = list(pool.imap(oe.package.filedeprunner, pkglist))
>

We'd likely be better off just avoiding os.popen entirely in favor of
subprocess based operations, which generally support specifying the command
arguments as a list, and can bypass the shell entirely, avoiding the need
to escape anything. Alternatively, use os.popen2(), which can accept a list
to bypass the shell as well.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a11c3c7f0d404fd04f2b4b220
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra">On Tue, Feb 18, 2014 at 5:27 AM=
, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:martin.jansa@gmail.c=
om" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</span> wrote:<br><div =
class=3D"gmail_quote">

<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":225" style=3D"overflow:hidden">=
=C2=A0 Maybe we should change meta/classes/package.<span class=3D"il">bbcla=
ss</span> to<br>


=C2=A0 fail when some filedeprunner call fails like this and fix<br>
=C2=A0 filedeprunner to escape &#39;()&#39; and other possibly dangerous ch=
ars<br>
=C2=A0 it&#39;s called like this:<br>
=C2=A0 processed =3D list(pool.imap(oe.package.filedeprunner, pkglist))</di=
v></blockquote></div><br></div><div class=3D"gmail_extra">We&#39;d likely b=
e better off just avoiding os.popen entirely in favor of subprocess based o=
perations, which generally support specifying the command arguments as a li=
st, and can bypass the shell entirely, avoiding the need to escape anything=
. Alternatively, use os.popen2(), which can accept a list to bypass the she=
ll as well.<br>

-- <br>Christopher Larson<br>clarson at kergoth dot com<br>Founder - BitBak=
e, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Software Engine=
er, Mentor Graphics
</div></div>

--001a11c3c7f0d404fd04f2b4b220--
