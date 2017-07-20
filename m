Return-Path: <ross.burton@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 3AA12782BB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 13:03:42 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id l7so11441272iof.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Jul 2017 06:03:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=irh/1YbHbHNApkcF/v0ulV/UXTN+357BwCxNr9zDQq0=;
	b=YcYVRlE5V+3MQko8N45VpBO/bVmrr2PnjEY6d/Xg7k8N0gpU/PaVhNbxrKOQtcPOY9
	fLU/4b7UuYUh6IoEpRMcB2zD08K1Od3++malUhiFTdce2FmwKjcmOZwnNlxoux+RTnWP
	b3qhTqWn6tcTLHm74q/u7HwhLj31oFNuUhiE1aRYfoJ1QaQGGrhc1r0wEbjr/BRhX2O5
	P+T9D9I/eXLYg7WrAWZhaQIVqyBlWpjS05Nv3lUyXRCdLjSjaHXzkZg0REbH7Qp+Ui58
	z11Ra5Q5Itt65bvicjnKVseCm+qqHB6zg6USpB45LHJRNwYbtrQzET/at7Kszc7PsPg/
	Ez4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=irh/1YbHbHNApkcF/v0ulV/UXTN+357BwCxNr9zDQq0=;
	b=THvES5mus3i/A7gnpQ9sotsAkZSwVbhHmOc1vcRK4lrTjSpaRrz42+HU7euHh24pYe
	9onqjGlIKOdebhfWqn5KpQo9gh30I8MD339k0F/8wLiDSvEB4XJvCxnGggeiFFqD/dMt
	WTFe3xt5sAuHnfFhd5Naom++TOctyvheNPHDHB9j8hRKxuSEpfk25IMwiHJBK49w9IdX
	YhQaL+lgGJQWBq7b9H4vazSZZYmGLeqdaGRzGT+xH6W5n2DnW7RMPkcQfy1n+xegvNcP
	dy/ACw8uZkCNI6Plsu16/KwWCA7X67d83NAjy/1iCUZBSuQ6wwxvrW4UOY4eijjQDyr9
	5OnQ==
X-Gm-Message-State: AIVw110C0wc60ardVrhCXqShdI6qTipi83LTs/PDTuFSHk/lDHPsYHKC
	1WYAnOUc66hrl1MaEyEM5WNCvvS2NBbI
X-Received: by 10.107.132.33 with SMTP id g33mr3266118iod.300.1500555823163;
	Thu, 20 Jul 2017 06:03:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.107.135.234 with HTTP; Thu, 20 Jul 2017 06:03:22 -0700 (PDT)
In-Reply-To: <CAP71Wjz2gS1PYWZzZ2FYb72F_T2dP30266Xcy70eRJvftjsKUA@mail.gmail.com>
References: <20170720115657.11406-1-nicolas.dechesne@linaro.org>
	<CAP71Wjz2gS1PYWZzZ2FYb72F_T2dP30266Xcy70eRJvftjsKUA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Jul 2017 14:03:22 +0100
Message-ID: <CAJTo0LaKDgomugkgS0uirpirJPOLSu=-OXyEDQcGSuF6PTP8HQ@mail.gmail.com>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] ffmpeg: fix pkg-config utilization
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
X-List-Received-Date: Thu, 20 Jul 2017 13:03:43 -0000
Content-Type: multipart/alternative; boundary="001a113ed2e8ce5d4b0554bf606d"

--001a113ed2e8ce5d4b0554bf606d
Content-Type: text/plain; charset="UTF-8"

On 20 July 2017 at 13:58, Nicolas Dechesne <nicolas.dechesne@linaro.org>
wrote:

> and it would make this patch a no-op instead. the patch would only
> 'fix' the pkg-config mistmatch. and we can fixup the xcb dependencies
> as a follow up patch instead. i am opened to suggestions..
>

Enabling those is good, although there should be a packageconfig so ffmpeg
still builds without x11.

Ross

--001a113ed2e8ce5d4b0554bf606d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 20 July 2017 at 13:58, Nicolas Dechesne <span dir=3D"ltr">&lt;<a href=3D=
"mailto:nicolas.dechesne@linaro.org" target=3D"_blank">nicolas.dechesne@lin=
aro.org</a>&gt;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D"=
:15j" class=3D"a3s aXjCH m15d601454d2ff113">and it would make this patch a =
no-op instead. the patch would only<br>
&#39;fix&#39; the pkg-config mistmatch. and we can fixup the xcb dependenci=
es<br>
as a follow up patch instead. i am opened to suggestions..<div class=3D"yj6=
qo ajU"><div id=3D":174" class=3D"ajR" tabindex=3D"0"></div></div></div></b=
lockquote></div><br>Enabling those is good, although there should be a pack=
ageconfig so ffmpeg still builds without x11.</div><div class=3D"gmail_extr=
a"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a113ed2e8ce5d4b0554bf606d--
