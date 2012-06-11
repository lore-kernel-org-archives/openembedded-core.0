Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Se8h1-0000Ay-N0
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 19:46:19 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 10:35:44 -0700
Received: by lbbgh12 with SMTP id gh12so2564278lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 10:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=HfJZHKj6cR05druNaIJAFzwsk/786cCrhMRVbu+rf68=;
	b=R36X0Lqk1appMwAEytGxLrE0qn97YfjOGzL7Z93P8G9JMEXri2Ky+x6bPZurjeOHcz
	AMtoNe3oYztxyPz+wmeMMhW+7YPGYO15mBdmfeO8aU2se+GhI1dh/w33CWHrMcM2GuYK
	THIvRMRHRxOA1jWsCbsNF4JAtAPca9xqqslvvUnqfAv0JMUX4X5Qw/l0PMHRDf9BcXBT
	KUj+4x0ukfnVGVsNyPYsO4A5/jCAjLyQtlVvBRVdYsuRmiaCU/PSPkzGdTSyg0A88zPH
	SWN5NvqYuwtCOX92BDJ94wQFNVH325AlpbobInBGlzKYChE9MdEFu/rHVY11IpiZ/zog
	3nMQ==
MIME-Version: 1.0
Received: by 10.112.36.163 with SMTP id r3mr3518080lbj.87.1339436142913; Mon,
	11 Jun 2012 10:35:42 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Mon, 11 Jun 2012 10:35:42 -0700 (PDT)
In-Reply-To: <cover.1339035261.git.liezhi.yang@windriver.com>
References: <cover.1339035261.git.liezhi.yang@windriver.com>
Date: Mon, 11 Jun 2012 10:35:42 -0700
Message-ID: <CAPhnLPC41bzwNsXAv9mOJyStbavOt_6BtaNa=-p-93+uB7Tj1A@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkvBCBfGFh4iCkCuDCYWdtWhYxjhsaCIS2YSBm8HGR1ZJgg7qs7v4kYIsH2R3cQ1Rxif8LT
Cc: Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 0/2] apt 0.7.14: do_compile failed with gcc 4.7
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
X-List-Received-Date: Mon, 11 Jun 2012 17:46:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 6, 2012 at 11:33 PM, Robert Yang <liezhi.yang@windriver.com> wr=
ote:
> * Tested on:
> =A0Ubuntu 10.10 (gcc 4.4.5)
> =A0FC 17 64 bit (gcc 4.7.0)
>
> // Robert
>
> The following changes since commit f8a054aca9962ebfd4c74fc1d34cd684de6b35=
68:
>
> =A0perl: Allow perl to cross build and native build in a directory named =
"t" (2012-06-05 23:02:20 +0100)
>
> are available in the git repository at:
> =A0git://git.pokylinux.org/poky-contrib robert/apt
> =A0http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Drobert/apt
>
> Robert Yang (2):
> =A0apt-get 0.7.14: hangs at runtime
> =A0apt 0.7.14: do_compile failed with gcc 4.7
>
> =A0.../apt/apt-0.7.14/remove-redeclaration.patch =A0 =A0 =A0| =A0 32 ++++=
++++++++--------
> =A0meta/recipes-devtools/apt/apt-native_0.7.14.bb =A0 =A0 | =A0 =A02 +-
> =A0meta/recipes-devtools/apt/apt.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0|=
 =A0 =A01 +
> =A0meta/recipes-devtools/apt/apt_0.7.14.bb =A0 =A0 =A0 =A0 =A0 =A0| =A0 =
=A06 +--
> =A04 files changed, 23 insertions(+), 18 deletions(-)
>
>

Merged into OE-Core

Thanks

-b

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


