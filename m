Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id DE09A7C724
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 10:33:54 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id k21so1573237ior.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Mar 2019 03:33:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Saa6nEzwj+tdOCBXsxXDhVJX8/4uQHOWUmWB3tEGGsY=;
	b=fHsals0paOEKbqWms47h4eFKvGs9OCB+GO1b20Re89de09Jy/+kNSSMcqcEaITW3AP
	SHaTdQ+lutWGDwGm8ZHNvS43e+yRQLrpoY4rRMEOvw80VpyKJCvJDOgvoUIOGOVqzore
	DcSdIUjqy3zixeHZWbD3gaKb1bgTvZB5hDSsb4glLxZ3av4cxFoLHV3cLjoCDTVn1WN4
	GNv6imnxa9e+vWn4q9WX+S7na63bxtbMkKZV1SEt3V/+zEisch6y82EqA1o/iuQZ8ALj
	WBaVMChtWbQz1eOD6YftPiL7N39egywZOAZHr/90UuPCpDeZsNM5lp1bfNG90iIUHCo2
	31lA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Saa6nEzwj+tdOCBXsxXDhVJX8/4uQHOWUmWB3tEGGsY=;
	b=hsM+6jTMTf1htCcwt1xeHciPy8cmdUwbAIeYiWQnPzDOD4o7eOS1yamgcWwr76lqkC
	qb/0v0jwc6O+YySaGE2UYdUQDjJIONLhyDAdj8x8poMe2fRCNp+cA5jKNRWnMnaHkA2h
	WRsusiBGAzRpvUmlrDi1rVk+KcMDcwT09Ur3ukA4iXNwrX/4Z1qFV/Slto2J5tQ4hjKi
	064MSnytRUx5Mt/JxtAgHOJRqyKzAzLUgqudZ5Tb2YI7NOCxrgBG9KcixZd+k8Nze3Zd
	k6hsmf/9fQyAVAKEWUXLCv/m/o00JL1Jews/nIKtJdwT0FEvVnoAvbPj2vUvqucLtEI9
	OmgA==
X-Gm-Message-State: APjAAAUVCcjJpf1p2923FgtelOqZ0Mgm6sl6DF2SCWj0tDNKV0+zSQb9
	+fpxUj4sJl/x8T5l29Ymew+CoLB6XGZFmSmrGcMsGhJK
X-Google-Smtp-Source: APXvYqzzVtXwyqMY8rUCGpiblYpg0vlZ9fnqdPgb4RjzG2eUrBkC37nJF5mnP3aVb/l/h+Kp4EU4F6+4JmQDtPa/cYM=
X-Received: by 2002:a6b:ee1a:: with SMTP id i26mr5030086ioh.201.1552386835814; 
	Tue, 12 Mar 2019 03:33:55 -0700 (PDT)
MIME-Version: 1.0
References: <20190312012245.25551-1-kai.kang@windriver.com>
In-Reply-To: <20190312012245.25551-1-kai.kang@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Mar 2019 10:33:44 +0000
Message-ID: <CAJTo0LbfKpABuhzzEdfpYQ_UEHSV7cV4ffMQeUj6ZhtFZu-hmw@mail.gmail.com>
To: Kang Kai <kai.kang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] virglrenderer: requires distro feature opengl
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
X-List-Received-Date: Tue, 12 Mar 2019 10:33:55 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, 12 Mar 2019 at 01:23, <kai.kang@windriver.com> wrote:
> +REQUIRED_DISTRO_FEATURES = "opengl"
> +REQUIRED_DISTRO_FEATURES_class-native = ""
> +REQUIRED_DISTRO_FEATURES_class-nativesdk = ""

I suspect you can drop the native/nativesdk overrides here, as
DISTRO_FEATURES is overridden in those builds.

Ross

