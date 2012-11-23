Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tc0LX-0002bE-5E
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Nov 2012 21:59:37 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 23 Nov 2012 12:45:25 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so45922070oag.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Nov 2012 12:45:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=DlxVCtyAUx/q5fJQQeYxOUT91qduH/VmXmr27a/OAq8=;
	b=Fu62uKT39fagMy1kjQeIktU5iESqz5PVSNVG8e0KG9PlZLivbT9OKF7GTOvwR63IHb
	SYrK3ty1wsOz8F5IS7dHcY9QQC8vBjR0NEB+G/AxfCgxQxuXESZimeUE2JhfGPphO3Pf
	3h7laBz8HrSisvNN2qrFmI2DAxXeB0Cg000O3Vu40e2t79f4rD5XKiVPZnc6yvx1TW5J
	l4mMRTQ8UpO8lEptcNSXpnuQAkJL8RjHbCfY9OAVr4L78HmnhOV8rj6J6odDacMoBOOj
	6t5feovurS1aQae/e3ZOCBub2mlSDHGgcoEIXMY79wleWR3RBb54Sm04gi/N1np3LHyO
	95WA==
Received: by 10.182.54.103 with SMTP id i7mr3756125obp.62.1353703524670;
	Fri, 23 Nov 2012 12:45:24 -0800 (PST)
Received: by 10.182.54.103 with SMTP id i7mr3756121obp.62.1353703524616; Fri,
	23 Nov 2012 12:45:24 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Fri, 23 Nov 2012 12:45:04 -0800 (PST)
In-Reply-To: <CAOT3miLTTjGDPTj=dbNgnTvKXSg3bc+CL5nu8ASfEgMtxZBdHg@mail.gmail.com>
References: <cover.1353631583.git.Martin.Jansa@gmail.com>
	<CAOT3miLTTjGDPTj=dbNgnTvKXSg3bc+CL5nu8ASfEgMtxZBdHg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 23 Nov 2012 20:45:04 +0000
Message-ID: <CAJTo0LZ6+fbMF-q2N+vtq9PFnnkiHAPgWeGOXpwbm+GBsmCeZQ@mail.gmail.com>
To: Nicolas Dechesne <ndec13@gmail.com>
X-Gm-Message-State: ALoCoQkn5kKqWRX0wbE2ZPMLoERTJS0obrXGdFPTqWXDJ8nndzKFUGneFhQWPyAPQBMKaDuCJu5XVJGwI1pJpEXxGh8Fm6zXAvw93NoHdlhf6bCVModH7UGgmh1SHqalWxIHnJs46jmNMrxk/Nrqyll642rIm4sYevNMim5Ss9IDWsw3ALjH5/SUnkl/NEvFkbqZH0A0cRhl
Cc: Martin Jansa <martin.jansa@gmail.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/4] Fixes for xserver and omap* drivers
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
X-List-Received-Date: Fri, 23 Nov 2012 20:59:37 -0000
Content-Type: text/plain; charset=UTF-8

On 23 November 2012 10:18, Nicolas Dechesne <ndec13@gmail.com> wrote:
> i have some questions... xf86-video-omap now clearly depends on opengl
> DISTRO_FEATURE (since dri cannot be disabled) for the xserver build.
> So if i build oe-core + meta-ti, it won't build as the xserver is
> built without dri/glx support there, and then xf86-video-omap won't
> build.

Add a new DISTRO_FEATURE for DRI?

Ross


