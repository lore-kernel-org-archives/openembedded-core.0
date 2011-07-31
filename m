Received: from mail-pz0-f43.google.com ([209.85.210.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QnKOo-0007hP-Gs
	for openembedded-core@lists.openembedded.org;
	Sun, 31 Jul 2011 03:01:01 +0200
Received: by pzk1 with SMTP id 1so8874228pzk.16
	for <openembedded-core@lists.openembedded.org>;
	Sat, 30 Jul 2011 17:56:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:organization:user-agent:in-reply-to
	:references:mime-version:content-transfer-encoding:content-type;
	bh=dk4ILNnGtt+xvlkvFV3cxF/MotaMSUyYAKOPUHztZSY=;
	b=j/Y3YAMwD+/vfPD0m7ic1mn9nNPLl8tpt2sKUUoO7V3ZV244JlXyoblqPJLzVLHJ1q
	vHKLEnbZdiLF1C6rEX6NOvCxrqNU2Sw8O/ht7wYt+BLlD7pcG8xbcr7QhehMC0XsdegH
	8srsGMfXjrmV9nUEkMa9BWB+qANifDlOcbo2Q=
Received: by 10.142.178.21 with SMTP id a21mr1750726wff.445.1312073799158;
	Sat, 30 Jul 2011 17:56:39 -0700 (PDT)
Received: from perseus.localnet (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id m12sm2127819wfh.7.2011.07.30.17.56.38
	(version=SSLv3 cipher=OTHER); Sat, 30 Jul 2011 17:56:38 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Date: Sat, 30 Jul 2011 17:56:36 -0700
Message-ID: <1651296.NY6EmKFV0b@perseus>
Organization: Sakrah
User-Agent: KMail/4.7.0  (Linux/2.6.38-10-generic; KDE/4.7.0; i686; ; )
In-Reply-To: <4E3496FB.7050605@mentor.com>
References: <cover.1311807353.git.tom_rini@mentor.com>
	<7954213.WCcvt5c9xE@perseus> <4E3496FB.7050605@mentor.com>
MIME-Version: 1.0
Subject: Re: [PATCH 2/9] tcl: Add tcl_cv_api_serial to siteinfo
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
X-List-Received-Date: Sun, 31 Jul 2011 01:01:02 -0000
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Saturday, July 30, 2011 04:42:51 PM Tom Rini wrote:
> On 07/30/2011 10:33 AM, Khem Raj wrote:
> > On Wednesday, July 27, 2011 03:56:46 PM Tom Rini wrote:
> >> This comes from oe.dev which had this set for arm-linux only.  Bump PR
> >> since this changes how builds happen.
> > 
> > if you are clubbing them in right site files then this variable is for
> > deciding what serial API(termios or termio or sgtty) to use its not
> > dependent on libc imo.
> 
> Where do you think it should go?  common-linux?
yes

-- 
Khem Raj


