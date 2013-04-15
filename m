Received: from mail-vc0-f182.google.com ([209.85.220.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1URlQa-0000Dt-CC
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 17:34:47 +0200
Received: by mail-vc0-f182.google.com with SMTP id ht10so4012652vcb.13
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 08:17:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=TujhbLPwu7JK+p61QQiiWrR+gjlXvlfVlskKXAI7C84=;
	b=oA/MqFfGVWu8MdkUs8IF/Zf9kVVtBAEfmv7uWG3x9WN3NKj0yPPGALuvn+4hnV93vX
	lW6KHrH72NILlAo5uyH7lk6cXP4od0rKcWxb4EWxuFVBAlypQUixCFVhspnHUvC/u04U
	xBgae5ZgcWfPSfdIVmwcjoFt1UMDebhihk3KLKsN87M/8/dO/uLjv94SbA8EessnhYp6
	XOtibiUVqZr0aAMEPKi4VK/2AHCR0AWFgEi0+ynYVi5BaMz2UJxlStc80irBdPDJpqW3
	Bsu+l8WeHVlTfISLpYaLFSPZjwZsAmjj4MxxEgVTIFYKfkHow3cOIwUq2PzG7WYrmclm
	jKHw==
X-Received: by 10.220.153.2 with SMTP id i2mr16207052vcw.53.1366039035098;
	Mon, 15 Apr 2013 08:17:15 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Mon, 15 Apr 2013 08:16:54 -0700 (PDT)
In-Reply-To: <1366020744-2958-1-git-send-email-koen@dominion.thruhere.net>
References: <1366020744-2958-1-git-send-email-koen@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 15 Apr 2013 16:16:54 +0100
Message-ID: <CAJTo0Lbcv-GkQs-PWoW3mtJWzfp_WuNbwU=A1NVd9R7-=uF0tQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQn7H/9UcjK1AyGvVvAtp3gdB8C0oiJIIV1AIIWrIaSOo04lonxN34I3Ofw1yGtfGdn1Yjbn
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
X-List-Received-Date: Mon, 15 Apr 2013 15:35:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Koen,

On 15 April 2013 11:12, Koen Kooi <koen@dominion.thruhere.net> wrote:
> In the original udev and systemd updates these extra conf rules and scrip=
ts where removed and moved to a different recipe to avoid pulling them in b=
y default, making them opt-in. The systemd merge into oe-core regressed thi=
s into making it impossible to opt out of it when using package feeds for u=
pgrades.

What udev updates are you referring to here?  The udev in oe-core has
RRECOMMENDED on udev-extraconf since 2008
(fc128ab1e4fec27d44cebfa690a9bc233eda0caf) and I don't see a udev
override in meta-systemd.

Dropping udev-extraconf from udev is rather invasive for a post-freeze
change considering how much it will effect.

Ross


