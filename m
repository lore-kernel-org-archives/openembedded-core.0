Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f177.google.com (mail-yk0-f177.google.com
	[209.85.160.177])
	by mail.openembedded.org (Postfix) with ESMTP id 4C5EE6E87A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 21:01:19 +0000 (UTC)
Received: by mail-yk0-f177.google.com with SMTP id q200so3813389ykb.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Mar 2014 14:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=fl8+WGYhJ/egrnAjfrAEXjNaEoxRxKEPiyyDrR7H1RU=;
	b=JMJci6rMB/gdQBJ8P095HGSxViFOQl95ToiGYFUERZ/mtVE2ocMYaTGTgFRElC7Ubg
	piH+n5RwBuJC3E7fuHpZ8rmaDITl/WuNRkT38vrNzSVP/m75W0yIUanCCx1GBPjCpADz
	rgrfwdH2q5764/MnyA1yoGVfl+zMdO3qD4qSfH9lIWEZcBEVIZmmcC3r2JuSoITjcQG4
	ATzc0l0HiHIYJJBS63nz6xHw3hcJ1heeRRVO5/aZwgXR+k7H8B/bF/HQohBegNPdRO/6
	Ehxe7kbWVEuQlF5WORP97UUummHWovpY/sPwI4eiFbZCim0xgda37T3jGTMIBFDyEYIX
	Opog==
MIME-Version: 1.0
X-Received: by 10.236.18.227 with SMTP id l63mr21995523yhl.101.1395349280866; 
	Thu, 20 Mar 2014 14:01:20 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Thu, 20 Mar 2014 14:01:20 -0700 (PDT)
In-Reply-To: <1395337775-26756-1-git-send-email-fathi.boudra@linaro.org>
References: <1395337775-26756-1-git-send-email-fathi.boudra@linaro.org>
Date: Thu, 20 Mar 2014 18:01:20 -0300
X-Google-Sender-Auth: sdu4QGmf49vbUOvuQXkQ98lA8Ys
Message-ID: <CAP9ODKoaNMqOG331KgJShjTmcmXYkF_rRbqor+ctt+_8VGq1qg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] kernel-arch.bbclass: add arm64 support to U-Bootarchitecture map
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
X-List-Received-Date: Thu, 20 Mar 2014 21:01:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Mar 20, 2014 at 2:49 PM, Fathi Boudra <fathi.boudra@linaro.org> wrote:
> to define UBOOT_ARCH, we map kernel architectures to U-Boot architectures.
> In the case of arm64 kernel, we should map to arm U-boot architecture.
>
> This patch add the exception rule to the map_uboot_arch function.
>
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>

Short log typo.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

