Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id DD12276903
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 19:58:07 +0000 (UTC)
Received: by qkfj126 with SMTP id j126so10855505qkf.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Aug 2015 12:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DJHKSbP0GomJLGTp77etvGYr/74202P+4AbRHoixAWE=;
	b=aqsAWTO4V7R8O1w7LtMBprCO+ebS/yjgdNnxFpx5m3yQcpwxrQbA0IwyE0PMUb8flu
	WtJ0t1V753M+2vkChoqQ3VY1aNGhf5P2t/vcazYDB0gBVOCLbc9dfGcZHpkBroAOYQS7
	9Hh8N1Bz0efjQXg/ldur5eg8VKdBZ+yUy0MmR+Lk8SvgbXwf+J8SgGvvsdofyOL11mbf
	S9i1E3JUyixm2hlpEeoDhO5miLGW0AuoxpnesVsXbXXLae3Kz9H4Q7+mV5Dx7DMr/tL1
	48mI5STFID1dEA1XnzN5hzLfeZQf982nK58hwAByQoPNu11Uu3a0Mj6U/L4a89lbXPGz
	SWtw==
X-Gm-Message-State: ALoCoQlj6XRt1ToQdyEjrb2fuOwBK9RaENnvM7UJaAoYA+HRfB55m7vgQGMGwTwbbxmO3AvWGQv/
X-Received: by 10.55.53.193 with SMTP id c184mr39708002qka.62.1439236687865;
	Mon, 10 Aug 2015 12:58:07 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.98.67 with HTTP; Mon, 10 Aug 2015 12:57:48 -0700 (PDT)
In-Reply-To: <1439236066-20015-1-git-send-email-otavio@ossystems.com.br>
References: <1439236066-20015-1-git-send-email-otavio@ossystems.com.br>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Aug 2015 20:57:48 +0100
Message-ID: <CAJTo0LZpPm1UGdw-ASy3bAH5RVZEHTwh_jEu34_mz3A2zkbn2w@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: OpenEmbedded Core Mailing List <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/2] mesa: Provide virtual/libopenvg
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
X-List-Received-Date: Mon, 10 Aug 2015 19:58:10 -0000
Content-Type: multipart/alternative; boundary=001a11476f148740ed051cfa674b

--001a11476f148740ed051cfa674b
Content-Type: text/plain; charset=UTF-8

On 10 August 2015 at 20:47, Otavio Salvador <otavio@ossystems.com.br> wrote:

> There are other GPU drivers which provide alternative implementations
> for libopenvg thus a virtual/libopenvg should be available for proper
> dependencies to be specified.
>

As of mesa 10.6.x (queued in master-next) OpenVG support was removed, so
this is obsolete now.

Ross

--001a11476f148740ed051cfa674b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 10 August 2015 at 20:47, Otavio Salvador <span dir=3D"ltr">&lt;<a href=
=3D"mailto:otavio@ossystems.com.br" target=3D"_blank">otavio@ossystems.com.=
br</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":1e5"=
 class=3D"a3s" style=3D"overflow:hidden">There are other GPU drivers which =
provide alternative implementations<br>
for libopenvg thus a virtual/libopenvg should be available for proper<br>
dependencies to be specified.<br></div></blockquote></div><br>As of mesa 10=
.6.x (queued in master-next) OpenVG support was removed, so this is obsolet=
e now.</div><div class=3D"gmail_extra"><br></div><div class=3D"gmail_extra"=
>Ross</div></div>

--001a11476f148740ed051cfa674b--
