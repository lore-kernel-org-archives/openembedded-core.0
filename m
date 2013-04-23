Received: from mail-vc0-f177.google.com ([209.85.220.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UUZ6m-0004HN-Uh
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Apr 2013 11:01:53 +0200
Received: by mail-vc0-f177.google.com with SMTP id hr11so350200vcb.36
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Apr 2013 01:44:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=85L3HTmqWMvI97yTGeICDgAQhtsA8l81oc7wpWuOPO0=;
	b=pLj9+XFNkAa2Xzm++nIEZJJQMkdEHttI1WfBjXtjQ9iA5+d9l7faQBtNFQ6ATL1HjV
	HfrX7tpwgGp+0MVZEZ9sYxXFNKWxT0fqF/t0LBOPvUrHw2AcyTpiX/wwmXbwp4XdX4GH
	GUjzbJFZYfyHsi/iepMw5av/7KsBRISTYlvB9rOwxNlAqJVFpzAQDFFGMi/FNM2fzJ1L
	P6BaUjXmwOaAFkntnssKP4HQ0i/Ir6yoodMjojTleSCZ1r+a5Yvh/d5WErC/TXkVx76T
	uO1lkOaLzAOdb+1Dn7/NQoO0/5zBzltrfmwVWDMkvgqCDHgCm9Ljsct3mHwWUmXJP2hX
	uk1g==
X-Received: by 10.52.174.41 with SMTP id bp9mr6100003vdc.4.1366706652329; Tue,
	23 Apr 2013 01:44:12 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Tue, 23 Apr 2013 01:43:52 -0700 (PDT)
In-Reply-To: <c1ba3096-22f4-40be-8db8-c9ed3694da5b@email.android.com>
References: <1366665407-32136-1-git-send-email-kirgene@gmail.com>
	<c1ba3096-22f4-40be-8db8-c9ed3694da5b@email.android.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 23 Apr 2013 09:43:52 +0100
Message-ID: <CAJTo0LYGVLXDbjMo4vADWcYnfxRf5+zB_nrK+WvHmZvACobpyg@mail.gmail.com>
To: Anders Darander <anders@chargestorm.se>
X-Gm-Message-State: ALoCoQkym9EMw27IpOfzc/tTKud3D3Y8+19lUm1WQQXWkq+Oe65p+UoQ/ZsWQJ2n6UWYED4dpJjY
Cc: Yevhen Kyriukha <kirgene@gmail.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v3] systemd: added python-systemd package generation.
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
X-List-Received-Date: Tue, 23 Apr 2013 09:01:53 -0000
Content-Type: text/plain; charset=UTF-8

On 23 April 2013 07:36, Anders Darander <anders@chargestorm.se> wrote:
> Would out be possible to change this patch to use PACKAGECONFIG instead? Otherwise we're going to always drag in Python, which will increase build times for systems that are not already building / using Python in the image.
>
> I think that I've discussed this at some earlier point when a similar changed was proposed, though I don't remember there were some problems with that approach.

The earlier patch did use PACKAGECONFIG, so I agree that this should
be an PACKAGECONFIG option, defaulting to off.

Ross


