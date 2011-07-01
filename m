Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QchPV-00023F-Pd
	for openembedded-core@lists.openembedded.org;
	Fri, 01 Jul 2011 19:21:46 +0200
Received: by pzk36 with SMTP id 36so830483pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Jul 2011 10:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=kV1xlml0Y52NkJaeuQZWAG0T172755yVwok4g9QES9g=;
	b=agzxIbXOBYgE34PAlsfAmTSAANDY8NRXYJ5Ivop4hVhmLXhplubAUcOKnkghDOlJ7G
	uX6y7swEU+DdBkTsRNyMP1Mxnyv6qyW5kzTVKj4A0laTr6zXW8/iiB3jpqKeknyrbjDD
	mYrNugy0EqMaIMpc5VX+5dxfG5ZeEv/T7vHaQ=
Received: by 10.142.248.12 with SMTP id v12mr1473905wfh.134.1309540606103;
	Fri, 01 Jul 2011 10:16:46 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id l10sm2196249wfk.21.2011.07.01.10.16.44
	(version=SSLv3 cipher=OTHER); Fri, 01 Jul 2011 10:16:45 -0700 (PDT)
Message-ID: <4E0E00FA.1060508@gmail.com>
Date: Fri, 01 Jul 2011 10:16:42 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1309446689-21243-1-git-send-email-koen@dominion.thruhere.net>	<201106301633.48933.paul.eggleton@linux.intel.com>	<4FC82E26-5A0C-48DF-99F5-7E2D9B8C7290@dominion.thruhere.net>	<201106301659.54941.paul.eggleton@linux.intel.com>	<1309537504.20015.531.camel@rex>
	<1309540367.20015.534.camel@rex>
In-Reply-To: <1309540367.20015.534.camel@rex>
Subject: Re: [PATCH] insane bbclass: turn fatal errors back into fatal errors
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
X-List-Received-Date: Fri, 01 Jul 2011 17:21:46 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/01/2011 10:12 AM, Richard Purdie wrote:
> gcc-4.6.0+svnr175150, non dev contains .so, gcc, /work/i586-poky-linux/gcc-4.6.0+svnr175150-r4/packages-split/gcc/usr/libexec/gcc/i586-poky-linux/4.6.1/liblto_plugin.so
>>

This should be packages with gcc itself. May be adding to FILES will get 
rid of this warning


