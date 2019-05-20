Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id C057C7E064
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 17:47:15 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id f12so7042443plt.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 May 2019 10:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=pdk8/5xJ2IRn2+b+2Mb0V9NYzZuJasyqS3TEUo3Upkw=;
	b=msaoxWw5FbLrwQnyxXMCOt/1O62viS9PPi6MCkwnps79N3B/GZ3Cuk/0mPC4o8NaBd
	k9mIkr630QBUx/eu5Om4cKN5XhZ0G0QvDWv5UEIKqV6s8qQukoDcW+rDF1YYZmb5xBQe
	G+AL59Bgr4s7aE3gGByKh8ijbFNviXEyMgu7zzFEKvj6gwJE7+ZuUmEAjN21zYPBdCMg
	KDMIfbdgVlYgGxG1El1OOTwpPzk6m0wi3Y9/2QtsM3zyZuYtI4iXov3FKJ6Pdg6lQJ9o
	PeWBxK9sHjEvTyhXWZlonboB4VLdaCQFJxYB01GOGcaRYoh+d2NVv7+m7iSeOeTK5avb
	A74A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=pdk8/5xJ2IRn2+b+2Mb0V9NYzZuJasyqS3TEUo3Upkw=;
	b=rfctnGg2zpvtwODWVIKJYHaX2P6RkGymNonII3YIRnGNtadbVVW3lbPoF6sJ7fkwz2
	HWmi8nCUSAjQfmWyk1WhZEjLO89E3FrK95L8jOecfX9RrIzEpKeVy5sJxbIC8i4/yCPT
	kAwFkUaHgp7XHYFUmHU5T4pwrxKMv1Oe+4LKMo+aqA5N1JP62egY/XbkDvurXym4dfsA
	o+64SlpBu4P+IZHxaNB2XmQXW4reAvZIVqs7ZE/auWO6lc+si02WcjqWp6k5j6ZKwtoX
	AdL34joL/SZ83SRHc74xS3Vunn/pDmoqQjAzqQtS8HVdMLjTPL8GWfrV0lvyR8sNYY3/
	VS6g==
X-Gm-Message-State: APjAAAXQP+wWWPSUZewclvPPxtTRhpXLjWGvipsBehhhZbIVPo+GYOw9
	f5Zv1DfQhvUgES0NHTnUyOtK0xBDvGI=
X-Google-Smtp-Source: APXvYqx/pTJDEZW8MMYuvqnVuVF9h2nCtI3lbCaU7ecIxV4mj7abH1Dqxydm5SmV12+ylY4c/14PUg==
X-Received: by 2002:a17:902:704c:: with SMTP id
	h12mr22256160plt.65.1558374436246; 
	Mon, 20 May 2019 10:47:16 -0700 (PDT)
Received: from hermes.local ([2601:646:8500:6bc6:74d7:3fa5:f6a5:ec10])
	by smtp.gmail.com with ESMTPSA id
	a7sm31387943pgj.42.2019.05.20.10.47.15
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 May 2019 10:47:15 -0700 (PDT)
To: Joshua Watt <jpewhacker@gmail.com>,
	openembedded-core@lists.openembedded.org
References: <20190520165719.20041-1-JPEWhacker@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <f87316b2-9628-3ef2-708d-cee93657928a@gmail.com>
Date: Mon, 20 May 2019 10:47:14 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:67.0)
	Gecko/20100101 Thunderbird/67.0
MIME-Version: 1.0
In-Reply-To: <20190520165719.20041-1-JPEWhacker@gmail.com>
Subject: Re: [PATCH 0/1] Initial QA test for reproducible builds
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
X-List-Received-Date: Mon, 20 May 2019 17:47:15 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Joshua

Thanks for contributing this will provide some teeth to reproducible 
builds QA

On 5/20/19 9:57 AM, Joshua Watt wrote:
> Implements an initial QA check for reproducible builds. This check is
> sufficient for an initial implementation, and will catch a wide variety
> of reproducible problems, but it does have the following problems:
> 
>   1) It doesn't pass. Currently, about 800 packages fail to build
>      in a reproducible manner for core-image-minimal. I've found two
>      major sources of non-reproducibility so far:
>       a) The perl-module packages don't have a consistent
>          SOURCE_DATE_EPOCH which means when they are packaged the
>          timestamps on all the files are different. Thankfully, this
>          accounts for several hundred of the packages, so fixing this
>          should remove a lot of the failures

maybe we can start with inhriting reproducible_build_simple which has 
hardcoded values for SOURCE_DATE_EPOCH

>       b) Debug package strings aren't consistent. It appears that in some
>          of the -dbg packages, the linker changes the order of the merged
>          .debug_strings section. This trickles down into the packages
>          that contain the executables because it changes the hash the
>          executable contains to ensure the debug symbols match up.
> 

try adding -fno-merge-debug-strings to linker and see if that fixes this 
problem. If that happens then we know its an option to add when doing 
reproducible builds.

>   2) It's not easy to debug issues when there are reproducibility
>      problems. I had initially intended to run diffoscope on the
>      resulting files but this takes much longer than I think we are
>      willing to run on the autobuilder and also generates far too much
>      output to be really useful. I think a better long term route is to
>      have the test dump the list of non-reproducible packages and then
>      write a helper script that can consumer this list, allow the user to
>      select a package, then run diffoscope to examine it.

I think that might be needed to wrap diffoscope.

> 
>   3) This test currently is incomplete and won't catch all classes of
>      reproducibility problems. At the least, I know that it won't
>      consistently catch the use of the __DATE__ macro in source code,
>      since that requires the builds to be done on two separate dates (on
>      the other hand, use of __TIME__ will be caught pretty reliably since
>      the builds are done serially). I suspect the correct solution to
>      this is to borrow from Debian and use something like faketime to
>      fake out the system time to some suitable future date when doing the
>      test build, but this will require some though to how it should be
>      implemented.
> 
>   4) It currently only tests Debian packages and core-image-minimal. The
>      test case has support for building the other package formats and
>      other images at the same time, the idea being that the long step in
>      this test is building everything from scratch, and building multiple
>      package formats and images at the same time will be much faster
>      overall than having multiple tests that have to do from-scratch
>      builds (although, there might be a way to serialize multiple tests
>      and have them share the test build TMPDIR). Until at least 1 package
>      format and image are passing, I don't see a huge motivation to
>      enable more.

why does it have to depend on packaging backend ?

> 
> Joshua Watt (1):
>    oeqa: Add reproducible build selftest
> 
>   meta/lib/oeqa/selftest/cases/reproducible.py | 159 +++++++++++++++++++
>   1 file changed, 159 insertions(+)
>   create mode 100644 meta/lib/oeqa/selftest/cases/reproducible.py
> 

