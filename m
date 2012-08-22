Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T45qz-0004zM-N7
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Aug 2012 09:59:53 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 22 Aug 2012 00:47:31 -0700
Received: by obceq6 with SMTP id eq6so883520obc.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 00:47:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=68wn2bG+g/xiQfDrv8+1+dykhlSF2xBOk6KAz2KMPWk=;
	b=GtQ4rs/vjFFV3qaKyhb95klkO9kaf1rewuXeYHCkPQ8ipXXW4em9XhDhPuQy1K21Kq
	iutAFmWl4AnHUqee/QNi4lByIKfvJkWE/YEzjYulX8VEcSMVfbQbvbxMaOEqyuDelf6Y
	saohFmCKceynE/8GNONfjLnGOaLme/tU625p7mmWgGm+lQfdlvhZPLO3oU3H3uQi2uX0
	arp8uv7pXU1Mhx79nYkj2YXL3QH0HYyOSCyuvAN1+ASBoNNIFs1P5PZP5F6Jd1nvkmkI
	CYmnPX8P3tgC/BVy5xrdHlQh8fJgemVkT94pYLHGSPS6l4wUdZYdW4gzwjOmpefHqFoo
	zI9g==
Received: by 10.60.29.72 with SMTP id i8mr14780345oeh.26.1345621650603; Wed,
	22 Aug 2012 00:47:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.158.3 with HTTP; Wed, 22 Aug 2012 00:47:10 -0700 (PDT)
In-Reply-To: <CAMKF1sp5vLaO68jx-wmmrFDaTjbBczSJ3uLf8oAZPwkpmhZr_g@mail.gmail.com>
References: <CAMKF1srvBZzMTbN-iOqEjitgSjFOK_Cpd0B94HjWm1z7s-0-iQ@mail.gmail.com>
	<1345285875.27428.27.camel@ted>
	<CAMKF1srJ1w94g2rgu8FvZdmHLK-4t=GSj9OtSAncuquK6oNhjw@mail.gmail.com>
	<1345339639.24626.62.camel@x121e.pbcl.net>
	<CAMKF1sp5vLaO68jx-wmmrFDaTjbBczSJ3uLf8oAZPwkpmhZr_g@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 22 Aug 2012 08:47:10 +0100
Message-ID: <CAJTo0LYycw59N9tO1i0q5NtTLjUgxwdPRTLQrcZWL7hgaQbmYA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQlzMpYPMyyDzXfLnUjIBSm5K6TJnWp10wVbZs/6XLQoGZCkxKPy2Ki1HlwLEniLqoEa+7Oh
Cc: Phil Blundell <philb@gnu.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Replacing chrpath with patchelf
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
X-List-Received-Date: Wed, 22 Aug 2012 07:59:54 -0000
Content-Type: text/plain; charset=UTF-8

On 22 August 2012 01:21, Khem Raj <raj.khem@gmail.com> wrote:
> May be it will be nicer to create one meta
> package which installs
> all prerequisites not only chrpath/patchelf and maintain that ourselves
> this could be nicer since then user only installs
>
> apt-get install make-my-host-compile-oe package on ubuntu and similar
> for others.

I used to maintain one of these for Debian years ago, and it did help a lot.

Ross


