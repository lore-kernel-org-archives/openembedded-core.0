Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f174.google.com (mail-qk0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 3B82C60053
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 08:58:05 +0000 (UTC)
Received: by qkdw123 with SMTP id w123so83369044qkd.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 16 Sep 2015 01:58:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=r2YLNceQNhaxphi6rlMjSikQyRoOkz67x12f16LE8vs=;
	b=F/psC9KC8WuXUxPcflvOnyrTBlnUp92hJ33oanDjNmBZDiNQ4WV+naEZbQLJxWS1Cx
	goK+UIn/aDXZXbP6FM7TUIAbctYUAs1IzIdiJlOP9oEp8nvI6UMMrT28Y9UGocZIXUNi
	APIrZH2On+Tlfu6iFh+mWuQ/nfKkM8g1UVEriFeqU4LRdKqJnPOsiCY6qw4EkvZNvJJz
	iNbnMKqTcXfODdMMBYAXq6xJZncMEhxo5f6xkLKAueyYA7WZyOcGYiQ/i7cjc6PhaMkO
	YrjL7eqTEeaX7Fh78m9qBkoWBjD8MnQZSeswPXsI/paMnPOqVuRXoFE7VGRT8XY9ZI7w
	m/9g==
X-Gm-Message-State: ALoCoQnF2XTcAsMQBjwT0oQLZmd/3zjJBj4UlKNg8AarrNN+RqcVGbImqY6w5jEZs/ZKybVMiWNH
X-Received: by 10.55.195.86 with SMTP id a83mr39109809qkj.72.1442393885763;
	Wed, 16 Sep 2015 01:58:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Wed, 16 Sep 2015 01:57:46 -0700 (PDT)
In-Reply-To: <55F91EEA.8040005@windriver.com>
References: <20150910160557.GD2387@jama>
	<1442294991-12427-1-git-send-email-Martin.Jansa@gmail.com>
	<55F7B25B.6030801@windriver.com> <55F91EEA.8040005@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 16 Sep 2015 09:57:46 +0100
Message-ID: <CAJTo0LYNyBdzb64QZHYobCdKUm-w1wAK4M3bn7CvCFmxR_ak4w@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH][master][fido][dizzy] Revert "perf: fix for rebuilding"
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
X-List-Received-Date: Wed, 16 Sep 2015 08:58:06 -0000
Content-Type: multipart/alternative; boundary=001a1142b95030072f051fd97f22

--001a1142b95030072f051fd97f22
Content-Type: text/plain; charset=UTF-8

On 16 September 2015 at 08:48, Robert Yang <liezhi.yang@windriver.com>
wrote:

> I've figured out the reason, this is because the task's default cwd
> is ${B}, the easier way to fix the problem is use mkdir -p rather than
> mkdir, autotools.bbclass also has this problem, but I'd like to fix
> exec_func, I will send a patch to bitbake-devel after more testing.
>

Changing the default $B of [dirs] is not something we'll be doing post-M3.
I've a branch that changes that default and have fixed all the obvious
breakage in oe-core already so this is something on my plan for immediately
after 2.1 branches off.

Ross

--001a1142b95030072f051fd97f22
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 16 September 2015 at 08:48, Robert Yang <span dir=3D"ltr">&lt;<a href=3D=
"mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.=
com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":14n=
" class=3D"a3s" style=3D"overflow:hidden">I&#39;ve figured out the reason, =
this is because the task&#39;s default cwd<br>
is ${B}, the easier way to fix the problem is use mkdir -p rather than<br>
mkdir, autotools.bbclass also has this problem, but I&#39;d like to fix<br>
exec_func, I will send a patch to bitbake-devel after more testing.</div></=
blockquote></div><br>Changing the default $B of [dirs] is not something we&=
#39;ll be doing post-M3. I&#39;ve a branch that changes that default and ha=
ve fixed all the obvious breakage in oe-core already so this is something o=
n my plan for immediately after 2.1 branches off.</div><div class=3D"gmail_=
extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1142b95030072f051fd97f22--
