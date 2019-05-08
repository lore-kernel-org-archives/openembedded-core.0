Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 873787DE4A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 16:22:18 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id l7so4893401ite.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 May 2019 09:22:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=hj/bPQW2I/TwTtWwWiuQgmy5Nw9YzTJNuD5HjV7aZOM=;
	b=uc1TbzZvQM8Sv0nc3njwdb62b2yDNClbi2+qfvgXoHasNCy+8j2RR8/US8el85cfXQ
	xjAHs8FFzr9uXDkesDPKSYx9nzpbZ3fTdluGb6j/Gtfx9fNh6SO/tLX7vvFtqr27qLzR
	fGDQoEJVFHh/FrFnSxKoyCGwYlY8ccrWP/nfFfn6tz2UI3LmU8bFvTp3GGWRjkDcg0GN
	k5uE2aZJ2pDv+XPRDAaDK0hA/a3gNkX4xOmdWL57DzpdNRWeS1FPhVGBb7gtGMlEKeqy
	UcvZgjfUjyEBUrrRf49Le+ZJPtFwUOei4ej07k01aWKCmbXhrWuVdMrkjauksnFLrIVS
	k/1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=hj/bPQW2I/TwTtWwWiuQgmy5Nw9YzTJNuD5HjV7aZOM=;
	b=YPaPVLsRLVWk7ZWNKDsGmFZshJhWTUCdK6l24wKgaNMXind16+YntSaf20FOvY5+cK
	HDAASH+mzgLHsXZIaHLyGmXfLA6CNqXlXrhUJgUlsN7yRAExyoiXO3Tsqhki6uSeEGW8
	qt2xq/NMdW7zmqblls2jaQq/+mdaUMq0U+EIcOojiIBdsRhe0GZ25pC7wNjzFpCJ4fp+
	AZ09U9fTTVvXRrKHPa5wzkMuSRIqI6bIksma2FR67DW0TK9oKx8OQ1UjSkhXbRbBIct7
	kZr1Y56exXtw1YwkdilxAas18ro1xGm/1rD3icBHEISmZhDdReX5sjiLMiWXkJJPHQ74
	+tqw==
X-Gm-Message-State: APjAAAUsshgYPlxxzIdMWchX8J1iUiqpFiG4phR9yA/8vzWtOwodf56c
	hVnotTEYsw2QSHpRcOpJyO+lZELH/Y/a78ZnpR7d/g==
X-Google-Smtp-Source: APXvYqySQw5ZESR5SmoUQuzsFfJT7jzmhoSBn2N+RbG0vwEV+U7r/Yd3nKnssA3uu0qc4GPZ7NzgcC4YRuAfwT4Op2Y=
X-Received: by 2002:a24:4cd2:: with SMTP id a201mr3994757itb.26.1557332539207; 
	Wed, 08 May 2019 09:22:19 -0700 (PDT)
MIME-Version: 1.0
References: <20190424065603.20591-1-open.source@oleksandr-kravchuk.com>
	<CAJO0J4jEMBF8nHWazEE08LhNF2y1xgKvnvNPxPCreYPKadQvwA@mail.gmail.com>
In-Reply-To: <CAJO0J4jEMBF8nHWazEE08LhNF2y1xgKvnvNPxPCreYPKadQvwA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 May 2019 17:22:07 +0100
Message-ID: <CAJTo0LZCs5nj-LTW5ZfE0JXiG0iHw4kEpqGA3e_88qDRrnxEiA@mail.gmail.com>
To: Paulo Neves <ptsneves@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>,
	Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: Re: [PATCH] wget: update to 1.20.3
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
X-List-Received-Date: Wed, 08 May 2019 16:22:18 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, 8 May 2019 at 14:35, Paulo Neves <ptsneves@gmail.com> wrote:
> Should this version bump be backported or the patch
> http://git.savannah.gnu.org/cgit/wget.git/commit/?id=692d5c5215de0db482c252492a92fc424cc6a97c
> be applied in older versions?

The CVE should be backported.

Ross

