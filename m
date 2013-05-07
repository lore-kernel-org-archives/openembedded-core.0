Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UZfqJ-0003eq-Ne
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 13:14:00 +0200
Received: by mail-vc0-f181.google.com with SMTP id hr11so329811vcb.26
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 03:55:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=6/5bnQllQuGRDrYLs4Sg1WagJO8Nx+LJL7u+LVJm480=;
	b=i2wpaQrr3IlESCGOM3/h30a5Qovbcw7BKJ7kzxtnLRCTcUxcWmmWEu8vhG3cffwn8O
	MCTxon+ua4zMSXH4rGiWpgBmg7pMltn26o9LytIdPzW1AsndzCpQiUwAjSnuo2p+9Cei
	EtJBTzPU2zvNgGjwTlQOtbQrSQ2ddurSI2O/RFSoYsY5cGPF3fjFGQ8jlyAOEGJXmfxM
	zRIVmnmc9FVnI0/31pptfG6sxn9MGfzBS6fugbiPDJkXnTE8CAiK5kWPK3zO/+LR5Rgs
	BOM5pMHphWg4y7z0s9v/3QQuXp+dK5EyN6D0DGCcDYm52R3dDPdaT7VlsiUd7x9eeC0N
	+i6w==
X-Received: by 10.52.18.206 with SMTP id y14mr687486vdd.29.1367924158458; Tue,
	07 May 2013 03:55:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Tue, 7 May 2013 03:55:38 -0700 (PDT)
In-Reply-To: <5188D791.1070505@pseudoterminal.org>
References: <1367787030-5056-1-git-send-email-dv@pseudoterminal.org>
	<CAJTo0LZrtVHq4PpF4uEL+_GeQBzDOMTEu-rt39j7agamGOe+MQ@mail.gmail.com>
	<5188D791.1070505@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 7 May 2013 11:55:38 +0100
Message-ID: <CAJTo0LbNWO3OSQZHN7e0pa7Dq3iY02k8GVSR3LqmEkdU3Dd1hQ@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
X-Gm-Message-State: ALoCoQk1CF0Kjsnx3Qr0ck/GC9//mYcutP05VuycFN/zgFbtfID8DRVg7ZFD3wy4jExfUEN8s1ia
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gstreamer: Fixed dependency problem with -meta packages
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
X-List-Received-Date: Tue, 07 May 2013 11:14:05 -0000
Content-Type: text/plain; charset=UTF-8

On 7 May 2013 11:29, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> True, however I wonder if somebody relies on these packages being there.
> Is it acceptable to break compatibility here?

They haven't been there for a while and 1.4 is shipping without them
so I'd endorse cleaning them up instead of having empty packages.

Ross


