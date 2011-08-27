Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QxQL0-0005rl-AY
	for openembedded-core@lists.openembedded.org;
	Sat, 27 Aug 2011 23:22:46 +0200
Received: by ewy5 with SMTP id 5so1997156ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Aug 2011 14:17:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=DlYDmvCweskKkOGtlA95hnd/jH2rMZd4S7UQExemApk=;
	b=m9NYZPev6cJzdfW0zBu4BUIo2JK0F0q61sOfOD1CMw0zkQxPOToErMtHfU6zZpD/3C
	X7jKTinfbjis1LmhDHbX6mo4pavOCVEB0mIEjkxTDKhhaO5A/JEXX7wA+Jtw01d5AWAG
	B36Np+25tn8NmaywcEx841DdytINBX0llKOCk=
MIME-Version: 1.0
Received: by 10.213.26.17 with SMTP id b17mr908425ebc.2.1314479876078; Sat, 27
	Aug 2011 14:17:56 -0700 (PDT)
Received: by 10.213.106.8 with HTTP; Sat, 27 Aug 2011 14:17:56 -0700 (PDT)
In-Reply-To: <927b350f86974e67949bd78aaa0adc5d@DFLE70.ent.ti.com>
References: <1314388460-9781-1-git-send-email-joelagnel@ti.com>
	<927b350f86974e67949bd78aaa0adc5d@DFLE70.ent.ti.com>
Date: Sat, 27 Aug 2011 16:17:56 -0500
Message-ID: <CAD=GYpbw-uGKNTBMkRG50XFfe1WLE904iYOEctVr0Qy51M2gsA@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] IMAGE_CMD_sdimg first cut
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 27 Aug 2011 21:22:47 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Koen,

Thanks for your feedback.

On Sat, Aug 27, 2011 at 2:05 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Op 26 aug. 2011, om 21:54 heeft Joel A Fernandes het volgende geschreven:
>
>> Here's an initial version of the SDCard image build functionality. Its not a direct copy paste from Narcissus
>
> Be careful when doing that, narcissus is GPLv2, OE-core is MIT
>
>> , I had to replace paths and am copying files from IMAGE_ROOTFS instead of how Narcissus untars into a mount point.
>>
>> Not build tested.
>>
>> @Koen and all, here are some questions:
>> 1. Where in openembedded-core do we store the "img.gz" template files so that they are available to image.bbclass?
>
> We don't, we can generate is everytime now that we aren't running as www-data
>

I didn't follow What has running as www-data or any regular user go to
do with generating img.gz?

So what you're suggesting is we run dd and fdisk to create an sdcard
image template everytime we bitbake an image?

thanks!
Joel


