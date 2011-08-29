Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1Qy3Yy-0003vX-4Q
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 17:15:48 +0200
Received: by ewy5 with SMTP id 5so2430186ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 08:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=jH9okUtI8cJMIJ9Jz24VaIjWSFksBHsEuA3VHMHOke8=;
	b=XimZ2l3qFbe2ASlnQp3211ZguVyoLoBoWqnsp9VRCyUg0FoK2phOVscNk7ExUNvoQL
	PHHMT6t4PegOfOg2kjoq7+7hJVB2HNrAwSp+WMdMoit3mcorlAajTn5JgDl1g113MvrE
	uqk43AfA5JSwtCQCtswodzsquBRZcP7Mhnmaw=
MIME-Version: 1.0
Received: by 10.213.28.139 with SMTP id m11mr2550540ebc.80.1314630652813; Mon,
	29 Aug 2011 08:10:52 -0700 (PDT)
Received: by 10.213.16.202 with HTTP; Mon, 29 Aug 2011 08:10:52 -0700 (PDT)
In-Reply-To: <D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
	<D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
Date: Mon, 29 Aug 2011 10:10:52 -0500
Message-ID: <CAD=GYpZi8dObBiWTAw9OpH1BmHuUZgT67jOMV6saQNcyfmW+Tg@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Graeme Gregory <dp@xora.org.uk>, Jason Kridner <jdk@ti.com>, k-kooi@ti.com
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
X-List-Received-Date: Mon, 29 Aug 2011 15:15:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 29, 2011 at 2:58 AM, Koen Kooi <koen@dominion.thruhere.net> wro=
te:
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
>> .../mkcard/mkcard-0.5/COPYING.patch =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =A0=
344 ++++++++++++++++++++
>> meta/recipes-devtools/mkcard/mkcard-0.5/mkcard.txt | =A0 79 +++++
>> meta/recipes-devtools/mkcard/mkcard_0.5.bb =A0 =A0 =A0 =A0 | =A0 19 +
>> 3 files changed, 442 insertions(+), 0 deletions(-)
>> create mode 100644 meta/recipes-devtools/mkcard/mkcard-0.5/COPYING.patch
>> create mode 100755 meta/recipes-devtools/mkcard/mkcard-0.5/mkcard.txt
>> create mode 100644 meta/recipes-devtools/mkcard/mkcard_0.5.bb
>
> This script is BSP specific and shouldn't live in the OE-core layer.

The only issue is this script is used from within the IMAGE_CMD_sdimg
code which lives in OE-core (meta/classes/image_types.bbclass)

thanks
Joel


