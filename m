Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id DC45C797B6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 16:17:07 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id y207-v6so41185630oie.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Sep 2018 09:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=vy6J2o61oWFeoYCgXmdn6auJmzLPQWBrQWGr8CfLxnE=;
	b=kHK4CuFNDxwSURGiwgBm3FKAGHDgOwVb2TOQR4ZG4vjcWAUwH+NxQuH88uqsDQllFT
	zb1YO1BQPUNszgmM0kHX2Fx8ljHkFLeNX2+blEAWfi5dYLNBuK+ZECH0vQPd4NYy62SF
	OWJ9K3+cDqVvUwxpmnDcEpY9edkK5qxb+/z30MmjVtFOzBA8pB509yt3tjOnIrvNHJW2
	GhLWckvIUz4gwrGN5hqXJH3hpk0r1DijlxBq7L+eA9GeTGm+LZZEy+G2LayllTqmhpkI
	6fqfHN1Vu2vCdZHLjb4C7oN/9HiHGaGg/8KtT+B+N5W1ruC/0Mk3HHEcMXEUYTU0+BJG
	a1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=vy6J2o61oWFeoYCgXmdn6auJmzLPQWBrQWGr8CfLxnE=;
	b=X0/Ufn2v9zzDkR3Nt93EGzQDnA1GxJF3YXyJkwcw1AjRS6sDwbgfUOfYPF6nTeXkvK
	QdSm8gW+30+7R/KdmTKDdT1a8bbWPUX56Wp4MN7FeYFolxfQUcWHv4JEQ5uJWD6wETW+
	5xgB/lH5IJf9ZNfgY+ddHn38DpTt+1u8IH+ev2gU8c54WiRXO2zKNbmLtF5lw42GPmNX
	GG05acTKmM1yh2TMKMe/ElTIPu0oLwP9oUQ2G5n6oUu06lffpIcvpvoa1G6m0YkBB00X
	iu0+GxhICXfqTIZNQ7adn/EzkrQXpTTbxAoyRr8Fcs0ya+rci66IJUL1gHg1BQHFTs3T
	wARg==
X-Gm-Message-State: APzg51DaCs73+I6z9MGuRKhf7xR3Vazl3I46PtMbgm4p0bwg9z+QbP+h
	Dn0/aqi0Pjq0giqUC+4jEOb/4ip1eKR4cO18ZyYq1w==
X-Google-Smtp-Source: ANB0VdapqU8Xets8Axx74UDh5mWfhgWcgTtboJafFGdISFElopKW/692lhhppKjvjK6QrKQ+Eo6MJy5OmItelChXNzM=
X-Received: by 2002:aca:c74d:: with SMTP id
	x74-v6mr20969017oif.97.1536596228907; 
	Mon, 10 Sep 2018 09:17:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:7ac:0:0:0:0:0 with HTTP;
	Mon, 10 Sep 2018 09:16:48 -0700 (PDT)
In-Reply-To: <CAMKF1so=k2qhez7uEwWS0saYnV+BJ+z=MjGdinhTKpzQYDw5dg@mail.gmail.com>
References: <20180910133123.22372-1-ross.burton@intel.com>
	<20180910133123.22372-2-ross.burton@intel.com>
	<CAMKF1so=k2qhez7uEwWS0saYnV+BJ+z=MjGdinhTKpzQYDw5dg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 10 Sep 2018 17:16:48 +0100
Message-ID: <CAJTo0LZjqGXsS_6MD+F4PMsXBomTiyJPEVUT-TEZ9gJXCzBCMA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/4] python3: remove redundant patch
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
X-List-Received-Date: Mon, 10 Sep 2018 16:17:08 -0000
Content-Type: text/plain; charset="UTF-8"

On 10 September 2018 at 17:12, Khem Raj <raj.khem@gmail.com> wrote:
> patch is also substituting ./$(BUILDPYTHON) with $(HOSTPYTHON), how is
> that taken care of ?
> maybe try to a build where hostarch != targetarch might catch the
> problem. If its handled in other
> ways then its probably good riddance.

Target binaries have a different loader so they won't run.  From what
I could tell none of the codepaths this touched were used in the
build.  I'll review the changes again and either demonstrate why I'm
right, or retract my patch.

Ross

