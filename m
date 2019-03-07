Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f180.google.com (mail-it1-f180.google.com
	[209.85.166.180])
	by mail.openembedded.org (Postfix) with ESMTP id 425297CEBC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Mar 2019 13:12:43 +0000 (UTC)
Received: by mail-it1-f180.google.com with SMTP id f186so3822824ita.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Mar 2019 05:12:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=0zZCI7xx4QQ64mNfkGnIwA0VT/m+3suvhUmK/jA5rX0=;
	b=eue8FvQDnboxq2+moj5GMw6VIpfLDx8REGpDYGw621kcOWYRLJVr4D+a+QU0UvUWOy
	jgRjBaHYyznaeBrykn+bSgtK17OnoKQHXlSgI/p2CXppmyTPNP5p5SV4P+aCZReoh5F0
	QmLEeHDu3yd236XnY8fK2GkY6GqZYJfLS7TcWtvNp2OYG7tbvnX1g4YSg91H5cpA9i9T
	JXaTtqFFbuLMl1/p3eC0fHuB+AB18VrdzZBdExqzsbBzgLChZw2qI1J6PDSNtFzhvUlr
	FlEtxEIekVWnCGXkvPDhOtaDgtpitLp+zMSNOno9LYQSsymHDZsTBb8qQOi11ogg1NjM
	tChA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=0zZCI7xx4QQ64mNfkGnIwA0VT/m+3suvhUmK/jA5rX0=;
	b=Rgbd6K4Sss7AgE0vWP8/3cPMsIV7iR0uVGRhtxQVA6Tx4jL0yNqYc79yq+halX7MK/
	cNgcN9QUHX3LekI0M+m7ddi1m4J1eLyoA1KYRa9ynHL6h1q2qev5hOmguj/rWPghqzh+
	x/L7trIBkKKm4Xg5f26rpWzSCbW5y5bFm0VUALUmj1PHg3fMx8bXPJCBDoj0qdi3MXBr
	WPuVdcrHgvssgDIgHtLejVqAg9+1k6zdTPfdPopm9Wj29Ke+7nw7YSm2o9u75RAtxnc0
	Tc5Q6dsGikmT93SoIcDvepnGrlLbAtjH8S/BqWnma2/TiP8I5ISpUQWWmzbMbwsIA/Nr
	fLeg==
X-Gm-Message-State: APjAAAWzfIzJ47lZgdB9S2E4ap4BoPr0IODc0hdxoYil46LrR56nPu4/
	9wcywxQTpYl//KtM8KhRbo5U3qM0h4ThR8Xljr49qvlP
X-Google-Smtp-Source: APXvYqyHFn4Dg5S6VldHohhtFZvCSBzRuGrKWzGpzFpAESMeX8Dli8RxCoVYWe5DXtq0TTh8zLNjkC6etuGS++7zYeY=
X-Received: by 2002:a24:7294:: with SMTP id x142mr4867125itc.26.1551964364385; 
	Thu, 07 Mar 2019 05:12:44 -0800 (PST)
MIME-Version: 1.0
References: <20190307130401.15700-1-max+openembedded@blarg.de>
In-Reply-To: <20190307130401.15700-1-max+openembedded@blarg.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Mar 2019 13:12:33 +0000
Message-ID: <CAJTo0LbBeD=n2b2fGONYan3zjthvXNgtw5ooCkn28J1yL2F2JQ@mail.gmail.com>
To: Max Kellermann <max+openembedded@blarg.de>
Cc: Max Kellermann <max.kellermann@gmail.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] libsndfile1: make sqlite and FLAC/Vorbis optional
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
X-List-Received-Date: Thu, 07 Mar 2019 13:12:43 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 7 Mar 2019 at 13:11, Max Kellermann <max+openembedded@blarg.de> wrote:
> +PACKAGECONFIG[sqlite] = ",--disable-sqlite,sqlite3"
> +PACKAGECONFIG[external-libs] = ",--disable-external-libs,flac libogg libvorbis"

Always be explicit and pass --enable-sqlite --eanble-external-libs too.

Rss

