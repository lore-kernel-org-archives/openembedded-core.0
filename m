Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f182.google.com (mail-io0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 6F08678695
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 15:06:32 +0000 (UTC)
Received: by mail-io0-f182.google.com with SMTP id c17so17140591iod.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Jan 2018 07:06:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r49mDLqimOxGDnITpt0dop7CIbror9zGsnPy6Mjzcy8=;
	b=19wJg3ejXyfGT4zTF11DRtelf+uLytccs7CXRpVDUzVMT0KrtkqK6Vwf/hVlkKqEPC
	o79No8gx7Wp2aLQefZk/m97UBjz6LvXAlizrnxWkPMnl+2FVltjXmC/I9mGqVsZI+hok
	wN6pVd/BCE7rriNd47GElWvQ4+g3zo/iVWZ5xROqeKGFyK6jRy9pDi4GTqAtwS0Q5zfL
	UNIXhzsbFAexg4TMEdDhERrKqmzvv2hMkU3ZhTbISj1GnjG5Cq5jiN/mTmLb8dLuSQzG
	1rVnphHO4SBP98tHnOLL5xXkeqv0pFbwrat10JKRBTH22+0oSVZ5jY55oeUqS84qGw02
	JWwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r49mDLqimOxGDnITpt0dop7CIbror9zGsnPy6Mjzcy8=;
	b=Jc69gqTIWClI+JUmiY/+JNbYnxFhJMrkeikYpkwm+j/pwoqnDBtp7ncc/wanSVpDLg
	fLy8PFpHn4eDom2bk+os+xzI/DoYWmeuisq+4GN/OHW9FLeabAxjnVU6llmwo4USalfk
	bx8KjCFop2dAIRBhrsYaU7eGhJ2wfMx292O4dM1ze43XynvVnC06XpO4/pYBcBn1MRt3
	QRAs2cDdRZNqXIyZrWZ2NsH5U7cJUY/BdnhYwaQhFOs5bP5IF7D9keHfelaV9BYUceTC
	2wQOUqog79gvrpx/J5BMpmVvpIV8IKeoWq16GfVxx49gOjjn7otRk2TfZ03SZqV6megM
	uBFQ==
X-Gm-Message-State: AKwxytefnDEjEM8S1jnn7e25vt6WtSQ6GIqha2gusEgKOzqbEObgaFB9
	/irffegOQBaBNzUMZwvePVRJiYowXN4s/b1J0NAi+w==
X-Google-Smtp-Source: ACJfBovyEBna5q0CwFRT5U9EsxW/kMA4lNV3gfUbAUHdKF6uJmxvDiU7CTIeAaiBRGYLvpOtcxVqr8lftwtCRmZe0Os=
X-Received: by 10.107.133.75 with SMTP id h72mr7066854iod.227.1516115194273;
	Tue, 16 Jan 2018 07:06:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.157.202 with HTTP; Tue, 16 Jan 2018 07:06:13 -0800 (PST)
In-Reply-To: <20180116144729.pfwg3qs2yhbxirl4@mcrowe.com>
References: <20180115175321.r7sfuxibr743icio@mcrowe.com>
	<CAJTo0LbcZxArSP-TRYXfNVXY9FS8hK=okbHT2p8RU+nx1Sya+g@mail.gmail.com>
	<20180116115516.bs5g4ngea3gz4sgr@mcrowe.com>
	<CAJTo0LYFZqkc_KMXKjNmX4M3z0UjAjGpRLNingKsmXf7yBUmHQ@mail.gmail.com>
	<CAJTo0LbHs0aVrvQi2RwSK=2FAe6q5nyYsu9CxDcnKrBae=f70Q@mail.gmail.com>
	<CAJTo0LZC6AJhTs0PtbRvfHK-dqjgfZvNSdN3gXGdWksaBZOP6Q@mail.gmail.com>
	<20180116144729.pfwg3qs2yhbxirl4@mcrowe.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 16 Jan 2018 15:06:13 +0000
Message-ID: <CAJTo0La_svZteH1ZXZ02_r9H7tYfe_dox9TO6sBTVF5V+CiUTw@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: glib-2.0 fails to configure with USE_NLS="no"
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
X-List-Received-Date: Tue, 16 Jan 2018 15:06:33 -0000
Content-Type: multipart/alternative; boundary="001a113ec5e498538a0562e61330"

--001a113ec5e498538a0562e61330
Content-Type: text/plain; charset="UTF-8"

On 16 January 2018 at 14:47, Mike Crowe <mac@mcrowe.com> wrote:

> On Tuesday 16 January 2018 at 14:04:14 +0000, Burton, Ross wrote:
> > Another fix would be to respect USE_NLS and seed msgfmt=/bin/false
> > appropriately.
>
>  CACHED_CONFIGUREVARS = "MSGFMT=/bin/false"
>
> appears to work, but I'm not sure whether that's what you meant.
> Presumably it would need to be:
>
>  CACHED_CONFIGUREVARS = "${@base_conditional('USE_NLS', 'no',
> 'MSGFMT=/bin/false', '')"
>
> or similar.
>
> > I'll test that later, or you can get the glory if you can
> > send a tested patch.
>
> Since I'm not really sure what the consequences of doing this are, I'm not
> sure that I want the blame that comes after the glory if I get it wrong. :)
>

Darn, my attempt at blame-shifting has failed.

Well, msgfmt is only used by the glib-gettext logic (oh, and a test case, I
suspect you've got ptest disabled?) so if NLS is disabled then all recipes
using glib-gettext shouldn't be invoking it anyway, right?   That's my
theory anyway...  the test case that uses it is an issue though.

Ross

--001a113ec5e498538a0562e61330
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">On 16 January 2018 at 14:47, Mike Crowe <span dir=3D"ltr">=
&lt;<a href=3D"mailto:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</a>&=
gt;</span> wrote:<br><div class=3D"gmail_extra"><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><span class=3D"">On Tuesday 16 January 2018 =
at 14:04:14 +0000, Burton, Ross wrote:<br>
&gt; Another fix would be to respect USE_NLS and seed msgfmt=3D/bin/false<b=
r>
&gt; appropriately.<br>
<br>
</span>=C2=A0CACHED_CONFIGUREVARS =3D &quot;MSGFMT=3D/bin/false&quot;<br>
<br>
appears to work, but I&#39;m not sure whether that&#39;s what you meant.<br=
>
Presumably it would need to be:<br>
<br>
=C2=A0CACHED_CONFIGUREVARS =3D &quot;${@base_conditional(&#39;USE_NLS&#39;<=
wbr>, &#39;no&#39;, &#39;MSGFMT=3D/bin/false&#39;, &#39;&#39;)&quot;<br>
<br>
or similar.<br>
<span class=3D""><br>
&gt; I&#39;ll test that later, or you can get the glory if you can<br>
&gt; send a tested patch.<br>
<br>
</span>Since I&#39;m not really sure what the consequences of doing this ar=
e, I&#39;m not<br>
sure that I want the blame that comes after the glory if I get it wrong. :)=
<br></blockquote><div><br></div><div>Darn, my attempt at blame-shifting has=
 failed.</div><div><br></div><div>Well, msgfmt is only used by the glib-get=
text logic (oh, and a test case, I suspect you&#39;ve got ptest disabled?) =
so if NLS is disabled then all recipes using glib-gettext shouldn&#39;t be =
invoking it anyway, right? =C2=A0 That&#39;s my theory anyway... =C2=A0the =
test case that uses it is an issue though.</div><div><br></div><div>Ross</d=
iv></div></div></div>

--001a113ec5e498538a0562e61330--
