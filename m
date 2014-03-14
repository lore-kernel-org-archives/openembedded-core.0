Return-Path: <paul.betafive@gmail.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 2B12E6E8E2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 19:38:22 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id jw12so3302549veb.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Mar 2014 12:38:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type;
	bh=kFVvp9R3iLWadzsGuTBiyGXvpXRy8dEbAbYUirk73DM=;
	b=0furwUEv5mSfJTHTAxEIjzlzLIOc+ffk+BfZEW5BdEKopBnapdLnKge3rdtGZZXzYB
	mZkqQ8sIAGhbnN4Xm1xkiQ8DnHCwZ0lXE+C3EQ07dIyCuEE9YaCCKUK2fVquDaP0WFZ/
	TVkZlAb3DezAEfqrmEn8NoNcD1sNRgcmIm2H5vRWBL7X2qK23QFLDJGfSy/u4mRogmW3
	mSGs5/1zOhprm2b6d6v5jifU8hR2+CtqFR6sJbwL0HAstgd8/f34B2CiXGbWgscTrz7M
	arL2skL85YHnykWTVyO55YSXNwZ/BuMi7yUV03ATVppmKmOtsi+ESYsnnRbDPvqPAC2n
	fyTA==
X-Received: by 10.220.103.141 with SMTP id k13mr2464897vco.25.1394825903701;
	Fri, 14 Mar 2014 12:38:23 -0700 (PDT)
MIME-Version: 1.0
Sender: paul.betafive@gmail.com
Received: by 10.220.239.135 with HTTP; Fri, 14 Mar 2014 12:37:43 -0700 (PDT)
In-Reply-To: <CAMKF1srjEOYoNoT5T3weMkKSKN3MNPTnqCVbfXgR9RHn=erxmA@mail.gmail.com>
References: <CANyK_8dJY0nbt6aNeLYeRggTHXj9qiGbSemngbZAdf7LU_KzCQ@mail.gmail.com>
	<CAMKF1so_=HgkVWr4ftsFny+9ipZ-Yy4PSRXx+=b=Z9NQAq1GaQ@mail.gmail.com>
	<CANyK_8euVvKOgKbKGmYwwGnYwC+w=L8EFEfCdMy==+qBEnhrTA@mail.gmail.com>
	<CAMKF1sp0WUMyC8zsnQEei8=azDsy5xpM9UWUUsnw5rNqjytWVQ@mail.gmail.com>
	<CABcZANkrJYK7xgf=A=WcL9+xHbX1=jTkcDGs=pC3wjpwS-G3sw@mail.gmail.com>
	<CANyK_8ex42HU9pDjkMri4vCs7hyGQTSk4eZ_dB25NXSXRY3JSA@mail.gmail.com>
	<CABcZAN=z8mB1LkJ05SmTk6Gg+UJgp2+-yQNWKNwNPpvHcdrVtQ@mail.gmail.com>
	<CAMKF1srjEOYoNoT5T3weMkKSKN3MNPTnqCVbfXgR9RHn=erxmA@mail.gmail.com>
From: Paul Barker <paul@paulbarker.me.uk>
Date: Fri, 14 Mar 2014 19:37:43 +0000
X-Google-Sender-Auth: 3zaPo1oJU3oXIVX8S3gYinI2FpY
Message-ID: <CANyK_8e7DT39nuTAYAPwK_n24k4jpX4JhkUCevRT6xovQiFOQg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Chris Larson <clarson@kergoth.com>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [dylan] Backport request
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
X-List-Received-Date: Fri, 14 Mar 2014 19:38:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

On 14 March 2014 19:16, Khem Raj <raj.khem@gmail.com> wrote:
> On Fri, Mar 14, 2014 at 12:13 PM, Chris Larson <clarson@kergoth.com> wrote:
>> You'll be amazed how many headaches you can save having the host environment
>> be a known quantity :)
>
> absolutely
> I cant agree more.
> -Khem

I used to do this with a separate build VM but after a hardware
re-arrange I don't have the spare machine anymore. I've never used
containers before but I've read plenty about them. Just setup Ubuntu
Server 12.04 in a container and I'm going to see if I can get the
builds running in this.

I still think the backport of the fix for eglibc-2.17 with make
version > 4.0 is worth doing, but this route gives me a more stable
build environment anyway.

Cheers for the advice!

-- 
Paul Barker

Email: paul@paulbarker.me.uk
http://www.paulbarker.me.uk

