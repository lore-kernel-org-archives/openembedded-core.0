Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f42.google.com (mail-vb0-f42.google.com
	[209.85.212.42])
	by mail.openembedded.org (Postfix) with ESMTP id 6B19F601DB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 16:00:03 +0000 (UTC)
Received: by mail-vb0-f42.google.com with SMTP id i3so3025747vbh.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 09:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=dOwMxaYks3jsFVr6gPEj813lOqAdf6vuV+W1i/kKN8U=;
	b=gtcZ44hs8lQS9slsLH1y1VfQCVLTNZQYQ1dvkk0cARMjlMVyr5pLE4VB8zsH+2T6on
	w+ipE0AZAKbpnvyubSWh8hvserGJ6fO1sl4Eoq23ZAGkXqXgQ6st1MEk/YcYYBjw0ykW
	Jc1GdioQwlqUqgG7Jr9l/Sj03bRPllBUoAZqzquNAE30suIY8wjOUIIPFJ1v5/NVJTZ1
	AjruiKTARlG2SWNpjC1Is0DUyfaMqiq8nOLeAZg6S1B/yrK6iBIffRTmUoZ44X4J7xRW
	SNVvwA+q4aZ+xvWL4XedFnbjOjMmYKG2HvjE+t3IqWmWOcS4Gb09/G9nDGKcDDeZPuqF
	KPuA==
X-Received: by 10.58.171.4 with SMTP id aq4mr6448806vec.26.1371571204105; Tue,
	18 Jun 2013 09:00:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 18 Jun 2013 08:59:44 -0700 (PDT)
In-Reply-To: <1371570895.6580.65.camel@phil-desktop.brightsign>
References: <CAJTo0LbHu=CyeCL=yvyBrUtc0i==ybVXQSXDVkVqMy4jsyoEfg@mail.gmail.com>
	<1371566573.6580.59.camel@phil-desktop.brightsign>
	<CAJTo0LZD46Gckm=PGRw2NdSBibREWUzJbG_zhVtcAAqtAunn+w@mail.gmail.com>
	<1371567621.3466.16.camel@localhost>
	<CAJTo0LbT7ZbbmbibLCzOvv4a2939-Hr8uGEoUqg2sRVgEOCqmQ@mail.gmail.com>
	<1371570476.20823.121.camel@ted>
	<1371570895.6580.65.camel@phil-desktop.brightsign>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 18 Jun 2013 16:59:44 +0100
Message-ID: <CAJTo0LbqXGC+qNet4QAahbbtMTOct-fa==P7U+aNd_KwkbHm3w@mail.gmail.com>
To: Phil Blundell <pb@pbcl.net>
X-Gm-Message-State: ALoCoQn5WiiiHb2rJ0Zh9NQ5h54Sx+4ZMJ0lai64nzqe9PwmVkg4Ufw/JVsLbssb9Jx1F29JmjnY
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: magic libtool .la removal
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
X-List-Received-Date: Tue, 18 Jun 2013 16:00:03 -0000
Content-Type: text/plain; charset=UTF-8

On 18 June 2013 16:54, Phil Blundell <pb@pbcl.net> wrote:
> On Tue, 2013-06-18 at 16:47 +0100, Richard Purdie wrote:
>> We might as well throw away libtool
>
> That sounds like an excellent plan to me.  I wonder how hard it would be
> to invent a libtool-dummy script which took the same arguments but
> basically just invoked the compiler and linker without any of the extra
> craziness.

That would be DOLT.

>>Yes the .la files are annoying but they're not that much of a problem,
>>are they?
>
> I do recall that I was moved to write my original patch because the .la
> files were causing me an actual problem rather than just being a
> nuisance.  I can't remember the details offhand unfortunately, though I
> guess I could try re-enabling them again locally and see what breaks.

FWIW, I've never seen a .la break anything where a clean doesn't solve
it, the problems are always due to rebuilds.

Ross

