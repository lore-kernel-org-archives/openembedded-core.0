Return-Path: <ross.burton@intel.com>
Received: from mail-ig0-f172.google.com (mail-ig0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id C64FD60248
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 20:56:31 +0000 (UTC)
Received: by mail-ig0-f172.google.com with SMTP id ig19so21668361igb.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 11 Mar 2016 12:56:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=DlbHWq8s6AsWkY8EJETCRh9LR1qMjzXNdhc26ibquGI=;
	b=MxI3JhMiDdTKXNpzPAbazHl6zCGKEnTQc1uWmiF6cxue1D7PfyejRbYfMHz2gMzUPN
	Sw94K2lHe1VAX3V8XxgKTIaO/jQK6RT041aCMyCEWz8txFCsgJb/W53Ca1OBdO/VdFFv
	d1MvIQIs40CE3M1+FOMkgz3d3cHRwKGfnO8WeMEMVttmL+B89gzNeovGEPem+CV+Dbfz
	LGyKax3kA0PuyDRhg6Hat5ql8fE/z8Wq1rlFMJe5cgLNH5w7nTFdSYaRpyMmo9LpFKI8
	vuNTzpjI0nXVKxv6+bchSBPM1e+zmWb1kzBSwfEdHNdFJ0vF8kzFPomETFY3tPhfg5xF
	ohjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=DlbHWq8s6AsWkY8EJETCRh9LR1qMjzXNdhc26ibquGI=;
	b=gyf4FU99hNxWXuz5Jai1+XCesdcC49CHgB5HtlvPH8B1gNoM3xOUDfGYCeajDS2I3F
	YeZzo0gniIyANJAVefrUm2LfYNrIP2xOHppLOTlk5iKir+CeJbI3qeAEnxpEZFfXTIEV
	ipnivhDeN77y8xEn03e3WQ82/rf6iFHfGMrLy8e1r4ReYfqEXYBUHnTLlyGp5CgrqLb6
	1frOEQgth+ZFcOPEE1CvK9KpSnnn3Q+UTCiyoECP7KSY0PGr8RI1KvIqbuYS4q4Z4Wqe
	rLttIXDAsAqW7iovEnNvUWTtSUMy2UbwTKY0B0S8YyhiRNfcc1z9oddGwFKqKYRoBeNz
	JOmA==
X-Gm-Message-State: AD7BkJJLi9sPdHeysHVo+vZkfSwDHZjwrMhSOwRaytDYNhONzPCTNp77Z3z0BEGOXA+0s7VcInIlA7OWfRFJgMr/
X-Received: by 10.50.112.101 with SMTP id ip5mr1297123igb.52.1457729792348;
	Fri, 11 Mar 2016 12:56:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.162.70 with HTTP; Fri, 11 Mar 2016 12:56:12 -0800 (PST)
In-Reply-To: <CAP9ODKrdGLcXWLmuYbG=UdGLdUfY6ZoOaO+Oh6K7qoAXVUV_ww@mail.gmail.com>
References: <cover.1457698804.git.jussi.kukkonen@intel.com>
	<CAP9ODKrZMfa0bW6e3VRS+mks+OJNDJwSmXqxtRM_QgBTSK5mQg@mail.gmail.com>
	<CAJTo0La3B=bGXGC1_M8c5qsUEF_kSZpGwfmw8+DHUUDEuOQdGg@mail.gmail.com>
	<CAP9ODKrdGLcXWLmuYbG=UdGLdUfY6ZoOaO+Oh6K7qoAXVUV_ww@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 11 Mar 2016 20:56:12 +0000
Message-ID: <CAJTo0LYB0D+=qh3BQP5jA-J49Ue=j2qrUjqf1rjRW_WtJeH5qg@mail.gmail.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 00/12] Sato desktop upgrade (Gtk3 etc.)
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
X-List-Received-Date: Fri, 11 Mar 2016 20:56:34 -0000
Content-Type: multipart/alternative; boundary=047d7b3a845873becf052dcc2afc

--047d7b3a845873becf052dcc2afc
Content-Type: text/plain; charset=UTF-8

On 11 March 2016 at 19:09, Otavio Salvador <otavio.salvador@ossystems.com.br
> wrote:

> All them; we might use GNOME (MATE or other WM) and write just a GTK+3
> demo like app for test the desired stuff.
>

The full GNOME DE is *huge* and until the g-i branch is merged is literally
impossible to build.  Something smaller like LXDE is possible but still
fairly large in comparison and massively fails when you try to use it on
hardware with a touchscreen: at least Matchbox+desktop+panel has always
(and will continue to) support a touchscreen+fingers for basic use.

Ross

--047d7b3a845873becf052dcc2afc
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 11 March 2016 at 19:09, Otavio Salvador <span dir=3D"ltr">&lt;<a href=3D=
"mailto:otavio.salvador@ossystems.com.br" target=3D"_blank">otavio.salvador=
@ossystems.com.br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><=
div id=3D":1hi" class=3D"a3s" style=3D"overflow:hidden">All them; we might =
use GNOME (MATE or other WM) and write just a GTK+3<br>
demo like app for test the desired stuff.</div></blockquote><div><br></div>=
<div>The full GNOME DE is *huge* and until the g-i branch is merged is lite=
rally impossible to build.=C2=A0 Something smaller like LXDE is possible bu=
t still fairly large in comparison and massively fails when you try to use =
it on hardware with a touchscreen: at least Matchbox+desktop+panel has alwa=
ys (and will continue to) support a touchscreen+fingers for basic use.</div=
><div><br></div><div>Ross=C2=A0</div></div></div></div>

--047d7b3a845873becf052dcc2afc--
