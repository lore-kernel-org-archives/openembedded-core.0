Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f41.google.com (mail-qa0-f41.google.com
	[209.85.216.41])
	by mail.openembedded.org (Postfix) with ESMTP id 292D465E38
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 21:41:00 +0000 (UTC)
Received: by mail-qa0-f41.google.com with SMTP id f12so3042882qad.28
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 14:41:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=tIAUDyv3laP8iD8A5peu69ZY9zGcKJvSR8Glqi4NRq8=;
	b=Kq7F6ditF//zrSHlEmqiUCboiijN5FgJ/eSdA8j8OxU8vLRhmRshGoidOnBI3h3W21
	FWavlvkbHEU2YlfT9HtedXX5ThoI48rJRy5Vbj60L2kofxymXukSQDQjq3jWyKLZxh6c
	4J9njRD7MNZNnI0nZOnYA0JyM+eMXpcPvOY3G4thiA51lTq9YVh0zzGMFa1VIhPjhn38
	k3KB19maBURZklSWFZnANisVEeYVaXoQ971D7L0lKJcsRajT544fNS3XtbMkhtbmS3Lu
	xnMbB2Mj5f6nFu7/hZgQUbn/7ZAHYl6a3xNJUYJqkyZJw4pAJ3S35QVMUbyI6YJbt4BE
	lvAg==
X-Gm-Message-State: ALoCoQleSQ3CSVBLZqfPn05MxeTXWrU5xspwGDVNlSsibA0DqvcqupsLALZvWt+3RfneEU52tQnT
X-Received: by 10.224.38.10 with SMTP id z10mr31393391qad.52.1410730861560;
	Sun, 14 Sep 2014 14:41:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Sun, 14 Sep 2014 14:40:41 -0700 (PDT)
In-Reply-To: <1410665660-25145-1-git-send-email-denis@denix.org>
References: <1410665660-25145-1-git-send-email-denis@denix.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 14 Sep 2014 22:40:41 +0100
Message-ID: <CAJTo0LaB+e=o02t4pbF6kSNKvy8R8YHT5tijT9T43U=6Y_yXdw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Denys Dmytriyenko <denys@ti.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: update to version 2014.07
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
X-List-Received-Date: Sun, 14 Sep 2014 21:41:04 -0000
Content-Type: text/plain; charset=UTF-8

On 14 September 2014 04:34, Denys Dmytriyenko <denis@denix.org> wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> * Update U-boot and corresponding tools to version 2014.07
> * Small cleanups with indentation and consolidation of u-boot.inc

This missed the feature freeze, so can you justify merging this after
the freeze or can it wait until 1.8 opens?

Ross

