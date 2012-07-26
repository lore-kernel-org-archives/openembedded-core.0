Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SuLi1-0005DV-EK
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 12:54:21 +0200
Received: by wibhq4 with SMTP id hq4so5458458wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 03:42:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=8fikyVe6BLeY4rgc71H0MxNsAPiHnJb2WvlhwpL9wJo=;
	b=ictMO6IS0E7KORki6fjQPi1CVBNnn6rx8A03zr7KqGeYOpZ4rvaBHAu11xAySOqFS2
	JEhfNvrw53F2VnUUTscg7pC9QQdX1SZ6XzA3iOOPNoQU9URBVAG8OtIrIQL1b+racuhm
	YNzDVllS9kaTVxAzAtkyyv625jOqj3daBxuCcqP3xGwCqB7EgqDB3XdTEhT9q8N2IVhj
	mKqkgHwQCBsf6TKklrP7uUn+Lvrc8nGZy2+YxIOlPznYX3NmlLJNuwDesAWTvRKxXznh
	YGUMTazzxvBfJOZwj4/v84DCzqB79cRzETiX2iTF098wH3YFFlMC51t8sXume8uhfpB1
	pMTg==
Received: by 10.180.87.199 with SMTP id ba7mr12399281wib.10.1343299370913;
	Thu, 26 Jul 2012 03:42:50 -0700 (PDT)
Received: from [172.20.0.6] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id fb20sm11635844wid.1.2012.07.26.03.42.48
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 26 Jul 2012 03:42:49 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1348620.0mAYnT0NtN@helios>
Date: Thu, 26 Jul 2012 12:42:47 +0200
Message-Id: <AC7B240E-2E23-4103-AE46-DF04C92CCFA9@dominion.thruhere.net>
References: <1343297075-29312-1-git-send-email-paul.eggleton@linux.intel.com>
	<98409DD0-BDE3-4F7D-B766-7B7B3E29F6AB@dominion.thruhere.net>
	<1348620.0mAYnT0NtN@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQk8SclzDmWZJORF2Ek13dbYhQcLs1v3AMrPq1z9GRlqJgjkht0FSFf8m1sdPmhe7pa/BuJx
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
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
X-List-Received-Date: Thu, 26 Jul 2012 10:54:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jul. 2012, om 12:38 heeft Paul Eggleton het volgende geschreven:

> On Thursday 26 July 2012 12:24:44 Koen Kooi wrote:
>> Op 26 jul. 2012, om 12:04 heeft Paul Eggleton het volgende =
geschreven:
>>> By virtue of having #!/bin/bash, the usb-devices script declared =
that it
>>> requires bash, however manual examinasion, checkbashisms and tests =
with
>>> dash and busybox show that it doesn't contain any bashisms, so =
change
>>> the script's header and remove the RDEPENDS on bash.
>>=20
>> Is the update-usbids ash/dash safe as well nowadays?
>=20
> Manual examination shows no bashisms, checkbashisms reports nothing, =
and it=20
> works fine with ash here.

Awesome! Thanks for checking!=


