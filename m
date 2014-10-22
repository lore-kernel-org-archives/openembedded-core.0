Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f179.google.com (mail-qc0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id 8B451601A0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 10:07:41 +0000 (UTC)
Received: by mail-qc0-f179.google.com with SMTP id x3so2372705qcv.38
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 03:07:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=gUwfi69v3NSyd5/AUpbMOhO9muSPVuO/zsfwKQjRLho=;
	b=XqOlFObSe/APhaIajX6jJ6r7NiMY8xnj624wAzO93S1C35OSGPrGNTGc31o7IoJ+aI
	DRaRV1idVOnxYTbfvrOE7K5B1A9g9EUn+KXAy7tqOqiD5lTjCHt2IZRTyYtAQmTP9LtL
	ayqmdILjea3iV3IClbL/+7D/pfqGs8yMZY8oAXUHCBsh0esU+b0l+sfp4JbhlgfIUivj
	l1LWa1A6exJcFSrqdBGOi4epqvV9zcd++Nd/m+Ud2Sb0BsIDz0hXx1UJZeM+5inKtl1v
	cUrHa0Fmd3RyG4JprEZdwzdtEMwSZ9J5AW2eje4/sXKbWGfnOUikpqVJEi/nEWBE8wLz
	npWg==
X-Gm-Message-State: ALoCoQmRxWBaI8mvwARX6vjx4FFaKMMDJUaVicYTwjQnS15NJSF99hrcgzbEWnY+my4WSSb6/x/7
X-Received: by 10.224.79.79 with SMTP id o15mr5709483qak.93.1413972462651;
	Wed, 22 Oct 2014 03:07:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Wed, 22 Oct 2014 03:07:21 -0700 (PDT)
In-Reply-To: <0ba9a1e61c64e450ed02ea699e01a5f5e292f98b.1413960370.git.Chong.Lu@windriver.com>
References: <cover.1413960370.git.Chong.Lu@windriver.com>
	<0ba9a1e61c64e450ed02ea699e01a5f5e292f98b.1413960370.git.Chong.Lu@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Oct 2014 11:07:21 +0100
Message-ID: <CAJTo0LZKKpiceby03E=fD6yqpxY4RTBXYKiCfqLgRj6CU4deiw@mail.gmail.com>
To: Chong Lu <Chong.Lu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V3 1/1] gconf: fix multilib conflict - org.gnome.GConf.service
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
X-List-Received-Date: Wed, 22 Oct 2014 10:07:44 -0000
Content-Type: text/plain; charset=UTF-8

On 22 October 2014 08:09, Chong Lu <Chong.Lu@windriver.com> wrote:
> The gconfd-2 will be called in org.gnome.GConf.service file and the path of
> gconfd-2 is ${libexecdir}, this will get following error when multilib exported
> in the sdk:
> error: file /usr/share/dbus-1/services/org.gnome.GConf.service from install
> of gconf-3.2.6-r0.0.lib32_x86 conflicts with file from package
> gconf-3.2.6-r0.0.x86_64

I'm clearly not understanding how our multilib implementation works,
but you don't need many copies of the main gconf package, just one in
the preferred configuration. What is causing multiple copies of gconf
to be installed?

Ross

