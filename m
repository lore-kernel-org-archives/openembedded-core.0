Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pa0-f45.google.com (mail-pa0-f45.google.com
	[209.85.220.45])
	by mail.openembedded.org (Postfix) with ESMTP id 7F8706AD0D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 21:41:09 +0000 (UTC)
Received: by pabvl15 with SMTP id vl15so46726123pab.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Jun 2015 14:41:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=BdURp6AjPi/Tz+G+L2K6ZrhKOtU6tfGej8PqaNMEJog=;
	b=UXk/Bni8l7Vnt06xpOJrrV+XYIuYLLJ70y0Jn+ccfixxZT8f3nVaoYa8/4U7JM336v
	BilpIkfLVYgVsC+9V2H4kBWHG4ceQRB6tK+IChXuj1lgzYV/BxY/qmE7OJ0Ss2d6dpL2
	YVRjgsd03lVIRPDF85IxKXggFTMWVXzwkJczQvs6blItR5V631DzEePHbDunxlV2bslp
	gMfCbr/FjkFIYJpJXWyVQVEX8gXrN8efJJJESy1DzbfxPxm26UZLD/ajAmqPUHOz/cSf
	bbs6DnHyAkootdXlGBEtET6Pwk48CiiFsO0NZfmEOQbzdPaWDgoyHVhKP/vVv+tRai3a
	bNjQ==
MIME-Version: 1.0
X-Received: by 10.70.126.200 with SMTP id na8mr10547561pdb.167.1434750070450; 
	Fri, 19 Jun 2015 14:41:10 -0700 (PDT)
Received: by 10.70.44.41 with HTTP; Fri, 19 Jun 2015 14:41:10 -0700 (PDT)
In-Reply-To: <CALbNGRRJjqzrfeJAY0ximXfCa0HpLxYB-2d51vfJDDvOgnfpkg@mail.gmail.com>
References: <1434547172-24620-1-git-send-email-alexander.kanavin@linux.intel.com>
	<1434547172-24620-6-git-send-email-alexander.kanavin@linux.intel.com>
	<CAHiDW_EwLwe52-VXnJTctjMS5+4pevuOE1CZwHuEbc_xRQ=4Zw@mail.gmail.com>
	<5582AA4A.9000202@linux.intel.com>
	<CALbNGRQ5C5cMEPZEyYe03dJfMdAkyH-WiaWjoZCH77Y-DJ+f4A@mail.gmail.com>
	<5582C4B8.4010408@linux.intel.com>
	<CALbNGRRJjqzrfeJAY0ximXfCa0HpLxYB-2d51vfJDDvOgnfpkg@mail.gmail.com>
Date: Fri, 19 Jun 2015 23:41:10 +0200
Message-ID: <CALbNGRTj_Z-UqkrAXVCXqpKUgpYX+mewKFe6kgdeV0+XY60-Og@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 05/22] Update libnotify to version 0.7.6
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
X-List-Received-Date: Fri, 19 Jun 2015 21:41:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2015 at 4:42 PM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Thu, Jun 18, 2015 at 3:16 PM, Alexander Kanavin
> <alexander.kanavin@linux.intel.com> wrote:
>> On 06/18/2015 03:35 PM, Andreas M=C3=BCller wrote:
>>
>>> I think gtk3 is not the problem here it is the API change libnotify
>>> 0.6 -> 0.7 which cannot (or only by ugly hacks) be installed parallel.
>>> Do we know what happens to meta-gnome/meta-xfce?
>>
>>
>> The packages in meta-gnome that fail because of new libnotify are all fi=
ve
>> year old, unmaintained 2.32.something versions.
>>
>> Let's just accept that meta-gnome needs to get a massive update to 3.x,
>> those who don't like gnome 3.x need to seek alternative desktops and mov=
e
>> on.
>>
> Cool: you send patches having no idea what efforts are caused and give
> helping hints as 'let's move on'. From my experience guys like you
> will not give any support in 'moving on' as the only scope is academic
> 'core-image-sato' building green for quemux86.
>
> Over and out
>
Hi Alexander,

Emotional part: I am sorry for my last email's style and I hope this
does not cause lack of motivation on your side. This was definitely
not an email that should have gone out this way.

Technical part: Although your patches break things I think _now_ that
they point in the right direction. The old gnome stuff turns into a
maintenance burden with every new tool/library introduced. As Martin
pointed out: I have tried to update libnotify two years ago and
stopped due to huge fallout.
Now we expect same but the situation is different: We have stable
releases of better quality than two years ago. If still interested in
gnome 2 style user experience and not accepting gnome 3 one could work
with releases (or implement/use alternatives Mate/Xfce..).
One note regarding gnome 3: I played around with gnome 3 long time ago
but stopped messing around with gobject-introspection which looked
mandatory for some packages. I think if we want to migrate meta-gnome
to gnome 3 we should think of migrating meta-gir to meta-gnome.

Andreas

