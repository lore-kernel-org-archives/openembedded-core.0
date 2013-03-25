Received: from mail-la0-f53.google.com ([209.85.215.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKARz-0005Hx-SA
	for openembedded-core@lists.openembedded.org;
	Mon, 25 Mar 2013 17:40:50 +0100
Received: by mail-la0-f53.google.com with SMTP id fr10so11635862lab.40
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Mar 2013 09:23:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=bWqvOlKnW778hae/zywCjo8IE4TEqBVGMgwKiITb0AI=;
	b=NTBfObPaewWwYLEenHDV0k2AfkRfN8ZzoC8+EE4ydLLzn+XxLuTlfbS86e0WlFXdqM
	xn62thechiJaHr3KHR1n5XwV4Q0PzyIPcAqUYAafEGGeqfV+epYYM/o8w7r5wrGpGS/7
	EkQ3+kmTlBhzo/iXdFpA6BQn6xUvLZPZ8frESHfYFafIUlO9LSRtReFMQmhTiSBrH9tb
	g6lMMebDzQooSd6oNKDKR0dY4uWDnmG2Pu9HZp+2aWFYqwhks+kUy/Zy+MkdmhXbhXcL
	fq+gtNzcGOmUfyuR1MQwLLjK+u0IrfwN1k08uSDzkTSAIeEsBVwVd5qaONR/6MU3pW3D
	fTBQ==
X-Received: by 10.112.5.6 with SMTP id o6mr6329155lbo.57.1364228626219; Mon,
	25 Mar 2013 09:23:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.81.231 with HTTP; Mon, 25 Mar 2013 09:23:26 -0700 (PDT)
In-Reply-To: <C39A6084-A254-4AE2-A9DD-49B88EDCB164@dominion.thruhere.net>
References: <1364216841-32600-1-git-send-email-cristian.iorga@intel.com>
	<C39A6084-A254-4AE2-A9DD-49B88EDCB164@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 25 Mar 2013 16:23:26 +0000
Message-ID: <CAJTo0Lb9e4j-O2R5_wvkH=2APWYMZDnFw0pxj_YheeHZfUBdig@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQknHhKKs86GQrJnE3clwrofFEZyDXrCFqKHgcidfD2G2qcCaUdhVPmS1PuDMFkqbXmmkA6H
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V3 0/2] BlueZ 5.3 new package
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
X-List-Received-Date: Mon, 25 Mar 2013 16:40:53 -0000
Content-Type: text/plain; charset=UTF-8

On 25 March 2013 16:09, Koen Kooi <koen@dominion.thruhere.net> wrote:
> So you say it's not an upgrade path, but...
>
>> - bluez5 conflicts with/replaces bluez4.
>
> ...  here you add RREPLACES. Why is that?

The logic was that if a *distro* does the upgrade from bluez4 to
bluez5, the package manager needs to be able to remove bluez4 when
installing bluez5, as otherwise they'd just conflict and the package
manager would error out.

Ross


