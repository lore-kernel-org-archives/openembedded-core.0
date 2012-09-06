Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T9dcD-0000PU-4x
	for openembedded-core@lists.openembedded.org;
	Thu, 06 Sep 2012 17:03:33 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 06 Sep 2012 07:51:07 -0700
Received: by obblz20 with SMTP id lz20so2751942obb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 06 Sep 2012 07:51:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=mTVic8F1KSR8/+uh51dOqvlsziVtvdF+Nl0qf8sDsSU=;
	b=U+Cy+1WhmpD2yk8WnxxqvWPKPzhKFnVjm2X1qOUsMguNb+ICmYtsslourJYjcSmFl0
	SXKfRPAHtS36hWKvYk5CofWPyzV7qZYN0dHYBgGAo2RDVq4izeGpvepDD8Mlzor9FlZ6
	DAiWMQiG944y7MHdI7oLvm4OP25CzGmxtiAwss2TOlAKxli5Vb/v1CB1688TOAyRCVrn
	4DtlRkLh5ixyNs5bykFz+fB4+BbsdoWMwyeBiQkLlHfYqPHkQyQau1smTTxGQQRaHdwS
	DrUuEMjDKcCOGpg+3e2qqpHxWqHMXKsLqSqYgr48RGnKgtfh1qBU49A7eORdGYHijfMk
	iosg==
Received: by 10.182.50.68 with SMTP id a4mr2399294obo.59.1346943066811; Thu,
	06 Sep 2012 07:51:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Thu, 6 Sep 2012 07:50:46 -0700 (PDT)
In-Reply-To: <5048B526.4050501@r-finger.com>
References: <CAK18fxEb3gjEEwhvN-du3eJvgUVCbjXU2Ag4kicFFDt6xra6og@mail.gmail.com>
	<CAJTo0LYmPf0g_qv6X+8MefjzfWr4gsr33SaszHsG82PiGg+oEg@mail.gmail.com>
	<644855E8-7D63-45DC-B072-B9A9893058F3@dominion.thruhere.net>
	<CAJTo0La9-QHoWJB2v82C2tiM2XFwgHzsP1zda+Duqe_3uTwByw@mail.gmail.com>
	<5048B526.4050501@r-finger.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 6 Sep 2012 15:50:46 +0100
Message-ID: <CAJTo0LbE0vZm423U47_mQqyi6N0ONR=p4qnh04jgKviH+CiRZQ@mail.gmail.com>
To: Tomas Frydrych <tf+lists.yocto@r-finger.com>
X-Gm-Message-State: ALoCoQkUB6xyD4zQzJZogruKl9fcY1Xmmf3Ou/k5giJyCr+xvwaZu45vPG7yaEPLrVN69+d3smKi
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [yocto] opengl / libgl / libgles
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
X-List-Received-Date: Thu, 06 Sep 2012 15:03:33 -0000
Content-Type: text/plain; charset=UTF-8

On 6 September 2012 15:37, Tomas Frydrych <tf+lists.yocto@r-finger.com> wrote:
> Is there much that actually links against libGL / libgles? Things like
> cogl dlopen() these these, so you have to manually specify the RDEPENDS
> anyway. Just thinking this could be less of an issue than it might appear.

That is certainly true.

Ross


