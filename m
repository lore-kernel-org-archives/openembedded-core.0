Return-Path: <lpapp@archlinux.us>
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com
	[209.85.220.49])
	by mail.openembedded.org (Postfix) with ESMTP id A4E646F12A
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:26:22 +0000 (UTC)
Received: by mail-pa0-f49.google.com with SMTP id hz1so6619432pad.8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 07:26:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=gTwQeFIzzLMdPHQWtAXp7RGSp4LU2GlVgaGQV6vZMac=;
	b=J+TfLQzsFlDtGBi+gAixs+EgJSx+b8qvaAQvAf6d2azvRmnITROmLakio4z9AFCRP8
	9u4JiAoRFgK+b2Vq0F/p4vkm7vgs8Ta+UWOdOdGW+C8AN1BUCzVu+UoWR9f/wmoctCHp
	arJCuGJJNAKYHACXeP/I8XDyE8ki658PfnMqW9Pu8A4tmhXftPod8SMRSZiYy37YpHxx
	NvaY9WtEg7ez/MviuX+ilFucrztx36TjOHknRjEpmtgNzmzT580QO5M2T8nBPuMZ4ImH
	8WWZLyNGsQy1UA1EsWXJ3w4EUABiEEFNFGfoj2ritporHdqmS5gOZX7VOZeTOVg/VBQI
	cdbw==
X-Gm-Message-State: ALoCoQm67dzK/q76za18gxWnfHpw3EAhAMjXsUIQPYrNvfpJK5Axx26w446jdcPeWevr4Bx0sonf
MIME-Version: 1.0
X-Received: by 10.66.121.164 with SMTP id ll4mr25695101pab.129.1393255583406; 
	Mon, 24 Feb 2014 07:26:23 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.26.195 with HTTP; Mon, 24 Feb 2014 07:26:23 -0800 (PST)
In-Reply-To: <20140224145117.GB26295@ad.chargestorm.se>
References: <CAOMwXhOmoLP_8+mv_c_4Eg8YG_T1JD-ao+P1S9FDKvityy_3mA@mail.gmail.com>
	<CAJTo0LY6hsYxR2=aeRodKhZ+5VBEUh+q+7nRYU0E6XYc+Pn-NQ@mail.gmail.com>
	<CAOMwXhN+D+kGw70ijEs_Zd9aNiLsmuts0B6SHf9QXkytgaQCPA@mail.gmail.com>
	<20140224135848.GA26295@ad.chargestorm.se>
	<CAOMwXhMsjQ2v40hM5UCx1R_NHnop2G2z_kTDVCqV4dWPwXW9EQ@mail.gmail.com>
	<20140224145117.GB26295@ad.chargestorm.se>
Date: Mon, 24 Feb 2014 15:26:23 +0000
X-Google-Sender-Auth: _KFMKaQHvffpW77ZMIueE26HjOA
Message-ID: <CAOMwXhOOghbcYwYyn__0=RxgipM_mFz-d6vwmqtebCpiW8_R3Q@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Laszlo Papp <lpapp@kde.org>, "Burton, Ross" <ross.burton@intel.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: No versioning for existing images
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
X-List-Received-Date: Mon, 24 Feb 2014 15:26:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 2:51 PM, Anders Darander <anders@chargestorm.se> wrote:
> * Laszlo Papp <lpapp@kde.org> [140224 15:12]:
>
>> On Mon, Feb 24, 2014 at 1:58 PM, Anders Darander <anders@chargestorm.se> wrote:
>> > * Laszlo Papp <lpapp@kde.org> [140224 14:37]:
>
>> >> On Mon, Feb 24, 2014 at 1:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> >> > On 24 February 2014 12:01, Laszlo Papp <lpapp@kde.org> wrote:
>> >> The problem is that build numbers, that I have seen at least, are
>> >> human unreadable. A human readable number would be nicer to have;
>> >> something that I have just double checked on my Blackberry Limited
>> >> Edition phone, and it is so that the OS Version is 10.0.10.738 in the
>> >> settings.
>
>> >> Perhaps the build number can be made human readable... but currently,
>> >> when I build an image, all I get is a long and not so convenient
>> >> time-stamp. Is there a more gentle way of generating image version
>> >> then?
>
>> > The git describe line is our main versioning. Using that line we get the
>> > abreviated SHA1 of our repo, the last tag, the number of commits after
>> > the last tag, and finally whether the repo was clean or dirty during the
>> > build.
>
>
>> > It might not be as pretty as the 10.0.10.738 in your example, though for
>> > us it's sufficient for the time being.
>
>> As you are writing, that is good for internal operation, but I would
>> dislike providing such "versioning" for customers.
>
> Yes, for customer communication it might very well be preferred to use
> some other version numbers.
>
> I'd guess that the best bet then would be to either store the version
> number in a config file in your repo, and have the build process take
> that number and put it into the image in a way similar to what's above.

Yes, I was thinking about a PRODUCT_VERSION or SOFTWARE_VERSION as a
configuration option (and/or command line option).

> Or to get the number from a tag.

Hmm, actually, this is not such bad an idea.

> In either case, you'll need to make
> sure that the release process updates the number correctly, thought that
> issue will be there no matter how you retreive and store the number.

Yes, these things can be automated in release scripts, absolutely.

> Though, I still think that having the info above on the images are
> usefull, not least when the customer comes back with more difficult to
> isolate issues.

I am not sure what information you mean. If you identify the image
appropriately with a version and the corresponding list of package and
versions (e.g. "image" BUILDHISTORY_FEATURE), I think you are good to
go.

Currently, I am not trying to solve such internal issues. It is more
important for me at this stage to be able to provide a useful version
to the end user and also for own sake, but admittedly, tag is actually
a good idea, thanks.

