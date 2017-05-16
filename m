Return-Path: <patrick.ohly@intel.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 9EE0271AD1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 07:12:29 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id p24so87954809ioi.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 May 2017 00:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=SM53kJRYyXfw10K+Y6TrMT6UmZ5P1bf8ZT8w6vFJGuQ=;
	b=MHCW4018YzePTgdXO13JpzxpwSr77pVMeiAvfBMsnMII4y0ojAGnHuYMkU+MCUGnLM
	m5RHkOm6bI2jDelH3z+tW1BycYxGql8arxw5KXc+fcHovRf1k5d3yVXpn10/16ZBl3kZ
	OMhueUoh1KAYpw31wKmomWCNTIax9zZXXSzfPJROOel+ZLF3IBENf+c4CrOheae8GcZo
	FnS9H0we4tJRMbT/ZmBySm/2LAtB6/x6X1Oc5+3a3ZEUBqo9J0z4VZYkhbA+9IA2cRSN
	qdtAnNzyol0ka0/BTacxLaTNx7inC8nZxmKOaYnN52di8V7lyvY61Ns72HDM4XkyZPz1
	euFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=SM53kJRYyXfw10K+Y6TrMT6UmZ5P1bf8ZT8w6vFJGuQ=;
	b=QqWbbKjQVg7lKnwFkLntd1c+tZiBSIZ3+XxUFOl4bvIV7UsUDOARprLaNf/OdkF6ZN
	LodhVST6BIIQyG6vnHz/77zcFARaUkQcT8KADrwlbIQHyBpBjcinxZ9cGWfyuUOFsJF4
	zgAS/Ez/HWkfpJDFKRFO1B8LmOdF+BeDUmjLwxBho/97j8BmtGdB+byPe17Lr0ihKoBZ
	eMW8RPOUe8tVMJjxvlk+RskufHqgEmLB5JRooFgUJF9K0Uh8jyeOFtIo7PnD3BYimGQm
	RcXART3+W+wTlsqcJxIfFrJIjPXj0uPq36nysU8/DsXdrUEDuoEwYMZzGzxmLMqGvI5b
	3LQg==
X-Gm-Message-State: AODbwcCfSCIwpqpNvxth54LrIa1xPXXdYmV2bvsI1VMhO8svWfJOlyso
	VB5YTEiGIlyBxZhC
X-Received: by 10.107.159.8 with SMTP id i8mr9345210ioe.143.1494918750437;
	Tue, 16 May 2017 00:12:30 -0700 (PDT)
Received: from pohly-mobl1 (p5DE8EB79.dip0.t-ipconnect.de. [93.232.235.121])
	by smtp.gmail.com with ESMTPSA id
	o73sm6365141ioi.42.2017.05.16.00.12.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 May 2017 00:12:29 -0700 (PDT)
Message-ID: <1494918747.1179.280.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-core@lists.openembedded.org, Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 May 2017 09:12:27 +0200
In-Reply-To: <e03ca7d9d2d8b290fe306da077e0fc74a6916efd.1494854721.git-series.patrick.ohly@intel.com>
References: <cover.da0bfaf0b62cb1033573711fd83cf5251f8827f3.1494854721.git-series.patrick.ohly@intel.com>
	<e03ca7d9d2d8b290fe306da077e0fc74a6916efd.1494854721.git-series.patrick.ohly@intel.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [RFC][PATCH 6/6] local.conf.sample: make debug-tweaks depend on IMAGE_MODE
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
X-List-Received-Date: Tue, 16 May 2017 07:12:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2017-05-15 at 15:27 +0200, Patrick Ohly wrote:
> Enabling "debug-tweaks" unconditionally, even if it is only in the
> local.conf.sample file, runs the risk of that getting used in
> production images.
> 
> By checking the per-image IMAGE_MODE, the debug tweaks only get
> enabled for images not meant for production.
> 
> Signed-off-by: Patrick Ohly <patrick.ohly@intel.com>
> ---
>  meta/conf/local.conf.sample | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/meta/conf/local.conf.sample b/meta/conf/local.conf.sample
> index 85c5e21..edadbb7 100644
> --- a/meta/conf/local.conf.sample
> +++ b/meta/conf/local.conf.sample
> @@ -114,8 +114,9 @@ PACKAGE_CLASSES ?= "package_ipk"
>  #                     e.g. ssh root access has a blank password
>  # There are other application targets that can be used here too, see
>  # meta/classes/image.bbclass and meta/classes/core-image.bbclass for more details.
> -# We default to enabling the debugging tweaks.
> -EXTRA_IMAGE_FEATURES ?= "debug-tweaks"
> +# We default to enabling the debugging tweaks unless an image is explicitly
> +# requested to be built for production.

Would it help to add an additional comment here, like this?

# Note that this expression gets evaluated separately for each image
# and that IMAGE_MODE can get set differently for different images,
# even in the same build.

> +EXTRA_IMAGE_FEATURES ?= "${@ '' if 'production' == d.getVar('IMAGE_MODE') else 'debug-tweaks'}"

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




