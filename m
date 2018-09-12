Return-Path: <armccurdy@gmail.com>
Received: from mail-vk1-f195.google.com (mail-vk1-f195.google.com
	[209.85.221.195])
	by mail.openembedded.org (Postfix) with ESMTP id EAF0379785
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 22:01:59 +0000 (UTC)
Received: by mail-vk1-f195.google.com with SMTP id m125-v6so375918vka.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2018 15:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6cwUfEqkMFSq1qw1FyNuJwP78Tl3eR4UuQZNG/yG4Ng=;
	b=cVR0uuHMG3u2RHcIJyZfifKu73KpZy/qqcMP16uSfbfTkInwrPZ5iPodgbYTjR1PA2
	j3hssvBOtnhDfRy1qOna1bVNzyx9VNvVXgruN70u6tZ/TKoLabKOAeDbN2YHcJP95awV
	QShCV1Ot6FbHNawHrgtk8hG95Z7CL/RJBDj3oMQmcpWzbw0novwTapv9V5uJ7rziFKTJ
	i4V+iuO71FOM/g2PYiy9EytR1peDafZ5Rb4+vuO+CMAtQBrcwgd6aOKK4DyrbEON+AMO
	5qW69gByfciv+9fmbYT4t++d4pO3dfrwaSfot6TCHfMYogqS7ds3m7VNCGQjkPpt3V8P
	enww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6cwUfEqkMFSq1qw1FyNuJwP78Tl3eR4UuQZNG/yG4Ng=;
	b=ExJFnzZx4HKJtZp+HPGf1z2gvjQ6cBdcsHC9NMviHsyjsDsPIjDNza2aCj1HHWpF5q
	n56Y3o2hUCQRUgfthCvDJwnj24ZlCgOsWEEE4oiDSbZk9r6WKYaaTURJD7HZLncUZlHd
	a4gwiI4IXGG1Gzwi9f+pEieIPgSe15/GUje4vuHVheR+VzfozO2gK+N9uy5/0tPddLT2
	Xl9eTNdIpvnMCMMNllWw4SToB1Q+kK/JcjFM5+ThzUqU97ZIXzph+Kky4LoCPItjhnvQ
	CZ24caVcPqMjaZ7yox4DBodX53FxOSFZJZCkYhyMRqkogZjyZW6Hq1DntvzvQ8joSwLW
	n8mQ==
X-Gm-Message-State: APzg51ATvrklcdjlZ9GTjgDDukSmQBqrWHvK9k70pwy4bmWSpEWJsTqp
	lUaMzna2dtyFm61afr0w0x4d0YLPIATO1bty0Uc=
X-Google-Smtp-Source: ANB0VdaagBZEARu3JMbr6kognI/7LRJSPbtT1XdG+wO6lfqpoEFwwPSuHsulzVq1gkCUBMP10DyLfm6o9bMyuATFq4Y=
X-Received: by 2002:a1f:96cd:: with SMTP id
	y196-v6mr732454vkd.77.1536789720717; 
	Wed, 12 Sep 2018 15:02:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:2904:0:0:0:0:0 with HTTP; Wed, 12 Sep 2018 15:02:00
	-0700 (PDT)
In-Reply-To: <CAJTo0LZHmq9s2LfqMyDOv1hii=tG3SEUofMxm6nUNCWTj13FEA@mail.gmail.com>
References: <al431y00B0lLAyC01l43Xu@charter.net>
	<CAJTo0LZHmq9s2LfqMyDOv1hii=tG3SEUofMxm6nUNCWTj13FEA@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Wed, 12 Sep 2018 15:02:00 -0700
Message-ID: <CAJ86T=WpZQ8ib2gnJHbuDSyBUwHjBYgpsjHNGU4BvSfYkKuNzg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, joseph-reynolds@charter.net
Subject: Re: [PATCH] disable medium-strength dropbear ssh ciphers
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
X-List-Received-Date: Wed, 12 Sep 2018 22:02:00 -0000
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 12, 2018 at 2:51 PM, Burton, Ross <ross.burton@intel.com> wrote:
> Yes, I'm aware that dropbear looks for that, but it won't be looking
> in the recipe folder. If you added it in SRC_URI then it would be in
> WORKDIR which is almost the right place, but not quite.
>
> Patching default_options does seem like the best idea moving forwards though.

Getting the changes upstream would be the preferred option.

If we want to carry an OE specific change to the defaults which
upstream won't accept then it should probably be under the control of
a PACKAGECONFIG option in the recipe - which implies somehow making
the options controllable via a configure or compile time option rather
than a hardcoded patch.

> Ross
>
> On 12 September 2018 at 22:04,  <joseph-reynolds@charter.net> wrote:
>>>From: "Burton, Ross"
>>>To: joseph-reynolds@charter.net
>>>Cc: "openembedded-core@lists.openembedded.org"
>>>Sent: Wednesday September 12 2018 7:20:27AM
>>>Subject: Re: [OE-core] [PATCH] disable medium-strength dropbear ssh ciphers
>>>
>>>Presumably this doesn't actually work as you're just adding a file to
>>>git without actually referring to it anywhere.
>>>
>>
>> Thanks for your email.  I am still trying to get the Dropbear patch
>> upstreamed.  (This is my first patch, so I am a bit of an open source noob.)
>>
>> To address your concern: Dropbear version 2018.76 and later build process
>> specifically looks for the localoptions.h file as the way to customize
>> dropbear.  (Note the  2017.75 and earlier versions use a different mechanism
>> to customize.)  See the Makefile.in file for details.
>>
>> However, now I am wondering if patching Dropbear's default_options.h file
>> would be a better way to make this change.  Adding a localoption.h file is
>> the way to customize dropbear.  But I want to change the *default* behavior
>> of dropbear so that it uses the same encryption ciphers as OpenSSH.  I think
>> patching default_options.h would be better way to accomplish that goal.  And
>> that patch could be applied to the Dropbear project itself.
>>
>>>Ross
>>>
>>>On 7 September 2018 at 20:16, <joseph-reynolds@charter.net> wrote:
>>> This changes the Dropbear SSH server configuration so it will not
>>> accept medium-strength encryption ciphers including: CBC mode, MD5,
>>> 96-bit MAC, and triple DES.
>>>
>>> Upstream-Status: Pending
>>>
>>> Signed-off-by: Joseph Reynolds <joseph-reynolds@charter.net>
>>> ---
>>> meta/recipes-core/dropbear/dropbear/localoptions.h | 8 ++++++++
>>> 1 file changed, 8 insertions(+)
>>> create mode 100644 meta/recipes-core/dropbear/dropbear/localoptions.h
>>>
>>> diff --git a/meta/recipes-core/dropbear/dropbear/localoptions.h
>>> b/meta/recipes-core/dropbear/dropbear/localoptions.h
>>> new file mode 100644
>>> index 0000000..ec48c26
>>> --- /dev/null
>>> +++ b/meta/recipes-core/dropbear/dropbear/localoptions.h
>>> @@ -0,0 +1,8 @@
>>> +/* Customize dropbear per default_options.h in the dropbear project */
>>> +
>>> +/* Disable insecure ciphers */
>>> +#define DROPBEAR_TWOFISH256 0
>>> +#define DROPBEAR_TWOFISH128 0
>>> +#define DROPBEAR_ENABLE_CBC_MODE 0
>>> +#define DROPBEAR_SHA1_HMAC 0
>>> +#define DROPBEAR_SHA1_96_HMAC 0
>>> --
>>> 2.7.2
>>>
>>>
>>>
>>> --
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>>
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>> /> >
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

