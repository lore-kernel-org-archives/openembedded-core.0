Return-Path: <rajathcs.1996@gmail.com>
Received: from mail-vk0-f51.google.com (mail-vk0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id EBD6674AD7
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 13:20:51 +0000 (UTC)
Received: by mail-vk0-f51.google.com with SMTP id v205so12972750vkv.13
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 Apr 2018 06:20:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=/eiyVDaxdKxiu/khIMH0fX8dMMgKM8Pnyw0OzuXJXqw=;
	b=m4+bu01iHZkZQvuxRE73F2GL/5KL3hlTMAIdTG5/R+Sw/65kRtqepY/zlYMRGJQuUs
	uVj7+Htilz9YyALELUqg+bG7HwEmjCbW6CuuNdH/T1xqhU8jJja/jZVWsYS9VJyshnon
	yd8iOI2od4+p1/YBnBKBFZjkfB/vO7VYbnrKEYYpB87Pz3SJxlPEU87KXUcAEIfABSDd
	zCHRWblO049zNaQV0MyhB2LXxOAFTrAYVrAvVU8tJPaluLjOLG0UYWXq1K1fJFL5Wz5F
	N2XprDAyrVhVK7FuJgCY3Usx/IuMN8IVwebF54zVz2jntjD7yvEK7jYMcmKAqkLlFXYk
	3F+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=/eiyVDaxdKxiu/khIMH0fX8dMMgKM8Pnyw0OzuXJXqw=;
	b=DTKLv+so4EmZNTGh/51Ze6JGdxv/zm18VoHldZj4NgbF86oGlAITPwabjJwqG0GZJh
	Y8Wz7uwGIv3tNcq1Q/eaN3+7Fz7K2CdT1R7ktfOODNKdol53ZB3s0Y50XqgkT/kxOxIC
	E8CXyCNTFdVKSQsM7+J6wPqiGmdX0vlP422rGu5RFabRpXteZzig52S2FbzKjG9zLnHt
	tlD06hAaddDV0cdd0q2a0cYuAyMH4AwqufR2FwJIai1mP3pO+29xdU9+kaLYnDBWhrA3
	TMtWqxezHHnzsd0RGoMXwavknGZbX2n/0reA6aObR9rNJnVlhEkFJgPw7SAB2xSlvjF+
	G6rw==
X-Gm-Message-State: ALQs6tBlHO/2Tf0XLeHQ8eqjcQne2lzz/tOucAfF1LzBqvg2tVla36KE
	L4u4WWvEjGVOIC9dDgmxXngkfHzTju0VMzD9QiA=
X-Google-Smtp-Source: AIpwx4/80LPemZpXBB5E1178vFzjTGJCqDqzK5LuxkJGXt61zCthqf+ZgO4OPsTjPyxi7BHLedefETrwls7NRLLpDmM=
X-Received: by 10.31.7.132 with SMTP id 126mr13459823vkh.42.1522934452504;
	Thu, 05 Apr 2018 06:20:52 -0700 (PDT)
MIME-Version: 1.0
References: <CAPGMVzHSCh1VU91Leev0BaZNbzg05U--61WEO1UgcL700_WkBA@mail.gmail.com>
	<CAPGMVzGsUSor8=tX5EWWmnhUw1G4rpia9SVpSu=eYHw7DXDghw@mail.gmail.com>
	<236bdac4-6e55-777d-b808-dcd6375d5dbb@linux.intel.com>
In-Reply-To: <236bdac4-6e55-777d-b808-dcd6375d5dbb@linux.intel.com>
From: Rajath C S <rajathcs.1996@gmail.com>
Date: Thu, 05 Apr 2018 13:20:41 +0000
Message-ID: <CAPGMVzFPwMa5xV=0H2Wim=OgiYJ-Tv4KvFrm5T7-8ecDyWOy9w@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe] qemu boot problem
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
X-List-Received-Date: Thu, 05 Apr 2018 13:20:52 -0000
Content-Type: multipart/alternative; boundary="001a11441a200ecccc056919cff4"

--001a11441a200ecccc056919cff4
Content-Type: text/plain; charset="UTF-8"

The above text I have posted itself is the full output it's throwing and
with with respect to command - runqemu qemux86


On Thu, 5 Apr 2018, 18:38 Alexander Kanavin, <
alexander.kanavin@linux.intel.com> wrote:

> On 04/05/2018 01:43 PM, Rajath C S wrote:
> > as the error specifies about a specific recipe missing the license, i'd
> > like to know which recipe is that what is the pointer to defaultpkgname
>
> You need to provide both the command you issue on the command line, and
> the full output that it prints.
>
> Alex
>

--001a11441a200ecccc056919cff4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">The above text I have posted itself is the full output it=
&#39;s throwing and with with respect to command - runqemu qemux86<div dir=
=3D"auto"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr">O=
n Thu, 5 Apr 2018, 18:38 Alexander Kanavin, &lt;<a href=3D"mailto:alexander=
.kanavin@linux.intel.com">alexander.kanavin@linux.intel.com</a>&gt; wrote:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;borde=
r-left:1px #ccc solid;padding-left:1ex">On 04/05/2018 01:43 PM, Rajath C S =
wrote:<br>
&gt; as the error specifies about a specific recipe missing the license, i&=
#39;d<br>
&gt; like to know which recipe is that what is the pointer to defaultpkgnam=
e<br>
<br>
You need to provide both the command you issue on the command line, and<br>
the full output that it prints.<br>
<br>
Alex<br>
</blockquote></div>

--001a11441a200ecccc056919cff4--
