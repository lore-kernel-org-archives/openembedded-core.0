Return-Path: <ptsneves@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 593C574D40
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 May 2018 13:12:24 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id y15-v6so9315539wrg.11
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2018 06:12:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=h+yaWmDE7yq/A5Pvwm09B5W3ORkwpbZRZ2UT4Oc3XEk=;
	b=JfT5zmPDd8i3wA8wDca78wUe7NK0FJBzWZz7RftwuxwUvm117HIP8fnLh11GDtlfQ0
	7ec/j+EDoxAryKWxplJsqPca/aNtPSmlm6apxtlNvbIYLV6KvsOssoGoDGon5Jf/+Z4o
	7wp0h/Spp5ek5NBNXNFAtGBMC/7jg3GwpeMLOe91IUYeuvjvuyIhASTQxiSZjdye+UR3
	4UR/YtvBsG8LFMGHJVI7Y2pSQPYZXihOwoR14bkDyGRRgPCr3JlvfDHR52G7HpNApOe5
	imbqbkkPP00TFhEfbKea399kWzSUppPzQqJxigH6DEjXLXpt6s1h2xLG0PpPU07ElgTb
	2nqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=h+yaWmDE7yq/A5Pvwm09B5W3ORkwpbZRZ2UT4Oc3XEk=;
	b=U3eJ/xEjj8t0WOZ8L/yHGv9swvXCxf3Bpe7q/uWKgjZdWFuO1X4X4vfYTsMp35GloU
	/nfZzKVOl5ViyprIYaUsLbzMWtDyHjjd04UahkeJH9AkQpvk0cJlSs9x68Qai2NbJ3GQ
	xYbqOxs1rnDVpE3Hl6+GzwH2sO/0AdFCIaPuN2ePpEYDo29xhauuRiwCTaKN3MZ7x5Az
	0wbB3ABXOMkFAbZbFAh/j2aq8k40El9CTpHgKnDWZh4U8kZU4+fvoomCUzDgj1PXTLMS
	vPQLDv/tMrIIIHK1FdaUSe4BJ+v/cOo1UX3Xpfg+FhmRZIvjIK0iPLfqF4hbJ8uSLaiw
	A9IA==
X-Gm-Message-State: ALQs6tAx0tbG1oJXkNtfbUeKqODhIBZaRh/l1EPXNvOSbIIpc4DY+vQt
	NA424BOaAQlw/r7XELe/arf95ePyqfUwUb5p6w==
X-Google-Smtp-Source: AB8JxZqNjh4m2b2kao76SCIzodfED43RKNZRONzJVJXTgIK1MBz4dgukh5v+XE3Fedm6rhDIotuxJdTNpsISNysQ7J4=
X-Received: by 2002:adf:972c:: with SMTP id
	r41-v6mr23300603wrb.79.1525439545710; 
	Fri, 04 May 2018 06:12:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.39.68 with HTTP; Fri, 4 May 2018 06:12:25 -0700 (PDT)
In-Reply-To: <CAJTo0LZSDUfpXvE9VA59wZVyTJFDW4sixh++DrdWdORrLKz4NA@mail.gmail.com>
References: <20180504123244.43049-1-alexander.kanavin@linux.intel.com>
	<20180504123244.43049-14-alexander.kanavin@linux.intel.com>
	<CAJO0J4hyjRyj+Zzz2Y7BTg0aB-dfEQXX4pJSi11n4Vc2iYkrJw@mail.gmail.com>
	<CAJTo0LZSDUfpXvE9VA59wZVyTJFDW4sixh++DrdWdORrLKz4NA@mail.gmail.com>
From: Paulo Neves <ptsneves@gmail.com>
Date: Fri, 4 May 2018 15:12:25 +0200
Message-ID: <CAJO0J4gTTHfnYRqr0BU14A6hgE_GHWrvM0UzbrLe0GwMu7n6WA@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 14/14] babeltrace: switch over to git
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
X-List-Received-Date: Fri, 04 May 2018 13:12:25 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, May 4, 2018 at 2:55 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 4 May 2018 at 13:46, Paulo Neves <ptsneves@gmail.com> wrote:
>>
>> I always wondered, what is the rationale for not always using the git
>> repositories? If there is one why did we change for this specific
>> recipe?
>
>
> Tarballs are easier to mirror, smaller, have checksums to verify the
> download at both fetch and unpack time, and often contain generated files
> which otherwise require yet more tools to regenerate (for example, man pages
> may require a documentation toolchain to build from git but will be included
> in a tarball).
In my case we have a requirement of using the git repositories because
of the easiness with which we can make code bissections, as well as
back porting.

>>
>> I ask this because I am in the process of creating a massive layer,
>> whose only purpose is to have the software come from the git
>> repository and not from the tarballs of the original poky recipes.
>
>
> I certainly hope this is using devupstream.bbclass or similar and isn't a
> giant copy/paste!
Wow never heard/saw of this bbclass even, and looking at the mega
manual there is not any reference to this class. Also from the look of
the classcode I am not seeing how this can help us accomplish the
goal. Can you point me to some docs or examples?

> Ross

The way we are doing the layer is, by bbappend, so there is not much
copy paste, but tarbal/git replacement.
There would be no problem if there would not be differences between
released tarballs and git repositories, but specially in autotools
projects, the bbappend requires much more trickery as you mentioned

Paulo Neves

