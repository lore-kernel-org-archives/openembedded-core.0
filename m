Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f68.google.com (mail-qg0-f68.google.com
	[209.85.192.68])
	by mail.openembedded.org (Postfix) with ESMTP id 4067C6011C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2016 18:30:46 +0000 (UTC)
Received: by mail-qg0-f68.google.com with SMTP id f74so12108490qge.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 15 May 2016 11:30:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=V0hIpof/AmwyMkFvicH5Jn0PodMlUHhqW5R/VoyECzg=;
	b=YiuMdOKb0eel6pNM41lq6uoVCS7zQHD7tWBL8SGqtpuqgNaYTq/XMKLecPqyMswOph
	RuybwHH3m7pVJpTU5fyQRn2rB4pBsQJdMj+UNRmFaBg9LJzfeaz75P0DxhFIUra2EDK0
	Tz+2J4FGjHi46kaOjV7iQMgJxA1IKBmv8LvsYoh08BJT+xhJS8k218GwmcPwzAm9O8HO
	9PfzZoNU3A50HSSfi3IHgW7Wuz4F3GOFctWnvtdkFM2w3C0dq+0NkXskBXDWjmU2C/wQ
	7u875hMw9eblaFFcuX2b2+ySOrQa0hTh11xzkgRZZ+JRJUwIHt3XFeJPKZERNVYSi+jA
	9yEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=V0hIpof/AmwyMkFvicH5Jn0PodMlUHhqW5R/VoyECzg=;
	b=i7PcDG4Eb76B8Mt3ISd3QvEisLkrUjuwYydoN0mO+LMC2a9Nj/9QgWQOh1ZOJI5PB3
	/zdt7wS63rKAyqQisUaFT0zK8V3i/YCgDiLLcMkUThiBOWgIEnTLPKVruCFyF2qjG5vr
	Oenx8YxIYmoT+5+fkmB2c2LY+2H6L30a6Nj3ZmgeuV+3l6C0JQsb6ID3dQaOsSyMx2VI
	dxAdqf3OqcubLEU5qS/IT8RnkVoCv4xbdDHli9WTX+8xVRx9z1mlWG/62CqD8xahA9jK
	o0nvkJ/7wPHOgUs7s7tAlzbEaAi3q//ILEhaiBVICOKiiwhYpT1aOvXvIdS/GALYkRKs
	Zx7w==
X-Gm-Message-State: AOPr4FXAQlI4SmRuo57APfLwJ3DSq3u4IwCGLfNzIUng/RaZF9cGCskkEG9EhdijXgOwdX4uXIDcEzcNtvsi8A==
X-Received: by 10.140.199.8 with SMTP id u8mr26682367qha.5.1463337047308; Sun,
	15 May 2016 11:30:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Sun, 15 May 2016 11:30:17 -0700 (PDT)
In-Reply-To: <5738BBBD.3050407@gmail.com>
References: <5738BBBD.3050407@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 15 May 2016 11:30:17 -0700
Message-ID: <CAMKF1sqdAyY7dSt0gJAcYA8c=gcsFZ_25qru1VKgmYjUodMbgA@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Yocto Project <yocto@yoctoproject.org>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Branch Maintenance process clarification
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
X-List-Received-Date: Sun, 15 May 2016 18:30:47 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, May 15, 2016 at 11:11 AM, akuster808 <akuster808@gmail.com> wrote:
> Hello,
>
> I am reviewing the stable branch maintenance for Yocto and would like
> some clarification on a few steps.
> https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance
>
> 6. Split out any bitbake changes and send them to the bitbake-devel
> mailing list (marking them with the appropriate stable version in the
> subject line e.g. [1.20])
>
> AK] I have not seen this being done in the past. Should we start doing
> this or update the process ?

I would also suggest to add OE-Core branchname along with bitbake version
[1.20][krogoth] or [krogoth/1.20] some thing like that

>
> 7. Split out OE-Core changes and create an openembedded-core-contrib
> branch containing them; send the cover letter only (marking it as such
> in the subject) to the openembedded-core mailing list.
>
> AK] I don't have write access to do this, so this will be a problem.

Ask Michael to add your keys to contrib repo.

>
> 8. Split out any meta-yocto changes and create a poky-contrib branch
> containing them; send the cover letter only (marking it as such in the
> subject) to the poky mailing list.
>
> AK] Is this required?

yes.

>
> I do agree that the downstream repos are where the changes should be
> pushed first  then feed poky. This is not what I have seen happen in the
> past nor did I do it for dizzy either.

Usually changes flow into upstream layers and then get merged into
downstream distros
like poky and others.

>
> regards,
> Armin
>
>
>
> --
> _______________________________________________
> yocto mailing list
> yocto@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/yocto

