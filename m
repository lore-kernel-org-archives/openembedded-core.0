Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f181.google.com (mail-qt0-f181.google.com
	[209.85.216.181])
	by mail.openembedded.org (Postfix) with ESMTP id 8BD38780E7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 13:28:30 +0000 (UTC)
Received: by mail-qt0-f181.google.com with SMTP id v27so154789759qtg.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 May 2017 06:28:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=28tPTXva8OG1BrPrhMlSpzUELdkO2EYIjR1hmsk+IqY=;
	b=xpLa+wBbb+6zG2kNzMsoZfsomuESD76o20tySMm/eeQA9HRVkQW0ArBEDRqLF3aD3l
	aZZr36//WuPlvK4amYh9BFmuwu3UGjCZBpYkYq5+UOeMOlZs3ZeaVlmuQm06PM/UesZw
	6bkN40oeSi5OJjpxplp07TJo1LFKenHTotBF5xF376ft/Q67/zqwHDp5flBkooeKux0s
	lNAM+Ibii+HuKRPK0QhmWeWov2Xxwf+854ZB5syGO0bgqBdaTNkgOnQxqNToXrH2lvX8
	iYwwq+KUEmHX8eNyOO2/NVYRis5Oh5j6Qzh4GDIP6hZduWFmElDd/uTs2Q5349RwjELm
	YnlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=28tPTXva8OG1BrPrhMlSpzUELdkO2EYIjR1hmsk+IqY=;
	b=nfy9WAI3GS5+3QG9rnsMegYiIzslFjWqySO1LmS8wX9sGiPynL2ImJvTwlK61wilhT
	5CC50HP48bq6dSh+y9smGsIdxIQEB8i0/Pkb71ILIo0WLKGTgypil1pcv5CDC6MCtJAQ
	vTS15wWgrhs0cHT4yShudW43iqmS+p7cD1/pd1gJ2rN0JyRJmeWERiATT94X9JtmMntw
	IZmQKF50mbMJu7c4+VeVI43eYOkK1edmlnjul7KuGDOJvqUHSgA1LzLHmr5n5GGGzIeP
	LrX8immrlRpEP4RdDBJ03ZNZYhhX5ihkeQF2uwkUIueK0gaTvXwi7uJSeuA9mtN/5hQO
	Uv4w==
X-Gm-Message-State: AODbwcCLiAYoIHu4mZuLEqGKTfg4ct0aRZXOfwv3BwCkfCqtyofMetzN
	JVa7Bjo/QLjKNV/w5fvKJCDbdF/516x6
X-Received: by 10.200.39.164 with SMTP id w33mr34543114qtw.93.1495632511594;
	Wed, 24 May 2017 06:28:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.41.115 with HTTP; Wed, 24 May 2017 06:28:11 -0700 (PDT)
In-Reply-To: <20170524132336.4259-1-mac@mcrowe.com>
References: <20170524132336.4259-1-mac@mcrowe.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 May 2017 14:28:11 +0100
Message-ID: <CAJTo0LY85HYy_CdROAJMdPVXehNYMs=mDAsuT-RmLr-QK-Ezjg@mail.gmail.com>
To: Mike Crowe <mac@mcrowe.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libgcrypt: Revert to inheriting from binconfig
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
X-List-Received-Date: Wed, 24 May 2017 13:28:31 -0000
Content-Type: multipart/alternative; boundary="001a114039f49197f005504514a1"

--001a114039f49197f005504514a1
Content-Type: text/plain; charset="UTF-8"

On 24 May 2017 at 14:23, Mike Crowe <mac@mcrowe.com> wrote:

> If libgcrypt upstream doesn't generate a .pc file by default, then we
> shouldn't expect other upstreams to make use of one. So, I think it makes
> most sense to go back to installing a working libgcrypt-config binary until
> that situation changes.
>

The flip side of this being that we disabled the script because those sort
of scripts have terrible failure modes when cross-compiling...

Ross

--001a114039f49197f005504514a1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 24 May 2017 at 14:23, Mike Crowe <span dir=3D"ltr">&lt;<a href=3D"mailto=
:mac@mcrowe.com" target=3D"_blank">mac@mcrowe.com</a>&gt;</span> wrote:<br>=
<blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1p=
x #ccc solid;padding-left:1ex"><div id=3D":1ir" class=3D"a3s aXjCH m15c3aa0=
ec3975a2b">If libgcrypt upstream doesn&#39;t generate a .pc file by default=
, then we<br>
shouldn&#39;t expect other upstreams to make use of one. So, I think it mak=
es<br>
most sense to go back to installing a working libgcrypt-config binary until=
<br>
that situation changes.</div></blockquote></div><br>The flip side of this b=
eing that we disabled the script because those sort of scripts have terribl=
e failure modes when cross-compiling...</div><div class=3D"gmail_extra"><br=
></div><div class=3D"gmail_extra">Ross</div></div>

--001a114039f49197f005504514a1--
