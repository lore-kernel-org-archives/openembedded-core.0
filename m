Received: from mail-ee0-f42.google.com ([74.125.83.42])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1URhPu-0006wK-0O
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Apr 2013 13:17:47 +0200
Received: by mail-ee0-f42.google.com with SMTP id d4so2122749eek.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Apr 2013 04:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:content-type:mime-version:subject:from:in-reply-to:date
	:cc:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=EtbddmqJH8JSfyxrMx7MJVhNIHoC0iqIA570S8SMZW0=;
	b=iEzgy5t5DlZykrru9WxDOi7D3IkWC+Hedz6THH68fTjwmehOoHgVSVAdXHvzS3jylN
	ARHvk5uFfyjj8JfzMgmNQOw8SSCzhzxrpGKotZ1eDSwxHw+mEE8a4Bmt+1N6iBcIdMLL
	OVMEJmvEUmosnXBbZ4x1yRoLm/KAv4pglKP+RaHEcZSsnwttpaG5NRyw892L1VjnHear
	NSAkUHRHF/KM38mZ8z/w0/znLRgMlaO41esk5FsngPLHlinvXjj3tL3pIrAdzid3gXZ9
	ATIkk5Z620XiVzlu0ogrbr3FafJ44R1phlhi5juZHMg8Gwr6LMANNd7JeyIFQGZJ94bR
	1A6A==
X-Received: by 10.15.111.202 with SMTP id cj50mr60197541eeb.6.1366023615824;
	Mon, 15 Apr 2013 04:00:15 -0700 (PDT)
Received: from [172.20.0.100] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id n48sm12697546eeg.12.2013.04.15.04.00.13
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Mon, 15 Apr 2013 04:00:14 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.3 \(1503\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <lyppxw135p.fsf@ensc-virt.intern.sigma-chemnitz.de>
Date: Mon, 15 Apr 2013 13:00:13 +0200
Message-Id: <CF396EBE-2706-494C-8D12-40BFF875BF79@dominion.thruhere.net>
References: <1365947306-15542-1-git-send-email-koen@dominion.thruhere.net>
	<CAJTo0LYxbJBVqYTCiz2BaBaoPz=pzpm5w49Ube+SpnX_ZOLh5Q@mail.gmail.com>
	<lyppxw135p.fsf@ensc-virt.intern.sigma-chemnitz.de>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Mailer: Apple Mail (2.1503)
X-Gm-Message-State: ALoCoQlwbeFnr6a22s3yx3PTfVfnEaUEpe7BhyWJykj416hqyNPOMDJgv6f5uDEDzOUqAGzTHzgH
Cc: "Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>,
	openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Mon, 15 Apr 2013 11:17:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 apr. 2013, om 12:47 heeft Enrico Scholz =
<enrico.scholz@sigma-chemnitz.de> het volgende geschreven:

> "Burton, Ross" <ross.burton-ral2JQCrhuEAvxtiuMwx3w@public.gmane.org>
> writes:
>=20
>>> When using busybox mount the filesystem won't get remounted as 'rw'
>>> and bootup will fail.
>>>=20
>>> This fixes the regression seen after switching from 'danny' to =
'dylan'.
>>=20
>> I was going to say that I've never noticed this and have been running
>> busybox's mount, but on reading the hddimg boot scripts I see it
>> mounts / as read-write before switching the root.
>=20
> This might break systemd's fsck'ing of /.

Systemd skips fsck if root is rw. Darren sent patches for mkefidisk to =
pass 'ro', so those work.

regards,

Koen=


