Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RxBx3-0005ZX-Lz
	for openembedded-core@lists.openembedded.org;
	Tue, 14 Feb 2012 07:33:21 +0100
Received: by lbol12 with SMTP id l12so3037366lbo.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Feb 2012 22:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=eXjbiEafGHQoKCmZYeC5RV1yr55GlZwFjplmQ2PKrKQ=;
	b=IAPammRl4fKXi5K3en5m+6I3QAqb6a2PBbYRTAkaFjowzErgDZkTC5+12pTI4GxN+D
	ozlUYnkxVBF78wBfkUSPYzVv1Rfuf+t8ekVLTKNJ0+eOTnnEfWBGsTjwZGDHNCet2IWW
	g8FpyKYVYGJZjQwZj5HL9H0HL/4BAkcjejZMU=
Received: by 10.152.125.20 with SMTP id mm20mr13182105lab.6.1329200710314;
	Mon, 13 Feb 2012 22:25:10 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Mon, 13 Feb 2012 22:24:40 -0800 (PST)
In-Reply-To: <857BE142E5399E46B20FD45B9DB8A7BC0FCE7381@SHSMSX102.ccr.corp.intel.com>
References: <04705556464a6e41642962da40f0e17847ee3483.1328510188.git.raj.khem@gmail.com>
	<c68f6de298c35c25638ea3a5adeb06c97cd74036.1328510189.git.raj.khem@gmail.com>
	<4F30DC16.1050506@linux.intel.com>
	<CAMKF1sqTc3PA_4xNbp1751tA73pRazsvrFdwhomdELtb-25ZGg@mail.gmail.com>
	<4F314A73.8070406@linux.intel.com>
	<20120207231245.GA13160@sakrah.homelinux.org>
	<4F31BF7B.4040303@linux.intel.com>
	<CAMKF1sqCgiu0TnTj_rgvDgZ5+JE3uX+Y_5KvKmcfd4LDOAoF2Q@mail.gmail.com>
	<CAGDS+nmdBg8QyBPx6iuG0p0aaPfAU3kvE6jJbekvC2ne0XBedw@mail.gmail.com>
	<54DBF0D0-65DA-4444-8EF5-3E14ED8FE44F@dominion.thruhere.net>
	<20120213074852.GA3832@jama.jama.net>
	<CAGDS+nne1Xbe6XGPuLXqyMLOC_7uqYKFkbRuW77Ub672kpL7BA@mail.gmail.com>
	<60152733-3093-4B6D-8D98-517DEA75C5A2@dominion.thruhere.net>
	<857BE142E5399E46B20FD45B9DB8A7BC0FCE7381@SHSMSX102.ccr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 13 Feb 2012 22:24:40 -0800
Message-ID: <CAMKF1spU8Yw7Uhw6JmkJ1EBm2K8K6Q0Zu_DmdhT8L0aL7nBthw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 12/20] zlib: Upgrade 1.2.5 -> 1.2.6
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
X-List-Received-Date: Tue, 14 Feb 2012 06:33:21 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 13, 2012 at 8:52 PM, Lu, Lianhao <lianhao.lu@intel.com> wrote:
>>>>>
>>>>> It works if you -c cleansstate on a bunch of recipes, pango, cairo, fontconfig, gtk+, etc
>>>>
>
> I tried rpm-native after "-c cleansstate", but it still asks for libz.la? Anyone has the clue?

try to find which native .la files have libz,la in deps
and rebuild them too

>
> Best Regards,
> Lianhao
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


