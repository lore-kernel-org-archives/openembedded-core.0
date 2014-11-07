Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 320946017E;
	Fri,  7 Nov 2014 15:58:11 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id at20so5466092iec.17
	for <multiple recipients>; Fri, 07 Nov 2014 07:58:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=W1dUoVcu5iI3tjirN6SNd11VzyUFQ6FA0t3H+HwrwPA=;
	b=TQYdJfMmN9Ymx7ZTjIidIs1A4kHyRRYMLNQAX7X0nfD2DiAVXa7bQ+rNpTnnOA9a/n
	Qr2FhexsZlBT++MknOqxQO/16BhXLE6rIOsxv8of99go07J/AZ7HWx7QKPZeG2GWgc3U
	d53TZhz9i2Kdkn4zrdokwaT8Nzo2PpHjsbVYUvtFfdovYUP/foG31P5SDnhrKmg4R9tc
	n5cqx2LSbHOMDe6jsrON30wLrG8HvmU0CEc4UHdLayFGMSRS1i/B6F/nwKEJte0kmBXz
	IOcTIC3Z83h5piz8yq2aP5aSJ0Bz4rmEmDrG/WankWHQS7akK7pDTsP3mtdB0NaxUagf
	krLw==
X-Received: by 10.107.47.223 with SMTP id v92mr3786477iov.75.1415375891677;
	Fri, 07 Nov 2014 07:58:11 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.169.2 with HTTP; Fri, 7 Nov 2014 07:57:41 -0800 (PST)
In-Reply-To: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
References: <CAJTo0LavfAPo3P4Mv9U-24KK7HhkBOgysg5ZAUZe1YOAL10pvw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Nov 2014 07:57:41 -0800
Message-ID: <CAMKF1sqUOM=FrvXkhoEkFpxMd0=GZ4deAoJnKDdCQkhesRuc0g@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-devel <openembedded-devel@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Moving llvm to oe-core?
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
X-List-Received-Date: Fri, 07 Nov 2014 15:58:13 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Nov 6, 2014 at 9:42 AM, Burton, Ross <ross.burton@intel.com> wrote:
> Hi,
>
> So I think it's fair to say that neither GCC nor LLVM are going away anytime
> soon, both having their respective niches.  Because of this I'm wondering if
> we should be adding LLVM to oe-core (taking the meta-oe recipes).  GCC will
> still be the cross-compiler used but LLVM will be available out of the box,
> for example the Gallium LLVM-based Mesa drivers can be enabled without
> requiring meta-oe.
>
> Anyone have thoughts/comments/objections?

I think it is a good thing to move it to oe-core.

>
> Ross
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

