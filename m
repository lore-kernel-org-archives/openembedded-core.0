Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 81A74601B8
	for <openembedded-core@lists.openembedded.org>;
	Sun, 17 Jan 2016 22:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HMRVVx010648; Sun, 17 Jan 2016 22:27:31 GMT
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id xk-KNXG60vpI; Sun, 17 Jan 2016 22:27:31 +0000 (GMT)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u0HMRRQ0010645
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Sun, 17 Jan 2016 22:27:28 GMT
Message-ID: <1453069647.27999.30.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jonathan Liu <net147@gmail.com>, openembedded-core
	<openembedded-core@lists.openembedded.org>
Date: Sun, 17 Jan 2016 22:27:27 +0000
In-Reply-To: <569AF17F.4080607@gmail.com>
References: <1452121054.7598.94.camel@linuxfoundation.org>
	<569AF17F.4080607@gmail.com>
X-Mailer: Evolution 3.16.5-1ubuntu3.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] image.bbclass: Separate out image generation into a new task, do_image
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
X-List-Received-Date: Sun, 17 Jan 2016 22:27:38 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sun, 2016-01-17 at 12:42 +1100, Jonathan Liu wrote:
> I have issues building a core-image-minimal Raspberry Pi 2 SD image
> after this series of patches using openembedded-core master 
> (b3b679d5be86f73d1a06c7230cb00872f0a407b5) and meta-raspberrypi
> master 
> (0d8e9271855ccb9bc21bdc0743f8e0f6ff0d2d5c).
> 
> > DEBUG: Executing python function set_image_size
> > DEBUG: Python function set_image_size finished
> > DEBUG: Executing shell function do_image_rpi-sdimg
> > 
> /home/build/git/pi2/build/tmp/work/raspberrypi2-custom-linux
> -gnueabi/core-image-minimal/1.0-r0/temp/run.do_image_rpi-sdimg.8349: 
> line 108: do_image_rpi-sdimg: command not found
> > WARNING: 
> /home/build/git/pi2/build/tmp/work/raspberrypi2-custom-linux
> -gnueabi/core-image-minimal/1.0-r0/temp/run.do_image_rpi-sdimg.8349:1
> exit 127 from
> >   do_image_rpi-sdimg
> > ERROR: Function failed: do_image_rpi-sdimg (log file is located at 
> /home/build/git/pi2/build/tmp/work/raspberrypi2-custom-linux
> -gnueabi/core-image-minimal/1.0-r0/temp/log.do_image_rpi-sdimg.8349)
> 
> openembedded-core 38237b7ac53c416f85c4a70a61acafc3404c8b5f - ok
> openembedded-core b3b679d5be86f73d1a06c7230cb00872f0a407b5 - fails
> 
> Any ideas?

Try the patch I just sent to the OE-Core list, "Handle image types
containing '-' correctly". Looks like image types containing the "-"
character would cause problems but I think there is a workaround.

Cheers,

Richard



