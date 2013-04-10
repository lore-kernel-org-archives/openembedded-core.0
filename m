Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koansoftware@gmail.com>) id 1UPzk8-0003rd-AI
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Apr 2013 20:27:37 +0200
Received: by mail-ee0-f47.google.com with SMTP id t10so370083eei.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 10 Apr 2013 11:10:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:message-id:date:from:reply-to:organization:user-agent
	:mime-version:cc:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=+NqKN8mv50IfvKL1IGds/FAaTxKvIOXisaduchJLQIk=;
	b=aT1/BWZnCeifT0/lmpsNtFi0X+43UlLq63n6MHG0kkSo3uEq7ljJrYwM9dt8YoPGGr
	9Ask5vNKZeUyTUb2mYHwg8qZjinOiorecwvGfd6NLvJf43drX2Fl9MO3kTsKB/OffwiW
	iGSWY+2AM2ocKVqpYFqsjAC3zeUMIrYRtH0wgNQ1fID9mJjL+drFOsmKrdyBjBwC0yhA
	B+WAUeDXK9KQTyxYHLsMytztjHpqWg+gEeEC1EqZwy3v/JIXwDOae1EwpzbWv28pj1j/
	soNW29NRAqazGRVNaCBPmwDyTme4X4UDfDhM35TZ2kOcYhFitYVuV1J6JpkwvLZ6wHq6
	0aTA==
X-Received: by 10.15.43.73 with SMTP id w49mr8011850eev.12.1365617414520;
	Wed, 10 Apr 2013 11:10:14 -0700 (PDT)
Received: from [10.1.10.33]
	(host61-87-static.14-79-b.business.telecomitalia.it. [79.14.87.61])
	by mx.google.com with ESMTPS id l4sm1271067eem.2.2013.04.10.11.10.12
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 10 Apr 2013 11:10:13 -0700 (PDT)
Message-ID: <5165AB03.8020404@gmail.com>
Date: Wed, 10 Apr 2013 20:10:11 +0200
From: Marco <koansoftware@gmail.com>
Organization: MC
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
CC: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <1365517275-30955-1-git-send-email-m.cavallini@koansoftware.com>
	<CAJTo0LZ6tKy0pDvPzdNw+z80NkXHB0kX7HxntsY_Hd+u3pUPwg@mail.gmail.com>
	<20130409174646.GD2474@jama>
	<C59D9F91-BDCD-496F-B6DA-8C6BB5990939@dominion.thruhere.net>
	<20130409190616.GE2474@jama>
	<929FF6AF-2956-41F0-92E5-E08C5C966909@dominion.thruhere.net>
	<CAHUNapRiB5a6XPwSC_geg+QML4raP2LHHfDCUe__U0hc=WDRSA@mail.gmail.com>
In-Reply-To: <CAHUNapRiB5a6XPwSC_geg+QML4raP2LHHfDCUe__U0hc=WDRSA@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH 2/4] xterm: add latest version of xterm
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: koansoftware@gmail.com
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 10 Apr 2013 18:27:50 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Il 10/04/2013 18:56, Trevor Woerner ha scritto:
> This whole thread has me thoroughly confused. Isn't xterm_277.bb
> <http://xterm_277.bb> already part of meta-openembedded?
>
> $ find . -name "*xterm*" -print
> ./meta-openembedded/meta-oe/recipes-graphics/xorg-app/xterm_277.bb
> <http://xterm_277.bb>
>
> And from what I can tell, it was added over a year ago by Koen:
>
> $ git log meta-oe/recipes-graphics/xorg-app/xterm_277.bb
> <http://xterm_277.bb>
> commit a38efd953c0bfef80fd6819c8339c1d1e79364b3
> Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org
> <mailto:marcin.juszkiewicz@linaro.org>>
> Date:   Thu Dec 13 10:35:26 2012 +0000
>
>      xterm: added gnu-configize for AArch64 support
>      Signed-off-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org
> <mailto:marcin.juszkiewicz@linaro.org>>
>      Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com
> <mailto:Martin.Jansa@gmail.com>>
>
> commit 253b1d7bc35c5a2a12dd6a7f2f0c034a34bfae18
> Author: Koen Kooi <koen@dominion.thruhere.net
> <mailto:koen@dominion.thruhere.net>>
> Date:   Fri Jan 13 09:41:51 2012 +0100
>
>      xterm: update to 277
>      License checksum changed due to date changes
>      Signed-off-by: Koen Kooi <koen@dominion.thruhere.net
> <mailto:koen@dominion.thruhere.net>>
>
>

Yes, it is copied from meta-openembedded into oe-core


-- 
Marco


