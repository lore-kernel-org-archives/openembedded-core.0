Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T1wkQ-0001nC-5s
	for openembedded-core@lists.openembedded.org;
	Thu, 16 Aug 2012 11:52:14 +0200
Received: by eaad12 with SMTP id d12so595087eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 16 Aug 2012 02:40:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=ifmA0fWeAnom3JX7v/FpzMWxjfezX8N02IiJoIRq5SU=;
	b=S0AAg9dOjhYpG1InB1Q8KhD0Ge4DW5gdWojsfhlFzPGViY5E93r8QVrE7Tou8Y1euf
	IqNnlHIOaVzkjvJ88q5em4GEQ1uHW9LuSm1uVCLAL+Gbu6NbgesGbRpOp/RpBWYhTxep
	A4aCaVCvsFpZSBOuvm4cy59CP/PmhUe7YsPlsZkBSybQQXxDlBmzETzWtmdxzJIE3gCA
	nCO+XsR43eylGV1/AfgH9qcZ7Kn+sA4dmjQ25m+T63Hn0PSjW1s/xIzLOrKU5jztuO8a
	38GEhc1kpyxyzmTjbftUmr5ZYPdxvgfzHkRwhq+2L2hHvAxBtV4VkKKn3//K43kBUA1D
	rLwg==
Received: by 10.14.175.7 with SMTP id y7mr699632eel.29.1345110017000;
	Thu, 16 Aug 2012 02:40:17 -0700 (PDT)
Received: from ?IPv6:2001:610:612::bd1f:f6c9:b86:a35a?
	([2001:610:612:0:bd1f:f6c9:b86:a35a])
	by mx.google.com with ESMTPS id a7sm10494414eep.14.2012.08.16.02.40.14
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 16 Aug 2012 02:40:15 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <27dcb81ca366e3bab299395b8ce150e02fdd3a4f.1345105475.git.liezhi.yang@windriver.com>
Date: Thu, 16 Aug 2012 11:40:15 +0200
Message-Id: <C2485FB5-A9C5-4CC5-8115-6ED44ED65468@dominion.thruhere.net>
References: <cover.1345105475.git.liezhi.yang@windriver.com>
	<27dcb81ca366e3bab299395b8ce150e02fdd3a4f.1345105475.git.liezhi.yang@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQlIbJ5TLQHOHBxFV5WZXNok22MTheW2WNjw1vFNqr5Cy/WbIJIg+eeqi2yIpacc4S06+it1
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 2/3] ipk: install external binary packages
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
X-List-Received-Date: Thu, 16 Aug 2012 09:52:14 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 16 aug. 2012, om 10:27 heeft Robert Yang <liezhi.yang@windriver.com> =
het volgende geschreven:

> It's been suggested that it would be a useful feature to be able to
> easily take a binary from a 3rd party software vendor and integrate
> it into an image created by the build system.

So why not write a recipe for such packages? That way you can fix a lot =
more of packaging screwups (it's a vendor binary, screwups are a given) =
and don't need to patch a ton of classes.=


