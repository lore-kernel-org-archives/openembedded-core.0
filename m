Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f48.google.com (mail-qa0-f48.google.com
	[209.85.216.48])
	by mail.openembedded.org (Postfix) with ESMTP id 24F317135B
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 15:03:52 +0000 (UTC)
Received: by mail-qa0-f48.google.com with SMTP id m5so6248789qaj.7
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Sep 2014 08:03:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=SWNn4269xFvXf3+XUCHaz1e4uej+GKYWUuEunYblqXM=;
	b=VV4+0pfD2lfnMXVVZ3gQQNIohTG4JwMJu2eiYazbLOiUQicWQ2R8B6Rox46s6FyOJG
	mJ3g7NPFRUKPyKxG8TqKRQinFNp11L8V+TrwQwSDFgGP0CQD+sEKc0xprZWkfIVJGL3/
	KprI1/RsWQsh5PNdBG8jYtw95en2y6fsiTyG4ghSm+MYzG4YsitOdC4pDO1LecYhFDoZ
	W9RD7IWOApyde+vQvfGl1Av51H857drdCa4+16yAiXHPSrHOTGcqY9k25wJaOknev2fb
	nnBdTYZuhM827FCuGAhUAeHywxJsO/iix0scxM625EoM+3Wte+VwhW53NR+19SQGOHol
	lE+w==
X-Gm-Message-State: ALoCoQkUbRIN7MtQTHlL/YaSTklKUiDBHf39Trhb4VQX106/WpZ1Td6QscVfj1kXaAgH6eBcZYFX
X-Received: by 10.224.166.195 with SMTP id n3mr35418977qay.22.1409670233871;
	Tue, 02 Sep 2014 08:03:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Tue, 2 Sep 2014 08:03:33 -0700 (PDT)
In-Reply-To: <664768e4223b4401525d0796662f1666e2d21824.1409655125.git.Qi.Chen@windriver.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
	<664768e4223b4401525d0796662f1666e2d21824.1409655125.git.Qi.Chen@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 2 Sep 2014 16:03:33 +0100
Message-ID: <CAJTo0LahyhjUwxnEqCZkTb=B1ctGb0E+sTEvvwkTpL6U6N4iTg@mail.gmail.com>
To: Chen Qi <Qi.Chen@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 10/26] dhcp: add dhcpd.service
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
X-List-Received-Date: Tue, 02 Sep 2014 15:03:53 -0000
Content-Type: text/plain; charset=UTF-8

On 2 September 2014 11:53, Chen Qi <Qi.Chen@windriver.com> wrote:
> --- /dev/null
> +++ b/meta/recipes-connectivity/dhcp/files/dhcpd.service
> @@ -0,0 +1,11 @@
> +[Unit]
> +Description=DHCP Server Daemon
> +After=network.target
> +After=time-sync.target
> +
> +[Service]
> +EnvironmentFile=/etc/default/dhcp-server
> +ExecStart=-@SBINDIR@/dhcpd -q $INTERFACES

Hard-coded /etc, replace in $sysconfdir.

Ross

