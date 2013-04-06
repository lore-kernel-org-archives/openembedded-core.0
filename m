Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UOQYT-0003TF-VG
	for openembedded-core@lists.openembedded.org;
	Sat, 06 Apr 2013 12:41:08 +0200
Received: by mail-ve0-f172.google.com with SMTP id oz10so4329842veb.3
	for <openembedded-core@lists.openembedded.org>;
	Sat, 06 Apr 2013 03:23:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=/Kdb9Dnr0keVMlD3QiIwEkul/fxIsACXB+A/Izr9Vo0=;
	b=PeCm9l7X18ksXvBnfnJVFdymTTmbHb7Ei6V7KyKLUHhw8G0GJg2rnQSrCp/lxaZfBm
	eUIHbTTr5r+L8zl8jjaHeTYp8+62jnI7WgtH2SPdUFX2p4IZ6Cjb1Gt0cEVQLA1YiLse
	abM38SzdEkScV8jeowebNf7Zhz59+20svxjdj+iPSfN7pv/i3D047XeGFo+oLgtseuCD
	EqCzumjNKk/c+1dsRu0b2lBpvKp91rtDAaxLi4DVTpow1NZwhSBM1oBidaXpPZa1xaRs
	glfnCyNHk3QrU74zKHQyBoUom1aCZUH/Jco9GcSMDTeXqdUTAQJPOoXpx81P8mfvW24b
	sZbg==
MIME-Version: 1.0
X-Received: by 10.52.28.101 with SMTP id a5mr9073041vdh.92.1365243830167; Sat,
	06 Apr 2013 03:23:50 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Sat, 6 Apr 2013 03:23:50 -0700 (PDT)
In-Reply-To: <515EF3B8.5080205@windriver.com>
References: <CALbNGRSj7uahrGy1DoSe5zJasciTf2Q7j1xj5N8V-cs_WOW+4g@mail.gmail.com>
	<CALbNGRS4MTJny0yqf-oYx1S12O-ZETo4g9x+7BuRVh8pbuBW0g@mail.gmail.com>
	<515EF3B8.5080205@windriver.com>
Date: Sat, 6 Apr 2013 12:23:50 +0200
Message-ID: <CALbNGRS970hw+S18EQs35kr_0S5AJL+eJ9O9XsAY5mxMx7rgdg@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-core@lists.openembedded.org
Subject: Re: experiences with images based on current layer heads
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 06 Apr 2013 10:41:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 5, 2013 at 5:54 PM, Mark Hatle <mark.hatle@windriver.com> wrote=
:
> If you are unable to look into this yourself, can you please file a bug o=
n
> the bugzilla.yoctoproject.org website?  This issue is likely to get more
> attention if there is an active bug with reproducer steps.  (What you hav=
e
> below may be enough for someone who understands X and xfce to reproduce i=
t,
> but I'm not sure.)
>
> (I've very lightly used X under oe-core master, but I've not done anythin=
g
> more then xterms myself.)
>
> It would of course be even better if you could figure out a proper test c=
ase
> to reproduce this, but that's not required...
>
> --Mark
>
>
> On 4/4/13 5:29 PM, Andreas M=C3=BCller wrote:
>>
>> On Wed, Apr 3, 2013 at 4:02 PM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>>>
>>> Hi,
>>>
>>> when migration of systemd to oe-core turned to unbuildable I decided
>>> to freeze my images and stopped further tests. Now that many issues
>>> were fixed and we are close to another release I built my standard
>>> xfce-based image based on latest layer HEADs. With this I face some
>>> issues which I would like to share:
>>>
>>> 1. X sessions crash with OOM. This is reproducible by opening
>>> google-maps with midori and changing to satellite view. In
>>> Xorg.0.log.old I see only
>>>
>>> | (EE)
>>> | (EE) Backtrace:
>>> | (EE)
>>> | (EE) Segmentation fault at address 0x9
>>> | (EE) BUG: triggered 'if (inSignalContext)'
>>> | (EE) BUG: log.c:502 in LogVMessageVerb()
>>> | (EE) Warning: attempting to log data in a signal unsafe manner while
>>> in signal context.
>>> | Please update to check inSignalContext and/or use
>>> LogMessageVerbSigSafe() or ErrorFSigSafe().
>>> | The offending log format message is:
>>> |
>>> | Fatal server error:
>>> |
>>> | (EE)
>>> | (EE) Backtrace:
>>> | (EE)
>>>
>> seems we are not alone [1]
>>
>> [1] http://www.raspberrypi.org/phpBB3/viewtopic.php?t=3D38568&p=3D321298
>>
>> Andreas
I am not a friend of bugzillas because notification is missing as long
as I don't add a comment. Anyway I will add a description for xorg
problem.

Meanwhile I found another issue with libpng 1.6.0 - see
https://bugzilla.yoctoproject.org/show_bug.cgi?id=3D4060

Andreas


