Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f193.google.com (mail-qk1-f193.google.com
	[209.85.222.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3BDD17D0FC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 18:12:51 +0000 (UTC)
Received: by mail-qk1-f193.google.com with SMTP id w20so8223095qka.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2019 11:12:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2fi5aUc1kj3z5eZ8AhjwDcgNgzmwJHBvGfSljajAO30=;
	b=mSjWgYCEi/NLNlLYLLpQExk6jXJ0ZZcNJ23yDnspdepxo362AsbnVxLLShS9OpO3I7
	2bLjynX0C3p+PGkKLPYc52VY96iUOXSVVZ8JzgYn+I86CQhlR8p1Tus/qbU2UdqxSitG
	M8LelxHLQmV2mbgiWO60sG606/jnwKSbykNSxIK0fH6hotHoPzitdnOMJKl2F9Ei5v9g
	5bjOakxI9rx2Ps4YxUdVidJ0mEPklf1120hXwWXuKIXaa+Trd4xgJbuJ4WVGGPC/ELeo
	9zc7DyJqQKeo/mWNPlYpN7UAwnAj2DSmMWg9sE8umhul2GRK76cN8QTNPkg7I8isno98
	Jsww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2fi5aUc1kj3z5eZ8AhjwDcgNgzmwJHBvGfSljajAO30=;
	b=ud9jaS19pGkHG6pUMI3VtCFU79hpjwm8VU8sCOCF0+xWSycHIee/wARxO5CbRpI79Z
	SYB5svPb77UfWp+IR2c2EhYSdl7zCaFxWtuKaaIWrOxj/HUFr4D7bvQtrmrjtpRGhS3n
	Ad/igX3Lt4a3B8ptgdrKQNM8jWJqNIdDwQyLpaTCswPZ02Ap8uokx/uDGOpzBowC2spj
	nbkkBkMr4GO3jpQ0AIYIrKT37rKQLjBNNp5xes+M7PQGL50JOEVrrNyczxlH651dJthn
	xzqsWogcJ5W/vcpbxPS3iceCR8kc+5eSagd21Fy4KEMYi8WfdZCG3GFLjnkj/pYf5Bwz
	WFJA==
X-Gm-Message-State: APjAAAX7dezDsxbDSWKPg5gH700sMbUVbtW+bT4jXHSTN89wfJVp/hX/
	pvEKhMmr9XDflpy/GOkN9C2/lb4D/nUOpKqf06c=
X-Google-Smtp-Source: APXvYqzE3ndzJGsiXM9GyAsfXnOkXcwtVbFBx5JvMKpNvPN0UBMK/6U3rIDN1cTtxu+Iz/LvttOalJarS5tMUVEfu/I=
X-Received: by 2002:ae9:f44a:: with SMTP id z10mr19419525qkl.223.1553623972853;
	Tue, 26 Mar 2019 11:12:52 -0700 (PDT)
MIME-Version: 1.0
References: <20190325234413.12652-1-ross.burton@intel.com>
	<CAMKF1soRmnRPFzUDs93Y=fx9VJ3DWrArxX-BRHSES4sSR5xhWA@mail.gmail.com>
	<CAJTo0LbPb05xLRjvyaRLVKZR1qQx5QiC-eh3XZSiAokCnvXUwg@mail.gmail.com>
In-Reply-To: <CAJTo0LbPb05xLRjvyaRLVKZR1qQx5QiC-eh3XZSiAokCnvXUwg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 26 Mar 2019 11:12:26 -0700
Message-ID: <CAMKF1sqn_FiN5fEX+kmOyKHQtB20Yx_RUfq-4YYZxz0UQg80ew@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libcomps: put PV in filename
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
X-List-Received-Date: Tue, 26 Mar 2019 18:12:52 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Mar 26, 2019 at 3:01 AM Burton, Ross <ross.burton@intel.com> wrote:
>
> On Tue, 26 Mar 2019 at 01:39, Khem Raj <raj.khem@gmail.com> wrote:
> > > This isn't a git snapshot recipe but a release that is fetched over it.  For
> > > clarity, put the PV in the filename.
> >
> > I think its better to keep it as it is. since its easy to trace git log history.
>
> So should I be renaming gcc-8.3.bb to gcc_http.bb?  If the argument is
> that the filename should contain the transport protocol and PV is
> embedded in the recipe so that git log is easier, we should be
> applying that rule consistently.

I would agree on ( foo.bb) for that as well if we do not maintain
several copies of recipes and fetch from SCMs directly, which is more
and more the case these days

>
> Ross

