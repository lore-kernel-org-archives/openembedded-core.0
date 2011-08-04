Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QozrA-0004kG-KR
	for openembedded-core@lists.openembedded.org;
	Thu, 04 Aug 2011 17:29:09 +0200
Received: by yib18 with SMTP id 18so1175956yib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 04 Aug 2011 08:24:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=uhtaXPPTXzCEKUmEepOez8StkIhPTHhgeCM5eN8ff8Q=;
	b=QBr477oBrhiu9BTq0gkpyIOGyHSr3zQRyXaSs6JR9qh4llXr/ubntDBhVV4a96dFbh
	ctmWcd15LT1F9Yn51iAb5uJYbj0U1YgzvErJ0dQg9cUH3dlUehjzPLxdmOopWv9kdo/2
	Ut/TmzpO6HDauXeYl3MhEikGJFfk/bepi/frw=
Received: by 10.142.188.7 with SMTP id l7mr835093wff.385.1312471484121;
	Thu, 04 Aug 2011 08:24:44 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id v2sm2331434pbi.35.2011.08.04.08.24.43
	(version=SSLv3 cipher=OTHER); Thu, 04 Aug 2011 08:24:43 -0700 (PDT)
Message-ID: <4E3AB9B9.9010201@gmail.com>
Date: Thu, 04 Aug 2011 08:24:41 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:5.0) Gecko/20110627 Thunderbird/5.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <EEDE7930-C960-4D86-86EE-D8E1E0A28017@kernel.crashing.org>
In-Reply-To: <EEDE7930-C960-4D86-86EE-D8E1E0A28017@kernel.crashing.org>
Subject: Re: 64-bit gcc hack patch /
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
X-List-Received-Date: Thu, 04 Aug 2011 15:29:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/04/2011 12:55 AM, Kumar Gala wrote:
> What is meta/recipes-devtools/gcc/gcc-4.6/64bithack.patch really accomplishing at this point?
>
> Its not clear to me what benefit or what is really impacted by the following change:
>
>   MULTILIB_OPTIONS = m64/m32
> -MULTILIB_DIRNAMES = 64 32
> -MULTILIB_OSDIRNAMES = ../lib64 $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
> +MULTILIB_DIRNAMES = . 32
> +MULTILIB_OSDIRNAMES = . $(if $(wildcard $(shell echo $(SYSTEM_HEADER_DIR))/../../usr/lib32),../lib32,../lib)
>
> Trying to decide if the ppc equivalent of this patch is really needed or not.

I think this patch should not be needed.

>
> - k
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



