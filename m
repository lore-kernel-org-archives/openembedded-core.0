Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TYfg7-00034Z-85
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Nov 2012 17:19:03 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 14 Nov 2012 08:05:06 -0800
Received: by mail-ie0-f197.google.com with SMTP id 9so1957265iec.0
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Nov 2012 08:05:05 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=Eso73UdifcfD+yQx+A7GlgJI2oYKNV/vA4o6qlzFd0w=;
	b=KwIAV2mfKs6aXUa8/ALMqd52p71vmXwd6JV5YYdC9OY5J2ai8p361Mi5a8YuQ+WOkS
	dvNf51n4N/UBrf0s5NWgU38RCXYXlVUwXXuZe+dgy7/ZqP11o1nXc1GfyajBQV8P2V8u
	Uij5Ox71uQ490wz5RorcKENQVUvq/+jhnEjhtnGLDBLWoyVyq7SCN0YTXEIVpyxZxHxS
	ldtf4wNj9lKN5THnLYZPPNe99V89dwqgAwfLnVSIFlMLYPBNDryumGhoW4yGh7k1KLOY
	VdMkhzFjQT2AOit9sQff91ZCLF2FrxHtPoszLtTG8shnTcmI+3Hcf95WKS1m/YEmAG9r
	BptA==
Received: by 10.43.132.65 with SMTP id ht1mr24493933icc.1.1352909105299;
	Wed, 14 Nov 2012 08:05:05 -0800 (PST)
Received: by 10.43.132.65 with SMTP id ht1mr24493894icc.1.1352909104785; Wed,
	14 Nov 2012 08:05:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.58.197 with HTTP; Wed, 14 Nov 2012 08:04:42 -0800 (PST)
In-Reply-To: <CAJTo0LafpqVfYPSmO4aYDKZyenrr+w5WQvPOhRMRyZ4wRXjYJA@mail.gmail.com>
References: <cover.1352898505.git.laurentiu.palcu@intel.com>
	<f819ea4994858356c0f33c7b754ae85a11b764b9.1352898505.git.laurentiu.palcu@intel.com>
	<CAJTo0LafpqVfYPSmO4aYDKZyenrr+w5WQvPOhRMRyZ4wRXjYJA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 14 Nov 2012 16:04:42 +0000
Message-ID: <CAJTo0LaNKBszH_WMgMLAwrmyita5CHAtxigowz5-h2avPmP2CA@mail.gmail.com>
To: Laurentiu Palcu <laurentiu.palcu@intel.com>
X-Gm-Message-State: ALoCoQmE8iifDzsXiL6qM8LUQYvYgYNJWzFVEPZo7Ell3/9uIhNHrc/NN1tWov5S5Ux+5RmlsinyvVPH14OK2ef0UaGaqyvZD8uNYB4DH4p1G8DjNAHisyAtsb6WZONOmDbAp45/vg8EMWnpLkOvUoM58ldQinLOETZhnXiAOZNOYGy4eDfuciaMQqFoLpE7wdm4st2h5457
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v3 07/12] libdrm: upgrade to 2.4.40
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
X-List-Received-Date: Wed, 14 Nov 2012 16:19:03 -0000
Content-Type: text/plain; charset=UTF-8

On 14 November 2012 14:56, Burton, Ross <ross.burton@intel.com> wrote:
> Acked-By: Ross Burton <ross.burton@intel.com>

Retracted.  There isn't a libdrm-intel package for the Intel driver,
so it goes into libdrm.  This then messes up the renaming and upgrades
become impossible.

Ross


