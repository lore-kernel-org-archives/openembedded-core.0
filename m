Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SuLQY-0004uR-4S
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 12:36:18 +0200
Received: by weyr6 with SMTP id r6so1097884wey.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 03:24:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=PaHoC+hAFN8Bp1NczM7UmCq+yi251u3ayT6zK+nM6Vo=;
	b=dBBvLf3bE3zL7cDrfJx1AlrqRJECgQQnesMnNF2UdDfwKoVRflnHmyKxxPo2Xi8eUM
	Zv+ndAj6ymMH+v11uZ65GWvaAaJWvh6puywjWo5Qseg01fYzNYAtq2igl4dTIGpoutU7
	g1thk7zlOyEeMmYfzVGGEaTAnmKRgYBTbkuG54Aq4RyEjRSb5UQl6TF/b096bTwPQQdy
	phh+CjQg7FqKQ9X5f0e+XH6MMi8xbzj3e5RUjvm3Gk09ja4R9FF7i/d5+okXJjBOChVo
	Nzva/xvv+8LbTexEidaGkS8xbcGp96tYkO1lu2+eUKjITlq0gGfUr+b5FxNF7D/7/QJe
	P6xg==
Received: by 10.216.138.229 with SMTP id a79mr9946983wej.197.1343298287735;
	Thu, 26 Jul 2012 03:24:47 -0700 (PDT)
Received: from [172.20.0.6] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id fb20sm11535111wid.1.2012.07.26.03.24.45
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 03:24:46 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1343297075-29312-1-git-send-email-paul.eggleton@linux.intel.com>
Date: Thu, 26 Jul 2012 12:24:44 +0200
Message-Id: <98409DD0-BDE3-4F7D-B766-7B7B3E29F6AB@dominion.thruhere.net>
References: <1343297075-29312-1-git-send-email-paul.eggleton@linux.intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQlcmWZZkMmK1bLVpki9AOvsEFmo1wPuLwOFgW8cbpUgejERtCOQ6zU1WOCtHqtjO+Rxgq5a
Subject: Re: [PATCH] usbutils: avoid dependency on bash
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 26 Jul 2012 10:36:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 26 jul. 2012, om 12:04 heeft Paul Eggleton het volgende geschreven:

> By virtue of having #!/bin/bash, the usb-devices script declared that it
> requires bash, however manual examinasion, checkbashisms and tests with
> dash and busybox show that it doesn't contain any bashisms, so change
> the script's header and remove the RDEPENDS on bash.

Is the update-usbids ash/dash safe as well nowadays?


