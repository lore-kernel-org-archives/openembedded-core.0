Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f177.google.com (mail-qk0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id 35C0A731CA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 16:04:11 +0000 (UTC)
Received: by mail-qk0-f177.google.com with SMTP id p22so5560035qka.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2017 08:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7P0ncI77o3c9dvkCV7yVedqUFDNctLzjsxfOU1JMAVY=;
	b=gVYJ5bsMwUd9kbZ89QGqBSE/+vaeTgLR53EULqbS+CbYBrVEMLtAe0dVkDYeaq8mLt
	bcZuDFMCV/ACGRJ5Rt9Uaydq8JyuQtBYL94IFSwEyM6tDughcToy7yASB2biW1viWnPk
	cFhMuDffLSTfIDUujmsYY4XYAI0e8WJWJh7RIhgmnSwWNwcG4iRX6CZtgo0nk7d6a47G
	dLgF+VAtLfqb7kC6m8qanO6Wvznp2rzSyvGmcVK3fj2ieXwgAcj006q/iT/rdv4YcmY5
	00VQsu12SHhnrwzMv/KGVFmCK6j7wt5FiW010QowKpJ3xiU3pRXMSl7JdFNxHxsHxeyg
	RLhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7P0ncI77o3c9dvkCV7yVedqUFDNctLzjsxfOU1JMAVY=;
	b=H9SxVsjY+P8B9NiFn4ZYyAEB1owGT0tTWzMbimgyn/uvPamk/Y6DVO+xWUkCu5+WXK
	PBHAHB2lfb1PVbBPgr+bLcW9yQ0wtTWhJSJ2ErCuVIr9tl9WIxn/u7cp6botQzHEbXeF
	yFLie/btGy0FNzhLG7jeKCUobMMfzM9mpz5mjTU2xLo/GV853+EBM5zFakDZsLQCIHJG
	Ol+4FsoXK+QwyV8PLKKHoxT4chBIMJns5W3UETyIbFYrIvZmhSGkeDIlr89cnfyqs8PY
	AwlMZa/1K2+9uyCi3MYhlpmMtTGyri7AOOWCkyw+han0nAXw8HsEcEo2ndJt35jlljfK
	l2vA==
X-Gm-Message-State: AMke39nfoE9Y24KhXHcUNvLSWwHCryLx5Xz4AtSfwFVrkoETkfyYokgznf/+QFR6Th4kjL2D7xxRTGsXFGhGqchR
X-Received: by 10.55.183.133 with SMTP id h127mr24034968qkf.121.1487001852111; 
	Mon, 13 Feb 2017 08:04:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.103.233 with HTTP; Mon, 13 Feb 2017 08:03:51 -0800 (PST)
In-Reply-To: <c5c82e1e-9290-1273-825d-9620e180c9b3@linux.intel.com>
References: <cover.1486997986.git.alexander.kanavin@linux.intel.com>
	<cb62217431175ee1029d3d223e9940886aa0e637.1486997986.git.alexander.kanavin@linux.intel.com>
	<CAJTo0LYjW=pgmayQ-kb+Caae7OJggiPf2hQHn3gnboSFZscdpg@mail.gmail.com>
	<c5c82e1e-9290-1273-825d-9620e180c9b3@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 13 Feb 2017 16:03:51 +0000
Message-ID: <CAJTo0LZOWWy=cNmp8bHZV2egjUTZADVgRxgv5kGOos__0Yx-AQ@mail.gmail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 30/36] selftest: do not perform a full build in test_continue
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
X-List-Received-Date: Mon, 13 Feb 2017 16:04:12 -0000
Content-Type: multipart/alternative; boundary=94eb2c0600562d101305486b99e3

--94eb2c0600562d101305486b99e3
Content-Type: text/plain; charset=UTF-8

On 13 February 2017 at 16:02, Alexander Kanavin <
alexander.kanavin@linux.intel.com> wrote:

> The test is forcing its own private DL_DIR, so I really don't see why we
> should be concerned about avoiding doing cleanall:
>

So it is!  Still, overcomplicating things.  No need to have a custom DL_DIR
and clean it when you don't need to bother.

Ross

--94eb2c0600562d101305486b99e3
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 13 February 2017 at 16:02, Alexander Kanavin <span dir=3D"ltr">&lt;<a hr=
ef=3D"mailto:alexander.kanavin@linux.intel.com" target=3D"_blank">alexander=
.kanavin@linux.intel.com</a>&gt;</span> wrote:<br><blockquote class=3D"gmai=
l_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left=
:1ex"><div id=3D":2ze" class=3D"a3s aXjCH m15a3835bb82bfe66">The test is fo=
rcing its own private DL_DIR, so I really don&#39;t see why we should be co=
ncerned about avoiding doing cleanall:<br></div></blockquote></div><br>So i=
t is!=C2=A0 Still, overcomplicating things.=C2=A0 No need to have a custom =
DL_DIR and clean it when you don&#39;t need to bother.</div><div class=3D"g=
mail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--94eb2c0600562d101305486b99e3--
