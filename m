Return-Path: <kristian.amlie@mender.io>
Received: from mail-lf0-f49.google.com (mail-lf0-f49.google.com
	[209.85.215.49])
	by mail.openembedded.org (Postfix) with ESMTP id 7219171AC6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 09:38:23 +0000 (UTC)
Received: by mail-lf0-f49.google.com with SMTP id h4so27774554lfj.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 May 2017 02:38:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mender-io.20150623.gappssmtp.com; s=20150623;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=YjiFzoertO+ZwOoSrPXuF0fIyiILle5UcOvBOqDKlSs=;
	b=d/Ips8/CmzjAP5h/mN6n4uMeX4MCd50S77shJrYpgkSND7z4SiUfUUwCDOc/0djBSx
	oCH68uWNHd6xQejQ+J/5LuVLVJwUm8P5kz3Vjnvnb+wkKLQRElagXxvpUp+2kzi+AeoA
	g0hkjQeCGGYpsf1R1w08RZ4lHQCdACoAXEJTSlKhcqB7mg9xn6wZKh93njG8zPIfoMxs
	+y/0zk/EglplDMYMF8Eb0iUclCIl84kYEBOJYvvNOs4o3DeglH7+rwDwdhm8KfOSurxB
	uoTbNlc9wmR31pUTmUjDpRLg3ufONtu+OUfBYORzKuvW8okA4aBg56H8N7/4GV4WyRkA
	VKOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=YjiFzoertO+ZwOoSrPXuF0fIyiILle5UcOvBOqDKlSs=;
	b=Q0jWrith0yYH5S2CzFPiXxhTTqGxxBIVT3OsMNCm0d8DQ8NISc0RWmELWCzFrbLHga
	uZbyx7+5zJnfVDcLcOxZi6j8D/TTXGGeR228rkDcO0a8/+CRk8h5YaF18sqFr2lURORT
	zHwehHAsP6VmgD0XnJnNN4SJImQu59bkEIqit100Y5+KZK6m0+te5ICFnMicCBHv0Mg7
	CzJvOzt4UziLCY/vtjv/Or4bMajSNHv+9U79yzs5qbdBnrkE7V0V7FGFMixqQli0ZLkc
	h3PyZr0jESuvKAI4YqvLY9sviNmYv3AF2vIgSPl76ozZqZN7VzOmoHcvjS0B2QiWqG75
	vtqw==
X-Gm-Message-State: AODbwcDiGKEAjiJxXkp5e+hNnaudbeWzRU9yPD6x9xldTJfuIup0fAbz
	VXUqRmQA0oXlsuCl
X-Received: by 10.25.92.220 with SMTP id u89mr6064175lfi.69.1495445904669;
	Mon, 22 May 2017 02:38:24 -0700 (PDT)
Received: from [10.20.33.141] ([195.159.234.190])
	by smtp.googlemail.com with ESMTPSA id
	l185sm2515033lfe.30.2017.05.22.02.38.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 22 May 2017 02:38:23 -0700 (PDT)
To: ed.bartosh@linux.intel.com
References: <1493219031-12843-1-git-send-email-kristian.amlie@mender.io>
	<534a1d7c-b787-5e3c-e9fe-829c6585124d@mender.io>
	<20170522084622.GA7783@linux.intel.com>
From: Kristian Amlie <kristian.amlie@mender.io>
Message-ID: <8e87fb4b-6180-efdc-6f60-4e8ca6d5564c@mender.io>
Date: Mon, 22 May 2017 11:38:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.1.1
MIME-Version: 1.0
In-Reply-To: <20170522084622.GA7783@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: do_image: Adding support for IMAGE_ROOTFS_EXCLUDE_PATH.
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
X-List-Received-Date: Mon, 22 May 2017 09:38:24 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 22/05/17 10:46, Ed Bartosh wrote:
> On Mon, May 22, 2017 at 09:08:41AM +0200, Kristian Amlie wrote:
>> Ping. Would be great to get some feedback so I can continue working on this.
>>
> I like the idea.
> 
> Lately I was working on generic EFI implementation
> and thought that it would be nice to be able to package EFI artifacts
> and get them installed the same way as other packages. With
> IMAGE_ROOTFS_EXCLUDE_PATH = '<directory with efi artifacts>' it would be
> possible to not include that directory into the rootfs if needed.

Yep, great example, that's exactly what this feature is about!

I'll continue with my current suggestion then. The thing I'm most unsure
about is the "d.setVarFlag('do_image_%s' % t, 'respect_exclude_path',
'1')" approach, but I will attempt that one if I don't hear any other
suggestions or hit a road block.

-- 
Kristian


>> On 26/04/17 17:03, Kristian Amlie wrote:
>>> This is a direct followup from the earlier f6a064d969f414 commit in wic. It
>>> works more or less the same way: The variable specifies a list of directories
>>> relative to the root of the rootfs, and these directories will be excluded from
>>> the resulting rootfs image. If an entry ends with a slash, only the contents are
>>> omitted, not the directory itself.
>>>
>>> This is early feedback call, and several things are missing here (see
>>> below). However, I would like to know if at least the basic approach is
>>> acceptable. Reviewers pressed on time really only need to look at the topmost
>>> hunk as well as the last couple of lines of the two functions. Those show what
>>> the basic idea is.
>>>
>>> What's missing:
>>>
>>> * Documentation
>>>
>>> * Test coverage
>>>
>>> * Respecting IMAGE_ROOTFS_EXCLUDE_PATH is a behavior change, and isn't
>>>   appropriate for all image creators. In fact, for the the main use case [1] to
>>>   work it must not always be respected.
>>>
>>> My idea for the last point is that the variable will not be respected by
>>> default, and each of the pure filesystem image creators (btrfs, ext2/3/4, etc)
>>> will set a flag that mark their image creator as a "pure filesystem", which
>>> would respect this variable. Image creators that make partitions, however,
>>> should not respect it, because they will use wic for that purpose instead, and
>>> then they need to have access to the entire rootfs. Hence they should not set
>>> the flag.
>>>
>>> I'm imagining something like this:
>>>
>>>   d.setVarFlag('do_image_%s' % t, 'respect_exclude_path', '1')
>>>
>>> although I'm not sure if that's the best approach (tips are welcome).
>>>
>>> [1] The use case for this feature is the following: We are creating two types of
>>> images in Mender: One complete partitioned image, and one image containing only
>>> the rootfs. In order to be able to populate non-rootfs partitions, we want to
>>> use the regular bitbake recipes for building these components, but then exclude
>>> certain directories from the rootfs image. Using wic, we are adding those
>>> directories back into the partitioned image, but under different
>>> partitions. Unlike the rootfs image, the other partitions are not expected to be
>>> rebuilt after the first rollout.
>>>
>>
> 


