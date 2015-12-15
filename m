Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f43.google.com (mail-wm0-f43.google.com [74.125.82.43])
	by mail.openembedded.org (Postfix) with ESMTP id B840A73197
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 20:07:48 +0000 (UTC)
Received: by mail-wm0-f43.google.com with SMTP id n186so42348199wmn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Dec 2015 12:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=VB7wa+PtEOQmgYRj/65QHD2SMuQYgFov+lRkTz/atKU=;
	b=GGB/82tBaX27XEwymZaBj0Hn8jx+b1N6jgEJr0sP4UXYXzHKv2ba7ebpNbAutB6LdW
	I7ITb7LxzerAYpMAdpgZR96w68+yuGHTzdaIFpXBPEyXuZkgs+qUUDtAhNMMa/kIKPjn
	XbdaTIT52jtxTac+JXfhN26psuGoZc3ASyGchUpaft+0k6udwjHx0bcDcDuAmbttweU3
	6xwT1yBDKngz8DxNSH+941HWzsWssfPuDN01KRiwe2YGzIkDclKATQxzVVYgU9bZajQ5
	OlE17Ivq8swsot8SPs3rtPNKrXGVvhpC4nFPl+Csg0aVaxjbbb1uVkMQ7jf+yjA/fL1h
	Dzzg==
MIME-Version: 1.0
X-Received: by 10.28.11.134 with SMTP id 128mr6714850wml.72.1450210068680;
	Tue, 15 Dec 2015 12:07:48 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Tue, 15 Dec 2015 12:07:48 -0800 (PST)
In-Reply-To: <2403291.KqQCZxqk2K@peggleto-mobl.ger.corp.intel.com>
References: <1450191753-13537-1-git-send-email-alexander.kanavin@linux.intel.com>
	<20151215152541.GA2556@jama> <567031BB.7040903@linux.intel.com>
	<2403291.KqQCZxqk2K@peggleto-mobl.ger.corp.intel.com>
Date: Tue, 15 Dec 2015 12:07:48 -0800
Message-ID: <CAJ86T=XkgyYditMnijXxWbQxqFMT-XR_-EZUOyLL17i=DcuGJg@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] valgrind: update to 3.11.0
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
X-List-Received-Date: Tue, 15 Dec 2015 20:07:49 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Dec 15, 2015 at 9:26 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tue, 15 Dec 2015 17:28:59 Alexander Kanavin wrote:
>> On 12/15/2015 05:25 PM, Martin Jansa wrote:
>> >> +COMPATIBLE_HOST = '(i.86|x86_64|mips|powerpc|powerpc64).*-linux'
>> >> +COMPATIBLE_HOST_armv7a = 'arm.*-linux'
>> >
>> > Can you add armv7ve as well?
>>
>> Armv7ve support is not yet in master, so you'll have to add it later I'm
>> afraid.
>
> I think by policy we don't have any restrictions on architecture-specific flags
> in OE-Core (at least, assuming they're reasonable).

If we're going to duplicate all _armv7a over-rides for _armv7ve then
I'd vote to do so in a single patch series which fixes up the whole of
oe-core rather than adding the over-rides one at a time amongst
version updates etc.

> Cheers,
> Paul
>
> --
>
> Paul Eggleton
> Intel Open Source Technology Centre
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

