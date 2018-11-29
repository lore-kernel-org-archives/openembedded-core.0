Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 4881C6D661
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 14:04:46 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wATE4Emq019240
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 29 Nov 2018 14:04:15 GMT
Message-ID: <335a4290d941021b84a2b0447e2017774d0e5259.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Mikko Rapeli <mikko.rapeli@bmw.de>,
	openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 14:04:14 +0000
In-Reply-To: <1543494097-19534-2-git-send-email-mikko.rapeli@bmw.de>
References: <1543494097-19534-1-git-send-email-mikko.rapeli@bmw.de>
	<1543494097-19534-2-git-send-email-mikko.rapeli@bmw.de>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Cc: Michael.Ho@bmw.de
Subject: Re: [PATCH 1/5] RFC image_types.bbclass: add image size limit for tar image type
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
X-List-Received-Date: Thu, 29 Nov 2018 14:04:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-29 at 14:21 +0200, Mikko Rapeli wrote:
> If IMAGE_ROOTFS_SIZE_LIMIT is defined in image configuration, then
> build will fail if for tar image type the uncompressed tar ball size
> exceeds the value, as reported by 'du -ks'.
> 
> This check could be extended to other image types as well.
> 
> There already exists a check with IMAGE_ROOTFS_SIZE variable
> but I could not figure out how to actually use it. It does
> some quite complex overhead calculations which did not seem
> to work for me on sumo.
> 
> When the image size is exceeded, build fails like this:
> 
> ERROR: image-1.0-r0 do_image_tar: Image size 170712 of
> /home/builder/src/base/build/tmp/work/linux/image/1.0-r0/deploy-
> image-complete/image.rootfs.tar reported by 'du -ks' is larger than
> limit IMAGE_ROOTFS_SIZE_LIMIT 170000

What about IMAGE_ROOTFS_MAXSIZE?

I think IMAGE_ROOTFS_SIZE is about adding extra space to the image, not
limiting its size...

Cheers,

Richard


