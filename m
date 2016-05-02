Return-Path: <kergoth@gmail.com>
Received: from mail-ig0-f195.google.com (mail-ig0-f195.google.com
	[209.85.213.195])
	by mail.openembedded.org (Postfix) with ESMTP id 68FD6731D5
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 May 2016 19:31:44 +0000 (UTC)
Received: by mail-ig0-f195.google.com with SMTP id c3so137689igl.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2016 12:31:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=WmxoDVUs6y9VgFrMDeP/Pki7lZq1KX6Sk3itSJfM+5c=;
	b=PuNxt/RvvCFg/cIHsMGt7hbgq87k22rmrpFmU0JX3lNHg5W3Ht/UOAJFlsQFEVdTD2
	AUFwJlj3ozAxr5RN6KFNUhji3Os304zTgBiINL4QwRSsgMyGH270+jE3vpai5dDfIG0l
	ibanXlK7gK/Txh+K2cKY11b7Znhl8CgsmVhXxp4l86ZIWlgqSq0pM/lQIaRRrBKu0Fnz
	KlxNdlzwqLIGgl9BMZcRYg0q5G0g09MHsR3WDbbxfgyFkYHqCb5ywED8j1Dh7tT3E52Y
	SiGSg5mt9vD56+4jgIf40fcIAa61WKtR9oeGwE+UNBOlXkd6ndw2uB6MdFiddWQPnES7
	nhhw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mentor-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=WmxoDVUs6y9VgFrMDeP/Pki7lZq1KX6Sk3itSJfM+5c=;
	b=O8rlB0cTO5a6u+4lnEdJbc25SDyl2fUA1rCeg5uOEbjlpWa6pPwdV0tHBr3uBjeQmD
	Nmh35benc674oXwlVcJhja5SS4Y0ggpvs0JLryGfXyj7rTcID7grqttv7ZnANNIX9rKh
	5n5pq6Pda4GR1fNkVQW14Ri9znSzuLOIQo5nxdW7NKuUssvYjQtys0qEHJ7ZUr/klLKu
	ebyY1TIAQzK6alB06MnERvdHUPI9BHxedAjrOGajK4LXSpIOx466a7F4lTvnc//OAK4Z
	EIOIUrjIPL+Vq8YBJLjPqbXF5A/iqRQS6g4TicH1ARo9jQcghdxXzC1EKuBxkxBwrmm+
	Fqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=WmxoDVUs6y9VgFrMDeP/Pki7lZq1KX6Sk3itSJfM+5c=;
	b=jbn9oMJes6B+O3YXifar9EMjAJyz5ETyHHdhAmGYWTy+mk3l4HGvGdmZjKJgAoFWlk
	MTX2iq8F09Z6Z6Y9fZnlSiwpgxoAfzuTKBD2Ih8Ce6qgLJqqOXFFxk7UXPF3h4eFiAi7
	IOFMxCPeAquxqsQWGZYqRnAOMQLdnmg64G/kHYHQUjZY+nZBedaIpOsl83Bo6EF8R0JP
	cUWS4MJVoT5VOmxeVpuXWox4FvOh5Qwi9qw5iIgD6q30aIwGn5UHye6sUtbmY1de5Pw/
	e2DXfL8gc9v+THQW8gy2ZuNjOOFWwxzX/5/rwc/CqYpznAbV+pOp5Fbh9fZ/HgPtls/3
	hy7g==
X-Gm-Message-State: AOPr4FXw9sxF+k5O4LzaTirvYFNmIHKwg2qZJsXHel4VUjV/Rin4ZBf9xcok1XtbRUFkQpzjuqDwklR8qHPQ4A==
X-Received: by 10.50.143.1 with SMTP id sa1mr23709121igb.20.1462217504618;
	Mon, 02 May 2016 12:31:44 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.134.70 with HTTP; Mon, 2 May 2016 12:31:25 -0700 (PDT)
In-Reply-To: <cover.1462216694.git.chris_larson@mentor.com>
References: <cover.1462216694.git.chris_larson@mentor.com>
From: Christopher Larson <chris_larson@mentor.com>
Date: Mon, 2 May 2016 19:31:25 +0000
X-Google-Sender-Auth: 0Dn_ohXINFJAofsiL9o38K4nrnc
Message-ID: <CABcZANnRQoNhnJvK+fv=DSs0imVsqUB1RsNUbDbN3kchEEvDSA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [for-master][RFC PATCH 0/3] Support template files for wic wks
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
X-List-Received-Date: Mon, 02 May 2016 19:31:44 -0000
Content-Type: multipart/alternative; boundary=001a1134bdaaf2b1470531e10ae9

