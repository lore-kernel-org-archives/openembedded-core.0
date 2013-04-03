Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UNS4N-0002VI-MA
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 20:05:59 +0200
Received: by mail-vc0-f175.google.com with SMTP id hf12so1662522vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 10:48:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=RmFrt91wKvUTnlrmKf7fdLXKzzaxGRCtIFTCQEOn/yY=;
	b=kzJ1ShHkpgX6Pz6NTaBAyZEl5ZL8kf3w1qBzkv0F6UMtoa8O9OWqa/UkT0L92Wtxuz
	V/ZyYBUldY0PMGJXbBop8BZcRNEgHAZUxyzJ0x96FIB+HlL1MpkFRmYouiejMlv77Uyz
	E06zozaytsSRcWeHerP0or2HOwEO+k3hhq5Qk11dpWTRm2ydsz87QBRCodyIO9vVcOIQ
	n8hS8B1+lSckaHdGblEWn6eMEzewEC6SrVmrz1b8JSJhAh8AhM8Bz3ulsG2LgBdbWrpM
	Vp44JASC7YnSz6tQTeYxGz77fudyUI9YL/Qgd760PelJ4dU0oMQUblzJoxyElSXhnddG
	uHWA==
X-Received: by 10.220.39.69 with SMTP id f5mr2080221vce.45.1365011327872; Wed,
	03 Apr 2013 10:48:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.134.74 with HTTP; Wed, 3 Apr 2013 10:48:26 -0700 (PDT)
In-Reply-To: <1365011250-24355-1-git-send-email-mark.hatle@windriver.com>
References: <1365011250-24355-1-git-send-email-mark.hatle@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Apr 2013 18:48:26 +0100
Message-ID: <CAJTo0LZ5a4oa7k-Mz7VbgAHaP8wvacV8vNBX_vDByvDUfeCVWw@mail.gmail.com>
To: Mark Hatle <mark.hatle@windriver.com>
X-Gm-Message-State: ALoCoQk/V7ki2JvheN0NFc7ExLDZXFq/c+KlFs0c9ztXYMZefq2NSR+sBLv4QxBWyrJ5uEnXfovF
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Enable additional kernel parameters for syslinux
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Apr 2013 18:05:59 -0000
Content-Type: text/plain; charset=UTF-8

On 3 April 2013 18:47, Mark Hatle <mark.hatle@windriver.com> wrote:
> Add additional parameter 'SYSLINUX_KERNEL_ARGS' in order to allow
> for specific kernel parameters to be set when using syslinux.

Why would you use this and not APPEND? (or am I totally
misunderstanding something?)

Ross


