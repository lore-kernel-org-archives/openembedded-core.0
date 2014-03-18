Return-Path: <raj.khem@gmail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 4957C6F7D2
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 23:14:25 +0000 (UTC)
Received: by mail-ig0-f171.google.com with SMTP id hl1so10027645igb.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Mar 2014 16:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Ok4lDU2BPXDapR/ZFygAp3RNuy1C+S5d+CvTi5cRCOM=;
	b=TQpYZkOHediZ6uCZ3uqKT5kYfkaS9uKz8e5zbKITGJo9SUfhUbmsyVAV4jHEbu6djK
	Lh8ltoIVmdriQUcwPZZyP9+IpVwohNC0XnTAufBf1wXGT2SqXruZQ7lWiPaPVayYnzs3
	+8Tnreys5zYltwCMyGXm2yOAU7hyd3qksq+M/1Xk55L0IZRS8z64hGR0GIFQeNrn0Y07
	ycjvFo86IhxUNHb+efLYlmvDB6af4QfnUeYXx9o3zZaN0OE+VYyUv0yPys0BDrYGr8b+
	NfYeMTyuQqxQ4Q6EPrSvTyMFwDZwpMifoZ9IVlwsfPRQIrN3R5Tc/qQO1wIRxPO01Inl
	5lkg==
X-Received: by 10.50.43.170 with SMTP id x10mr21856729igl.20.1395184466548;
	Tue, 18 Mar 2014 16:14:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.224.136 with HTTP; Tue, 18 Mar 2014 16:13:56 -0700 (PDT)
In-Reply-To: <CAMKF1son=Mf8_yyOLtmy1kQ2HGA6ALH9N=9aG+YtUmvfCkfk8g@mail.gmail.com>
References: <1394559360-27718-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LY4_XK3-KCTON_tnzhqTnOgH4UfKVTBcBfzYGrXy-wi3A@mail.gmail.com>
	<CAMKF1srprf=54e_nh2+j5fCCRCkrTGxNxM7DgVVgqRxSDMRNCA@mail.gmail.com>
	<1395184093.3808.100.camel@ted>
	<CAMKF1son=Mf8_yyOLtmy1kQ2HGA6ALH9N=9aG+YtUmvfCkfk8g@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 18 Mar 2014 16:13:56 -0700
Message-ID: <CAMKF1sr=a1BLpvcqQHt+UQqvWff1GGWJGo22dEoMMwWpQVWWwQ@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] pulseaudio: Upgrade 4.0 -> 5.0
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
X-List-Received-Date: Tue, 18 Mar 2014 23:14:26 -0000
Content-Type: text/plain; charset=UTF-8

These two

http://patchwork.openembedded.org/patch/68851/
http://patchwork.openembedded.org/patch/68853/


On Tue, Mar 18, 2014 at 4:11 PM, Khem Raj <raj.khem@gmail.com> wrote:
> i think so look for v2
>
> -Khem
>
> On Mar 18, 2014 4:08 PM, "Richard Purdie"
> <richard.purdie@linuxfoundation.org> wrote:
>>
>> On Tue, 2014-03-18 at 10:07 -0700, Khem Raj wrote:
>> > On Tue, Mar 18, 2014 at 8:51 AM, Burton, Ross <ross.burton@intel.com>
>> > wrote:
>> > > On 11 March 2014 17:36, Khem Raj <raj.khem@gmail.com> wrote:
>> > >> bluetooth-proximity has been removed in 5.0
>> > >
>> > > This brings in a new QA warning:
>> > >
>> > > WARNING: QA Issue: pulseaudio: configure was passed unrecognised
>> > > options: --enable-bluez
>> >
>> > yeah now it differentiates between bluez4 and bluez5 so the options
>> > are also renamed
>> > accordingly. I have sent a v2
>>
>> Did you sent the right patch?
>>
>> Cheers,
>>
>> Richard
>>
>

