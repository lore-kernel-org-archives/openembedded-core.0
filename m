Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2510370A84
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 10:52:36 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id m20so3443379qcx.41
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Oct 2014 03:52:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=Mhyl/qRmXRKXeiHjG2o2rWhQ7USsaIU9K+ytrgK5SXc=;
	b=TBdyuIxihd7r4/mHtfrZbehlU8p7OlIk8VSaRfoUOQeT/XDghDZQ9gcbFOnat8q0dn
	foGnZu8bnRlbgYuwmujUHeKR8KcxtOzNWfATHHrOfX+pNWCOXYv0/MSL9Acwa1CMGmUn
	YD7sFGjKGtwzU9tBehMTmq0qnwbgNnxiVCUVIZmrJ/i6oWJnudYoSlR2GSO3JHrs6e+r
	3LzaGLzgzMU+JoUBZFsvUSgfe1Lyyd1PsDOe2CbTBm+R6XD6Q7wUyGbq6hRTMXY4Ltx4
	rcmRv/fRZLRVV6BfB/m7I4LhB4okxiIYUzUFzHJ0JyW0qs52e8+5aC+Q7rcuyrcbF3IU
	b6Vw==
X-Gm-Message-State: ALoCoQlCBDPE0hL1RC3KGOQ2ggPjKc4qssE42IvHK75MaVPFJV348pBojmPbIIw3V/sp3XTsmTEo
X-Received: by 10.140.109.244 with SMTP id l107mr8361698qgf.80.1414407156585; 
	Mon, 27 Oct 2014 03:52:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.92.179 with HTTP; Mon, 27 Oct 2014 03:52:16 -0700 (PDT)
In-Reply-To: <20141027095248.GC2430@jama>
References: <1414403082-28396-1-git-send-email-jackie.huang@windriver.com>
	<20141027095248.GC2430@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 27 Oct 2014 10:52:16 +0000
Message-ID: <CAJTo0LZOAOEoEi=7KA70hgJqdoC65xyqkzYvNHHzfPQn=Gdp1A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] which-2.18: Make sure ChangeLog exists for automake
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
X-List-Received-Date: Mon, 27 Oct 2014 10:52:39 -0000
Content-Type: multipart/alternative; boundary=001a113b7e50230cad05066554b6

--001a113b7e50230cad05066554b6
Content-Type: text/plain; charset=UTF-8

On 27 October 2014 09:52, Martin Jansa <martin.jansa@gmail.com> wrote:

> On Mon, Oct 27, 2014 at 05:44:42AM -0400, jackie.huang@windriver.com
> wrote:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Fixed:
> > Makefile.am: error: required file './ChangeLog' not found
>
> Isn't it better to pass foreign to automake?


Yes, and talk to upstream to understand why this isn't a problem.  Some
upstreams are unaware of autoreconf and continue using home-grown tools.

Ross

--001a113b7e50230cad05066554b6
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><div class=3D"gmail_quote">On 2=
7 October 2014 09:52, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mailto:=
martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt;</s=
pan> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex=
;border-left:1px #ccc solid;padding-left:1ex"><span class=3D"">On Mon, Oct =
27, 2014 at 05:44:42AM -0400, <a href=3D"mailto:jackie.huang@windriver.com"=
>jackie.huang@windriver.com</a> wrote:<br>
&gt; From: Jackie Huang &lt;<a href=3D"mailto:jackie.huang@windriver.com">j=
ackie.huang@windriver.com</a>&gt;<br>
&gt;<br>
&gt; Fixed:<br>
&gt; Makefile.am: error: required file &#39;./ChangeLog&#39; not found<br>
<br>
</span>Isn&#39;t it better to pass foreign to automake?</blockquote><div><b=
r></div><div>Yes, and talk to upstream to understand why this isn&#39;t a p=
roblem.=C2=A0 Some upstreams are unaware of autoreconf and continue using h=
ome-grown tools.</div><div><br></div><div>Ross=C2=A0</div></div></div></div=
>

--001a113b7e50230cad05066554b6--
