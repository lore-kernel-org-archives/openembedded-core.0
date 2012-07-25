Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1Su35Y-0004gD-Gh
	for openembedded-core@lists.openembedded.org;
	Wed, 25 Jul 2012 17:01:24 +0200
Received: by wgbdr1 with SMTP id dr1so749172wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 25 Jul 2012 07:49:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ytSaVHOhyuvYGV9Od9Y7u57VOV6koRc83VyDlG/tiBY=;
	b=Oo9BbVqJtP2WhYf6wpvt80C/OTpFdbyzNqa7gCnni9OOmmpxFsJ2G+f3O6J7z+pOAO
	WqqS+6bl1+L0ceMd7ygMhPKojYAQvZTvHIL8J61L63w+kVvQ7j8gdYekD+jMmkGz9zx1
	PP/DKVZN1MrofRSk0ZSBQxDkVtXfSOaffoo98AxUzfFrHbL/ixlviGuRV0U8oiTDCmtr
	/8aVo38WKIr17QWgVjQfM2lTfXb+jRR1TlM5+8JvIjK1+5sfDHlzT66PHEWtNifFdygD
	DV+DY3XU+RqB0xhy/4lObmdvMbkjM12w6kXTTVkKJDL4mB0yrGyqDkoV2pq9bfWkvtGH
	Ap0Q==
Received: by 10.180.100.37 with SMTP id ev5mr5337488wib.5.1343227795055;
	Wed, 25 Jul 2012 07:49:55 -0700 (PDT)
Received: from [172.20.3.201] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fb20sm4549249wid.1.2012.07.25.07.49.50
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 25 Jul 2012 07:49:52 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1278)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1528039.fg9dttDzQG@helios>
Date: Wed, 25 Jul 2012 16:49:46 +0200
Message-Id: <08A955C9-B5DA-4A79-A9DA-86653116D8E9@dominion.thruhere.net>
References: <1343225031-19107-1-git-send-email-radu.moisan@intel.com>
	<E1C8B862-C08F-4098-93A4-9C7E6262038B@dominion.thruhere.net>
	<CAJTo0LbFcZYhBzgO4wEhnS4Dq+msQP9pu8Biagiy3cPGUoPGkA@mail.gmail.com>
	<1528039.fg9dttDzQG@helios>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1278)
X-Gm-Message-State: ALoCoQklYDUniEsLVLyM8MbiA4LcvLE968R8cVwfp53f4yQHiB5GmlXR83kkkZJo+oqdE1NWCaLc
Subject: Re: [PATCH] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Wed, 25 Jul 2012 15:01:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 25 jul. 2012, om 16:23 heeft Paul Eggleton het volgende geschreven:

> On Wednesday 25 July 2012 15:19:10 Burton, Ross wrote:
>> On 25 July 2012 15:17, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> This breaks the upgrade path
>> 
>> So how would the upgrade path be unbroken?  A dummy dbus-x11 package
>> that pulls in dbus, I suspect.
> 
> RREPLACES_${PN} += "dbus-x11" ought to be enough...

Right, but since that's missing -> broken upgrade path


