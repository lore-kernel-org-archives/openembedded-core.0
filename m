Received: from mail-ob0-f181.google.com ([209.85.214.181])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UNMa3-0004m9-CT
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Apr 2013 14:14:19 +0200
Received: by mail-ob0-f181.google.com with SMTP id ni5so1301282obc.12
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Apr 2013 04:57:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=c3PZaVpK1eQW4z+O0psFKPwmuX0jFqss+5ONkMx6jGQ=;
	b=yOVm0ZbTnypNuDghD5hw/pcYw6dkqJK+qV6X/HEJ/p0/bnVHUynxGidr6+UQyYVDnV
	OyLl6x4ubq8eCg9P41IpCUxUfwrgcg+JI2S9L677VcjHbcPxXjAaVwX57nld9K9g43YV
	kDdMSNGAvPeowMNffe1MukSVvB+IF3cyx/zfxH3TCZs53ESExKzYWycixEA2K/EHEaC3
	j/XduMnPSKZKIBgv+2kceoFnitbHy+uGsBb1wijiwANKjwGCRgswR7woiKYpZEsOoCta
	pE1ECZCQTZPdq0AMzRBNInHGTjvd1eZW4B1bhaHKRvRWwTyplZDchU6MPQlV9XuQb60z
	wjlQ==
MIME-Version: 1.0
X-Received: by 10.182.106.16 with SMTP id gq16mr882305obb.27.1364990227691;
	Wed, 03 Apr 2013 04:57:07 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.80.198 with HTTP; Wed, 3 Apr 2013 04:57:07 -0700 (PDT)
In-Reply-To: <CAJTo0LY14UsodYqHO2iEZfiZCfHVKG6XXNbPCRU95tWP=-qoZg@mail.gmail.com>
References: <1364949284-32569-1-git-send-email-ronunes@gmail.com>
	<1364949284-32569-2-git-send-email-ronunes@gmail.com>
	<CAJTo0LY14UsodYqHO2iEZfiZCfHVKG6XXNbPCRU95tWP=-qoZg@mail.gmail.com>
Date: Wed, 3 Apr 2013 08:57:07 -0300
X-Google-Sender-Auth: WH88R0pcSLZ1BT86Yx_7CHAFyfk
Message-ID: <CAP9ODKoHwQQR3AHDdXEVjObEFSHzbFJ5mGH0NXk_aevmsU+VDg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] gst-plugins-bad: disable librsvg when x11 is disabled
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
X-List-Received-Date: Wed, 03 Apr 2013 12:14:19 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Apr 3, 2013 at 8:30 AM, Burton, Ross <ross.burton@intel.com> wrote:
> On 3 April 2013 01:34, Rogerio Nunes <ronunes@gmail.com> wrote:
>> librsvg depends on gtk+, which in turn does not support framebuffer
>> as backend in current version (2.15.24). This patch disables librsvg
>> when x11 is not in the distro.
>
> One of my plans is to make every optional dependency a packageconfig
> option in the long term, so feel free to do the rest whilst you're
> there! :)

I agree with the longterm goal but let's not hold this until the goal
is accomplished. This fixes a real issue and delay it won't help.

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


