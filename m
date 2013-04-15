Received: from mail-ea0-f171.google.com ([209.85.215.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URgvF-0003S0-LK
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 12:46:43 +0200
Received: by mail-ea0-f171.google.com with SMTP id b15so2166558eae.2
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 03:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=oJJJJhK64V6KqKFUmK0fDyQVXS/eK/ySEJ4JyLZq2eg=;
	b=VjBXkTtLWPUvvPwIvjZ38t/ciEbC7+1dzKqSk+sF1dhZjVAGR4oFzYm0u/l8NiP55G
	RK2Z4gyY+LknqWf79D4vItOtJBpKGJlTeKAjyx+yjsKP6gHD/7L8T+ZIRZ+22yfqtMIf
	N1nCVlMPxCuBFJIAxRVUkPqiMImLsMKJfDfBpVAaByqSX7Y9qNxu0+pDBjtVVAL7SqHV
	g2L/7Lr3bGnERVBcSnr2Alq+BRfmMferkoqfKwmxs+wj7s1ORabdsUsQc/sDytFgAq2Q
	jYdG8hwv8b9drM1Sg4q7/G52Vp/jto/F+KFR3xiGtOXeZc4t06/jKOaogEzpfVHOBj2d
	+leA==
X-Received: by 10.14.177.197 with SMTP id d45mr3903315eem.9.1366021716932;
	Mon, 15 Apr 2013 03:28:36 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id bj2sm26160157eeb.1.2013.04.15.03.28.35
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 03:28:36 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0Laqc93oxZcHZ+vF99q_UqJ_8TUV4QAxPy6VfBLDBUxOYg@mail.gmail.com>
Date: Mon, 15 Apr 2013 12:28:35 +0200
Message-Id: <0B369B55-5FAE-42F1-BA21-22A7EE21E9EB@dominion.thruhere.net>
References: <1365947306-15542-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LYxbJBVqYTCiz2BaBaoPz=pzpm5w49Ube+SpnX_ZOLh5Q@mail.gmail.com>
	<9D7AC92D-FF69-4A31-B99C-D2008675A27B@dominion.thruhere.net>
	<CAJTo0Laqc93oxZcHZ+vF99q_UqJ_8TUV4QAxPy6VfBLDBUxOYg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQmn/sb4+3LdCIoEp5n97WMvr9ELeWCF8/VEuZeDysmh+3BFP4JgC1o0F3UFW/NpkN1qwUVK
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-dylan][PATCH] systemd: fix bootup with 'ro' by re-adding util-linux-mount to RDEPENDS
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
X-List-Received-Date: Mon, 15 Apr 2013 10:46:45 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 apr. 2013, om 12:16 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 15 April 2013 11:09, Koen Kooi <koen@dominion.thruhere.net> wrote:
>>> Does busybox produce any useful errors as to why it's not working?
>>=20
>> No, it pretends everything is OK and the remount succeeded.
>=20
> Thanks busybox!
>=20
> /me sighs

The worst part: I debugged this very issue 2 years ago as well, so =
busybox mount hasn't improved much during that time.

regards,

Koen=


