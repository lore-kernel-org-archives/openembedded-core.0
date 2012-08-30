Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T73zV-0005rb-8z
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 14:36:57 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 30 Aug 2012 05:24:40 -0700
Received: by obblz20 with SMTP id lz20so3118517obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 05:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=hxIIrmIi37i8VrPjk2qOtsxLP9W2Wnq9LNoZqENdutE=;
	b=f+d0rcB6CaE1vSkh5FcGeunNEU/8D45hkZlkk1HSA9TOVqlNLKkZwoWEFcHEQPAoWT
	PM7TyozrF7FonH5yk4raNp8GNz7ZKCV5vzpaM/DdhEOVUiL09IocwEbNC528POq7G3h6
	rH01FqFQmLkX49YUQ7eCw722+hVg/LKSeqpzcLU1CI+mqYQxOoJ4BHWOiT0/Q6gyGJEC
	M71tQhTeI0AqjfRQJ2pvzmLSzupMiFqTPAjcWGUbRyNboLVbSwfT6uNVEaRnIpT0FyDi
	Sddjz8nQWYWMNLGhhODWYMhj/RSmKbkeXdlEMSvhIbfxQrvly+3SaLU8aQ+4fm3dz4yz
	F3aA==
Received: by 10.60.171.174 with SMTP id av14mr4201371oec.61.1346329479775;
	Thu, 30 Aug 2012 05:24:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Thu, 30 Aug 2012 05:24:19 -0700 (PDT)
In-Reply-To: <F37371D0-84A6-4E9C-9455-72409B92E29C@dominion.thruhere.net>
References: <1346255613-13401-1-git-send-email-ross.burton@intel.com>
	<92175252-0A9C-401F-87F5-751E4CFB8611@dominion.thruhere.net>
	<CAJTo0LY5=R5=7BGtt3LkstRhRb2Ycd1oDJFDoKygtc8KcC4W8w@mail.gmail.com>
	<F37371D0-84A6-4E9C-9455-72409B92E29C@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 30 Aug 2012 13:24:19 +0100
Message-ID: <CAJTo0LZtnp+CRBrz2GcMsGuGRYzDkCgS46hxGe34v_p47BeMRQ@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl8Mw/YLOcIuh+mRkmD9E6M53HBtXH6czuKxWUGu+n8gfKftRdTeefZdoqXpBuc5tOivitr
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] xserver-xorg: ship the exa module in a separate package
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
X-List-Received-Date: Thu, 30 Aug 2012 12:36:57 -0000
Content-Type: text/plain; charset=UTF-8

On 30 August 2012 13:17, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Indeed. In the past I had every device using full Xorg in OE on my desk, but with the demise of kdrive and the adoption rate of OE it has become impossible to have access to each device :)

Speaking of hardware I'd like to test the touchscreen calibration code
in Xorg and purge the bits that are kdrive-specific.  Any
recommendations for hardware with a touchscreen?

Ross


