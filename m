Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f53.google.com (mail-qa0-f53.google.com
	[209.85.216.53])
	by mail.openembedded.org (Postfix) with ESMTP id 4AB2B6F909
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 15:15:43 +0000 (UTC)
Received: by mail-qa0-f53.google.com with SMTP id w8so6961033qac.40
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 08:15:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=cFH2xr/nl7uksa6ipC57ekSMuKEdNJJlEJXXzuif9wM=;
	b=SKXHTvbtJgoXvXqR7bIw6dIBkxKxHIMBrgAj02Uu4EDCqlj3U+HatMKc0KP9nvYGde
	69Dpp6gDQVdDMebss8LQe+VV4GuvDEBTyRmF3Je4vkcuSqLtdt81V2D6wsdx0KSe6BVK
	8cxkrmAjuJqvI+HRihHeotqGHLf4gGcuxcgn86hn0CsbGtWOc7Qj2LXyaHZ4cMRB16Ri
	R6YLNtdpR/YYO/qTrqkKm2eHI3aXt6l4QzgOVMd3wSxjr78by35m3PLL+uwv4Xo3cQR0
	vhrQuDu0uHgVb6V1lvvuOIc/2NavGU+gSeCmY5FuKUWuTieHAfAvlWgALJnI3DiNRhFu
	uRFQ==
X-Gm-Message-State: ALoCoQm8tRDREfKjb8FKEGuMWNWRhrMD00wHx3SbDyuBWD8LWmemuS1pUFtyJqS8Q8JGzCrDvM16
X-Received: by 10.224.160.142 with SMTP id n14mr37045724qax.17.1395155744662; 
	Tue, 18 Mar 2014 08:15:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.27.167 with HTTP; Tue, 18 Mar 2014 08:15:23 -0700 (PDT)
In-Reply-To: <eff32371a8b9d824ff74e80bd2c3dffbf42961f4.1395126237.git.Chong.Lu@windriver.com>
References: <cover.1395126237.git.Chong.Lu@windriver.com>
	<eff32371a8b9d824ff74e80bd2c3dffbf42961f4.1395126237.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Mar 2014 15:15:23 +0000
Message-ID: <CAJTo0LZbXvNgOAXibaLoxuViCv16QzcLdhoMxLhipkooqBtFpg@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2 1/1] dbus: fix a hard dependency about dbus-ptest
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
X-List-Received-Date: Tue, 18 Mar 2014 15:15:45 -0000
Content-Type: text/plain; charset=UTF-8

On 18 March 2014 07:11, Chong Lu <Chong.Lu@windriver.com> wrote:
> +PACKAGES += "dbus-ptest"

This should be conditional on DISTRO_FEATURES containing ptest.

> +ALLOW_EMPTY_${PN}-ptest = "1"
> +RDEPENDS_dbus-ptest = "dbus-test-ptest"

Please be consistent with the use of dbus-ptest and ${PN}-ptest.

> +RPROVIDES_dbus-ptest = "${@base_contains('DISTRO_FEATURES', 'ptest', '', 'dbus-test-ptest', d)}"

This line took me a minute to understand and won't be needed if the
PACKAGES addition is conditional.

Ross

