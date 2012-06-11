Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Se6XT-0002Rd-MX
	for openembedded-core@lists.openembedded.org;
	Mon, 11 Jun 2012 17:28:19 +0200
Received: from mail-qa0-f49.google.com ([209.85.216.49])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 11 Jun 2012 08:17:39 -0700
Received: by qabj40 with SMTP id j40so2560582qab.15
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Jun 2012 08:17:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding:x-gm-message-state;
	bh=WGA/r7FQsXsEpoPC3qqSkr1IGvXszojIQZYaVGQgmhI=;
	b=HWm/jc86Yv6FGe5bj7k0nFNbQ3O8c95NQtDzKlo9oKjLxGYLdKWmRr4BJvLKg+2AJr
	3F+tcX/qkyF2TApEk6DX17H3WOUpYOcBJCGbgIQtTMGYvZNvT7VqYDTB7VHGm9eAdmMb
	ycSkOI1I3U2En2jUs5lUNixV46eE1Q//VYCVkvDB4H8KVK5IY3j73gOPXccyeIOcAyoa
	le/9RGx+CJsNcGY8xfghVgGFQI2E5SYr7ElVnbIJXPEGimnUMmaCGskoNagsjO/1Pnew
	yoHD3yA5e9pvUjgcb/shZMpZ47KwIaG2megvKNOMymxlyDmBLnvOV6pag0ywRGnJR/Ss
	pHUQ==
Received: by 10.224.174.138 with SMTP id t10mr3187223qaz.50.1339427858557;
	Mon, 11 Jun 2012 08:17:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.111.193 with HTTP; Mon, 11 Jun 2012 08:17:18 -0700 (PDT)
In-Reply-To: <20120608000804.GH3140@jama.jama.net>
References: <cover.1339078729.git.ross.burton@intel.com>
	<5afc9f367cc3224e82bbe59fe9bda14f504b45c0.1339078729.git.ross.burton@intel.com>
	<20120607143221.GG3140@jama.jama.net>
	<CAJTo0LaiApvc0oD4VKHPcsoWtEEBcSyPcza9sr=wOs78DNxPLg@mail.gmail.com>
	<20120608000804.GH3140@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 11 Jun 2012 16:17:18 +0100
Message-ID: <CAJTo0LYZDP5zpHCQmFEpH5mM_dFGaEpE_5D=gBpPg7BUHCre9Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkyVbAdpKgTw5z7yAyfotD7/6i+B8OGdhBuCPTmPrKJVWdn3HOj2sPBgCXF1kL/uiASLH7e
Subject: Re: [PATCH 1/3] connman: respect the 3g feature and enable/disable ofono support
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
X-List-Received-Date: Mon, 11 Jun 2012 15:28:19 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 8 June 2012 01:08, Martin Jansa <martin.jansa@gmail.com> wrote:
>> Because this is the first time I've encountered it. =C2=A0:) =C2=A0Is th=
ere any
>> documentation on it, or a comprehensive example?
>
> Git log shows e.g.
> http://git.openembedded.org/openembedded-core/commit/?id=3D7a58911f6951ab=
d56db9ebb37f8d6284d91fa514
>
> and git grep PACKAGECONFIG will show couple of examples

So,  the basic theory is that you set PACKAGECONFIG to the list of
enabled options, i.e. connman would have wifi, bluetooth, 3G.  This
would be set using base_contains(DISTRO_FEATURES...).

Then, you have a PACKAGECONFIG[foo] for each option that defines the
configure flags and build/runtime depends.

Neat.

Ross


