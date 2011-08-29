Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jkridner@beagleboard.org>) id 1Qy946-00034z-0h
	for openembedded-core@lists.openembedded.org;
	Mon, 29 Aug 2011 23:08:18 +0200
Received: by gwb11 with SMTP id 11so4769523gwb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 14:03:25 -0700 (PDT)
Received: by 10.236.72.233 with SMTP id t69mr27983301yhd.55.1314651803779;
	Mon, 29 Aug 2011 14:03:23 -0700 (PDT)
Received: from mail-yw0-f47.google.com (mail-yw0-f47.google.com
	[209.85.213.47])
	by mx.google.com with ESMTPS id j45sm120027yhe.36.2011.08.29.14.03.21
	(version=SSLv3 cipher=OTHER); Mon, 29 Aug 2011 14:03:22 -0700 (PDT)
Received: by ywa12 with SMTP id 12so4692018ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Aug 2011 14:03:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.151.86.2 with SMTP id o2mr3302989ybl.107.1314651801471; Mon,
	29 Aug 2011 14:03:21 -0700 (PDT)
Received: by 10.150.177.4 with HTTP; Mon, 29 Aug 2011 14:03:21 -0700 (PDT)
In-Reply-To: <A7D15A83-D3C5-4F64-90AA-6A77225BB6E5@dominion.thruhere.net>
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
	<D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
	<CAD=GYpZi8dObBiWTAw9OpH1BmHuUZgT67jOMV6saQNcyfmW+Tg@mail.gmail.com>
	<A7D15A83-D3C5-4F64-90AA-6A77225BB6E5@dominion.thruhere.net>
Date: Mon, 29 Aug 2011 17:03:21 -0400
Message-ID: <CA+T6QPmfs0-_k+io3rviuTqxS9-qTT7q0y_=k6JNagB93TGG6Q@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Graeme Gregory <dp@xora.org.uk>, Jason Kridner <jdk@ti.com>,
	"k-kooi@ti.com" <k-kooi@ti.com>
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
X-List-Received-Date: Mon, 29 Aug 2011 21:08:18 -0000
Content-Type: text/plain; charset=ISO-8859-1

>>>
>>> This script is BSP specific and shouldn't live in the OE-core layer.
>>
>> The only issue is this script is used from within the IMAGE_CMD_sdimg
>> code which lives in OE-core (meta/classes/image_types.
>
> classes shouldn't be calling external scripts
>

Is the right approach to add parameters to the IMAGE_CMD_sdimg class
such that it can be used generically to produce SD card images,
instead of trying to move this to meta-ti?  Should it perhaps be a bit
closer to what is being done by the Linaro image tools [1]?

[1] https://wiki.linaro.org/Source/ImageBuilding


