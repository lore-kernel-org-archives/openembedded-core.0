Return-Path: <alex.kanavin@gmail.com>
Received: from mail-vk1-f194.google.com (mail-vk1-f194.google.com
	[209.85.221.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF247EC95
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 Jan 2020 14:55:01 +0000 (UTC)
Received: by mail-vk1-f194.google.com with SMTP id d17so1028076vke.5
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Jan 2020 06:55:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=JgJwDLzT+a3U48j1yw+7UPTokfP+NFMMjNwn46wDclQ=;
	b=ALHwdxvQUrarOOQPyyrIPB1MTJdZfpcgkuYKyreVWAjAsUVpwq/2BwfF3YoJCpBPYK
	PYEZw6x2ApttpsvpxLMyCd51/y4SKw57fP3PycRlbMfIo+L187zTnO2QHNZbNcQHk2vA
	If8yFi6h/TNnqwU+wUJLkY8eIb/Gowsuagkgk9PL2duxVeCmDp0EJja8ZYm45LXuVRxq
	+pKXFo5lkf+lStGzFYuXx9IsDZUUvxL95/tc9Jm2xw+LHV5B389CW6za0caTrJK/Jqf3
	tELq6hjVO5eytOw8AJU8zvd4WDbyAB8XF+1pu+ZN5ZV4nFsLl6u/zq4nX5B9uQ4HWMHE
	ZOwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=JgJwDLzT+a3U48j1yw+7UPTokfP+NFMMjNwn46wDclQ=;
	b=p4FIXTAWi5LVKg5GLA1thpSIAs1F5SHUC4GGGdrU9D6ucOHNJgEyC/uoozoCR61YZs
	uNg+w7gSSUrvCTNkDvUO9OiZ5zSHcrvtfRFk8Eps6dOot3waK+Cn//6Ovcjy6Cv6Nl/h
	ytymQ6zEkGRyUQ92UgCeMxInIXCs9NHkLJFy3d8o0F4kjN/PkUceVbL8XVo2UfgkyIaY
	VHRo+ofAM6P6LNupFmXFRhkenV09EO2u+fHmy+cdLC+rR74SdsF9OlR4wChIYsshFHGs
	RiOP2V5WCEIrfLm22MP1pMl8xFbyQPl+LRetWdvesOxp7oSAOZs0CNAI6k6yoM898CQt
	0lhw==
X-Gm-Message-State: APjAAAU0i7ztI6ZTrI/3dXAWtfLIjRIagnbkzENx0d/LlQ1lrsrhiI5i
	X8im5BeRYiwvXTO99kl9NTfheTDyHsyOiez3pH05+4444I8=
X-Google-Smtp-Source: APXvYqxoSEOJ3kX6XwGO3H2Lra4S+8TQF6fGnsAXkEZb3InTjhaD+PWDmP1eHwGM6vfCY/KUTrEpCMo0bwcniu4Ru7M=
X-Received: by 2002:ac5:cdcd:: with SMTP id u13mr3194232vkn.0.1578495302567;
	Wed, 08 Jan 2020 06:55:02 -0800 (PST)
MIME-Version: 1.0
References: <20200108065117.4556-1-yi.zhao@windriver.com>
	<CANNYZj90XtZ2Oi2q1u0UU9Z=+o711YQ2T0=URCxK_MdwsT_4RA@mail.gmail.com>
	<0fa2ddf5f8c860dd796addeaa3252db8dc009373.camel@linuxfoundation.org>
In-Reply-To: <0fa2ddf5f8c860dd796addeaa3252db8dc009373.camel@linuxfoundation.org>
From: Alexander Kanavin <alex.kanavin@gmail.com>
Date: Wed, 8 Jan 2020 15:54:51 +0100
Message-ID: <CANNYZj_5W1GsfjBNr+A64m42pvA6w2hK18SwzAxedUpHBYsimA@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] maintainers.inc: cleanup entries
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
X-List-Received-Date: Wed, 08 Jan 2020 14:55:02 -0000
Content-Type: multipart/alternative; boundary="000000000000ca08ec059ba21375"

--000000000000ca08ec059ba21375
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 Jan 2020 at 15:47, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> On Wed, 2020-01-08 at 12:17 +0100, Alexander Kanavin wrote:
> > Just a note: there is an oe-selftest for this which you can use to
> > verify that all recipes still have a maintainer listed:
> >
> > oe-selftest -r distrodata.Distrodata.test_maintainers
>
> Perhaps we should extend it to check for recipes which have a
> maintainer but no recipe? :)
>

But how to do that? I know how to iterate over existing recipes, but I
don't know how to iterate over entries in maintainers.inc, and then check
whether a recipe exists.

Alex

--000000000000ca08ec059ba21375
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Wed, 8 Jan 2020 at 15:47, Richard Purd=
ie &lt;<a href=3D"mailto:richard.purdie@linuxfoundation.org">richard.purdie=
@linuxfoundation.org</a>&gt; wrote:<br></div><div class=3D"gmail_quote"><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">On Wed, 2020-01-08 at 12:17 =
+0100, Alexander Kanavin wrote:<br>
&gt; Just a note: there is an oe-selftest for this which you can use to<br>
&gt; verify that all recipes still have a maintainer listed:<br>
&gt; <br>
&gt; oe-selftest -r distrodata.Distrodata.test_maintainers<br>
<br>
Perhaps we should extend it to check for recipes which have a<br>
maintainer but no recipe? :)<br></blockquote><div><br></div><div><div>But h=
ow to do that? I know how to iterate over existing recipes,=20
but I don&#39;t know how to iterate over entries in maintainers.inc, and=20
then check whether a recipe exists.</div><div><br></div><div>Alex<br></div>=
=C2=A0</div></div></div>

--000000000000ca08ec059ba21375--
