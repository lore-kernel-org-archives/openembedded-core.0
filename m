Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f179.google.com (unknown [209.85.213.179])
	by mail.openembedded.org (Postfix) with ESMTP id AE511605B2
	for <openembedded-core@lists.openembedded.org>;
	Sat, 10 May 2014 16:20:31 +0000 (UTC)
Received: by mail-ig0-f179.google.com with SMTP id hn18so2298326igb.6
	for <multiple recipients>; Sat, 10 May 2014 09:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=j7KAs5Sn8GFDbq4s9n/ywDPclbIzZ9qY5Uxu8YviyzU=;
	b=HOzS9pnj6B2XzUoZPos1GBZXHFfWH3maRgyEKE+v3SLhQ7PmXA53gGv2WyYOWuwpkC
	s1vCMLngu6cDtBH4ll5HJsM+Co8w7bp4hlqj+CBF0cGXmHq2KcD71VD9S/FMW9VfYHrV
	Pan5cr7hcpsIiaBjKKc9URtX25qOTaKEfVzpVaWCTnaVeEHGvWBjdA68vyAqBcoKHiCF
	2aLIdrCNEG2OC6YHIFZLCIyyezH82HgXA/rrkKpJf8RAVLk7NoxfVhIdsySDvRDOX7j+
	H/wwkmf/LsIUgQrG7qZFNtIq8IbENGnTwbHcAwyPDqIr3aYgeoqnaESC2mK6wVevGVz6
	bVqQ==
X-Received: by 10.50.109.130 with SMTP id hs2mr22554399igb.29.1399738477515;
	Sat, 10 May 2014 09:14:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.133 with HTTP; Sat, 10 May 2014 09:14:07 -0700 (PDT)
In-Reply-To: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
References: <CAJTo0LZbPXzXyvKXGZZYDT1BDWg3XYrRO_NXsXmuHLMmmW_S3Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 10 May 2014 09:14:07 -0700
Message-ID: <CAMKF1sqETNuu4EVasrJfdumQvvOYmhC3g6ez9px5EDhsMTTLUg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: GStreamer 0.10's future
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
X-List-Received-Date: Sat, 10 May 2014 16:20:33 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 8, 2014 at 7:48 AM, Burton, Ross <ross.burton@intel.com> wrote:
> For the 1.7 release I want to move GStreamer 0.10 from oe-core into
> meta-multimedia, and ensure everything in oe-core has ported to
> GStreamer 1.x.  GStreamer 0.10 is considered dead upstream and is
> unmaintained so we don't need to be shipping both versions anymore.
>
> Everyone in agreement?  Should I expect any hate mail over this?

I think we still have QT versions which has not yet removed the
support. but as long as its in
some layer I am good with it.

