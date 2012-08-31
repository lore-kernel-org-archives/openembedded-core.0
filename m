Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T7YU9-0001rO-C2
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 23:10:37 +0200
Received: by eaad12 with SMTP id d12so860323eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 13:58:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=UB7+H97WWyKO+E1etFeULy33dyyp/Ty5ekKzo4rTzO0=;
	b=IfqTr38kEbvnwoaXDwfnbKUnn/Vsokm140hg0UHBCGqqXSpdrMeORqMOFOzV0iRtPV
	VyW6nYdTcaWLeGv+f0P+RZxxIF8FHcPBsaFMcblIu3MrpBdxgn2U86kV/o6u7FDpdWDG
	GkwcRaYjxHkmRINFOfJCTRPfBpOTz0fk2d7CsFlwc5Tth7i10U+aW9XbDHtceqREeapi
	wciDFSCa2Y8LlB7c3vg79RbHOv/Y/qVgeZm9taesFgS4D0qyezrHAx81B/fM5dmsbfQU
	IHPAe2GUCfl4eTo+XvMK3X3uKKJKEIeh05vOfOg4ca99+Q6Phi10FLlOIIgOa1DwEN2j
	uC/g==
Received: by 10.14.218.134 with SMTP id k6mr12838124eep.14.1346446700323; Fri,
	31 Aug 2012 13:58:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 31 Aug 2012 13:57:50 -0700 (PDT)
In-Reply-To: <5040D8FE.3050506@linux.intel.com>
References: <1346422229-61628-1-git-send-email-bjst@enea.com>
	<1346422229-61628-3-git-send-email-bjst@enea.com>
	<5040D8FE.3050506@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Aug 2012 13:57:50 -0700
Message-ID: <CAMKF1sqymqSHOc7Yng8J-3Jx+Pg6TgusN+6qzROm0T3DZcUHgg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/3] Enable bash-ptest
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
X-List-Received-Date: Fri, 31 Aug 2012 21:10:37 -0000
Content-Type: text/plain; charset=UTF-8

> Should this be a DISTRO or IMAGE FEATURE? I can see potential arguments for
> both sides, what was your thinking on choosing IMAGE over DISTRO?

this is IMAGE_FEATURE that can then be recommended/mandated in a distro policy
is upto distros


