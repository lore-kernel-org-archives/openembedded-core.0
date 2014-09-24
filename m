Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f48.google.com (mail-qg0-f48.google.com
	[209.85.192.48])
	by mail.openembedded.org (Postfix) with ESMTP id 036F160167
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 14:22:20 +0000 (UTC)
Received: by mail-qg0-f48.google.com with SMTP id z107so5860987qgd.7
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 07:22:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=2hs4jsyQBpi6fRdUnZfsbbHe+ZmqkMCOBiTj3Eh31GU=;
	b=A61DxFyNrwju8lxtFPpDZaf9J7CZaA3YWALk1moJEj+MMsu65H/rs9F7ZJ9TDZhXCv
	lc4DMZR9zspXHLHnEdoDm6l4SOA4yWe0pIaFgGNGKT5AK6NBZ2xyCQ8TeGevmIzHx0Ny
	oqZgMf+0GaA7IuOWQPvw63anS0Db4AIhLbWO65kk7YFoV6yOXIgNcAvYgc3JXVlLMCVs
	tZSOsHMRqMWaOU8omBIx3Qoqgfy6xUz5eq53vwYFeYYGooeCbXnKAkVHs/htuHn4ixag
	fffBpvk2KMLv6deAg08t0kKklPscUWuI2Rhw9fux5lbGP/VFWAKMHE2LGtdt/Rx+ZHT3
	ngAQ==
X-Gm-Message-State: ALoCoQnzt3VsZCJNOFtzllH+LgnExOckZcvnlfZDYOsrzuSrBd21Y+9gaymeZaARWiYcbCcbpumO
X-Received: by 10.224.121.80 with SMTP id g16mr6254985qar.64.1411568541733;
	Wed, 24 Sep 2014 07:22:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Wed, 24 Sep 2014 07:22:01 -0700 (PDT)
In-Reply-To: <1411563169-49607-1-git-send-email-muzaffar_mahmood@mentor.com>
References: <1411563169-49607-1-git-send-email-muzaffar_mahmood@mentor.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Sep 2014 15:22:01 +0100
Message-ID: <CAJTo0LZfYfgtNLv36ME9xhxbQzdg533bU7sybe0BqJSkxdLqmg@mail.gmail.com>
To: Muzaffar Mahmood <muzaffar_mahmood@mentor.com>
Cc: Anant Agrawal <Anant_Agrawal@mentor.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] alsa-utils: interrupt streaming via signal
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
X-List-Received-Date: Wed, 24 Sep 2014 14:22:21 -0000
Content-Type: text/plain; charset=UTF-8

On 24 September 2014 13:52, Muzaffar Mahmood
<muzaffar_mahmood@mentor.com> wrote:
>  .../recipes-multimedia/alsa/alsa-utils_1.0.27.2.bb |    1 +

Master has 1.0.28, please rebase.

Ross

