Return-Path: <bunk@stusta.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id 5071C7DE5A
	for <openembedded-core@lists.openembedded.org>;
	Wed,  8 May 2019 13:12:27 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 44zcMb5fjZz1M;
	Wed,  8 May 2019 15:12:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1557321148;
	bh=EQLFoqXoUdmy97X9b2MVUTWkiq/9QShPwo1Ats7dhFg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QbBPAxCuOSYel7q/VjKyNCZrrG7bdqY1JwiRmy1PSAhJUwHYeLJXglZJF+oVbtWDC
	+BS+f3qzISHLcyccL+/xXpqgJew/jfnOSdXRt8qE65DiYNDv5F5jialmHIAun1W2R2
	yHLUOiRU/UewYNqDHTlvfLVIvuPP2S4jO6DqSojbbIej1pwHu9VsMQW7cQXAZlcLkF
	P+hf8mjmbws2JmrHKCUFfxP5rSjoJD8aNAP17XoNfDA2qkG7M8RPHOn//H9nJJbtlm
	Bh4maArlNQtsSvI86ivXdH2D/6CDoSLFgF79Ixd12g9onB2fHXB2ZDFMucGKuwHSdf
	DO2DXhaJbtB1OlN+NcpvCaaIt/bpWuKVN/pUKErIu1jk12isTydn/2vyTtkAkfKahn
	AfCAPmdAo4z9EMxcgS2I1rpTZqPXMgbsBLu8aPGHCq3c1zXspDRjqQckJEdWiMsDaq
	63OVEu3Jw2rH9sGR3ZH4qMOqvPZonDdmtF3OgUexBZKA3t+IRkeHalqr/DfyuT5DFN
	S6z7SSmF1y7vO222yNS2iu/odMst7qCeTtaWGreiiB4VM0rerFSz5wwT19iFz8byam
	oyEiDzKdpg8svV6r317cq3FHkoGX4zav6+8Cz3fqXuoHcitn8Mp47TWSuHNMOCQAzB
	/yzfkqVrzknf+ynVuaMHDSUc=
Date: Wed, 8 May 2019 16:12:25 +0300
From: Adrian Bunk <bunk@stusta.de>
To: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Message-ID: <20190508131225.GB25917@localhost>
References: <20190507211954.10762-1-open.source@oleksandr-kravchuk.com>
MIME-Version: 1.0
In-Reply-To: <20190507211954.10762-1-open.source@oleksandr-kravchuk.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] bitbake.conf: remove GPE_MIRROR
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
X-List-Received-Date: Wed, 08 May 2019 13:12:28 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Tue, May 07, 2019 at 11:19:54PM +0200, Oleksandr Kravchuk wrote:
> The site is down and no recipe is this variable.
>...

Not in OE-Core, but
meta-openembedded/meta-oe/classes/gpe.bbclass:SRC_URI = "${GPE_MIRROR}/${BP}.tar.${GPE_TARBALL_SUFFIX}"
meta-openembedded/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb:inherit distro_features_check gpe


cu
Adrian

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed


