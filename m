Return-Path: <kergoth@gmail.com>
Received: from mail-io0-f196.google.com (mail-io0-f196.google.com
	[209.85.223.196])
	by mail.openembedded.org (Postfix) with ESMTP id 2F5C973257
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Jun 2016 15:35:35 +0000 (UTC)
Received: by mail-io0-f196.google.com with SMTP id k19so3640805ioi.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2016 08:35:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=hdQ0YhHi87HIBjsAWvbhw9r7dUHHnCMwZPAv9zXmKrw=;
	b=U8rgD34OTwCD9TghID8XjlVb5i3eLYxf3Txe6+J//LAofdFJOi1l2Q3SqMmsutSQhZ
	DBXBT16R+avsEEiKzp7xQH+SQLIPviCmmDxAvk9fOLflDEw3kEoit3A6RmlagPVOeDbE
	dMNosDSi2gAaEC41QQbToFGKIqsClKJSrrWcRdgHlA1qIs+5yGCIPKyYmFpCNpIs/BJP
	AHcEwQ9nA9KOJVWVV0JSVkZKtWHgC5zuRAOKjRFF9pQ7edbyey5BLYEZIkKGLTIpVUpk
	pfVEorsQrwFkP9nvfSog3A2bQK+qWLhueqGrhjP0oWD1rVp6JiclG5Pxr9Ow0o7G1aJ+
	iz/Q==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=kergoth-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=hdQ0YhHi87HIBjsAWvbhw9r7dUHHnCMwZPAv9zXmKrw=;
	b=0qjfvwy4rM/TekIIhTmcbFXm2DCJ0O3KGGshD1qqZ9EDxJF1x/hk/+RBXVUujtBTn0
	5KwROV/Dvh4hF8+i5RAD8tBQcc8vE22zWi0qPAkB8GdDVbs6+7mrvPX7Dcbd5Aq2QxxD
	8UQA9Q5S1aWc7jKNLNaxt1yuWKWJaqgjBbX9Vsnk1ejnVW/oSibJ2pHf2ks8N0KNHKGD
	e3Zh3Jjxig4qLJDw3A2wSBii3cUdG6hZZX80SED7KuicZyEnwllbRBksT5lANWbPAjM7
	SldtWQJ5sancPhQA3bllVwyeh5o2gEQJq8CqwPGqWwoX7IR927PuGvKRC+l/k+vLYsyU
	nU4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=hdQ0YhHi87HIBjsAWvbhw9r7dUHHnCMwZPAv9zXmKrw=;
	b=RRGk+kMB7jOOBr8kVhN6EGrBl9SBDGqbUXjwZFIHFoCXYol2eYhWCjiR6wfOaTTAVT
	n/6/pqrBh4XGthTLkvx+ZXD01gCzpesnTP+rncCkAEGeqOss/NRjIknk/IWQYBc7C+2A
	czy+oh1VAJMIjCiagkf7ltYZRUoZbkqx5v5UH61xiuu2RwnklJr80vr0zYSurbE5Jwl1
	66b8AXKSADShzMiylny8zwjJr0znAt9U1kv2K7JUibI/OIWWfBkvv4qHA8SfzSHETPrZ
	zflsP8qm/ivbJSh3hbugCtxNBA6UQ73JR99k788OOR7MO7qMfDP67OAvGqT9aOA5s4E5
	XhfQ==
X-Gm-Message-State: ALyK8tLqGaC2W8qMwFe19f4rG5Gh6pmqBoQ9lE0LP+w7zEXTYiO4tcR6dP71tkQqGiiFGUEriHbYrnQuL3wBlA==
X-Received: by 10.107.140.132 with SMTP id o126mr6712909iod.70.1464795336133; 
	Wed, 01 Jun 2016 08:35:36 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.79.100.5 with HTTP; Wed, 1 Jun 2016 08:35:16 -0700 (PDT)
In-Reply-To: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
References: <1464784540-2786-1-git-send-email-richard.purdie@linuxfoundation.org>
From: Christopher Larson <clarson@kergoth.com>
Date: Wed, 1 Jun 2016 08:35:16 -0700
X-Google-Sender-Auth: of9hl_Mj07HUkg-1FjSHcCkm6GM
Message-ID: <CABcZANkmNG1MvPsYf-KJs2gmPMGjR+CjwLGjxc9k5-MRhgHuiw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 01/22] oe-buildenv-internal: Update to python3
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
X-List-Received-Date: Wed, 01 Jun 2016 15:35:38 -0000
Content-Type: multipart/alternative; boundary=94eb2c05aea2ae327e0534393d54

--94eb2c05aea2ae327e0534393d54
Content-Type: text/plain; charset=UTF-8

On Wed, Jun 1, 2016 at 5:35 AM, Richard Purdie <
richard.purdie@linuxfoundation.org> wrote:

> Check that 'python' is a python v2 since that is what we assume everywhere
> and upstream python devs recommend. We can need both python2 and python3
> available since we don't control the software we might download and run.
>
> Also check that python 3 is >= 3.4.0, our minimum version for bitbake.
>
> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>

I'm curious, why don't we just have a bit of logic to figure out what the
names are of the binaries, create a subdir and prepend it to the path, and
add symlinks or wrapper scripts there to the real binaries on the system?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

--94eb2c05aea2ae327e0534393d54
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On Wed, Jun 1, 2016 at 5:35 AM, Richard Purdie <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:richard.purdie@linuxfoundation.org" target=3D"_blank">richard.p=
urdie@linuxfoundation.org</a>&gt;</span> wrote:<br><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex"><div id=3D":10v" class=3D"a3s aXjCH m1550bf797f8a918a">Check that &#=
39;python&#39; is a python v2 since that is what we assume everywhere<br>
and upstream python devs recommend. We can need both python2 and python3<br=
>
available since we don&#39;t control the software we might download and run=
.<br>
<br>
Also check that python 3 is &gt;=3D 3.4.0, our minimum version for <span cl=
ass=3D"il">bitbake</span>.<br>
<br>
Signed-off-by: Richard Purdie &lt;<a href=3D"mailto:richard.purdie@linuxfou=
ndation.org">richard.purdie@linuxfoundation.org</a>&gt;</div></blockquote><=
/div><br>I&#39;m curious, why don&#39;t we just have a bit of logic to figu=
re out what the names are of the binaries, create a subdir and prepend it t=
o the path, and add symlinks or wrapper scripts there to the real binaries =
on the system?<br>-- <br><div class=3D"gmail_signature" data-smartmail=3D"g=
mail_signature">Christopher Larson<br>clarson at kergoth dot com<br>Founder=
 - BitBake, OpenEmbedded, OpenZaurus<br>Maintainer - Tslib<br>Senior Softwa=
re Engineer, Mentor Graphics</div>
</div></div>

--94eb2c05aea2ae327e0534393d54--
