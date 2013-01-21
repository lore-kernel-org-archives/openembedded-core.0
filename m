Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxGRC-0005OK-1W
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 13:25:30 +0100
Received: from mail-yh0-f72.google.com ([209.85.213.72])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 04:09:47 -0800
Received: by mail-yh0-f72.google.com with SMTP id z12so1686448yhz.11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 04:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=WJBzPU9/GuxWenAjODJjlDBng38FyqWpZTwoQ+T7uNk=;
	b=ewQuVQ9YdSrslBfaiD8cnOhZ0v1EY23w9NaVA9TiUDfHFG9Q2BN/tqWOx2H7UvVXws
	00FQ0xtpESBFidlTFoJaNUzgknazeuDDoogRM5LYea9ZVrNROSeZkdEMW56PfutNy9c7
	jBf/LazNAN8sovhzgRoYiQz2YDq5Ey5vNusI78VCwBb3WqZIzMisqjk7fj7tzdh4Dqlh
	V6FiwKvVI53xSAtnR/Qug10Q6p48yTZcQF0O/mhnRyEL3Amb2riHWYHGkpOcpyVB9tA0
	ek2d2iG2IR0QYEvYZBXDmSoY+onEj2JhXvifVpnvOzSweb7KDYQ7ehjmQiA/7HelA2yr
	gxVg==
X-Received: by 10.52.72.137 with SMTP id d9mr2939686vdv.105.1358770186919;
	Mon, 21 Jan 2013 04:09:46 -0800 (PST)
X-Received: by 10.52.72.137 with SMTP id d9mr2939679vdv.105.1358770186840;
	Mon, 21 Jan 2013 04:09:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Mon, 21 Jan 2013 04:09:26 -0800 (PST)
In-Reply-To: <1358763296.14265.43.camel@ted>
References: <cover.1358635193.git.ross.burton@intel.com>
	<50FC3899.5000202@linux.intel.com>
	<50FCBCB7.8060201@linux.intel.com>
	<CAJTo0LYU0-1EEZfE8LdTDSmGmgprHbmZ-g00O-8+Qv1MmcaQTg@mail.gmail.com>
	<20130121091942.5a6c5a82@e6520eb> <1358763296.14265.43.camel@ted>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Jan 2013 12:09:26 +0000
Message-ID: <CAJTo0LYwjTnjvj6XCdn4eeC8PCLB7ZDYLFrbJ7Cvhf3i3s9=xw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQlNHz11hv7ABs5FMtK05Y/CTI/3UEUiv+GOh7jwaL+Q5CaJV39eYvgRwtTdZP7MsmExrBQEE2sULEt2VJC33RjSt3SLd+QvsG2DTiprL8SU+q/9YFrOQnnRsHytyPrXBy5ONmflCzjBgnbBSdBpaRwlTMGj4BnY5tCK15meyC8nEydKVd0Aqorlm2qhRvdpZOv4kip9
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Initial systemd integration
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
X-List-Received-Date: Mon, 21 Jan 2013 12:25:32 -0000
Content-Type: text/plain; charset=UTF-8

On 21 January 2013 10:14, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> This isn't enough to prevent warnings for "bitbake world". We need to
> detect which is enabled and then SkipPackage in the one that isn't
> needed, or at least exclude it from the world build.

Patches sent so udev and systemd skip if the other is going to be built.

Ross


