Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1Qzy9g-0000jv-91
	for openembedded-core@lists.openembedded.org;
	Sat, 03 Sep 2011 23:53:36 +0200
Received: by gwb11 with SMTP id 11so2132602gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Sep 2011 14:48:37 -0700 (PDT)
Received: by 10.236.161.33 with SMTP id v21mr12034564yhk.82.1315086516016;
	Sat, 03 Sep 2011 14:48:36 -0700 (PDT)
Received: from mail-yw0-f47.google.com (mail-yw0-f47.google.com
	[209.85.213.47])
	by mx.google.com with ESMTPS id z24sm2442124yhj.5.2011.09.03.14.48.34
	(version=SSLv3 cipher=OTHER); Sat, 03 Sep 2011 14:48:34 -0700 (PDT)
Received: by ywa12 with SMTP id 12so2592231ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Sat, 03 Sep 2011 14:48:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.150.104.17 with SMTP id b17mr1911961ybc.392.1315086514175;
	Sat, 03 Sep 2011 14:48:34 -0700 (PDT)
Received: by 10.151.112.21 with HTTP; Sat, 3 Sep 2011 14:48:34 -0700 (PDT)
In-Reply-To: <CAD=GYpbw-uGKNTBMkRG50XFfe1WLE904iYOEctVr0Qy51M2gsA@mail.gmail.com>
References: <1314388460-9781-1-git-send-email-joelagnel@ti.com>
	<927b350f86974e67949bd78aaa0adc5d@DFLE70.ent.ti.com>
	<CAD=GYpbw-uGKNTBMkRG50XFfe1WLE904iYOEctVr0Qy51M2gsA@mail.gmail.com>
Date: Sat, 3 Sep 2011 17:48:34 -0400
Message-ID: <CA+T6QP=ciYRnAHzm=8m0Om4SgE0iuUmtED43uLmnBNqqVJqoMA@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
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
X-List-Received-Date: Sat, 03 Sep 2011 21:53:36 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Aug 27, 2011 at 5:17 PM, Joel A Fernandes <agnel.joel@gmail.com> wrote:
> Hi Koen,
>
> Thanks for your feedback.
>
> On Sat, Aug 27, 2011 at 2:05 AM, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> Op 26 aug. 2011, om 21:54 heeft Joel A Fernandes het volgende geschreven:
>>
>>> Here's an initial version of the SDCard image build functionality. Its not a direct copy paste from Narcissus
>>
>> Be careful when doing that, narcissus is GPLv2, OE-core is MIT
>>
>>> , I had to replace paths and am copying files from IMAGE_ROOTFS instead of how Narcissus untars into a mount point.
>>>
>>> Not build tested.
>>>
>>> @Koen and all, here are some questions:
>>> 1. Where in openembedded-core do we store the "img.gz" template files so that they are available to image.bbclass?
>>
>> We don't, we can generate is everytime now that we aren't running as www-data
>>
>
> I didn't follow What has running as www-data or any regular user go to
> do with generating img.gz?

Narcissus ran as www-data.  It was necessary to run Narcissus as an
unprivileged account, since it is a web service.

>
> So what you're suggesting is we run dd and fdisk to create an sdcard
> image template everytime we bitbake an image?
>
> thanks!
> Joel
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


