Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f181.google.com (mail-qk0-f181.google.com
	[209.85.220.181])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB776AC1E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 08:36:39 +0000 (UTC)
Received: by qkx62 with SMTP id 62so69131747qkx.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Apr 2015 01:36:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=xLDH+DThXxGFLj4dz2rOANkICBQa+fG7V/XLumISvWY=;
	b=MeEa6spruv6Mo13cV5973qM42BALCOrz1Tss/x+v05ADUbUz71LQ08ljViYbH/3kJW
	0m6Lmf2Jso4lWFNIW61RNBBV65ffOqS9oTIe5/V2jNnNZAbc1cg4GKhBz7WBt8hoYlzT
	A8CNia/Y0salS8Em0HnxdqL0wC5T5JYGVncAcbTemRCxzrK0SyGR8p548bztApATLzTu
	xsJ2t4koOA1rjXNBMptelx3wXslJskfGxQXpjntOUIALAoHqKFm4rEejbIQPjlN2eT3L
	JfbC4bzTlTgw8CP7Pso4GzxMecPa9tZ17a+bhHUtLTu7dUuXxyFJC76GrZud2t3ezLf0
	1ySg==
X-Gm-Message-State: ALoCoQl8tu33pZwV48VWq3mDMVrXN4QO/Fm66zDa0z7xF4zqubELTRV/eUZB+XJ9NaYSQ3oGV0Qb
X-Received: by 10.140.39.164 with SMTP id v33mr29217560qgv.80.1429086997963;
	Wed, 15 Apr 2015 01:36:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Wed, 15 Apr 2015 01:36:17 -0700 (PDT)
In-Reply-To: <CAHiDW_EWoEuXsQ3PLBpOpfj1h3bRrRD1PbMUchUbxk8qxiqgBw@mail.gmail.com>
References: <cover.1429002519.git.liezhi.yang@windriver.com>
	<9862abd5653d0ccddc5e1a7e805c176877231a77.1429002519.git.liezhi.yang@windriver.com>
	<CALbNGRQJNw3YvjDYVGd2kecM9nAMsamu9yRRfCSjgg+LvkdH=w@mail.gmail.com>
	<CAJTo0LaU5AK6RyN+q6w5B49nqy-9Ox=+ioKtxcF7yh7U6+E-Qg@mail.gmail.com>
	<552DC27E.3060804@windriver.com>
	<CAHiDW_EWoEuXsQ3PLBpOpfj1h3bRrRD1PbMUchUbxk8qxiqgBw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 15 Apr 2015 09:36:17 +0100
Message-ID: <CAJTo0LZvz4cGkG+YNC3LEwd4txchqFucugPRnYrL1kNZQ0ynVQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/6] libepoxy: DEPENDS on virtual/mesa
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
X-List-Received-Date: Wed, 15 Apr 2015 08:36:41 -0000
Content-Type: multipart/alternative; boundary=001a11c14eaeddfe260513bf3e25

--001a11c14eaeddfe260513bf3e25
Content-Type: text/plain; charset=UTF-8

On 15 April 2015 at 09:28, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:

> As a learning exercise, what would have been the correct (and least
> destructive) way for me to test that I hadn't forgotten a dependency
> like this? I assume the problem is that I already had the correct
> headers and pkg-config files in the staging sysroot?
>

Something else for the manual.

Once you have a recipe that works, the shortcut is to run "wipe-sysroot"
which deletes all the sysroots (and the relevant stamps).  Then you can do
bitbake foo -ccleansstate ; bitbake foo to do another build.  If that works
and doesn't just fail outright, you can then use buildhistory-diff to
verify that nothing changed.

Ross

--001a11c14eaeddfe260513bf3e25
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 15 April 2015 at 09:28, Jussi Kukkonen <span dir=3D"ltr">&lt;<a href=3D"=
mailto:jussi.kukkonen@intel.com" target=3D"_blank">jussi.kukkonen@intel.com=
</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin=
:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":579" c=
lass=3D"a3s" style=3D"overflow:hidden">As a learning exercise, what would h=
ave been the correct (and least<br>
destructive) way for me to test that I hadn&#39;t forgotten a dependency<br=
>
like this? I assume the problem is that I already had the correct<br>
headers and pkg-config files in the staging sysroot?</div></blockquote><div=
><br></div><div>Something else for the manual.</div><div><br></div><div>Onc=
e you have a recipe that works, the shortcut is to run &quot;wipe-sysroot&q=
uot; which deletes all the sysroots (and the relevant stamps).=C2=A0 Then y=
ou can do bitbake foo -ccleansstate ; bitbake foo to do another build.=C2=
=A0 If that works and doesn&#39;t just fail outright, you can then use buil=
dhistory-diff to verify that nothing changed.</div><div><br></div><div>Ross=
</div></div></div></div>

--001a11c14eaeddfe260513bf3e25--
