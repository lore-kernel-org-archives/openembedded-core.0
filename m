Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <agnel.joel@gmail.com>) id 1QyB1N-0005N0-N0
	for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 01:13:37 +0200
Received: by ewy5 with SMTP id 5so2620036ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 16:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=szGNN8io9b70mT5s4raCVZvJNe+hf8j2UdqtQ3Kn7Q8=;
	b=PJGAc8iU23hfAFTUcLiPdjy2sfBkdv6mPvqCWajwTlDATcG1ZMsMY9GsxGpw19rDLe
	hhRcqnROMkNdv+KoOwLEL6dZdN8aqUm/QUKLZCPSAaUrG6JQn1VD1x/HJzQQbsk5xdA1
	q2boQHzOBahYVNJS06fVpB8n3t86Kb5yP6EEI=
MIME-Version: 1.0
Received: by 10.213.101.20 with SMTP id a20mr20202ebo.118.1314659325113; Mon,
	29 Aug 2011 16:08:45 -0700 (PDT)
Received: by 10.213.10.201 with HTTP; Mon, 29 Aug 2011 16:08:45 -0700 (PDT)
In-Reply-To: <CA+T6QPmfs0-_k+io3rviuTqxS9-qTT7q0y_=k6JNagB93TGG6Q@mail.gmail.com>
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
	<D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
	<CAD=GYpZi8dObBiWTAw9OpH1BmHuUZgT67jOMV6saQNcyfmW+Tg@mail.gmail.com>
	<A7D15A83-D3C5-4F64-90AA-6A77225BB6E5@dominion.thruhere.net>
	<CA+T6QPmfs0-_k+io3rviuTqxS9-qTT7q0y_=k6JNagB93TGG6Q@mail.gmail.com>
Date: Mon, 29 Aug 2011 18:08:45 -0500
Message-ID: <CAD=GYpaL73siZqSoSChCG2rbXSy7nBsJ6LmujxxmqhqubiFCWQ@mail.gmail.com>
From: Joel A Fernandes <agnel.joel@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: "Kridner, Jason" <jdk@ti.com>
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
X-List-Received-Date: Mon, 29 Aug 2011 23:13:37 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 29, 2011 at 4:03 PM, Jason Kridner <jkridner@beagleboard.org> w=
rote:
>>>>
>>>> This script is BSP specific and shouldn't live in the OE-core layer.
>>>
>>> The only issue is this script is used from within the IMAGE_CMD_sdimg
>>> code which lives in OE-core (meta/classes/image_types.
>>
>> classes shouldn't be calling external scripts
>>
>
> Is the right approach to add parameters to the IMAGE_CMD_sdimg class
> such that it can be used generically to produce SD card images,
> instead of trying to move this to meta-ti? =A0Should it perhaps be a bit
> closer to what is being done by the Linaro image tools [1]?
>
> [1] https://wiki.linaro.org/Source/ImageBuilding
>

Don't the Linaro scripts need to run on the target? Does it fit well
with OE(-core) ?

I took lot of pain to write it for OE and its almost done, so suggest
we use my method atleast for a few days ;-)

Thanks
Joel


