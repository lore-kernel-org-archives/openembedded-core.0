Received: from mail-vc0-f180.google.com ([209.85.220.180])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Uanxj-0006Zt-UJ
	for openembedded-core@lists.openembedded.org;
	Fri, 10 May 2013 16:06:23 +0200
Received: by mail-vc0-f180.google.com with SMTP id hv10so3640443vcb.39
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 May 2013 06:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=jrn9hnRHbjvtedje2pn2YSBXjPKLPFkZ5s+nZ3ZqJVI=;
	b=JgKG49cwVabeXw0L2ur9EslGZKwieP32thc1izXHlQfAvPntjnSVaIeQOfk+JJfth+
	ifiG3/B4U0rpky1K7fmYwTnyaWZtaR3ZBZG+mgM0KxLAL5Wd/OjX6ecCDnnq8m6uUBiH
	p7yeqCMqkJt3ICJTtUkb3Fr61FgR+k1AqrBlTdVm0UkjqKx+iETng8XP0L7IRzA+ZmPn
	pLVaeiJNNijbJYzXCRUoYz/KbSu8u74hS9YA2xkwvB3jtsJAfWpsJSn3KPcQ2iQeFUfQ
	CHHn+TXjzUNX2gkkUB1RFYQMZvAt6sHogZInLXdsn6PhutWZfvJu/pmx5eX590pCPftD
	lo2g==
X-Received: by 10.58.90.66 with SMTP id bu2mr11158309veb.29.1368193694022;
	Fri, 10 May 2013 06:48:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Fri, 10 May 2013 06:47:53 -0700 (PDT)
In-Reply-To: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
References: <1368189198-1294-1-git-send-email-jukka.rissanen@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 10 May 2013 14:47:53 +0100
Message-ID: <CAJTo0Lac6pFLNcnq3DgyZ4WbevXGjaZVnOJU-M103EVBmD7psg@mail.gmail.com>
To: Jukka Rissanen <jukka.rissanen@linux.intel.com>
X-Gm-Message-State: ALoCoQkegP+3BCscQgooMKrqXzriqBkBKya/Yr8jEtQD/p6QMo4WI76hnuj7G3Q+iBCGb5mXguq0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] Enable VPN support in ConnMan
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
X-List-Received-Date: Fri, 10 May 2013 14:06:24 -0000
Content-Type: text/plain; charset=UTF-8

Hi Jukka,

On 10 May 2013 13:33, Jukka Rissanen <jukka.rissanen@linux.intel.com> wrote:
> this patchset enables OpenVPN, vpnc, L2TP and PPTP VPN
> technogies in ConnMan and fixes this bug
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4456

I've chatted with Jukka online already, but I'll put this on the list
for clarity.

The VPN plugins are missing runtime-dependencies on the relevant VPN
clients.  As they're split out already the dependency can be
per-plugin.

It's potentially nicer to not have built-time dependencies on the VPN
clients, but just specify the paths to the client binaries directly.

I'm not convinced there's a need for a "vpn" DISTRO_FEATURE as it
seems quite specific to connman.  Adding the packageconfig options but
not using them in the default value should be fine, and then distros
that want to enable the VPN options can do so using, erm
PACKAGECONFIG_pn-connman_append = " openvpn" (something like that,
anyway).

Ross


