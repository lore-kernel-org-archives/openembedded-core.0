Return-Path: <matt@madison.systems>
Received: from mail-lf0-f48.google.com (mail-lf0-f48.google.com
	[209.85.215.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5CFE673173
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Jan 2016 12:27:34 +0000 (UTC)
Received: by mail-lf0-f48.google.com with SMTP id c192so135678662lfe.2
	for <openembedded-core@lists.openembedded.org>;
	Wed, 06 Jan 2016 04:27:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=madison-systems.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=IyV+JfYMMcul8Dq/o95hClACZMwrYM3pOPzNHqzFHAY=;
	b=LYb1gUxtRUW44vFvI2KznqDyPtoO7uvy98iUvygY4swQy1VYYWfryiMZfxf0m7xqXz
	ifL5jZ+U7RBADfuvFjSJt76cqJ2q6kld10c8gb9F+QR8MVgFeY+0lkRFEaafg4AhQdWJ
	NQ/GFeE6rhUW+ZltEuSZl58O1YTPGT8DT2eWt9wcUfr8O8AaeC29jUO+aD4BeCN5U/Rv
	miSbvspOUmzsBnBatP1mTY5iILo7UweM8pjcVhr3xdmP5z1s50uy8a04/yVgufsH+ovT
	HASJHtwRAj8vBa3M5P+vjZ2A3637l7YqtePS8xqUGgp2dwYUdHOreCL9qeS1JrUpcMWl
	Da0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=IyV+JfYMMcul8Dq/o95hClACZMwrYM3pOPzNHqzFHAY=;
	b=JSLyhWiPjfk6mqqsiEBl06UWIcx7ikNCPFTdGsQShE8xdr5zBoCnN24ROaogVGXtuU
	b2tUJm1NuF71K8TvDUPElTY2G+5b/jJDoRQyu4dzpt+D6bOYTTxNXom9wwpxqMbEhFqm
	v8mcAiMMSdOJ5SzPKVhRgugYB9FZ8MmwnVbcLVbce8LzLDNA0pj6rzvcYtfOIEDoPxvK
	QsagkKvobTJeXOGaYPuTZCeAVXaHkSRJ2lCYPhcF8+ToPImWAS7xdSX3+ok+Dh+/IxQS
	RjvNLy2i3Fi56MFGw3PqnMFzN9XVWe5EUGIUR+LmoFsaKe+6YQdT2jm8XMd3EVJm8KM4
	Xlcw==
X-Gm-Message-State: ALoCoQk9GEc5DYUIyQ5Wj/2OeLW6kmWEn503XaH+Lh5ooHb1EN31czotELMy+nfuPKgt3llWVeVMAqy5WTbrgIlVDHlvcfhQsA==
MIME-Version: 1.0
X-Received: by 10.25.156.83 with SMTP id f80mr25671619lfe.75.1452083254839;
	Wed, 06 Jan 2016 04:27:34 -0800 (PST)
Received: by 10.25.26.7 with HTTP; Wed, 6 Jan 2016 04:27:34 -0800 (PST)
In-Reply-To: <1452082896-3261-1-git-send-email-matt@madison.systems>
References: <1452082896-3261-1-git-send-email-matt@madison.systems>
Date: Wed, 6 Jan 2016 04:27:34 -0800
Message-ID: <CAGgRHJqyAmjCQ1XacdN23AVM9dHF7v6xFoyf+ZLB1TrfE0S3ug@mail.gmail.com>
From: Matt Madison <matt@madison.systems>
To: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3 0/4] Debian multilib packaging fixes
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
X-List-Received-Date: Wed, 06 Jan 2016 12:27:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

It would be great if these could be pulled into jethro as well, since
that's where I first noticed that multilib Debian builds were broken.

-Matt

On Wed, Jan 6, 2016 at 4:21 AM, Matt Madison <matt@madison.systems> wrote:
> This version adds a fourth patch from An=C3=ADbal to skip any
> "unmet dependencies" errors reported by APT from the initial
> install, which were prematurely terminating the rootfs build.
>
> An=C3=ADbal Lim=C3=B3n (1):
>   DpkgRootfs: Fix logcheck_error false-positive when use multilib
>
> Matt Madison (3):
>   package_deb.bbclass, cross-canadian.bbclass: DPKG_ARCH mapping
>     function
>   package_manager.py: fixes for multilib deb packaging builds
>   package_deb.bbclass: add 'Multi-Arch: foreign' tag to allarch packages
>
>  meta/classes/cross-canadian.bbclass |  2 +-
>  meta/classes/package_deb.bbclass    | 37 +++++++++++++++++++++++++++----=
------
>  meta/lib/oe/package_manager.py      | 17 +++++++++++------
>  meta/lib/oe/rootfs.py               | 13 +++++++++++++
>  4 files changed, 52 insertions(+), 17 deletions(-)
>
> --
> 2.5.0
>