--001a1134bdaaf2b1470531e10ae9
Content-Type: text/plain; charset=UTF-8

On Mon, May 2, 2016 at 7:23 PM, Christopher Larson <kergoth@gmail.com>
wrote:

> From: Christopher Larson <chris_larson@mentor.com>
>
> This adds support for .wks.in files as WKS_FILE.
>
> These files are treated as the contents of a bitbake variable, so usual
> bitbake variable references are supported. I considered using another
> templating mechanism, for example the one used by yocto-layer, but then
> we'd
> end up largely mapping metadata variables to template fields anyway, which
> is
> a pointless indirection. Let bitbake expand the variables directly instead.
>
> This feature lets us, for example, reference ${APPEND} in --append, and
> avoid
> hardcoding the serial console tty in the wks file, and let the user's
> changes
> to APPEND affect wic the way they do the other image construction
> mechanisms.
>
> The template is read in and set in a variable at parse time, so changes to
> the
> variables referenced by the template will result in rebuilding the image.
>
> It's been suggested that the name should better reflect how its contents
> are
> used, i.e. .bbin or so. I've also considered including something like
> 'bbv' or
> similar, to indicate its contents are that of a bitbake value. I think this
> should be discussed.
>
> I'd love to hear questions or comments on this. I think the value is clear,
> and it's something we need to solve, but I'd like to hear if others agree
> or
> disagree on that, and whether this implementation is appropriate.


One downside to this approach is, afaik,  that it's the first serious
deviation between wic outside and wic as an image type. One alternative
would be to parse the template at parse time to inject vars into WICVARS,
but let wic process the template, but then of course a change to the
template without re-running bitabke wouldn't update WICVARS and the written
env files.
-- 
Christopher Larson
kergoth at gmail dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--001a1134bdaaf2b1470531e10ae9
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On M=
on, May 2, 2016 at 7:23 PM, Christopher Larson <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex">From: Christopher Larson &l=
t;<a href=3D"mailto:chris_larson@mentor.com">chris_larson@mentor.com</a>&gt=
;<br>
<br>
This adds support for .<a href=3D"http://wks.in" rel=3D"noreferrer" target=
=3D"_blank">wks.in</a> files as WKS_FILE.<br>
<br>
These files are treated as the contents of a bitbake variable, so usual<br>
bitbake variable references are supported. I considered using another<br>
templating mechanism, for example the one used by yocto-layer, but then we&=
#39;d<br>
end up largely mapping metadata variables to template fields anyway, which =
is<br>
a pointless indirection. Let bitbake expand the variables directly instead.=
<br>
<br>
This feature lets us, for example, reference ${APPEND} in --append, and avo=
id<br>
hardcoding the serial console tty in the wks file, and let the user&#39;s c=
hanges<br>
to APPEND affect wic the way they do the other image construction mechanism=
s.<br>
<br>
The template is read in and set in a variable at parse time, so changes to =
the<br>
variables referenced by the template will result in rebuilding the image.<b=
r>
<br>
It&#39;s been suggested that the name should better reflect how its content=
s are<br>
used, i.e. .bbin or so. I&#39;ve also considered including something like &=
#39;bbv&#39; or<br>
similar, to indicate its contents are that of a bitbake value. I think this=
<br>
should be discussed.<br>
<br>
I&#39;d love to hear questions or comments on this. I think the value is cl=
ear,<br>
and it&#39;s something we need to solve, but I&#39;d like to hear if others=
 agree or<br>
disagree on that, and whether this implementation is appropriate.</blockquo=
te><div><br></div><div>One downside to this approach is, afaik, =C2=A0that =
it&#39;s the first serious deviation between wic outside and wic as an imag=
e type. One alternative would be to parse the template at parse time to inj=
ect vars into WICVARS, but let wic process the template, but then of course=
 a change to the template without re-running bitabke wouldn&#39;t update WI=
CVARS and the written env files.</div></div>-- <br><div class=3D"gmail_sign=
ature"><div dir=3D"ltr">Christopher Larson<br>kergoth at gmail dot com<br>F=
ounder - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior =
Software Engineer, Mentor Graphics</div></div>
</div></div>

--001a1134bdaaf2b1470531e10ae9--
