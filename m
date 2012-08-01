Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwaXr-0007k0-7T
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:09:11 +0200
Received: from mail-gh0-f180.google.com ([209.85.160.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 07:57:27 -0700
Received: by ghbz12 with SMTP id z12so6504872ghb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 07:57:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=lP1C4m/ZLAQWguNiPlTGLCPgtBMeSSessBf8lQN0Wqw=;
	b=A5mIVxv3aTprdP36o8dZkZv2e9RI0CiZqPawnEaqcGveLJMVKRRTJzs2I3DvKST9tH
	ndxMwdDiIKx92HB6CkvmjsyjMxB7Gqd5FW/ux26bIERnDnhpXDBCvHd7SKrvuK264Ag7
	ip2lznQLRYm8ZXiDdX36h9N5e+HOOg+QLb5O5jFQlVy6xK79rLpTN+pHe29uz9EfDqvM
	vzsPxpw7KpV8DmbEaY2gpiA0S5JcKnr6kIIRZxooEAfdk1ovfUfLrKEU52vBx/adOVYk
	jOTP98fmB52O0BKoxWIY6LrkNy7qFwNnKfUl4/coj6EB3NFYvpFZlYb+4QFi5Nl9K+wM
	5yZQ==
Received: by 10.60.169.134 with SMTP id ae6mr29188210oec.55.1343833043642;
	Wed, 01 Aug 2012 07:57:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.43.99 with HTTP; Wed, 1 Aug 2012 07:57:03 -0700 (PDT)
In-Reply-To: <88550BB7-DF17-4971-B7F3-EEA06C0C7A42@dominion.thruhere.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<40FAF05B-A7A4-45DF-8BA7-872A97FDF157@dominion.thruhere.net>
	<CAGrt=7hVBjV+3de21AEHnC9ZuTBhAO6sdnt8krt=4kMxFuvFFA@mail.gmail.com>
	<88550BB7-DF17-4971-B7F3-EEA06C0C7A42@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Aug 2012 15:57:03 +0100
Message-ID: <CAJTo0LZORyxNKPidzwAWaD0-2Y9ffX75gc3aH6zGKPxyz_rqzg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmyHujySRHYjhZROXaoVaIWTqEEMFE0vKLFBaiiBNn9rIPO9QwbhnowMaZy3At+OusJBgpA
Subject: Re: [PATCH 00/12] Mesa upgrade/improvements
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
X-List-Received-Date: Wed, 01 Aug 2012 15:09:12 -0000
Content-Type: text/plain; charset=UTF-8

On 1 August 2012 15:54, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Apart from the fact that both aren't machine specific. Making them machine specific would be a regression.

Theoretically, yes.  Practically, only one of the libegl.so (libgl,
etc etc) actually works on a particular machine.

Ross


