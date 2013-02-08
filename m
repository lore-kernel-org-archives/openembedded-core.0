Received: from mail-vb0-f50.google.com ([209.85.212.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U3n1Y-00072U-7q
	for openembedded-core@lists.openembedded.org;
	Fri, 08 Feb 2013 13:25:48 +0100
Received: by mail-vb0-f50.google.com with SMTP id ft2so2270898vbb.37
	for <openembedded-core@lists.openembedded.org>;
	Fri, 08 Feb 2013 04:09:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=N2FYDnnCNVYZlK8bFDXioFU9MDZS9GP5FPJqdgySjio=;
	b=M+86SCxDPMOX4vqYHReVCe2BDcKa0afbYJtdWoPmR1eRLDwUcVuvpJRRdUfv7Uc845
	1AHN9ZaJfGElgAV+limoVnbC8jEm+c0ULhlsVW6knrz/4Esq0OkOSuYvZxtZs5k+2qAi
	kak4CGHjq+4zxK7V2HjSygwCjXIFks1hFuE8nzq+yn6zIaS5d78uj+5XLjC6MYrD+6xm
	WjvfT889hT7u3F2PokjPCzs9KhT5n5E6df7KGHpFZAhfRvSui5YbQxRNAysWxUKJqY7Q
	wowdVOjkFbKMz7dnGdENrHIgoXmZmSL7Zfc8xmCTpECAIcuXxIeMhJvTAUEHV+clabl0
	OGag==
X-Received: by 10.52.21.175 with SMTP id w15mr5376548vde.100.1360325394170;
	Fri, 08 Feb 2013 04:09:54 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.131 with HTTP; Fri, 8 Feb 2013 04:09:33 -0800 (PST)
In-Reply-To: <932EDA66-92E1-4B0A-A9CC-7037DACE0372@dominion.thruhere.net>
References: <1360318544-11013-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0Lbd9uXC9B+VTO0SgbBSksqT+5XKiUUC62YgKadmRxqqdA@mail.gmail.com>
	<932EDA66-92E1-4B0A-A9CC-7037DACE0372@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 8 Feb 2013 12:09:33 +0000
Message-ID: <CAJTo0LbP9YAEa1qZJqjgKNwvFXz+pebwDqeXd8RRp3FV_AS2CQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQmGMi+sLsha+tBnxBrYkhN62aWSJDTxcCD9lxUd24x13dPI5BTKJTk8sJyHIU/pxbXAG9ut
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-danny][PATCH] xf86-video-modesetting: new recipe for gma500
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
X-List-Received-Date: Fri, 08 Feb 2013 12:25:48 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 8 February 2013 12:01, Koen Kooi <koen@dominion.thruhere.net> wrote:
> The GMA500 comment is very misleading, this is just a recipe for yet-anot=
her-ddx that only gets installed when you ask for it :) What the commit for=
gets to mention is that it's a ddx for any DRM based kernel display driver,=
 I need it for beagleboard, beaglebone which don't use gma500 and also for =
fri2 which does use gma500.

Indeed, it's the new fbdev. Death to fbdev!

Ross


