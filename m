Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id 39B04617AA
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:29:16 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id fp1so6473868pdb.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 07:29:17 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type;
	bh=LT44k2dM2cMOXTJqAAfs79XcGNl2O3Lu6hoO99xIPyI=;
	b=lwVqrUKB8NoqG+8cdnLWw3lTNi8kFRMuLZ+QL0ORBSWsQOs08Zy7i8wAgrxOLzJqvN
	D+R2JOLKhlzTyEK4+n3fPL7fD18VXZpiKPkRUqUILIjoWL0GgMw9u1pflE639BSXXOUs
	wOSXjqsMjDIfagVJtU1CxS0bVXADfpcDPRbe66ZRtc80olwT/3T4Dv6cpd3Bkwu7TJDl
	0wE4VoWfeEHj4auS/p1fEwgxkdNRwiGLeSfIh3CY4YYldiuCec5HF7ryeHUTfU2nVTeh
	Oc0qz4lhzjarzJPvAsGRSWnxv7N+PDxNZKYwlr1J56p2IXvmxgVmxyFC+qcJwFfHS2mm
	2JEA==
X-Gm-Message-State: ALoCoQmSlwlIrDTDX1Fs4IMUYHifc5eMN3lorEcr39Gw3yDdRmtLtYr3b/RYa6Xi5QSaFR5KIvwN
MIME-Version: 1.0
X-Received: by 10.66.138.40 with SMTP id qn8mr26203358pab.154.1393255757803;
	Mon, 24 Feb 2014 07:29:17 -0800 (PST)
Sender: lpapp@archlinux.us
Received: by 10.70.26.195 with HTTP; Mon, 24 Feb 2014 07:29:17 -0800 (PST)
In-Reply-To: <20140224151510.GF26981@jama>
References: <CAOMwXhOmoLP_8+mv_c_4Eg8YG_T1JD-ao+P1S9FDKvityy_3mA@mail.gmail.com>
	<CAJTo0LY6hsYxR2=aeRodKhZ+5VBEUh+q+7nRYU0E6XYc+Pn-NQ@mail.gmail.com>
	<CAOMwXhN+D+kGw70ijEs_Zd9aNiLsmuts0B6SHf9QXkytgaQCPA@mail.gmail.com>
	<20140224135848.GA26295@ad.chargestorm.se>
	<CAOMwXhMsjQ2v40hM5UCx1R_NHnop2G2z_kTDVCqV4dWPwXW9EQ@mail.gmail.com>
	<20140224145117.GB26295@ad.chargestorm.se>
	<20140224151510.GF26981@jama>
Date: Mon, 24 Feb 2014 15:29:17 +0000
X-Google-Sender-Auth: EH7QhWtaIGuW8QiN43wDRddHXq4
Message-ID: <CAOMwXhPe+uti-ZtUzfw1_SquQ6vYr==9oN0+_6kAAWLZDobrLw@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Mon, 24 Feb 2014 15:29:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 3:15 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Feb 24, 2014 at 03:51:19PM +0100, Anders Darander wrote:
>> * Laszlo Papp <lpapp@kde.org> [140224 15:12]:
>>
>> > On Mon, Feb 24, 2014 at 1:58 PM, Anders Darander <anders@chargestorm.se> wrote:
>> > > * Laszlo Papp <lpapp@kde.org> [140224 14:37]:
>>
>> > >> On Mon, Feb 24, 2014 at 1:18 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> > >> > On 24 February 2014 12:01, Laszlo Papp <lpapp@kde.org> wrote:
>> > >> The problem is that build numbers, that I have seen at least, are
>> > >> human unreadable. A human readable number would be nicer to have;
>> > >> something that I have just double checked on my Blackberry Limited
>> > >> Edition phone, and it is so that the OS Version is 10.0.10.738 in the
>> > >> settings.
>>
>> > >> Perhaps the build number can be made human readable... but currently,
>> > >> when I build an image, all I get is a long and not so convenient
>> > >> time-stamp. Is there a more gentle way of generating image version
>> > >> then?
>>
>> > > The git describe line is our main versioning. Using that line we get the
>> > > abreviated SHA1 of our repo, the last tag, the number of commits after
>> > > the last tag, and finally whether the repo was clean or dirty during the
>> > > build.
>>
>>
>> > > It might not be as pretty as the 10.0.10.738 in your example, though for
>> > > us it's sufficient for the time being.
>>
>> > As you are writing, that is good for internal operation, but I would
>> > dislike providing such "versioning" for customers.
>>
>> Yes, for customer communication it might very well be preferred to use
>> some other version numbers.
>>
>> I'd guess that the best bet then would be to either store the version
>> number in a config file in your repo, and have the build process take
>> that number and put it into the image in a way similar to what's above.
>> Or to get the number from a tag. In either case, you'll need to make
>> sure that the release process updates the number correctly, thought that
>> issue will be there no matter how you retreive and store the number.
>>
>> Though, I still think that having the info above on the images are
>> usefull, not least when the customer comes back with more difficult to
>> isolate issues.
>
> in meta-webos we're appending human readable version suffix to
> IMAGE_NAME, KERNEL_IMAGE_BASE_NAME and MODULE_IMAGE_BASE_NAME variables
> and it's also included in some utils (like lsb and nyx-modules).
>
> That way we can distinguish not only what is in the image, but also
> where the image was built (e.g. official/local build,
> development/production version, which jenkins-job produced that etc).

Right, this sounds well-organized and advanced. Currently, we do not
need this much flexibility, but it is useful to know there are people
doing it as "professionally" as you. :-)

