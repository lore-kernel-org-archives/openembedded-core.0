Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id B2EA0759DE
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 22:38:20 +0000 (UTC)
Received: by qcsf5 with SMTP id f5so8278856qcs.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Jun 2015 15:38:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=4uXGnpIrSmGBdQK/apx6pjTqMuqd1sHukv2FSTVMAp8=;
	b=KkkDO7JOuDhrtRptMJ4TpmylsDVhXzUk4SH+MEJz1F+kY8Y7B2mGp65wWh86ylal5S
	aaUEs/oXZYnpYuECtChsPjnd+L9t06Uu8g/1TS4Wsh13gXF289NTAiylIqVyj8583FAC
	wR983iy6X1ReQPi4xyhlZoDso2h7enMGqpWlGG+LPhrHr6vZL0ckyrYalP9pS9mkcCow
	B8Y5nJ0KzyYPqBigtS4dq7pKrDKsd76mNqxUuKWDhXQeTjF5f3R78TJmF+ZiVNJg4+Qc
	FnMfHwrQIRXxlXtf4P0sI05v3KPPthXXinq2fJhdGcvrQEwdCj/zofbWmL/AiY1oI0lT
	NbuQ==
X-Gm-Message-State: ALoCoQkcLPdExNWgVCqZzz130Nh9YogNSAcknT2L2GNkgGcjgVoyTyO4L9xYjhhVl6egY3FkNGd1
X-Received: by 10.140.43.228 with SMTP id e91mr38438120qga.80.1434407901652;
	Mon, 15 Jun 2015 15:38:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 15 Jun 2015 15:38:01 -0700 (PDT)
In-Reply-To: <1434111318-12593-1-git-send-email-laurentiu.palcu@intel.com>
References: <1434111318-12593-1-git-send-email-laurentiu.palcu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Jun 2015 23:38:01 +0100
Message-ID: <CAJTo0LYnsO=8GnT+6U1dOssUAbcgWNEEVD1y_niOLyaED4ak3Q@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] scripts: Add cleanup-downloads-dir tool
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
X-List-Received-Date: Mon, 15 Jun 2015 22:38:21 -0000
Content-Type: multipart/alternative; boundary=001a113a34bc7100790518961d91

--001a113a34bc7100790518961d91
Content-Type: text/plain; charset=UTF-8

On 12 June 2015 at 13:15, Laurentiu Palcu <laurentiu.palcu@intel.com> wrote:

> A few days ago I noticed I had no space on disk and decided to make some
> space. Since my downloads directory was never deleted since denzil, it
> consumed 25GB of space which I needed. However, I wanted to delete only old
> and unneeded tarbals/git repos and keep the ones that my current Yocto
> version needed, so I wrote this tool.
>

Something is not quite right, after running this and causing a rebuild I
got this:

ERROR: No checksum specified for
/home/ross/Yocto/downloads/git2_git.lttng.org.lttng-modules.git.tar.gz,
please add at least one to the recipe:
SRC_URI[md5sum] = "c32ceb7d4b208b2b1d8132c3bbc7d638"
SRC_URI[sha256sum] =
"d593cca435003770e981c8ae5def3db0e95d72bc3f83f3d43a18287ea1f6d165"
ERROR: Function failed: Fetcher failure for URL: '
http://downloads.yoctoproject.org/mirror/sources/git2_git.lttng.org.lttng-modules.git.tar.gz'.
Missing SRC_URI checksum

A few too many files pruned?

Ross

--001a113a34bc7100790518961d91
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 12 June 2015 at 13:15, Laurentiu Palcu <span dir=3D"ltr">&lt;<a href=3D"=
mailto:laurentiu.palcu@intel.com" target=3D"_blank">laurentiu.palcu@intel.c=
om</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left-width:1px;border-left-color:rgb(204,204,20=
4);border-left-style:solid;padding-left:1ex"><div id=3D":2vy" class=3D"" st=
yle=3D"overflow:hidden">A few days ago I noticed I had no space on disk and=
 decided to make some<br>
space. Since my downloads directory was never deleted since denzil, it<br>
consumed 25GB of space which I needed. However, I wanted to delete only old=
<br>
and unneeded tarbals/git repos and keep the ones that my current Yocto<br>
version needed, so I wrote this tool.</div></blockquote></div><br>Something=
 is not quite right, after running this and causing a rebuild I got this:</=
div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"><div cl=
ass=3D"gmail_extra">ERROR: No checksum specified for /home/ross/Yocto/downl=
oads/git2_git.lttng.org.lttng-modules.git.tar.gz, please add at least one t=
o the recipe:</div><div class=3D"gmail_extra">SRC_URI[md5sum] =3D &quot;c32=
ceb7d4b208b2b1d8132c3bbc7d638&quot;</div><div class=3D"gmail_extra">SRC_URI=
[sha256sum] =3D &quot;d593cca435003770e981c8ae5def3db0e95d72bc3f83f3d43a182=
87ea1f6d165&quot;</div><div class=3D"gmail_extra">ERROR: Function failed: F=
etcher failure for URL: &#39;<a href=3D"http://downloads.yoctoproject.org/m=
irror/sources/git2_git.lttng.org.lttng-modules.git.tar.gz">http://downloads=
.yoctoproject.org/mirror/sources/git2_git.lttng.org.lttng-modules.git.tar.g=
z</a>&#39;. Missing SRC_URI checksum</div><div class=3D"gmail_extra"><br></=
div><div class=3D"gmail_extra">A few too many files pruned?</div><div class=
=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div></div=
>

--001a113a34bc7100790518961d91--
