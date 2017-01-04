Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f174.google.com (mail-qt0-f174.google.com
	[209.85.216.174])
	by mail.openembedded.org (Postfix) with ESMTP id E38E2719DE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  4 Jan 2017 23:50:13 +0000 (UTC)
Received: by mail-qt0-f174.google.com with SMTP id v23so37127925qtb.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2017 15:50:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=K1wkxyxobBcuzkvAo19wZP78mfRIPS23LdvYjzfJHd8=;
	b=jusBalXNUQqJGsaHaSWco9pTZRm9ygQEkLwmY1ADYRjJ/jDx0KN/r5IBF3ZG9LO/U0
	EokgSPb5ly0AAmWpgAvZwesgpVlNp6Utt2wWwXVv/18m3Pj1nKcHrMpoCsguKnA/AZXh
	zqhsskooN/6QDiDrXK5RHGtmrPKAyKRCfnzuC2LnVgpr/oA/RRplc30KV9qmS95dX5m+
	W0OfnQFYA2OPRedhYq9MuUnJ3FCs9dvIsY2jkVRix9Wcv2FlWADdKsUOHFEo6MBFSSpT
	IVCAiMaDRKyj6ojD5Hjs6FWXU6x7Dppqm9zYfjcrLW59Dhv8FvV2suIXYUx3xKlJ1b7C
	+6sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=K1wkxyxobBcuzkvAo19wZP78mfRIPS23LdvYjzfJHd8=;
	b=ubnDegH+L+jCObJjIPvILZsuNMVtt55x2WLJO6yEi+cyzUCGv262in/4g+Pr09JKHN
	H1FAPm6JO8b654tPLH/3ENlWQ7E+Yxaxs5Jr+Fdmif5O5e3KovU8w8JZaQK72M1qRoQJ
	rwuX/9P+w+YvuMwXxkd8xNmkkiiZPZKXY9DNnwfSlDlc9jsQFxQssiznTUJX/9Seferq
	YrzMB8eCDXj5pn725c2nDiQIDc0FKJz6DBKnpnjxVs2kuoSTNyoHZuIhjhrawk77JDLJ
	zUJjTAgVOq6v8VocIJJWUMYzKUHgcctQp7C8zXy4jNqivAdPo7YJ2bHzQGUt/wESnCLg
	kcXw==
X-Gm-Message-State: AIkVDXIDPyFp8bx3KtFnAdd0rbNjXChM1e8VgPRNBq+1o7v4jpZVinEqOH6jdxJhb7ZdmfDR2Jf90I+bsAzQDP6v
X-Received: by 10.237.34.46 with SMTP id n43mr70374257qtc.105.1483573814459;
	Wed, 04 Jan 2017 15:50:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.106.99 with HTTP; Wed, 4 Jan 2017 15:49:54 -0800 (PST)
In-Reply-To: <cover.1483570577.git.chris_larson@mentor.com>
References: <cover.1483570577.git.chris_larson@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 4 Jan 2017 23:49:54 +0000
Message-ID: <CAJTo0LYepu3mAAc=Y76RxBW20w1gEVH1+ms7gpfmSTB-ePfrcQ@mail.gmail.com>
To: Christopher Larson <kergoth@gmail.com>
Cc: Christopher Larson <chris_larson@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Add opengl to REQUIRED_DISTRO_FEATURES for some recipes
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
X-List-Received-Date: Wed, 04 Jan 2017 23:50:15 -0000
Content-Type: multipart/alternative; boundary=001a11377e1835bd1b05454d72b1

--001a11377e1835bd1b05454d72b1
Content-Type: text/plain; charset=UTF-8

On 4 January 2017 at 22:57, Christopher Larson <kergoth@gmail.com> wrote:

> These aren't buildable without it, and adding it fixes oe-core world builds
> with nodistro (which does not have the opengl feature by default).
>

Am I still the only person who thinks skipping of recipes should be
recursive, so if say libx11 throws a SkipRecipe then everything else that
depends on it is also magically skipped?

Ross

--001a11377e1835bd1b05454d72b1
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 4 January 2017 at 22:57, Christopher Larson <span dir=3D"ltr">&lt;<a hre=
f=3D"mailto:kergoth@gmail.com" target=3D"_blank">kergoth@gmail.com</a>&gt;<=
/span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8=
ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":419" class=3D"a=
3s aXjCH m1596bb4613b3de8d">These aren&#39;t buildable without it, and addi=
ng it fixes oe-core world builds<br>
with nodistro (which does not have the opengl feature by default).<br></div=
></blockquote></div><br>Am I still the only person who thinks skipping of r=
ecipes should be recursive, so if say libx11 throws a SkipRecipe then every=
thing else that depends on it is also magically skipped?</div><div class=3D=
"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a11377e1835bd1b05454d72b1--
