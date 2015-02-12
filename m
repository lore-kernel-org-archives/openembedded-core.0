Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f54.google.com (mail-qg0-f54.google.com
	[209.85.192.54])
	by mail.openembedded.org (Postfix) with ESMTP id 5862C606E8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 15:36:39 +0000 (UTC)
Received: by mail-qg0-f54.google.com with SMTP id z60so8413036qgd.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 Feb 2015 07:36:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=VpkADUN5CebFaeBagktQnmeBdRZT6y24tpSDFgj9E6I=;
	b=ATJaUweLi8lVb4BTtEbjr6Hg0qBloE+AS4gWkMF/r1yy1NPe/WXxzIx2YVBbiF3b7I
	LPW2YQp9+Sz/NoTXvXeFaP7qszC/1KgYejWqb31m3U0rq7rWCNgCq7W3DJmfRoyQK/Rk
	L8v/l572LntJYMDhgnZYuhnTb+JhE1aWO1VDtcQ/dE5yh2qHZ9MoiPn7Kj5tMpsfqCxi
	6LLJxylo88dtK/dzvFUPUCy0fU7LPupeZ2pAzih3ARWfDYcfZiE/SK4aDCW74xprpPam
	QQldZoaHjc/t8izQ6YJB0omdIniqlJvCbRwYcRBC4TsMmQ0vobZjriVK6eL7VQLZQS6Y
	Mj1g==
X-Gm-Message-State: ALoCoQkuU05Su/er40kGxP0nuaj5oUTWnlJHDl1Oju7VZhhPN9Ze5KMD6vTK+1x87o8zLfDGb4Iv
X-Received: by 10.140.39.179 with SMTP id v48mr11305278qgv.77.1423755400853;
	Thu, 12 Feb 2015 07:36:40 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.96.166 with HTTP; Thu, 12 Feb 2015 07:36:19 -0800 (PST)
In-Reply-To: <CAJTo0LbvkV1kVy3f_Qy95FCCAuZcJkqwRR_3v2FdoYrha6B51Q@mail.gmail.com>
References: <1423500745-2142-1-git-send-email-ben.shelton@ni.com>
	<1423500745-2142-2-git-send-email-ben.shelton@ni.com>
	<CAJTo0LbvkV1kVy3f_Qy95FCCAuZcJkqwRR_3v2FdoYrha6B51Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 12 Feb 2015 15:36:19 +0000
Message-ID: <CAJTo0LbLPSVjKi-m085=HnkVTTkKaUozVTpJBc2qzOJ-wqSL0Q@mail.gmail.com>
To: Ben Shelton <ben.shelton@ni.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] kernelshark: Update to version 2.5.2
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
X-List-Received-Date: Thu, 12 Feb 2015 15:36:41 -0000
Content-Type: multipart/alternative; boundary=001a11c131f6ea576e050ee5e249

--001a11c131f6ea576e050ee5e249
Content-Type: text/plain; charset=UTF-8

On 12 February 2015 at 07:46, Burton, Ross <ross.burton@intel.com> wrote:

> This is failing on the autobuilder:
>
> http://errors.yoctoproject.org/Errors/Details/8571/
> http://errors.yoctoproject.org/Errors/Details/8572/
>
> Two problems - an exception during build that is probably being ignored,
> and then swing not found.  Is swig a non-deterministic dependency?
>

I had a quick look at this and it appears that despite having Python
build-depends (via trace-cmd.h) kernelshark for me locally doesn't build
with Python enabled.  Somehow the autobuilder managed to have an
environment that almost but not quite worked and so it tried to build...
and failed miserably as oe-core doesn't have a swig binary.

I guess this just needs NO_PYTON exported to stop the Python auto-detection
from happening.

Ross

--001a11c131f6ea576e050ee5e249
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 February 2015 at 07:46, Burton, Ross <span dir=3D"ltr">&lt;<a href=3D=
"mailto:ross.burton@intel.com" target=3D"_blank">ross.burton@intel.com</a>&=
gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 =
0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div>This is failing on=
 the autobuilder:</div><div><br></div><div><a href=3D"http://errors.yoctopr=
oject.org/Errors/Details/8571/" target=3D"_blank">http://errors.yoctoprojec=
t.org/Errors/Details/8571/</a><br></div><div><a href=3D"http://errors.yocto=
project.org/Errors/Details/8572/" target=3D"_blank">http://errors.yoctoproj=
ect.org/Errors/Details/8572/</a><br></div><div><br></div><div>Two problems =
- an exception during build that is probably being ignored, and then swing =
not found.=C2=A0 Is swig a non-deterministic dependency?</div></blockquote>=
</div><br>I had a quick look at this and it appears that despite having Pyt=
hon build-depends (via trace-cmd.h) kernelshark for me locally doesn&#39;t =
build with Python enabled.=C2=A0 Somehow the autobuilder managed to have an=
 environment that almost but not quite worked and so it tried to build... a=
nd failed miserably as oe-core doesn&#39;t have a swig binary.</div><div cl=
ass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">I guess this just =
needs NO_PYTON exported to stop the Python auto-detection from happening.</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</d=
iv></div>

--001a11c131f6ea576e050ee5e249--
