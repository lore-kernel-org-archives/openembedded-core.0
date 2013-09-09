Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f171.google.com (mail-vc0-f171.google.com
	[209.85.220.171])
	by mail.openembedded.org (Postfix) with ESMTP id DE8936156E
	for <openembedded-core@lists.openembedded.org>;
	Mon,  9 Sep 2013 11:36:21 +0000 (UTC)
Received: by mail-vc0-f171.google.com with SMTP id ij15so3994498vcb.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Sep 2013 04:36:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=7XGc9WWMeRsrAgNmO5thtVYxj5xftJbYWv3Ki1fnip8=;
	b=F/wF1e2ClmXwzxmZPbEKmNooBgATBAIGQiaAl4q02bMgsuP8HnfLFXbC/ockv17Hto
	iTwqqlhCPdZHp4CdDbktteg30caGQefJ1TYG/ZN+CpEJrjRN+0q2OpOX/NTjgabK9Ry7
	cmj8nEFncwGpLtLR5gIRORF99wxx+6RsDF+l8bbuJMs8SAwEhvn5WdSn/I9NSBXuHwDe
	7om4rhUl3dIWiNF2F39bxSCNiCVIdZmd+LVA8xfu4sDJ7DZCyasbwNotIM7v6sRtJiXl
	zCxEXA1gBJtlXrNXFZI5T0w8jwCqQtN+aERZj2AJwevUdmAkmVQfoQgypip14Eaa48+X
	BpOg==
X-Gm-Message-State: ALoCoQl/W0JtC0NLhzqnjZ877gMuozhVR37wWgiNlHMJHaNk47acqK/5zDtOdlKSL2uRGt1IA/vd
X-Received: by 10.220.46.72 with SMTP id i8mr17535557vcf.10.1378726583187;
	Mon, 09 Sep 2013 04:36:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Mon, 9 Sep 2013 04:36:03 -0700 (PDT)
In-Reply-To: <CAP9ODKo0KQ3gJd+eCfzDF0QX9EYb_NhRRX6NWJOKsxWth7_wxg@mail.gmail.com>
References: <cover.1378361078.git.nitin.a.kamble@intel.com>
	<2b4e12bfea634eaecac61b471a9d607fe127d1cd.1378361078.git.nitin.a.kamble@intel.com>
	<1378369981.32427.23.camel@ted>
	<CAJTo0LbLaH4-YTJVo_yr-gsaaSbXXe9Ucfbq_i+4gO+qKa354Q@mail.gmail.com>
	<CAP9ODKo0KQ3gJd+eCfzDF0QX9EYb_NhRRX6NWJOKsxWth7_wxg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 9 Sep 2013 12:36:03 +0100
Message-ID: <CAJTo0LYUL1kvZB=Lk8ine+zVpAipRNMevnnpLi5C2_+ZobLdyw@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>,
	"meta-intel@yoctoproject.org" <meta-intel@yoctoproject.org>,
	Darren Hart <darren.hart@intel.com>, Saul Wold <saul.wold@intel.com>
Subject: Re: [Patch-v2 1/1] mesa: avoid unnecessary rerunning of tasks
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 09 Sep 2013 11:36:22 -0000
Content-Type: text/plain; charset=UTF-8

On 7 September 2013 00:56, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Maybe it is time to have a mesa-gl recipe alongside mesa that *just*
>> builds the GL libraries.  EMGD can depend on it for the driver modules
>> it installs, and presumably other vendors with binary drivers can
>> install it for the software rendering/GLX support (Otavio etc, please
>> step in here!).
>
> Yes; we have both situations at Freescale ARM BSP.
>
> For the AMD GPU binaries, which are used in MX5 SoCs we *just* use
> mesa GL and do software rendering.

So mesa-gl will work fine there.

> For Vivante GPU binaries, used for
> MX6, we use mesa GL *headers* but Vivante provides a libGL binary.

My, that's horrific.  I'd forgotten about this, for good reason clearly.

Ross

