Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-lf0-f44.google.com (mail-lf0-f44.google.com
	[209.85.215.44])
	by mail.openembedded.org (Postfix) with ESMTP id 314286003C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 28 Mar 2018 01:39:05 +0000 (UTC)
Received: by mail-lf0-f44.google.com with SMTP id u3-v6so1110432lff.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 27 Mar 2018 18:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H1/znpFog0xesN8eyhiLMWXOwx5kvwLd5Mx+m2EGBYw=;
	b=i5CcVd0368zwiaRzjwb4/1InNXknm2JvnEgrU8gGeDmbh0wivwSrRQvhck4vtiF7Gm
	Xfa1I2NV0/D9u7k2W98517RxX80NcprZ5iDrdPqSHKkhxZOrn/WmfFaAruYpM9BG8iE0
	OKwrJt0LewEtczTkrtHVcO9jeNWZoiCG0L+I1cvYnJfoMYP87xkiIPzslCLexuKgVY5g
	bpG643DQeFHF7OhuW3SWU0BddmAzxwfOiTzcKarUPgwaWnWFZgDDd8TvXeSSICQMBwYz
	S9w6xiTzO8+ubRS+rQMb7ey0YpLTbgu4DPeiYmXI4+d4sq9yAIY1a+rP+CORwrjSb3BF
	ReJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H1/znpFog0xesN8eyhiLMWXOwx5kvwLd5Mx+m2EGBYw=;
	b=YPgzVa/ssNysOY5Sv0gsRayRGbLtiC0IfV6ql4uxpNTIbWUIBRniqVQ7wODviOn9SG
	7fpHM8e9Y9S3aOI/IggynJoGjafsVjIIrG5ermIVURlDbSzG1oGUOZTuCZ1UKgLGnEAu
	FvUrMcJl/81eL7lhrX+sWjkeeVNMaysxoISWZNPUWxpfN2V0Jeo5GoPez4mRB+6MAhYZ
	4HH1pjJNJP7WuHYjHUXMDJHhwnLJNgWx0r4sP9PC1KYqPj1X4Z+WCGY2UwmxH5ieSLY4
	31VuOB0W8Nf9rOdTMGicSOoS4FOENcrU35qT0dIcls50N7LI7isjx4KCIZfDjch4SJ4K
	qiXw==
X-Gm-Message-State: AElRT7EqMQKtVnMEIGmYVTD6D9dhqHFJEXMhV1UYrke44NuZ4XTN4042
	oU3K6owFI2s43ImuqhEAz3B6MU6ykLZr+kqk5fA=
X-Google-Smtp-Source: AIpwx4/RmEE+dRKapIBqUEqTl22d4c0jFTQEFBjyW1EDhfQ1Lca2Wjhm1e5yrTnKp1hy+GCeGtHOwO2RkOCRRhPxEnc=
X-Received: by 2002:a19:1b02:: with SMTP id b2-v6mr851478lfb.3.1522201146613; 
	Tue, 27 Mar 2018 18:39:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.46.25.8 with HTTP; Tue, 27 Mar 2018 18:39:06 -0700 (PDT)
In-Reply-To: <CAJTo0LYj9jF-oz9mDRXziiLC6xnS-A_q=EtG-T2aoVZ4H4pAkg@mail.gmail.com>
References: <cover.1522162765.git.bruce.ashfield@windriver.com>
	<37126f1c8d7556686f55019a52265f0e1c85e2ff.1522162765.git.bruce.ashfield@windriver.com>
	<CAJTo0LYj9jF-oz9mDRXziiLC6xnS-A_q=EtG-T2aoVZ4H4pAkg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Tue, 27 Mar 2018 21:39:06 -0400
Message-ID: <CADkTA4Nb78OPAGO+tDvkho=qw-J6w1HS-sVUbhYQyHQVkoT3pQ@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] linux-yocto/4.14: update to v4.14.30
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
X-List-Received-Date: Wed, 28 Mar 2018 01:39:06 -0000
Content-Type: text/plain; charset="UTF-8"

How annoying.

That is twice that this has happened to the tiny/* branches.

yow-bashfiel-d4 [/home/bruc...-yocto.git]> git branch --contains
40adf66d7c45b8252a1d3f904b5027a495e41725
  v4.14/standard/tiny/base
* v4.14/standard/tiny/common-pc

Should be fixed now.

Bruce


On Tue, Mar 27, 2018 at 6:07 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Sorry but this is failing for poky-tiny:
>
> ERROR: linux-yocto-tiny-4.14.30+gitAUTOINC+f8232ce8e9_40adf66d7c-r0
> do_fetch: Fetcher failure: Unable to find revision
> 40adf66d7c45b8252a1d3f904b5027a495e41725 in branch
> v4.14/standard/tiny/common-pc even from upstream
> ERROR: linux-yocto-tiny-4.14.30+gitAUTOINC+f8232ce8e9_40adf66d7c-r0
> do_fetch: Fetcher failure for URL:
> 'git://git.yoctoproject.org/linux-yocto.git;branch=v4.14/standard/tiny/common-pc;name=machine'.
> Unable to fetch URL from any source.
>
> Ross
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core



-- 
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

