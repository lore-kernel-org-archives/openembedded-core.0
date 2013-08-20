Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f181.google.com (mail-ve0-f181.google.com
	[209.85.128.181])
	by mail.openembedded.org (Postfix) with ESMTP id A943E6B8BB
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 12:01:20 +0000 (UTC)
Received: by mail-ve0-f181.google.com with SMTP id jz10so197498veb.26
	for <Openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 05:01:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=O5oesHsGMrTXITw+lz5lwNyjV/pqXmrzUAg2w+hy+nI=;
	b=oJYrir1VQNyi/VJ4U3i/mKy7MnW9FDRyrfo4ZSBvR2z5fBCWuOWya6oJzI+RQBj/UG
	U+P5KYV+XEC+Xap98op18DfjCUUerqCpxd66B4hXX/96L+n91dZAbg5cVq3MMQ29xjYp
	cUN0O+EH7y3HyU2LzcrE1RLTfWB5t9LXkC4ToUHNfzig4kAcvY0vgAlf5AcUJ0HtDM/4
	G1S9oturJKUnJkes907mbdu37vUoAER9ogBLcEf051QG9fQLw6++fTLqMhqQk6ltJFhC
	rsVBkluKcMs81JxACBtMjgdHhT6fHPMTWKs5pdthxSTaLIsIReykCX3LZ5EhNnBr0QgQ
	AhlQ==
X-Gm-Message-State: ALoCoQlgWq12zYBF8rAyxezDq4f/afTuVizYAn00U05l/aIZKk1sIINTjCyLi1sTfV0aYC91yTUV
X-Received: by 10.220.249.67 with SMTP id mj3mr905393vcb.23.1377000081443;
	Tue, 20 Aug 2013 05:01:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Tue, 20 Aug 2013 05:01:01 -0700 (PDT)
In-Reply-To: <CAP9ODKpxNe3zw4_HgYJZksDvr4tr-Jq9FxBc28kqqpjbzP=C0w@mail.gmail.com>
References: <cover.1376939912.git.nitin.a.kamble@intel.com>
	<b8e848c82d5c361278328b0569509f6cc4f58d36.1376939912.git.nitin.a.kamble@intel.com>
	<CAJTo0LayXbOWSnT=F5=ud2Vy__b0ipc9Xx6ujKkups2zWSLM7A@mail.gmail.com>
	<CAP9ODKpxNe3zw4_HgYJZksDvr4tr-Jq9FxBc28kqqpjbzP=C0w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 20 Aug 2013 13:01:01 +0100
Message-ID: <CAJTo0LYzGTseb33djRVrpXmNXZB_OdHrdhfwd9D+4ovjrPQ48w@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: Patches and discussions about the oe-core layer
	<Openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] sanity.bbclass: a new check for required distro features
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
X-List-Received-Date: Tue, 20 Aug 2013 12:01:20 -0000
Content-Type: text/plain; charset=UTF-8

On 20 August 2013 12:58, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Are there any situations where these distro feature dependencies can't
>> be expressed more precisely in a package recipe, and then something
>> like Otavio's approach of throwing a SkipPackage used?
>
> I have several cases in meta-fsl-demos. Vivante GPU driver provides
> different libraries depending on the backend to use (DirectFB, FB,
> Wayland and X11) and they cannot be used at same time. So depending on
> distro features setting some images are buildable or not.

And does distro_features_check.bbclass work for those?

> In fact I see same case in OE-Core; core-image-weston /depends/ on
> wayland distro feature and this is not explicit in metadata nowadays.

Yes, and it should definitely be checked for.

Ross

