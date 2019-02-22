Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com
	[209.85.166.43])
	by mail.openembedded.org (Postfix) with ESMTP id 3B2256C108
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 10:18:50 +0000 (UTC)
Received: by mail-io1-f43.google.com with SMTP id x4so1349629ion.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Feb 2019 02:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eFXWt3Zt8cOZcPdAWDsEfNQc3hIibiPYgenhRsechSA=;
	b=T3aufh6MsI+SS3OQxTzj2tlq3sQXJZvTtbKsQxHwNf3KtLHh+JXNgoSBFg8PbO62FS
	HxG2d27clD0rAkH+7vKPfBBCHFTvi+Bh+d6u5MYZwUhNw7e9fTNDeV8pA/SPwUi+QD5R
	gJyrafkGX7ouFc2ppXZ1YIijGAuyXP3FQSjc3hZBI+qfbSsCaWaD8GdJCt8TNdy4gZrP
	6ORiLWfT939dENRsqXdvPieqzSaqiUGeiD6fFnDNWTtoO6sJEioDcl6V5L6mgmQaYc9w
	OqCsGK7+7X1Hmqh4PqtyPKeaGXIhbXVn1P+BaxJPMUrKcVHpcQZks4Ceg+0xFD+IbzHE
	RqWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eFXWt3Zt8cOZcPdAWDsEfNQc3hIibiPYgenhRsechSA=;
	b=QT8ZcGb7rJCqTub8wOUrPKRhjoEbS2EmzZ8sqTNbhMS8XnfWX3FbD3YFjvxcHh0uQe
	lR1Zmu+TpwyChTzU+JteLmvtGPQQ5uRhqPvhOgxILTPS6PT9Tm9CfWCmD6dTtokgAKUa
	9L5T6Wvnt7sepmCfKgIN9KK7pYq4AIN1A+uO5SVwudd7lh0EOlIVf+PObimmgwiGrOnv
	eSC0OhkcZsjGYxo4+g+NEqYopD40+wF+1Ub0h5xJ3dJRydCU40hhTeeQF1q17Emjb2I+
	nwWmJZ0Si8P0slyOXkF1N2mkzwprf3RnTHf97MMhpmr/DhFMdhcN5myzHLUYKE2ZE6fY
	4A+w==
X-Gm-Message-State: AHQUAuatq99X5YeuI04uQUeJ18lXel7AmIyNRBFPZ4wUtoqWoqgwt9iQ
	26H98Yi49+k43HVpJNADi02558o3sJBzZIJ11yqMbQ==
X-Google-Smtp-Source: AHgI3IbXIqBIfvEyJpQKgn2mo/zwQjxm87vC7gxPcFHMEVexu2PpEGdFNhvNi53vvJoueZV8Q9JH8eI2Rus9RENzBd8=
X-Received: by 2002:a5d:818d:: with SMTP id u13mr1765870ion.20.1550830731258; 
	Fri, 22 Feb 2019 02:18:51 -0800 (PST)
MIME-Version: 1.0
References: <20190220201026.70803-1-alex.kanavin@gmail.com>
	<20190220201026.70803-3-alex.kanavin@gmail.com>
In-Reply-To: <20190220201026.70803-3-alex.kanavin@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Feb 2019 10:18:40 +0000
Message-ID: <CAJTo0LYeVyh0tE+zuUCpzqNLYJG9A+7pQ-nZURxDnBAeLAMMmw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] gdk-pixbuf: convert from autotools to meson
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
X-List-Received-Date: Fri, 22 Feb 2019 10:18:50 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 20 Feb 2019 at 20:11, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> -PACKAGECONFIG[x11] = "--with-x11,--without-x11,virtual/libx11"
> +PACKAGECONFIG[x11] = ",,virtual/libx11"

https://gitlab.gnome.org/GNOME/gdk-pixbuf/commit/204082e6a7a404ec7372d78ef7a7890ada595154
is in 2.36.12.

> +       # Do not install ptests if ptest is not enabled; gdk-pixbuf has no configuration option for this
> +       if [ "${PTEST_ENABLED}" != "1" ]; then
> +               rm -rf ${D}${datadir}/installed-tests
> +       fi

https://gitlab.gnome.org/GNOME/gdk-pixbuf/commit/4c76635e1f19c6d1919d4ea94f6b00f97b996665
is in 2.38.0.

Last minute upgrade or cherry-pick those?

Ross

