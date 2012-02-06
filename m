Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RuW44-0004t4-5t
	for openembedded-core@lists.openembedded.org;
	Mon, 06 Feb 2012 22:25:32 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q16LHSXI005405
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 6 Feb 2012 13:17:28 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.232) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Mon, 6 Feb 2012 13:17:27 -0800
Message-ID: <4F304366.8060201@windriver.com>
Date: Mon, 6 Feb 2012 15:17:26 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:9.0) Gecko/20111222 Thunderbird/9.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAMvUbCz0Lts7dUOWWvJeivm9nUb3nuhEqS-QY4+nOYOgmDzEkw@mail.gmail.com>
In-Reply-To: <CAMvUbCz0Lts7dUOWWvJeivm9nUb3nuhEqS-QY4+nOYOgmDzEkw@mail.gmail.com>
Subject: Re: armhf support in OpenEmbedded?
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
X-List-Received-Date: Mon, 06 Feb 2012 21:25:32 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

In oe-core, there are definitions for various tunings that use the ARM EABI w/ 
HF extension.

The following tunings support that mode:  (And armhf is avsolutely not required 
to be for the armv7-a CPU.. it compatible with any CPU that supports VFP 
instructions... note there are armv7-a systems that do -not- have VFP support, 
so these ABI extensions will not work there!)

armv5ehf-vfp armv5tehf-vfp
armv5ehfb-vfp armv5tehfb-vfp
armv5hf-vfp armv5thf-vfp
armv5hfb-vfp armv5thfb-vfp
armv6hf armv6thf
armv6hfb armv6thfb
armv7hf armv7thf armv7hf-neon armv7thf-neon
armv7ahfb armv7athfb armv7ahfb-neon armv7athfb-neon
armv7hf armv7thf armv7hf-neon armv7thf-neon
armv7hfb armv7thfb armv7hfb-neon armv7thfb-neon

See conf/machine/include/arm/*

--Mark

On 2/6/12 3:01 PM, Leon Woestenberg wrote:
> Hello,
>
> do we already have support for the ARM "armhf" ABI in OpenEmbedded? (A quick
> search on the ML didn't get me hits).
>
> Basically,"armhf" is built with -mfloat-abi=hard, and tuned for armv7-a CPUs.
>
>
> http://wiki.debian.org/ArmHardFloatPort
> http://www.powerdeveloper.org/forums/viewtopic.php?p=13645#13645
>
> Regards,
>
> Leon.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



