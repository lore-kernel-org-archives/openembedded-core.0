Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Qy21l-0001iS-7f
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 15:37:25 +0200
Received: by pzk2 with SMTP id 2so11712349pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 06:32:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=25EK3suFoedkkv4ZTGEYDQzAC0fY5S+2u5VArIeQq4Y=;
	b=It4DzPZ+GlcluA7iMc7WzfAahsi+Hz4hDYVtVz2E1f16CwCcOwqXf0W7xQXXhdygNt
	QI4UJJXGYmYvbGnCM+x1du6U6LrAzDl9vCgfPJlp+0AzjzvMiI0LqavzDkAjTi7B47BL
	6DsrkGAHwPfBfPTGboroi9XRQpanA/RV5IcjM=
MIME-Version: 1.0
Received: by 10.142.231.20 with SMTP id d20mr2512844wfh.265.1314624752219;
	Mon, 29 Aug 2011 06:32:32 -0700 (PDT)
Received: by 10.142.136.21 with HTTP; Mon, 29 Aug 2011 06:32:32 -0700 (PDT)
In-Reply-To: <D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
	<D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
Date: Mon, 29 Aug 2011 15:32:32 +0200
Message-ID: <CAAQYJAtauhnv+RnUgjRzGay7AAB-FCC9qgRGj5k26dDVmYLaNA@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC oe-core] mkcard: Add a script to parition and format an SD Card
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
X-List-Received-Date: Mon, 29 Aug 2011 13:37:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

I was exactly wondering about the necessity of such
script...formatting an SD is not rocket science.
If it is handy for  beagleboard then put it in its BSP.
Andrea

2011/8/29, Koen Kooi <koen@dominion.thruhere.net>:
>
> Op 29 aug. 2011, om 08:12 heeft Joel A Fernandes het volgende geschreven:
>
>> Script written by Graeme Gregory
>> http://www.angstrom-distribution.org/demo/beagleboard/mkcard.txt
>>
>> Signed-off-by: Joel A Fernandes <joelagnel@ti.com>
>> Cc: Graeme Gregory <dp@xora.org.uk>
>> Cc: Jason Kridner <jdk@ti.com>
>> Cc: k-kooi@ti.com
>> ---
>> .../mkcard/mkcard-0.5/COPYING.patch                |  344
>> ++++++++++++++++++++
>> meta/recipes-devtools/mkcard/mkcard-0.5/mkcard.txt |   79 +++++
>> meta/recipes-devtools/mkcard/mkcard_0.5.bb         |   19 +
>> 3 files changed, 442 insertions(+), 0 deletions(-)
>> create mode 100644 meta/recipes-devtools/mkcard/mkcard-0.5/COPYING.patch
>> create mode 100755 meta/recipes-devtools/mkcard/mkcard-0.5/mkcard.txt
>> create mode 100644 meta/recipes-devtools/mkcard/mkcard_0.5.bb
>
> This script is BSP specific and shouldn't live in the OE-core layer.
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>

-- 
Inviato dal mio dispositivo mobile


