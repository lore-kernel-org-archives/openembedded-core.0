Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 4C2F076EBF
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Feb 2016 19:46:26 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id 128so4424325wmz.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Feb 2016 11:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=Pkp91grFyi8BOb0aWxghXn0BSsfZPptJZsWVGrds8Y0=;
	b=O7v0ZIACsGYBm+lTSbX0V5/znTGrUN82YiU2tbCltV33bHHr1kPZVE+dxAj9Ho6Gec
	fvLZ3vv5Kv7AqRltWezO9im01Lf4EoC/1UyTjgUlafj1qRAhfa7eWguslpq/kjGd/9Ao
	CwVTqcseK/U0NjJBv1hj+JpgXrcmrmxxE5uzGoxPnVrRTE6YX/QDjQ/FUwvSwtqskQK2
	e2pxTqDm2onwOR5qwWhTxVSdQHhyQeDZLRJEt5v05UOazZri6rJtYuFFytEWqGd9t1yn
	P4AZvEQ0D4Nxxynoe03J5D8V9hTHK3y0GV83WjgsX9YyacIX3o4/o4DKpm2OvJ6blUgv
	LQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=Pkp91grFyi8BOb0aWxghXn0BSsfZPptJZsWVGrds8Y0=;
	b=SjfPmhEFdHJToWOn9ReUXIvjtb9r3LZG/2qmRD9vLAOwUQ5QwxVPpRfjSADz9hVe78
	pMrMz3tMGomGndFy4NMi1oy4gHD70ouFocgxXuaciwGxWMLzbIIOcFFSS4qkWbzTNEEc
	HrD5vfGcnVUps324dHGGx0WwFlYcnG2J4rkUSfHR7g1+qu7TjwKDOSEXoSFSw4Xm60nl
	sUJmCV3FJk9ZM7p3mMFKrXun9i3TSU92Ce6M7JKNkJLC2E9vEJ3WphXmyflnkAo+yv4v
	0Pbdu0Qwfm1uXgwOQwpyO3MFdxVykXk8NdnzVoBy/3NMmTMW2NngXcHX/MLUzLEpxwhs
	Zbyg==
X-Gm-Message-State: AG10YOSrwvMZu2hUOzibGkvsc7IORx4GQM5MR8Fp0W7Ij4vnZqYorSL1svcO8/sjOn0UASbRBhJzO1s5p00xdg==
MIME-Version: 1.0
X-Received: by 10.28.220.134 with SMTP id t128mr6583410wmg.61.1454701587235;
	Fri, 05 Feb 2016 11:46:27 -0800 (PST)
Received: by 10.194.209.131 with HTTP; Fri, 5 Feb 2016 11:46:27 -0800 (PST)
In-Reply-To: <CAJTo0LbvHFKywioso4iYxpGQLOYCgjZ6tHSqkSA9kQrJ595MyA@mail.gmail.com>
References: <1454627058-26663-1-git-send-email-armccurdy@gmail.com>
	<1454627058-26663-2-git-send-email-armccurdy@gmail.com>
	<CAJTo0LbvHFKywioso4iYxpGQLOYCgjZ6tHSqkSA9kQrJ595MyA@mail.gmail.com>
Date: Fri, 5 Feb 2016 11:46:27 -0800
Message-ID: <CAJ86T=U4JnPudrbucz6bJ1XD29hxwUVV-Ojz-Lrwj0NsaARypA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] gstreamer1.0_git: avoid including <sys/poll.h> directly
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
X-List-Received-Date: Fri, 05 Feb 2016 19:46:27 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Feb 5, 2016 at 7:55 AM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 4 February 2016 at 23:04, Andre McCurdy <armccurdy@gmail.com> wrote:
>>
>> musl libc generates warnings if <sys/poll.h> is included directly.
>
> Are these not required for the versioned recipes?

Official releases of GStreamer don't enable -Werror, so the warnings
are only a problem when building the git versions.

> Ross

