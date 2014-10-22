Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f181.google.com (mail-wi0-f181.google.com
	[209.85.212.181])
	by mail.openembedded.org (Postfix) with ESMTP id AC6CD65C88
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 08:42:12 +0000 (UTC)
Received: by mail-wi0-f181.google.com with SMTP id n3so186054wiv.8
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Oct 2014 01:42:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:content-type:mime-version:subject:from
	:in-reply-to:date:cc:content-transfer-encoding:message-id:references
	:to; bh=uN+esbDOvbS7So8+j+32jN5K2nXH95cGLPYKa9gdxdY=;
	b=bZLyECMA2w3fE25DG+DzxgFcwFspSt3UqPjkaS/RrW5cl/qRYatAKj3gsn9T5j09So
	4qbm/f0wQIItViLwI5ltWwecWH1vqITWGxt4s+UmHrjUDAgkOSwLNxblb70C/rJhMKgt
	6+V01uvAxVSm5rbG/p4nOHTCPcWhPnhhUsgMn/Tr7U971HM6o1RU0ZoOm+kNl5jhUZk0
	HFCwM9gMP7z+k36fT+UE+1J2Mhe3gPY3AGWq1OVKXgGv0aVHNWsReUtXnOwUKdQOz5Lg
	CaerXMrMqbwkS/ItvbubMKXTEPBH5qSzz/seI4mTMkyfAuqvhtQCeDTW6sFlcAT1aVmq
	afQA==
X-Gm-Message-State: ALoCoQm7IYlWUExb/VWmq4sZ7fecCGg+xItlwqg1EzVTNehHIT2M5zpwePJ4P1p/tDE73h+NivRb
X-Received: by 10.194.185.167 with SMTP id fd7mr28312195wjc.108.1413967332329; 
	Wed, 22 Oct 2014 01:42:12 -0700 (PDT)
Received: from [172.20.0.187] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPSA id ws5sm964829wjb.9.2014.10.22.01.42.10
	for <multiple recipients>
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 22 Oct 2014 01:42:11 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 8.0 \(1990.1\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <201410220128.44782.marex@denx.de>
Date: Wed, 22 Oct 2014 10:42:09 +0200
Message-Id: <DBEF9196-DDEF-4862-87CD-24DA0577C08F@dominion.thruhere.net>
References: <1413746147-7120-1-git-send-email-marex@denx.de>
	<1413746147-7120-5-git-send-email-marex@denx.de>
	<84924DE0-BBAC-45C0-B0B3-66A3EB6841CC@dominion.thruhere.net>
	<201410220128.44782.marex@denx.de>
To: Marek Vasut <marex@denx.de>
X-Mailer: Apple Mail (2.1990.1)
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/7] kernel: Pull uImage generation into separate class
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
X-List-Received-Date: Wed, 22 Oct 2014 08:42:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


> Op 22 okt. 2014, om 01:28 heeft Marek Vasut <marex@denx.de> het =
volgende geschreven:
>=20
> On Monday, October 20, 2014 at 12:26:04 PM, Koen Kooi wrote:
>>> Op 19 okt. 2014, om 21:15 heeft Marek Vasut <marex@denx.de> het =
volgende
>>> geschreven:
>>>=20
>>> Pull the uImage image format generation from kernel.bbclass into
>>> a separate kernel-uimage.bbclass. The recipes which now need to
>>> generate an uImage will have to inherit kernel-uimage instead of
>>> kernel class.
>>=20
>> To keep backward compatibility, could you rework this into something =
like:
>>=20
>> kernel.bbclass:
>> 	inherit kernel-${KERNEL_IMAGETYPE}
>>=20
>> kernel-${KERNEL_IMAGETYPE}:
>> 	inherit kernel-base
>> 	imagetype stuff
>>=20
>> kernel-base:
>> 	old kernel.bbclass stuff
>>=20
>> That would keep existing BSPs working *and* split out the image =
types.
>=20
> Yes, this makes sense. Are there any traps inside kernel.bbclass I =
should
> be careful about? Like for example ${PN} or other possible variables =
which
> are set based on the name of the file?

You should be safe, PN is supposed to be completely ignored since the =
output packages will all be 'kernel-<foo>' instead of =
'linux-myfirstbsp-<foo>'

regards,

Koen=

