Return-Path: <danielhilst@gmail.com>
Received: from mail-qk0-f176.google.com (mail-qk0-f176.google.com
	[209.85.220.176])
	by mail.openembedded.org (Postfix) with ESMTP id 3E3767742F
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Dec 2016 21:56:35 +0000 (UTC)
Received: by mail-qk0-f176.google.com with SMTP id n21so125022071qka.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 17 Dec 2016 13:56:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H+MZRsj0iKyyag05eCx3jmp8kjqHOo+GUEvWmT3GMds=;
	b=TIXZGYRK062vAgbwKDoAgWX4WDYQUmipFZEVHZUOks+GBRo0PXGdPZlPSg4vcc2QaZ
	aSyT8jTA/DY9YE9MnMS8yrPqxciK6PykhOhZvUTIJTdudokMgFeQf71vtA19X1sqI+xV
	fwhECE0rqVHQ9MUjQzo5QOUIUtk+0TlD2TNdyJXJqu+Fm4gLKqKTkPGoB0/P4Vyi4NJh
	hamdT3/NTv98ydWKNOoF8ET4ebunxVeTaLpTC9spfrLp/yTMXWcPCFnHsmzvgS3B3h73
	UoTeUJ165CfX35xTQRtQDTLdA+JMupxtCELofuFU4KhbJk3e8hT9nvIaSZt78+aP9chi
	RFpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H+MZRsj0iKyyag05eCx3jmp8kjqHOo+GUEvWmT3GMds=;
	b=XHjUvgip2ZrMAtrym1zmnc4/QuJ7bDP9nJ0BY4vCkNfmya7qCbwImC9w1b6yEi11NJ
	gcjdU4wttloxF7+idsFHYQ5kbUvc65N/5qhUwyjz+oqFwCjHv1UKca79luT9qXqbE8ZT
	14W+qQzRoCHxlXB1eBW+R5lELtwkc0GiZGyaCJDzTsNCWX3emd3NQmDHFHyxSCVm1s0R
	lECmE8nkFqpBspcHhLYxJW2HrXcvuDPlQ0a01OstxljPkllbNJ/f1hW1hzvLYKK72WmB
	xUqvQe/bIk0jljnoigzH45GWYe9I8F6PWk32LB2w8TCAn6O7Cmj1emG/cuwQpGhjF+cP
	f0Uw==
X-Gm-Message-State: AIkVDXLRNl6BgcvULQBW+blSXsO2A7SaXV0J89yu796ei8KBM9qqS8KGjRVHzkc6OrcUewKdvhGz/ubCiXOclw==
X-Received: by 10.55.89.197 with SMTP id n188mr10416270qkb.217.1482011797314; 
	Sat, 17 Dec 2016 13:56:37 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.88.21 with HTTP; Sat, 17 Dec 2016 13:56:36 -0800 (PST)
In-Reply-To: <CAJTo0LZdjrddyZMKJDSMzVnNp-BVZ1UeF1waG5561nj1pWgi9w@mail.gmail.com>
References: <20161217014805.6120-1-danielhilst@gmail.com>
	<CAJTo0LZdjrddyZMKJDSMzVnNp-BVZ1UeF1waG5561nj1pWgi9w@mail.gmail.com>
From: "Daniel." <danielhilst@gmail.com>
Date: Sat, 17 Dec 2016 19:56:36 -0200
Message-ID: <CAF3SDA6RJ61mgb932ffNsK9s9YbQ97C_SCCpxF+8On4iGBa37Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Add cxxtest framework to devtools.
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
X-List-Received-Date: Sat, 17 Dec 2016 21:56:36 -0000
Content-Type: text/plain; charset=UTF-8

Okay! Sent!

Thanks for the reply!

2016-12-17 14:38 GMT-02:00 Burton, Ross <ross.burton@intel.com>:
>
> On 17 December 2016 at 01:48, Daniel Hilst Selli <danielhilst@gmail.com>
> wrote:
>>
>> CxxTest is a C++ unit framework test that doesn't
>> need precompiled library.
>
>
> Unless you have a great reason for this to be in oe-core, it should probably
> belong in meta-oe so please submit it to that layer.
>
> Ross



-- 
"Do or do not. There is no try"
  Yoda Master

