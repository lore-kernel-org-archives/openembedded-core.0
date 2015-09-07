Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 53BFB7422C
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Sep 2015 14:20:00 +0000 (UTC)
Received: by qgt47 with SMTP id 47so62903426qgt.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 07 Sep 2015 07:20:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=RLafwfTOVSEI627rvThv+1zLlVTFLNW6ybT26fNNXIk=;
	b=mrLpuCdlQM+dvPVBAzXNxgSM6/W1oWULIitWI9zhd7jFhyeslHV0zGwN6CYxH9Ut6l
	bhPlexjH0IznXCGGtu2+5ghBEC1MTkaq4qcZlodCwJMxHARZHqYuuMl+ZvKOgkKdICCU
	g2ce9diAlAQaZaVG36bUJiEU6hJg5qytEe4LxNd3GHblI6Siy9XEwpQmXXObzY7RB7sp
	F/y7kampSYuU0gRP/FlQV+qqcFGLWnOajTSrT/PB/NOqnqNRoYUQySN6R5Hgr0n1T0yb
	lm6abMze3WygdrBny9fNPmCYPmumf86LTko6K8iR1Xd1nQv2SwUaSEyehJkQmUBkiq3Z
	f6XQ==
X-Gm-Message-State: ALoCoQkJzHpyfQZ2yUD7dj0s0deUsbQ9Q2q881/Yonu7520MNm40p60C3d85WWsz1gzofWfjFmUp
X-Received: by 10.140.30.138 with SMTP id d10mr26990375qgd.80.1441635601204;
	Mon, 07 Sep 2015 07:20:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.94.86 with HTTP; Mon, 7 Sep 2015 07:19:41 -0700 (PDT)
In-Reply-To: <55EBF552.80709@windriver.com>
References: <cover.1439799468.git.liezhi.yang@windriver.com>
	<55EBF552.80709@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 7 Sep 2015 15:19:41 +0100
Message-ID: <CAJTo0LZqqzwZwN8Rf3BX1_quVaj=z-u3=dct1jcSvuZfhkKx4Q@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] mc: add PACKAGECONFIG for util-linux
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
X-List-Received-Date: Mon, 07 Sep 2015 14:20:03 -0000
Content-Type: multipart/alternative; boundary=001a113a9e7ce7cef8051f28f1bf

--001a113a9e7ce7cef8051f28f1bf
Content-Type: text/plain; charset=UTF-8

On 6 September 2015 at 09:12, Robert Yang <liezhi.yang@windriver.com> wrote:

> Ping.
>

A similar but more basic (just adding util-linux as a build dep) patch was
merged as c158cdd.  If you want it to be a packageconfig then please rebase.

Ross

--001a113a9e7ce7cef8051f28f1bf
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 6 September 2015 at 09:12, Robert Yang <span dir=3D"ltr">&lt;<a href=3D"=
mailto:liezhi.yang@windriver.com" target=3D"_blank">liezhi.yang@windriver.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex"><div id=3D":lk" class=3D"" sty=
le=3D"overflow:hidden">Ping.</div></blockquote><div><br></div><div>A simila=
r but more basic (just adding util-linux as a build dep) patch was merged a=
s c158cdd.=C2=A0 If you want it to be a packageconfig then please rebase.</=
div><div><br></div><div>Ross</div></div></div></div>

--001a113a9e7ce7cef8051f28f1bf--
