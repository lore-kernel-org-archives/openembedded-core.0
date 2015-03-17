Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f45.google.com (mail-qg0-f45.google.com
	[209.85.192.45])
	by mail.openembedded.org (Postfix) with ESMTP id 2FABC6013D
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 13:50:09 +0000 (UTC)
Received: by qgf3 with SMTP id 3so8143780qgf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Mar 2015 06:50:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=uV8xF9SNWXsW0b+W+VFa0MZvMgassmRzrCS9jpCWa18=;
	b=h4a4VhDmc9BHQs7DjBAxBNtLkV5i3NAChho9u7k1MksEH+aAxfwiuK1AR+fK7h1Agu
	x8eIic7H7dlgaVMgH4IfOa2XfQg0OAV4t/2TpF3JodlSK+ml42OpGMhItyNoN54SEENU
	LOmlIXuwFATJ/E3nVX5dYIKqtkj1DuE5k6k1iwrwcOtJxOQTo3F/JWpwdLnbIgKfut15
	elzFSnYkH19mvaZWIuEFjgRK01GpkPfogkKqDPWQC3J8wVNsp1scik4nWvtTbxIEoM/W
	noSwYIx4kArw5xWpJ7PC8fsTpPeXZXYWoqOD32Oe1dt0LirjrLA/FUGFT+TbuW6oWgN5
	ZnBA==
X-Gm-Message-State: ALoCoQn1nECgPHf/syzVGKcKA77obbzfpT9u1f59NpO0P94xvZEeczpshQlI8VjqeyujC5FqU25o
X-Received: by 10.55.23.208 with SMTP id 77mr51599177qkx.21.1426600211155;
	Tue, 17 Mar 2015 06:50:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.203 with HTTP; Tue, 17 Mar 2015 06:49:50 -0700 (PDT)
In-Reply-To: <55081C38.9080901@windriver.com>
References: <cover.1426525757.git.bruce.ashfield@windriver.com>
	<1cd7d6881e747b3458140e34d7801141b0ae62d1.1426525757.git.bruce.ashfield@windriver.com>
	<CAJTo0LbvjhZ8nUzua80y+K23n7CS+sY7QcDYg3PqjJWLe+_fwQ@mail.gmail.com>
	<55081C38.9080901@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Mar 2015 15:49:50 +0200
Message-ID: <CAJTo0LbffFs6r_GkzF7CTUP+1yxrUydwq6RxRZTgJhbZbhiYSA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/5] kernel-yocto: split meta data generation from patching phase
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
X-List-Received-Date: Tue, 17 Mar 2015 13:50:11 -0000
Content-Type: multipart/alternative; boundary=001a11479e2ed2a46b05117c3e3c

--001a11479e2ed2a46b05117c3e3c
Content-Type: text/plain; charset=UTF-8

On 17 March 2015 at 14:21, Bruce Ashfield <bruce.ashfield@windriver.com>
wrote:

> It was. The extra output only goes to the logs, and it is helpful
> in diagnosing problems.
>
> .. and yes, the obvious follow up is that I should have put that
> in the commit message!
>

It looked a bit like debugging changes, thought I'd check.

Cheers,
Ross

--001a11479e2ed2a46b05117c3e3c
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 17 March 2015 at 14:21, Bruce Ashfield <span dir=3D"ltr">&lt;<a href=3D"=
mailto:bruce.ashfield@windriver.com" target=3D"_blank">bruce.ashfield@windr=
iver.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":1om" class=3D"a3s" style=3D"overflow:hidden">It was. The extra output =
only goes to the logs, and it is helpful<br>
in diagnosing problems.<br>
<br>
.. and yes, the obvious follow up is that I should have put that<br>
in the commit message!</div></blockquote></div><br>It looked a bit like deb=
ugging changes, thought I&#39;d check.</div><div class=3D"gmail_extra"><br>=
</div><div class=3D"gmail_extra">Cheers,</div><div class=3D"gmail_extra">Ro=
ss</div></div>

--001a11479e2ed2a46b05117c3e3c--
