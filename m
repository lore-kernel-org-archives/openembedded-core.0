Return-Path: <ulfalizer@gmail.com>
Received: from mail-ua0-f182.google.com (mail-ua0-f182.google.com
	[209.85.217.182])
	by mail.openembedded.org (Postfix) with ESMTP id A9962607F8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 12:00:11 +0000 (UTC)
Received: by mail-ua0-f182.google.com with SMTP id 51so11010084uai.1
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Nov 2016 04:00:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=/l2rARtoomhiwfVZoXn6XgBewsdEwN2am2DS+QjSXLI=;
	b=xNfHY+rNq2hQ+PHdEpcCoa6amLSHrmVUG912sAKhwCqpJrb7zkPHToDLbcHcm9oFet
	GeoafINBaovduDlygDZVwmwTRNxgELoZvNkTg8d8heFHndNMCBrbiEXq18XUZvLFkbgZ
	Dojx1XZ9iaapvn8y3q/u64Dp/ZohOMEbnxkV3MSc4y6AMz6TxZGerm90Tj4HMkB8sJd4
	q2IfJ7Gmtj8EkT7qU6N886NWKMmGLYHSmKRxYZnZqq/FsxYMTBRsAG8AKwDobtEHGGqt
	rZGURux9tqoCtsOpwHfDqty3PTBd77aNPuD0dWehFRaZWw0oE2tnaqjAmJITIIHaAJl1
	4qkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=/l2rARtoomhiwfVZoXn6XgBewsdEwN2am2DS+QjSXLI=;
	b=C70GSC/iCpmUggbOzC6FMBnlOtwPFgTPaAe8/ADdkpQjMdfcCeOjTW8AS+YVAS3ZNQ
	ogdZ4ACMGhXKuSZh7itqgyYqSW/CEgeJH7iiTiv/bP907gxPwZQWXx+acMEF3bNACXmf
	wauH4vUTDhzbtxeTJZMt4c1JBb9pTyYnxhGTLNo7rOkdUHkIEUFYUBXx3ii6kjILkBK0
	teNF1Zo8pl4Q38M4mVGOkDCsiDehuN7KghZaoODguNg3Y56Z2WR6ydJLh5/IC6t0Tmvi
	pnWsfonWyPa3UHZGOPlQOUSvk5DzLbcmnS6pt9wl7qqIRzIDPmLwRwMjZnovB7fQPqPK
	WTfQ==
X-Gm-Message-State: AKaTC02gM+H336ziHNadhF0Kiz3sesG27PQ8KnHygols3AYYxpcOiyvkD+N70/+EXLreJ4R6MaTXuS5eJLhv/w==
X-Received: by 10.176.82.214 with SMTP id w22mr1772799uaw.167.1479902412710;
	Wed, 23 Nov 2016 04:00:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.103.117.129 with HTTP; Wed, 23 Nov 2016 04:00:12 -0800 (PST)
In-Reply-To: <alpine.LFD.2.20.1611230633180.8293@ca624034.mitel.com>
References: <alpine.LFD.2.20.1611230540200.7856@ca624034.mitel.com>
	<CAJTo0LZvk-Ssv3Bc5rSYSuYCm2rQma4Vwv2jvh5zdE7cCPE0Vg@mail.gmail.com>
	<alpine.LFD.2.20.1611230633180.8293@ca624034.mitel.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Wed, 23 Nov 2016 13:00:12 +0100
Message-ID: <CAFkk2KRQ+vv+X9paB+ZLCuFobAVpXyi7gaV7P5kwgX3hja9Rhg@mail.gmail.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: migrating simple tarballs over to OE recipes?
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
X-List-Received-Date: Wed, 23 Nov 2016 12:00:11 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 23, 2016 at 12:34 PM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
> On Wed, 23 Nov 2016, Burton, Ross wrote:
>
>>
>> On 23 November 2016 at 10:42, Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>>         colleague has a pile of tarballs that were used to customize an x86
>>       centos system, wants to move all that to OE with as little fuss as
>>       possible, i guess the simplest way is to just create recipes that have
>>       the same tarball in the files/ directory, and write a trivial
>>       do_install() task that untars it into the root fs, yes?
>>
>>
>> Pretty much, yeah.
>>
>> If you've a large pile and they're all effectively the same then a
>> little class can automate it even more.
>
>   already going down that road, just wanted to make sure i hadn't
> overlooked something obvious.
>
> rday

bin_package.bbclass might be useful as well, especially if the files
are already arranged like in the rootfs inside the tarballs.

Cheers,
Ulf

