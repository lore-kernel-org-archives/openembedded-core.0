Received: from mail-vc0-f182.google.com ([209.85.220.182])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UXVkD-0003hU-Up
	for openembedded-core@lists.openembedded.org;
	Wed, 01 May 2013 14:02:50 +0200
Received: by mail-vc0-f182.google.com with SMTP id ht10so1210015vcb.13
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 May 2013 04:44:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=dQ6Pnn1VkLFqr5w9d1YV3cV/8EevbwsqdfpxP6LVQJQ=;
	b=pwlBbwuTktaVQmi77MsULw9ZHCuaF0Jx+KFhZkmYuQBy6TGI56M8lWFwd4WQOgt+SR
	ZwraqyjF9vO3C0K9M2y4AYWXPLzFsLJDe/iEn5JDukapGIGGqT7dxjV6NMdFHX9RKlR3
	RStr+uwZlX2yRV33ZVOdk4+wLn4odJAwVg+qrFIpVf9VXaNmYBIEvsPO8y26lihfqxYx
	fforSyNzmGR2DYQObEaLoIZX0qUJyhWjA1rFEfUBk0vgGT/EIKQvdWY6HoMcdGGlCVeJ
	bryznYfzcUzdz32HNvvxDvw8oJdex4phQgtlY6/FagAJ0fKLnK88lnio6ax+vHOmUryN
	MR/w==
X-Received: by 10.52.174.41 with SMTP id bp9mr657825vdc.4.1367408693657; Wed,
	01 May 2013 04:44:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.221.8.3 with HTTP; Wed, 1 May 2013 04:44:33 -0700 (PDT)
In-Reply-To: <2F6BFA0E-EB8F-4335-9BF8-852D7F056696@dominion.thruhere.net>
References: <cover.1367403369.git.ross.burton@intel.com>
	<06a1154d758be0744da68717b31077cc02ec657e.1367403369.git.ross.burton@intel.com>
	<2F6BFA0E-EB8F-4335-9BF8-852D7F056696@dominion.thruhere.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 May 2013 12:44:33 +0100
Message-ID: <CAJTo0LY3tfCLsYLYP0RKR80qcAAn3yaXqpjfA-4JNyhLDuaVBg@mail.gmail.com>
To: Koen Kooi <koen@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQm3hSnMB8l8U2yqRs+/AnjHSLKpLYxJO5iRpdSmnMPN0lJj/E96v0pVpvyXzolxLq8LHUUi
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/3] libsoup: upgrade to 2.42.1
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
X-List-Received-Date: Wed, 01 May 2013 12:02:52 -0000
Content-Type: text/plain; charset=UTF-8

On 1 May 2013 12:38, Koen Kooi <koen@dominion.thruhere.net> wrote:
> Sweet, that drops a load of dependencies for gstreamer http sources!

Yes, the buildhistory-diff was a delight :)

Ross


