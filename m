Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SuVZQ-0004zH-Oj
	for openembedded-core@lists.openembedded.org;
	Thu, 26 Jul 2012 23:26:08 +0200
Received: from mail-ob0-f180.google.com ([209.85.214.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 26 Jul 2012 14:14:36 -0700
Received: by obbuo19 with SMTP id uo19so2807729obb.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 Jul 2012 14:14:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=6e9hYh1q9wuen+R8/OOfUiaWsQKa+TNnhPEwO2W5FaI=;
	b=DIARJ21GIcF2Ixn8gbj6R7tLYaioFExAjMcfTMEDXO3xktak2ynkdED6kpIcwuwW19
	liyXz2v6sRDPaQHYjWmutpsvei2HtP9pa5vSreVaaS8BBmAIlSAv1+8t2GINDWu+RLzV
	qbeCWKzvZBn3D/Ci54bhF+OikSlGY29CWtdkFHve7iSVPvEpeFHxFOb38g4U/Q19RHay
	7MUOuPNg/MIiuBBXf+tAR/RHEPTL2adXChwxcn+DbjeJxN9tbmTR39CsOXeC436dYo6a
	yy/WYS62Acu/NKQViVxR0vN9ETB8jpIs14E39hbnNWAAS5MjHA09XJRhcXMwWLKR5gOU
	R4rA==
Received: by 10.182.207.39 with SMTP id lt7mr222453obc.67.1343337275725; Thu,
	26 Jul 2012 14:14:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.33.4 with HTTP; Thu, 26 Jul 2012 14:14:15 -0700 (PDT)
In-Reply-To: <lyehnyvbiu.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1343283462-25435-1-git-send-email-radu.moisan@intel.com>
	<5010E3CF.3060709@intel.com>
	<919CF905-E475-44CE-8050-94A39C204208@dominion.thruhere.net>
	<lymx2mvfe8.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<501144FE.4040201@intel.com>
	<lyehnyvbiu.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 26 Jul 2012 22:14:15 +0100
Message-ID: <CAJTo0LZkAFzw8FTSocpB=cSEpm6cUnzBWeuCUq6SDKcjgaM9Lw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQm1ackIUrOpPwmDrYzauRoTVeMrtKGIaW9uW6GyaFq0CK2E3qrQ941W5gFdtY5nj8smqT9q
Subject: Re: [PATCH v3] dbus: include dbus-launch in the main dbus package
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
X-List-Received-Date: Thu, 26 Jul 2012 21:26:09 -0000
Content-Type: text/plain; charset=UTF-8

On 26 July 2012 15:32, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
> I do not speak about crash; I guess 'dbus-launch' has some extra
> functionality when compiled with x11 support, and packages which
> depend on dbus-x11 might expect this functionality.
>
> Providing 'dbus-x11' although no x11 functionality is provided sounds
> wrong to me.  Either remove the 'dbus-x11' property completely or provide
> it only when x11 support is built in.

I disagree.  Currently dbus-launch is packaged in dbus-x11 which may
or may not have a dependency on X11.  *That* makes no sense.

Moving dbus-launch into dbus which conditionally has X11 autolaunch
support depending on whether X11 is being used or not makes sense to
me.

Ross


