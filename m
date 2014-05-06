Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f182.google.com (mail-ie0-f182.google.com
	[209.85.223.182])
	by mail.openembedded.org (Postfix) with ESMTP id 0C1FA6098B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  6 May 2014 18:26:00 +0000 (UTC)
Received: by mail-ie0-f182.google.com with SMTP id tp5so10254404ieb.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 06 May 2014 11:26:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=VERS8sbadZtYqVbDXQFdu0U5VU2//YOfy1T9NczwrzQ=;
	b=REQWkuZn3sAqHZ2plodeYIl+NaXM4Y1mmnM7JoETVBACbntvMreTilvjQWejJQ4vuC
	FTw+QF3U7RM13sdge84jBc4A8uftBUymmqVf3HBNgUy0snL0DDdOKgMUznOuOZyiDYnU
	QlSPPdeyplpMmTxju0Pb7SodNeraYEJrCbKsxmPzu8Dp+Mc7mjxzCNg9A0m3dQ63hGTL
	6KTfkkaoC2npOvJouFQM6n8YfMx1yRgDN/ocdHmpUeLf/uVvEN+Wl/ecvR559h/XydqE
	Kpz4cin9PbF95f/8+IPjWauVBgkt+uThdHz4AGUtiKF5owoYknqwLt5griEhhhalEDEX
	S/Yg==
X-Received: by 10.43.62.204 with SMTP id xb12mr4733993icb.51.1399400761475;
	Tue, 06 May 2014 11:26:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.74.228 with HTTP; Tue, 6 May 2014 11:25:31 -0700 (PDT)
In-Reply-To: <20140506103329.GD12987@gmail.com>
References: <1399289179-5662-1-git-send-email-koen.kooi@linaro.org>
	<A4B8EEBF-A117-4A52-B23E-FB09372AC3DF@dominion.thruhere.net>
	<3786353.G8dUuZuNuH@peggleto-mobl5.ger.corp.intel.com>
	<3296908.lWzdU1Kadh@peggleto-mobl5.ger.corp.intel.com>
	<20140506103329.GD12987@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 May 2014 11:25:31 -0700
Message-ID: <CAMKF1srXCeedrKMS78WvgXO9PAMJe1sWXAywPSsgp1Tya7q7pA@mail.gmail.com>
To: Paul Barker <paul@paulbarker.me.uk>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>, Koen Kooi <koen.kooi@linaro.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] libarchive: add missing e2fsprogs dependency
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
X-List-Received-Date: Tue, 06 May 2014 18:26:03 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, May 6, 2014 at 3:33 AM, Paul Barker <paul@paulbarker.me.uk> wrote:
> On Tue, May 06, 2014 at 10:18:41AM +0100, Paul Eggleton wrote:
>> On Tuesday 06 May 2014 10:17:03 Paul Eggleton wrote:
>> > On Tuesday 06 May 2014 07:52:23 Koen Kooi wrote:
>> > > Op 5 mei 2014, om 23:54 heeft Saul Wold <sgw@linux.intel.com> het volgende
>> >
>> > geschreven:
>> > > > On 05/05/2014 04:26 AM, Koen Kooi wrote:
>> > > >> This fixes the following build error:
>> > > >>        | libarchive/archive_entry.c:59:55: fatal error: ext2fs/ext2_fs.h: No
>> > > >>        | such file or directory>>
>> > > >>
>> > > >> There is no configure options to avoid this dependency.
>> > > >>
>> > > >> Signed-off-by: Koen Kooi <koen.kooi@linaro.org>
>> > > >> ---
>> > > >>
>> > > >>  meta/recipes-extended/libarchive/libarchive_3.1.2.bb | 2 ++
>> > > >>  1 file changed, 2 insertions(+)
>> > > >>
>> > > >> diff --git a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
>> > > >> b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb index
>> > > >> eedbaa7..277d8c8 100644
>> > > >> --- a/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
>> > > >> +++ b/meta/recipes-extended/libarchive/libarchive_3.1.2.bb
>> > > >> @@ -5,6 +5,8 @@ SECTION = "devel"
>> > > >>
>> > > >>  LICENSE = "BSD"
>> > > >>  LIC_FILES_CHKSUM =
>> > > >>  "file://COPYING;md5=b4e3ffd607d6686c6cb2f63394370841"
>> > > >>
>> > > >> +DEPENDS = "e2fsprogs"
>> > > >> +
>> > > >
>> > > > By doing this we also have to extend e2fprogs to be a nativesdk target.
>> > > >
>> > > > Is there not a way to make this optional by editing the configure.ac and
>> > > > adding a switch?  What functionality to we gain or loose with / without
>> > > > the ext2fs extensions?
>> > >
>> > > I really have no idea, I just had the above buildfailure yesterday.
>> >
>> > FYI this is a bug I was meant to be fixing in the 1.6 cycle (I noticed the
>> > error in one of my builds a few months ago). Simply adding e2fsprogs to
>> > DEPENDS adds time to the build, plus when I submitted a patch to do this I
>> > found that nativesdk-e2fsprogs doesn't actually build at the moment and
>> > since it's actually only the header it wants, I had in mind to just use the
>> > header from e2fsprogs-native. I haven't got around to testing the latter
>> > solution though.
>> >
>> > Anyway, I've now done what I should have done earlier and filed a bug:
>>
>> Oops, sent too early - bug link:
>>
>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=6268
>>
>> Cheers,
>> Paul
>>
>
> I just had a quick look at this as I've done a bit of work with libarchive. It
> looks like as long as the header isn't found at configure time there's no
> problem at compile time. Could we work around this by modifying config.h in a
> do_configure_append() function to undefine the relevant symbol
> (HAVE_EXT2FS_EXT2_FS_H)?

It can be disabled in many ways and easiest is to cache the autconf
variable and set it to 'no'
but we loose The EXT2 ioctls that are used on Linux to get/set file
flags since our build systems
are mostly linux I would think this is a good thing to enable in libarchive.

