Received: from mail-vc0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URlbG-0001HE-Pc
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 17:45:49 +0200
Received: by mail-vc0-f175.google.com with SMTP id ib11so3953430vcb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 08:28:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=8cievFYXl94wh9NlweSyi4nF9yiDqZdX3Ut72ggyn+0=;
	b=btGGs3FYh7cIQUDyFZJxJw7wxgqBZ9iUth8swWFwb+ukbK3XP2wNRqFukiujwSltcF
	8YMV8+VO+5cOPdvjDBUvPwthPuQ476lMKogIxjgLJIJFAR5oMhBOg7GZ5adNxQjHFMSl
	bCzWKdIRmJojrCbDF4codgDPLOF89A71jFDhhVt1ZtvQRQuVDI85ztEu9iKpOQFHk/fO
	pm3OyI/Xiq5/h+XNYTcnC/ZxUltP9OCdbfju4PZeGuVuWHiNq0s1HviBc5cA/xDVKSpR
	DL/mackGypvZShCAWd44a7ndc+3c8eSKibD+YTGDCKcOq2BV8eaHn/Lynlwp1LUwWHgS
	4XsQ==
X-Received: by 10.52.23.115 with SMTP id l19mr14128050vdf.55.1366039697551;
	Mon, 15 Apr 2013 08:28:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 08:27:57 -0700 (PDT)
In-Reply-To: <66033B10-A10A-4660-85F5-D06E1B9C21D7@dominion.thruhere.net>
References: <1366020744-2958-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0Lbcv-GkQs-PWoW3mtJWzfp_WuNbwU=A1NVd9R7-=uF0tQ@mail.gmail.com>
	<66033B10-A10A-4660-85F5-D06E1B9C21D7@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 16:27:57 +0100
Message-ID: <CAJTo0LZWt2W2w5FvOcPsh5OnrGWcnFCR2mjzYDWCkq8K7etJ6g@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl4XhrzxwNkdX+bJOQVZ0pEj0BbT8oz/kySYxvUD6okCyOUnIzJQDvOwDjTIB9GdYDCf50u
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] udev: remove udev-extraconf from RRECOMMENDS
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
X-List-Received-Date: Mon, 15 Apr 2013 15:45:51 -0000
Content-Type: text/plain; charset=UTF-8

On 15 April 2013 16:21, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> What udev updates are you referring to here?  The udev in oe-core has
>> RRECOMMENDED on udev-extraconf since 2008
>> (fc128ab1e4fec27d44cebfa690a9bc233eda0caf) and I don't see a udev
>> override in meta-systemd.
>
> The udev in meta-oe, I never used the udev in oe-core, it was very outdated and had all the weird dependencies like extraconf.

Presumably that's been moved to Angstrom as I can't see a udev at all
in meta-oe now.

Ross


