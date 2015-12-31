Return-Path: <twoerner@gmail.com>
Received: from mail-ig0-f174.google.com (mail-ig0-f174.google.com
	[209.85.213.174])
	by mail.openembedded.org (Postfix) with ESMTP id B12CF606BF
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Dec 2015 22:07:22 +0000 (UTC)
Received: by mail-ig0-f174.google.com with SMTP id to18so185906787igc.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 31 Dec 2015 14:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=subject:to:references:cc:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-type:content-transfer-encoding;
	bh=GAMipOBTT2S+D1FWLr2aXgajwVgTeMoZzKNoAZilZjE=;
	b=LVgOS+k1ezGCP7dLokOD1aRQ/JJPcZb9YuuMh7hqPZEpGMkXh0jZq2HFlE4laulBdW
	SxMXjD6B4qy4R1HLJG7UPpdlUFL/Fl5HsexgKYU12bRG9SLG1ZNqpWq9nndUPInc5a2q
	vkIyoN4bRYNGmF86YxPzYCVCVpqhL2dbJ6kFF9RatywaplBVc2hPL06PRNa3VzdERUOe
	AZmYDUs0TqfWNIg8u9HY5Qd2Mfcb4HU9atWcJWSz/cGEXy8XzXdfQ+noVuau96Dc6j5p
	vl6LR6rzJTApkvp3eeUn/Gv6b3BU0KgjdQqNhsqjOH/Bi26RecH2T8Xs92PzuPwqn4Ee
	Ovxw==
X-Received: by 10.50.22.33 with SMTP id a1mr65044644igf.52.1451599643018;
	Thu, 31 Dec 2015 14:07:23 -0800 (PST)
Received: from [192.168.141.85] (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	n6sm7121364ige.12.2015.12.31.14.07.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 31 Dec 2015 14:07:22 -0800 (PST)
To: openembedded-core@lists.openembedded.org
References: <1448721782-30965-1-git-send-email-twoerner@gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
Message-ID: <5685A70D.3050708@gmail.com>
Date: Thu, 31 Dec 2015 17:07:09 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1448721782-30965-1-git-send-email-twoerner@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: [PATCH] mkefidisk.sh: add startup script for automated boot
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
X-List-Received-Date: Thu, 31 Dec 2015 22:07:24 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

ping?

On 11/28/15 09:43, Trevor Woerner wrote:
> Regardless of which image is built using which layers, try to ensure the image
> on the SD device being prepared is the one that is booted automatically when
> the board is powered.
>
> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
> ---
>  scripts/contrib/mkefidisk.sh | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/contrib/mkefidisk.sh b/scripts/contrib/mkefidisk.sh
> index 23c18cb..333284f 100755
> --- a/scripts/contrib/mkefidisk.sh
> +++ b/scripts/contrib/mkefidisk.sh
> @@ -438,6 +438,9 @@ if [ -d $ROOTFS_MNT/etc/udev/ ] ; then
>  	echo "$TARGET_DEVICE" >> $ROOTFS_MNT/etc/udev/mount.blacklist
>  fi
>  
> +# Add startup.nsh script for automated boot
> +echo "fs0:\EFI\BOOT\bootx64.efi" > $BOOTFS_MNT/startup.nsh
> +
>  
>  # Call cleanup to unmount devices and images and remove the TMPDIR
>  cleanup


