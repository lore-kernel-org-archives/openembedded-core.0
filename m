Return-Path: <net147@gmail.com>
Received: from mail-pd0-f182.google.com (mail-pd0-f182.google.com
	[209.85.192.182])
	by mail.openembedded.org (Postfix) with ESMTP id C5E276041D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 15:18:55 +0000 (UTC)
Received: by mail-pd0-f182.google.com with SMTP id r10so3041207pdi.27
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Jul 2013 08:18:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=JKk500F6ebGcDTUrLw/muGiofN2cWH7xDW0DUftC1sI=;
	b=VcxZeLT7Pw4oC6fwoui07njipqXUkkuoiKF1dTsn4lQUpvKG3/nC2Ho2aW8jTfN8dn
	tExcSfP20qnQ4ANza4UUDKT/ECfewnrh1i/8v1ZNwXjUSzHBB/yCnNu/jT3GJa7H+Y5R
	E8Mu6BKQADYQVce7pe0B5fmaAFIEIUsK2Vk3e45M5BWjsiHhXzvRbqptCq8dALtUEs3s
	Z7jbZym57wi9GxtSCI7a0j9KNClmThkgP108ecJxVWZbLdmF/7mtDa1O+4s9EqEWMfVK
	Sl0DBTB8szutAlKTVuOqPxGZ6qVOuvxnlc5aADl6Q9vidPMI74EDg24zLVPNfxcNMcf0
	DzZA==
X-Received: by 10.66.252.129 with SMTP id zs1mr54689685pac.113.1374851936266; 
	Fri, 26 Jul 2013 08:18:56 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	qh10sm20750807pbb.33.2013.07.26.08.18.54 for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 26 Jul 2013 08:18:55 -0700 (PDT)
Message-ID: <51F29236.70003@gmail.com>
Date: Sat, 27 Jul 2013 01:13:58 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Riku Voipio <riku.voipio@linaro.org>
References: <CAAqcGH=ouV4fgpR629AVG2+J2SVY6vbPTyD0JatyMX72oVn-pQ@mail.gmail.com>
In-Reply-To: <CAAqcGH=ouV4fgpR629AVG2+J2SVY6vbPTyD0JatyMX72oVn-pQ@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: too tight inode limits on ext4?
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
X-List-Received-Date: Fri, 26 Jul 2013 15:18:55 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 26/07/2013 11:27 PM, Riku Voipio wrote:
> So the image has plenty of space:
>
> root@genericarmv8:~# df -h
>
> Filesystem      Size  Used Avail Use% Mounted on
> /dev/root       2.3G  961M  1.2G  45% /
>
> root@genericarmv8:~#
>
> but only 48 free inodes:
>
> root@genericarmv8:~# df -i
> Filesystem     Inodes IUsed  IFree IUse% Mounted on
> /dev/root       34440 34392     48  100% /
>
> ext3 image is much more sensible:
>
> root@genericarmv8:~# df -i
> Filesystem     Inodes IUsed  IFree IUse% Mounted on
> /dev/root      293888 34392 259496   12% /
> e
>
> I understand that the E in OE is about embedded, but still only 48 free
> inodes seems a bit too steep. I would presume the amount of free inodes
> should be about the same for both ext3 and ext4.
>
> Also fiddling with EXTRA_IMAGECMD_ext4 doesn't seem to have any effect,
> so currently ext4 images are not very useful.
>
> Riku
Try Robert Yang's patches which build ext4 using mkfs.ext4 and debugfs 
rather than genext2fs: 
http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=robert/image

Regards,
Jonathan

