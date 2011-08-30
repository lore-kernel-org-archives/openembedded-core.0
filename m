Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <richard.purdie@linuxfoundation.org>)
	id 1QyKkn-0005q2-GG for openembedded-core@lists.openembedded.org;
	Tue, 30 Aug 2011 11:37:09 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7U9WGgd017714;
	Tue, 30 Aug 2011 10:32:16 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 15446-06; Tue, 30 Aug 2011 10:32:12 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id p7U9W8cs017708
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Tue, 30 Aug 2011 10:32:09 +0100
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
In-Reply-To: <CA+T6QPmfs0-_k+io3rviuTqxS9-qTT7q0y_=k6JNagB93TGG6Q@mail.gmail.com>
References: <1314598341-2793-1-git-send-email-joelagnel@ti.com>
	<D6747D39-5AE0-4982-BE54-828DFF4AF761@dominion.thruhere.net>
	<CAD=GYpZi8dObBiWTAw9OpH1BmHuUZgT67jOMV6saQNcyfmW+Tg@mail.gmail.com>
	<A7D15A83-D3C5-4F64-90AA-6A77225BB6E5@dominion.thruhere.net>
	<CA+T6QPmfs0-_k+io3rviuTqxS9-qTT7q0y_=k6JNagB93TGG6Q@mail.gmail.com>
Date: Tue, 30 Aug 2011 10:31:58 +0100
Message-ID: <1314696718.5939.305.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Tue, 30 Aug 2011 09:37:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2011-08-29 at 17:03 -0400, Jason Kridner wrote:
> >>>
> >>> This script is BSP specific and shouldn't live in the OE-core layer.
> >>
> >> The only issue is this script is used from within the IMAGE_CMD_sdimg
> >> code which lives in OE-core (meta/classes/image_types.
> >
> > classes shouldn't be calling external scripts
> >
> 
> Is the right approach to add parameters to the IMAGE_CMD_sdimg class
> such that it can be used generically to produce SD card images,
> instead of trying to move this to meta-ti?  Should it perhaps be a bit
> closer to what is being done by the Linaro image tools [1]?
> 
> [1] https://wiki.linaro.org/Source/ImageBuilding

I have heard multiple requests for making general SD card (or USB stick)
style images so I would love to see something generic. The script as it
stands looks like it has some issues due to requiring root access
(and/or special mounts).

There was a previous attempt at this in OE-Core:

http://git.yoctoproject.org/cgit.cgi/poky/tree/meta/classes/boot-directdisk.bbclass

but this has some issues making assumptions about sector size that
caused problems. On the  plus side it demonstrated it was possible
without root...

Cheers,

Richard



