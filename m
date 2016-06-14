Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f172.google.com (mail-io0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id A4FB06014F
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 15:06:49 +0000 (UTC)
Received: by mail-io0-f172.google.com with SMTP id 5so150219469ioy.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jun 2016 08:06:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aY0pNAWZ9gpIEA5KQzYN9eNyLZMltPySEyF8Ry6VzXw=;
	b=aWUEMmvRYSC6kuT6myEACUq3lCKkWqqLMe7zMv1Es0efvAm104C6BfBGbxSx/lMjX7
	7BOUlSt65giXX+mrJnLkD9hcxwEgOVSe7PoUf0kL8ShjnzaP0RcJ7JWF3nYW5ChhDH/R
	WTMTbUrcb0bFkSWdX2Ho7XvE2BECjoPj2hRAAoA5zDB4Ei1PUN6oQeXV5yIw4/gxoR2c
	5Wb6qhtMhZuOhg5d7BfRKiQplWMJ+fq90zFih6heDCXIzByJuwk453KMcnPD9blPzWVZ
	oTOmugODpfNn3DTSZC8wWzDj8r3Ks2aSuME2vhrrHFvr0SAaPI203FIJc1cgo6dJTGwA
	Qaaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aY0pNAWZ9gpIEA5KQzYN9eNyLZMltPySEyF8Ry6VzXw=;
	b=CWJ2hdMxhDgh5E6t/rCNyc5ANsZQqy+ZMjVWl0d6KbSKsszvTnPJQHqZrf/o0B0BB0
	cDv5rSxAOY9/A/oIeEM4gWLBiqQvVIuEJQf1lBDIENcbmKuSyFBLVxSV+RaZaS6G86VV
	7TS+hUm+MQ6kyroLeRaF66jFy7bn2z/VMH9xGI94PgVeJ0Gcbq8+tWA8VYiyCBJDeDKW
	MfC21YnlLfmd5O9SWkzkjWXN5JUi1+xVqQNey+n+/CTJxngpZyF9aMorsV2FRVc5XU/f
	HFWLAZ04zdFuw9HimJfBmibo1zY7nb7xdIO2fIwUSwrJCR+LkbG74Ez21T+V6DEHX8Ng
	L1lQ==
X-Gm-Message-State: ALyK8tImMvMA+uuLE4ouJ2ujlaLy9ilNukviqwvbKIR+g3PdoTH9stIyO5igF+I/LIR2tkMgDXaPiQf84fMCLucE
X-Received: by 10.107.138.201 with SMTP id c70mr31091440ioj.148.1465916809863; 
	Tue, 14 Jun 2016 08:06:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.162.6 with HTTP; Tue, 14 Jun 2016 08:06:30 -0700 (PDT)
In-Reply-To: <3308ab50-4cd1-c480-0fbb-c189159973a8@linux.intel.com>
References: <20160614140357.6145-1-Martin.Jansa@gmail.com>
	<3308ab50-4cd1-c480-0fbb-c189159973a8@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 14 Jun 2016 16:06:30 +0100
Message-ID: <CAJTo0LbGYDmKadOz0cjai83FjcG6NbW=hobEidpSiUJgzQO8Cg@mail.gmail.com>
To: Leonardo Sandoval <leonardo.sandoval.gonzalez@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] icecc.bbclass: replace os.popen with subprocess.check_output
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
X-List-Received-Date: Tue, 14 Jun 2016 15:06:51 -0000
Content-Type: multipart/alternative; boundary=001a113e8e6ab8f8da05353e5a49

--001a113e8e6ab8f8da05353e5a49
Content-Type: text/plain; charset=UTF-8

On 14 June 2016 at 15:59, Leonardo Sandoval <
leonardo.sandoval.gonzalez@linux.intel.com> wrote:

> Also, now that we switch to subprocess.check_output, I wonder if we need
> to convert it to string (the output of this method) before proceeding.
>

Yeah, check_output under py3 returns byte arrays, so you either need to
convert to string or pass universal_newlines=True.

Ross

--001a113e8e6ab8f8da05353e5a49
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 14 June 2016 at 15:59, Leonardo Sandoval <span dir=3D"ltr">&lt;<a href=
=3D"mailto:leonardo.sandoval.gonzalez@linux.intel.com" target=3D"_blank">le=
onardo.sandoval.gonzalez@linux.intel.com</a>&gt;</span> wrote:<br><blockquo=
te class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc so=
lid;padding-left:1ex"><div id=3D":4k6" class=3D"a3s aXjCH m1554f6ba4e43eef3=
">Also, now that we switch to subprocess.check_output, I wonder if we need =
to convert it to string (the output of this method) before proceeding.<br><=
/div></blockquote><div><br></div><div>Yeah, check_output under py3 returns =
byte arrays, so you either need to convert to string or pass universal_newl=
ines=3DTrue.</div><div><br></div><div>Ross=C2=A0</div></div><br></div></div=
>

--001a113e8e6ab8f8da05353e5a49--
