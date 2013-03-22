Received: from mail-la0-f43.google.com ([209.85.215.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UJ7dP-0005iX-TK
	for openembedded-core@lists.openembedded.org;
	Fri, 22 Mar 2013 20:28:25 +0100
Received: by mail-la0-f43.google.com with SMTP id ek20so7995236lab.30
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Mar 2013 12:11:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=l/ELmFN1zWP1P/Y0qM+wuj0xBf8lfnhArduSPbe59jo=;
	b=iuVAXHYEoNpkgmbv5djyv/QBKznOYXNC9oFqAAW95UqcLwPInBXdn67qLj3zw6fqY0
	IslTcbMfoYLYHy4VcILACO5nwNfn/Okk4KtwDTBdb37f7iYgfWwepT/3DOEbytoXApQz
	QhEbachxcfFvDwoT/HxebUh6ArW3amEci8leDXWNAANd0WBzbNnBZ97qYmYoorROSc4F
	Z07e9t1iESRbCyRMxIkIiJIkZKza6preLX6ZsBShux+HcTNq0wANx6xrdGpNrzNs/nRW
	n/pGJikmB0bOBTIJRDwRl2wmKEuQwjB0ShUumr2e7FLs8VF223iyzAmzgYoUi1DX031U
	s2Jg==
X-Received: by 10.152.115.196 with SMTP id jq4mr1215171lab.53.1363979481399;
	Fri, 22 Mar 2013 12:11:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.81.231 with HTTP; Fri, 22 Mar 2013 12:11:00 -0700 (PDT)
In-Reply-To: <20130322190434.GV3219@jama>
References: <cover.1363973088.git.ross.burton@intel.com>
	<876b70b30d4ed72bed465147dc6ecf28f331e2f7.1363973088.git.ross.burton@intel.com>
	<20130322190434.GV3219@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 22 Mar 2013 19:11:00 +0000
Message-ID: <CAJTo0LZka2bbRHc5anCA8MFiW33cR76TgCZx_MVX1mf_xQwdfA@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQkbLCaLHknNT5d47kj79ZIyVlelrGCuiCO1TihTGOEk0xlyN9GMw/IeUpmgKkowrJwP+x/M
Cc: openembedded-devel@lists.openembedded.org,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 09/22] update-rcd.bbclass: handle both sysvinit and systemd features being present
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
X-List-Received-Date: Fri, 22 Mar 2013 19:28:38 -0000
Content-Type: text/plain; charset=UTF-8

On 22 March 2013 19:04, Martin Jansa <martin.jansa@gmail.com> wrote:
> Isn't DISTRO_FEATURES_INITMAN removed later in this series?

Yes.  I reviewed this series entirely twice and still this slipped
through.  Consider the chunks mentioning INITMAN gone.

Ross


