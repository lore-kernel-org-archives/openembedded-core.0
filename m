Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tlfdb-0003j5-77
	for openembedded-core@lists.openembedded.org;
	Thu, 20 Dec 2012 13:54:13 +0100
Received: from mail-ye0-f198.google.com ([209.85.213.198])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 20 Dec 2012 04:39:24 -0800
Received: by mail-ye0-f198.google.com with SMTP id l11so4822570yen.5
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2012 04:39:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=DeZLDFiMg6NOGEumJ8BAjWVVNfO/pBzG2BG0Q++MZdU=;
	b=TQ4Y+8v9EsU29RICkx6jl67yg9dzJ/oYYD+Kyyp9n75xsAJU6WBpm9QsDahcLrOZGu
	OGoH4WzDl78G/bHdQMgaFmUY29fZzw1R1DJcu1ZSJnkwnN/cbYAMaZjBG0BD6IJDURD1
	FZo5pMMvRt6B4senuKjka6887RthZmuVvWjiQIQg4Y8pPDRyDPxKOBrsGOEA3zr8m894
	zGNOIyF2pkh26LEiUxNpM/5OIBE1/+b84Q5clZewiXqjA6pqB4oQFMHSPGr2pV7Xi1JX
	u66yX1H346YRrzTzXkJqZhX4atRmGj5BfqYKsaQJGn5o0K614Qt53yh65PToZiC4QuyH
	nM5Q==
X-Received: by 10.221.10.6 with SMTP id oy6mr12233243vcb.65.1356007163415;
	Thu, 20 Dec 2012 04:39:23 -0800 (PST)
Received: by 10.221.10.6 with SMTP id oy6mr12233237vcb.65.1356007163344; Thu,
	20 Dec 2012 04:39:23 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Thu, 20 Dec 2012 04:39:02 -0800 (PST)
In-Reply-To: <EC7262B3-B95B-4AC6-AAF3-4EA4B7C66B3F@dominion.thruhere.net>
References: <50D1F76D.4070000@intel.com>
	<EC7262B3-B95B-4AC6-AAF3-4EA4B7C66B3F@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2012 12:39:02 +0000
Message-ID: <CAJTo0LYA9-__u-ptX+=2D61wjVEDDc=6mfdFDc_+8-9zr22s8g@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQlQeDAFzX4yRZ/x562y7eb0Ouy74Hnt/8LOy7eKuZjH4zgpppLa4epg7S75QAnQ1cXCpU27GDpBgbmcBpN8OCD4HTkSiW7OaXekZwAnXoxqcbzu6mTAbQTt8DqP8qWTaqFM0fZSCtuw7f99E2SPNbn1D8t+f+HrQoD0jp0Y+4H5j8oBBQv2ohbB6WPksdKQPbS3wE5B
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: RFC: systemd integration
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
X-List-Received-Date: Thu, 20 Dec 2012 12:54:14 -0000
Content-Type: text/plain; charset=UTF-8

On 20 December 2012 10:47, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>     You can activate systemd by  DISTRO_FEATURES_INITMAN = "systemd"
>
> What happens when I do DISTRO_FEATURES_INITMAN = "sysvinit systemd"?

As systemd is showing, the choice of init manager isn't just something
you can do at image generation time, but impacts the build.  Services
may opt to use systemd-native interfaces if systemd is available, or
streamline their daemonisation based on the support that systemd has.

This is why this series makes the choice of init a distribution
choice, and doesn't allow multiple choices.

Ross


