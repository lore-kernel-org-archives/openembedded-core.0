Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TbGkl-00068p-Ty
	for openembedded-core@lists.openembedded.org;
	Wed, 21 Nov 2012 21:18:38 +0100
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 21 Nov 2012 12:04:29 -0800
Received: by mail-ob0-f197.google.com with SMTP id za17so27969164obc.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Nov 2012 12:04:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=iQWlmiu9491wz1icTeCURwqYF1xRaiPHc9wAJNiWKYk=;
	b=PidVo0t9ONRNMmLHFdBdcW1bQIF4I//kR4m7TOHwE+w1BRVequrT5KsKveNqEG2Txq
	XCvvZzb/jqUDvkHdPvK5K8i/cPEMJC3iEbEVsgXucKOSZ9XqCDyZv3X81XoazPOUTRKB
	EOmp+QIdCEArGdnXYwzfD5b2OhfdRRPe3jb2swPm71y2Nzj4sgNanVE8QP+C/otz6pgt
	wwCqquNY1wJ+/i3OGKhVOtptGXv5wCbZyFR2JBZH0Zdb+IuFoEIMUbvsCO71mgRgmzFD
	kHqN0H9EOllyD6jKZgOhl2Jj3i9sD/btwtpb/jK2nI5jghK20qze36OAKtOaCrFPBqMM
	86wQ==
Received: by 10.60.13.73 with SMTP id f9mr9736733oec.131.1353528268317;
	Wed, 21 Nov 2012 12:04:28 -0800 (PST)
Received: by 10.60.13.73 with SMTP id f9mr9736722oec.131.1353528268202; Wed,
	21 Nov 2012 12:04:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.154.37 with HTTP; Wed, 21 Nov 2012 12:04:08 -0800 (PST)
In-Reply-To: <20121121172155.GL12637@jama.jama.net>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<7f73d8a0aee08a41e949ec7a1297f5edbf12ed57.1352898505.git.laurentiu.palcu@intel.com>
	<20121121162051.GK12637@jama.jama.net> <1353517951.10459.21.camel@ted>
	<20121121172155.GL12637@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 21 Nov 2012 20:04:08 +0000
Message-ID: <CAJTo0LZrWEW8-CwmBMY8+=e6KJ_yQv6=gTtRODrrRnQ6ELwQkA@mail.gmail.com>
To: openembedded-core@lists.openembedded.org
X-Gm-Message-State: ALoCoQkH5sq2qQx6EPf5I7LN2nuqOCPeuG8bt10WsuDibsTWDpD5huiqXGR4Or7+9bNnbDIwaKNrB2m/9vpGTEz3QsAntIlZibJN4wyugFzYmw+Vz7AvcTAZlL9KsK6HV90erv83MbKdd/OZZOUDzliLZ+Pvf+nfatYQK7gYumBcQ6uRlMY1KgI/RbDFmWEipYHT0wFV8Ex5
Subject: Re: [PATCH v3 12/12] xf86-video-omap: add new recipe to follow the maintained repo
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 21 Nov 2012 20:18:39 -0000
Content-Type: text/plain; charset=UTF-8

On 21 November 2012 17:21, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > So I'm wondering if it was tested at all.
>> >
>> > With xf86-video-omapfb not ported to xserver-1.13 video API it makes new
>> > default xserver from oe-core unusable on many armv7a machines..
>>
>> /usr/include/xorg/dri.h probably existed on the machine it was tested
>> on. I appreciate this needs to get fixed but I know it was tested.
>
> Doesn't AC_CHECK_FILE macro fail the same when it does exist?

AC_CHECK_FILE always fails when cross-compiling. Any instances of it
should be replaced with something more useful - especially header
checks that should be using pkgconfig. I recommend patching the build
to use pkgconfig and sending the patch upstream.

Ross


