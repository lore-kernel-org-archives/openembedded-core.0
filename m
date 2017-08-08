Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f49.google.com (mail-wm0-f49.google.com [74.125.82.49])
	by mail.openembedded.org (Postfix) with ESMTP id 8EE9D779C1
	for <openembedded-core@lists.openembedded.org>;
	Tue,  8 Aug 2017 22:54:10 +0000 (UTC)
Received: by mail-wm0-f49.google.com with SMTP id t201so18258539wmt.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Aug 2017 15:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6R/E1esPKguUBdhLhQJa9XH7zHaD49fSeEBIYWa1udk=;
	b=l6E7o1rniM3yk0b67MWLlv2XaPL+DUvsM4s2HJrWdaGhU/4oVzKuIpTmnbmNbajOcI
	ZZ6JH+KhrdAmUsf156pVfi5kso6CGMSMGV+hjFFSw1gOI5nuguCNP/3HddspNDyUYvva
	dHUnJviA7/z8Vv5VSmxXodRZPS2svfta2N19RaK3XmHkwxQDB/yWmjaqYwqSCH0OmGep
	bG1VxX7zjpILduh9lWdNVetDR0/tp8DcBNAT8WwbPma0S6bANwv/r9A+Z7lLpwPep/GA
	2txUoq6gKEkk+bZcq8YHEHqdks67i408P85gXoIWxa1bGGWN3z1qg40p4kkz5nfNqTbO
	ZIBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6R/E1esPKguUBdhLhQJa9XH7zHaD49fSeEBIYWa1udk=;
	b=K2On/KyHn05XrLmCCHtakXfMmjjB1BkqxUbWCvTKLZMi1soqex5RO7hJD7aj8STZaU
	mARQz5bQHq+/tbFUayVz0KNDw1RfWQUrTrjDgtKniSA+V4i/HTz60lS6oyIV4IBbBibu
	oqiZS/c6snlCtRrfubUYiYt8bT7e0JAFI/ohf1AzWjqPs1bC1AEIYbNlDvd7tVT9cm5U
	GTWlhHjbbLzUDllmIzexwYObwIuAgpTP2R1HEJaAiR7JyrXaNr7XippfYpI+c2MC+gjM
	tO3fXaJoeprhNy0rU6cXWSHZyfTILUZMxt+AorTyPoo8lONtpmyPgJS5XmS7HSAE6nzG
	iHVg==
X-Gm-Message-State: AHYfb5gpuSU+nri+JIYsFXF5vNjV3atAe/r22s0L3uqGZN5RHQEgiGrC
	izdTPzOft2mX66mnxUC91m1QIG6/UQ==
X-Received: by 10.28.24.210 with SMTP id 201mr3818735wmy.65.1502232851401;
	Tue, 08 Aug 2017 15:54:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.175.16 with HTTP; Tue, 8 Aug 2017 15:54:10 -0700 (PDT)
In-Reply-To: <46243f22-8359-490d-d7fa-aa2ce3280fa8@windriver.com>
References: <cover.1502206031.git.alexander.kanavin@linux.intel.com>
	<7ef3f08bdec1e383464085347222b59894526872.1502206031.git.alexander.kanavin@linux.intel.com>
	<4ae3a694-c172-c4e7-8cf9-97f6cd8507cd@windriver.com>
	<c9af037d-bd8f-691c-ec3d-ba17e723805d@linux.intel.com>
	<46243f22-8359-490d-d7fa-aa2ce3280fa8@windriver.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 8 Aug 2017 15:54:10 -0700
Message-ID: <CAJ86T=Xpv9px7d1t9JMieBwO+2AjbEN2xj19ZsjKPTUioZChQQ@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] gstreamer-plugins-bad: replace openssl dependency with nettle for hls plugin
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
X-List-Received-Date: Tue, 08 Aug 2017 22:54:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Tue, Aug 8, 2017 at 11:55 AM, Mark Hatle <mark.hatle@windriver.com> wrote:
> On 8/8/17 12:35 PM, Alexander Kanavin wrote:
>> On 08/08/2017 06:58 PM, Mark Hatle wrote:
>>> Can we somehow make openssl(10) or nettle a choice when compiling?
>>>
>>> I ask because I've worked on a few systems where people seem to want one
>>> encryption engine for as much of the system as possible (usually openssl).
>>> While gstreamer has not been a problem in such systems, I could see it being
>>> something that would need to be considered.
>>
>> This would need to be done across all recipes where such choice is
>> supported, as a 'preferred crypto engine' distro feature. There's been
>> talk of doing this, but I don't remember what was the outcome.
>>
>> Also, the plugin needs to be ported to 1.1 first, as the choice will
>> otherwise be taken away when 1.0 goes EOL.
>
> For now I'm fine with 1.0 support.  So something like:
>
> # ensure OpenSSL is used for HLS AES description instead of nettle
> # (OpenSSL is a shared dependency with dtls)
> PACKAGECONFIG[hls_openssl10]             = "--enable-hls
> --with-hls-crypto=openssl,--disable-hls,openssl10"
>
> PACKAGECONFIG[hls]             = "--enable-hls
> --with-hls-crypto=nettle,--disable-hls,nettle"
>
> But my concern is changing the choice of encryption engine could break various
> existing uses.  (Like I said, -I- don't have that use, but I expect others do..
> perhaps not with gstreamer-plugins-bad though?)

I looked at the gstreamer code briefly and the crypto dependency seems
fairly trivial (basically just AES decryption) so switching between
openssl and nettle doesn't look like it's going to be a big risk (even
for users obliged to avoid the LGPLv3 version of nettle in oe-core).

For reference, the problem with openssl 1.1 seems to be that gstreamer
embeds an openssl EVP_CIPHER_CTX struct directly within the
GstHLSDemuxStream struct, but openssl 1.1 requires that such structs
are now allocated and freed dynamically:

  https://wiki.openssl.org/index.php/OpenSSL_1.1.0_Changes
  https://cgit.freedesktop.org/gstreamer/gst-plugins-bad/tree/ext/hls/gsthlsdemux.h#n84

>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

