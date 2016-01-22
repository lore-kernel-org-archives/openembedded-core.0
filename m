Return-Path: <raj.khem@gmail.com>
Received: from mail-io0-f181.google.com (mail-io0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 0E4957327E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 16:29:48 +0000 (UTC)
Received: by mail-io0-f181.google.com with SMTP id 77so93027055ioc.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Jan 2016 08:29:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=F19Tn+SxIjDmCh2VyGbcp5ZZwjKw3R2uaiDqJynCdy0=;
	b=nlmyT9BVLm3xv9l2F6BhhCZ7zwSO9cBFx1rIiLfPzUF0QYvAnxM2VGlBp5O46umXHD
	8V2VLLkuHhY4C1ZK3UzKmi88s3otMQo9YirjJfOMIM7FXX9geO1jKaE+Yy+bXL4YRVzS
	HMjw64CxoLoV+Qwz3gyJp+yhneHOvThke4hW65xaEH8H2MNaadNBPsjssiuxAaZ/KcPP
	2Jl9/bbCrtroPMu2ocu4Py2TyjkqNY9PSXqXFnOea7M0ypUqpnlHghx2TrauBTkDA1kW
	hmr7XNUIaZzJo73EPpOgcGHhxpYSNpTsQWtkLhkXfYlmdVqNV7SM3PMYAmFODFYCyDnv
	rDpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=F19Tn+SxIjDmCh2VyGbcp5ZZwjKw3R2uaiDqJynCdy0=;
	b=G952MI0L+qOdfRIV00ZjBUtHo2/ioFoff/2Oda3jf+AmGTM8GKSQKyrB7vmrtsdBNX
	zEVqGjNkpYQymt0ynwUQuZ8nVwnbMXec9KNr0EsYx75FLJIzVw2hbXqoRPrLhGDjfKnC
	/vqI69QmkKjMQ5+88qDviYlML2pGq5R+EWCO3+0cfqNkN7jXDUEe4vojkLA9nrLJpKAQ
	MpODa0iuW5h5fcInE+7VbGS25B7SH9hqHDlkHnhsNP8pcS/ssOxVjAQOps9vh5ZXnY6Z
	jWJVWG5BCCq5NtgzNbFperuwrE3a7905dBCAWV1vlQsPfi5Cm485cYc/oXUVhSTRP3Ru
	xrpQ==
X-Gm-Message-State: AG10YOSB73MMpFqOg9Mt+66OxppYXacAK7XeooWKIZkrQTEYBUZUBEQ9yEu2HBHWR7UmW0gPe8EMeymVWyEo3Q==
X-Received: by 10.107.9.224 with SMTP id 93mr4337759ioj.112.1453480188892;
	Fri, 22 Jan 2016 08:29:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.107.16.74 with HTTP; Fri, 22 Jan 2016 08:29:19 -0800 (PST)
In-Reply-To: <CAJTo0La-aNU6nMmrykB6VcTV_zOLVsj_+0T35QtZ1Zjs6bMCxw@mail.gmail.com>
References: <cover.1453029952.git.raj.khem@gmail.com>
	<4db181ab873afe453a8203c7f10a9e08a5e4f41c.1453029952.git.raj.khem@gmail.com>
	<CAJTo0La-aNU6nMmrykB6VcTV_zOLVsj_+0T35QtZ1Zjs6bMCxw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 22 Jan 2016 08:29:19 -0800
Message-ID: <CAMKF1sov63VpaySPDsOdvZb5njgXtCfbmQ96rThNwPg8tBR52g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 54/73] btrfs-tools: Disable backtrace on musl
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
X-List-Received-Date: Fri, 22 Jan 2016 16:29:49 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Jan 22, 2016 at 4:39 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 17 January 2016 at 11:36, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> musl does not support backtrace APIs
>> include limit.h for PATH_MAX definition
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>
>
> Since the rebase to btrfs-tools 4.4 this fails to patch:
>
> NOTE: Applying patch '0001-btrfs-corrupt-blocks-Include-limits.h.patch'
> (../meta/recipes-devtools/btrfs-tools/btrfs-tools/0001-btrfs-corrupt-blocks-Include-limits.h.patch)
> ERROR: Command Error: exit status: 1  Output:
> Applying patch 0001-btrfs-corrupt-blocks-Include-limits.h.patch
> patching file btrfs-corrupt-block.c
> Hunk #1 FAILED at 21.
> 1 out of 1 hunk FAILED -- rejects in file btrfs-corrupt-block.c
> Patch 0001-btrfs-corrupt-blocks-Include-limits.h.patch can be
> reverse-applied
>
> Presumably 4.4 accepted these patches and this can be dropped?

Patch part is in upstream so can be dropped however there is a recipe
change which is still needed

>
> Ross

