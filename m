Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S9zry-0000Sn-3n
	for openembedded-core@lists.openembedded.org;
	Tue, 20 Mar 2012 15:17:02 +0100
Received: by wera1 with SMTP id a1so67216wer.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Mar 2012 07:08:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=Iw2vlBL+aEsPB3SO/7ftTyMxsvVXiKDMN90CF8rZ9Zc=;
	b=oSZIRr4OnFc/gKoeikz0g/PYQAJwPLRTW2i+SHS+uDe4IpbH74MK+zWh34H+mkI7U7
	jDrwDEDqQNdu/AelOoqpxCk10Unt3z7TbgqIxvvht6DTgdRt/ZLjDOzShPVEFvYj0b88
	1z+2PQD+N/ggtaYTSr1vw5RRUqRb0PcHm5TAIDqrck6376VcgUDvd3BlfbVhgx27WCaw
	8AAMuGOymtHHS5P3EiH/1b1JHryCZZfC8agKE4d+mJgLDUPBAuANNELgwLAiZEjo7j4W
	kcgAk/KQBuFv9Vhr9Mg6RGtiM5XiKn6cEDnwsK4gegvCrhT2vV4tgoV3ZNSbRhXL7XUw
	haww==
Received: by 10.216.135.66 with SMTP id t44mr35391wei.8.1332252489344;
	Tue, 20 Mar 2012 07:08:09 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235]) by mx.google.com with ESMTPS id
	bx13sm20827033wib.10.2012.03.20.07.08.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 20 Mar 2012 07:08:08 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <16657624.ejDoFzWrx1@helios>
Date: Tue, 20 Mar 2012 15:08:06 +0100
Message-Id: <62B0DB76-9ABF-4959-A54B-CFBDB1E96716@dominion.thruhere.net>
References: <1332250734-14660-1-git-send-email-koen@dominion.thruhere.net>
	<16657624.ejDoFzWrx1@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkw46Vbik39KcWGeNI8guzawEZzJEwgxH2kKA5SrVssQV8TIkQ9CZJSJOKr8/23pNP/FCuR
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [RFC v2][PATCH 1/3] buildhistory: record all builds
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
X-List-Received-Date: Tue, 20 Mar 2012 14:17:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 20 mrt. 2012, om 14:51 heeft Paul Eggleton het volgende geschreven:

> On Tuesday 20 March 2012 14:38:52 Koen Kooi wrote:
>> Allow empty commits, this also give a nice speedup since 'git status
>> --porcelain' doesn't need to get run.
>=20
> I guess my thinking before (without any verification) was that git =
commit would=20
> need to be running the equivalent of 'git status --porcelain' anyway

It does

> and the=20
> second time it would be cached so there wouldn't be much impact.

On my non-SSD machine the cache doesn't seem to be working out :(

> If the=20
> buildhistory repo is quite large or the machine is busy then it's =
entirely=20
> possible that wouldn't work out however.

Exactly!

regards,

Koen=


