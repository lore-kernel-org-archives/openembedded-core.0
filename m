Received: from mail-vc0-f181.google.com ([209.85.220.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UHveh-0006fK-0d
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Mar 2013 13:28:44 +0100
Received: by mail-vc0-f181.google.com with SMTP id hv10so289955vcb.12
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Mar 2013 05:11:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=ktLrSCxfoE8BL7+5bLNXdWVeUJbjq3a2jrF41FvdMs4=;
	b=dh4MInMzaFHzl7DUdNcTndCWaq6Hf29NX6ZsjOtIsQjNFN2jieuAY3d8L4AhvhASwu
	BVklVmjZwwgQBXNcU7LiV/Br0gLevz9Dj620IupoQ9OR65x7PNdFmBNuqpFjGxtI7Mkr
	ha6pdmtg3vMNkLqpmy1ERHje/VMVoWYMX9I0vLuLVKJ18cqz8/RMG94oEXiAaNNYlNlT
	n8qizD/BcyNlA+Bae6iYmNrxxKdOgdzF7t3KKBpFlHzYsRJRembzOr1bLEXkaCk0F8JD
	CZPuLDKn/8rl/199780y6quSYOGDBlxHfC+7Z+MVdXBG6S8SRgEZCi2kjq45vkvpA+0c
	T5GA==
X-Received: by 10.52.155.5 with SMTP id vs5mr1714235vdb.24.1363695109306; Tue,
	19 Mar 2013 05:11:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.125.102 with HTTP; Tue, 19 Mar 2013 05:11:29 -0700 (PDT)
In-Reply-To: <lyip4ny4jo.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <cover.1363031776.git.ross.burton@intel.com>
	<4ad7ea263a05fb3c1960623760340549a20c849c.1363031776.git.ross.burton@intel.com>
	<ly620wucp5.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0Lb7tbVpCn4-hGfs8KOKKp8LQW2p2grnGvmLfNUG9bR0eg@mail.gmail.com>
	<lyip4ny4jo.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 19 Mar 2013 12:11:29 +0000
Message-ID: <CAJTo0Lb-RGs0s6o6YHN11ud0rNTy7pzatTQEuO+u2ZXe9Hq4zw@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Gm-Message-State: ALoCoQl5lVUp0jyxaCeKN96wTMb79VCqL+SAZgd7fEJszT0ZX24FQzLpIUmSpD5TUPViO3USbBDw
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/9] systemd: allow postinsts to run without systemd being present
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
X-List-Received-Date: Tue, 19 Mar 2013 12:28:49 -0000
Content-Type: text/plain; charset=UTF-8

On 19 March 2013 12:09, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
> 'type systemctl'; 'type -p ...' is a bashism.

Pretty sure I tried both, and busybox source shows it won't error out
on "-p".  I'll try again.

Ross


