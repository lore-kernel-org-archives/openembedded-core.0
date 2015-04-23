Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 0B05F6AC24
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 13:03:05 +0000 (UTC)
Received: by qgeb100 with SMTP id b100so7484635qge.3
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Apr 2015 06:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=OaI+21khDhn4amXKr6ySb6bQrIF5M1S7AleAnUs3SWw=;
	b=FHvPL0gsfbxSU5yOmYXaseBTxPOtsZNI2zi9Wh4eqzLh+3qGQrWRPDArqlTFE+NzWZ
	M+OZb1a2jVwXCES+8MQCj0dNI5gXGEu7ksHj9HEXhOX1Ud5AOCZ5S+tmM4HJacxIbNLU
	+eFYcnY8gbvCdps1xNCFuXBq30RKx4u11n973BgtYuoub9Ce9ksBIiO5M9AQ9A4tfAq9
	1s3uAt7f2Dm+l11j0IcIklFSOeYNEiYdVGOWA7DmThLMrqbprWmPPjocHEBLuiz7Tn28
	wlu+xJyBbQ+ErtHiQRhGkEHk30OHxUALr7ZTrU/V4bZTjL9/VpJLVVhabGiSNRXra8gY
	wWVA==
X-Gm-Message-State: ALoCoQkT+FJGeQMOxVHVHQf4bu/qyezmyIZSxez3+KqoMMz/Kbey0SMM5CLW+uuNYYFxpaoU27rK
X-Received: by 10.140.235.77 with SMTP id g74mr3083765qhc.64.1429794186211;
	Thu, 23 Apr 2015 06:03:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Thu, 23 Apr 2015 06:02:45 -0700 (PDT)
In-Reply-To: <2822728.eQSAVmuFvh@peggleto-mobl.ger.corp.intel.com>
References: <1429771148-1545-1-git-send-email-cristian.iorga@intel.com>
	<2822728.eQSAVmuFvh@peggleto-mobl.ger.corp.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 23 Apr 2015 16:02:45 +0300
Message-ID: <CAJTo0LZd_CSOVW9j07d19fARwvkFuj3LgaizQO7Dr3xg_mpd-A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] testimage: regenerate rootfs before testing
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
X-List-Received-Date: Thu, 23 Apr 2015 13:03:08 -0000
Content-Type: multipart/alternative; boundary=001a11354a009248a8051463e6a0

--001a11354a009248a8051463e6a0
Content-Type: text/plain; charset=UTF-8

On 23 April 2015 at 12:20, Paul Eggleton <paul.eggleton@linux.intel.com>
wrote:

> I can't remember for certain, but I suspect the lack of this dependency was
> intentional, so that you could e.g. copy in an image built elsewhere and
> run
> tests on it. Maybe we can take the decision we don't need that, but it
> should
> be a conscious decision.
>

My guess was that the missing dependency was from when rootfs always
regenerated an image, so if you were iterating the test suite it would
always rebuild the image.  This isn't the case now.

Someone should speak with QA and see if they actually use the ability to
copy in images.  Cristian, I'm looking at you. :)

Ross

--001a11354a009248a8051463e6a0
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 23 April 2015 at 12:20, Paul Eggleton <span dir=3D"ltr">&lt;<a href=3D"m=
ailto:paul.eggleton@linux.intel.com" target=3D"_blank">paul.eggleton@linux.=
intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=
=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=
=3D":av" class=3D"a3s" style=3D"overflow:hidden">I can&#39;t remember for c=
ertain, but I suspect the lack of this dependency was<br>
intentional, so that you could e.g. copy in an image built elsewhere and ru=
n<br>
tests on it. Maybe we can take the decision we don&#39;t need that, but it =
should<br>
be a conscious decision.</div></blockquote></div><br>My guess was that the =
missing dependency was from when rootfs always regenerated an image, so if =
you were iterating the test suite it would always rebuild the image.=C2=A0 =
This isn&#39;t the case now.</div><div class=3D"gmail_extra"><br></div><div=
 class=3D"gmail_extra">Someone should speak with QA and see if they actuall=
y use the ability to copy in images.=C2=A0 Cristian, I&#39;m looking at you=
. :)</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra">R=
oss</div></div>

--001a11354a009248a8051463e6a0--
