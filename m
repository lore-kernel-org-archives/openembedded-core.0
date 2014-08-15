Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id 25ADC601A0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 14:46:08 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id a108so2227323qge.38
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Aug 2014 07:46:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GEV16xeJvfNIEzFBga/hn6O1buSWihFpmHy2+1mD1HQ=;
	b=JSXRAnlo6j7QFf9R5cC3fcapwYbynYo56Oe3DWazf6v/oCX7HlO5+RTZKBaTytJJdi
	Nu9lsyRUDzDR1GRxlswdasqXSiktTeluw7xtlMunOOauDdw78WrSFI2cmz8vf4RTMYjr
	Ot+DThLk/1hCG1lqZi0n8R6L2kJ8ymk0CFhhSlVmxDb909ulDfkFpJOtQB+iZJoWJG+N
	SCLmuFb2HfsdSyAgy/OWyNDY3Bul+8taxi+jxth9qta3ZUR3+ngRjNwAcSV+GzSBwQos
	3i9C6rT2XKk4iihx6DlVJno3ajQKCD22Qzm9tDf5Ab+/Z2XTwxVWoaBM7/vRwNuBmnFv
	bQXw==
X-Gm-Message-State: ALoCoQk8of8t4XJhsPnIVOJ+0YcLPBVtOmAT4QaryGtx7QHxWm0so3e83HDnUNDmqH6DNAxpEC8z
X-Received: by 10.224.38.10 with SMTP id z10mr28640998qad.52.1408113966769;
	Fri, 15 Aug 2014 07:46:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.134 with HTTP; Fri, 15 Aug 2014 07:45:46 -0700 (PDT)
In-Reply-To: <e633a8d2352117201e8044f34bba514bf64af4af.1407794494.git.max.eliaser@intel.com>
References: <cover.1407794494.git.max.eliaser@intel.com>
	<e633a8d2352117201e8044f34bba514bf64af4af.1407794494.git.max.eliaser@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 15 Aug 2014 15:45:46 +0100
Message-ID: <CAJTo0LYWr8DD1Co61yo7-i9d8Mrh3oDS8ngLVGk7=5dZuRphcw@mail.gmail.com>
To: Max Eliaser <max.eliaser@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] xorg-drivers: xf86-video-cirrus: add a recipe for the Cirrus Logic X.Org driver
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
X-List-Received-Date: Fri, 15 Aug 2014 14:46:09 -0000
Content-Type: text/plain; charset=UTF-8

On 11 August 2014 23:03, Max Eliaser <max.eliaser@intel.com> wrote:
> +DEPENDS += "virtual/libx11"

From looking at the configure.ac you don't need this, but you are
missing a dependency on libpciaccess.

Ross

