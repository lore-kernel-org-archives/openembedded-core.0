Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f50.google.com (mail-qg0-f50.google.com
	[209.85.192.50])
	by mail.openembedded.org (Postfix) with ESMTP id BDFEC65E0C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 20:49:16 +0000 (UTC)
Received: by mail-qg0-f50.google.com with SMTP id z60so3143720qgd.9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Sep 2014 13:49:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=3WT0TxQ2h+F4b0iWRvyL1w3s8tx6d22gA3mo9DQhHGQ=;
	b=T/LpHWOQVtTPW/xBhTHnD2U2SExGP4tN0VPxYOxG0GoJ1jm3BjDKC6fwoPj6Vab7Y6
	7+9bDnnJ5cn0CkN9hKEQ3GZjbZTRbroRBVDX0oWTpf+Ms9MEU6zBvbe4f6/ApH0uSNWJ
	4yVFzm5jAswjIEo1iSFruFuCQ2Z0rPtq+s1aelmKyG7MVsAnQfdJE/+dhek8BLvYasyO
	FpGwV/q83HEX1NoYYkjG9SHY6wf7Zk3HA3oJRQIEOsbtaoWu01dP9RqG5M7J9xhlMVh6
	lfBMLoMPY1cP1sAZh2BypWgQ9VrR78LWt+68BzIkrUnendFoGhxe7Eg28JhUz0Hem4v5
	FINw==
X-Gm-Message-State: ALoCoQnQUqG8IfO8oTGC+xQdn0PBASAuiX8gqo39ya7pr9AwDn9B0xWK9+XtvFSBt8DqHui+Bx28
X-Received: by 10.224.126.202 with SMTP id d10mr30142684qas.22.1410727757135; 
	Sun, 14 Sep 2014 13:49:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Sun, 14 Sep 2014 13:48:57 -0700 (PDT)
In-Reply-To: <CACS+7ZTLWpoBXXezLOH5k=i9-x4869mrM35ZfhY5=Wsj2d=c7Q@mail.gmail.com>
References: <CACS+7ZTLWpoBXXezLOH5k=i9-x4869mrM35ZfhY5=Wsj2d=c7Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sun, 14 Sep 2014 21:48:57 +0100
Message-ID: <CAJTo0LbT0CkWqp5MoOYS-zg838113JP7GhSuRPYK8WNjNegwXA@mail.gmail.com>
To: Dan McGregor <danismostlikely@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [Patch v2] libsanitizer: Enable GCC sanitizers
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
X-List-Received-Date: Sun, 14 Sep 2014 20:49:19 -0000
Content-Type: text/plain; charset=UTF-8

On 13 September 2014 04:06, Dan McGregor <danismostlikely@gmail.com> wrote:
> +python __anonymous () {
> +    arch = d.getVar("TRANSLATED_TARGET_ARCH", True)
> +    if arch not in { "i586", "i686", "x86_64", "arm" }:
> +        raise bb.parse.SkipPackage("libsanitizer only works on Intel and ARM.")
> +}

Shouldn't this be something like
COMPATIBLE_HOST=(x86_64.*|i.86.*|arm.*)? (assuming it doesn't work on
aarch64, which isn't matched by arm.*)

Ross

