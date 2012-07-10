Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sofjf-00071n-HD
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 21:04:35 +0200
Received: by eaal1 with SMTP id l1so117919eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Jul 2012 11:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=KIIloQfxDl9kVIew64sIzm7uGrgU6s4MHTtOrXmcxyA=;
	b=G/RLm4cid7QUPsxowjrpmqClzZZFFYD4A1ZPsWIN7fTqen/X20RDErIzehhtqYwaJR
	lTKiUCPggblDVzwtga+i+zGB/tAE0gNJ3daR893lY+eIffsoMQHfAq91nKqA+BPCR0on
	huaUeq/+d/68Qn7PjnWW0NN4pXN55jYPz/rCM5JWJLeDNuB47Ear0PvFR4xvDBZx++g2
	kbcURSIip3eU9wIcNvgWjM5PXgYLVO0TP0cFXqrQwbQKHaLPbwDdSnZJnteU1y8iCwBr
	eA4hq0EVQKhKaiFXXwmp5Y5+FTtiWf+swv7938eJ+ex+ccokNa/TADRw3oXDV9cCLu7Q
	NPPQ==
Received: by 10.14.99.201 with SMTP id x49mr9110212eef.142.1341946404650; Tue,
	10 Jul 2012 11:53:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Tue, 10 Jul 2012 11:52:54 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.02.1207101433580.3587@oneiric>
References: <1341927124.24837.8.camel@ted>
	<CAEsOVNf0SDnxATQog_8Li1oeK6wkqhVH+m=Bt=L0bBbR02B05Q@mail.gmail.com>
	<1341935849.1294.2.camel@ted>
	<alpine.DEB.2.02.1207101433580.3587@oneiric>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 10 Jul 2012 11:52:54 -0700
Message-ID: <CAMKF1sqrf_hPLpYhY-sJzVBx5pHrV8_VWF9+6OjzKo5+Qqa+qQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: McClintock Matthew-B29882 <B29882@freescale.com>
Subject: Re: bitbake.conf: Add git-native to ASSUME_PROVIDED
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
X-List-Received-Date: Tue, 10 Jul 2012 19:04:35 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jul 10, 2012 at 11:35 AM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
>
>   my opinion, which is mine, is to add a script someone can run that
> tells them what appears to be safe to override from their current
> distro.  that way, it's entirely optional and the developer deals with
> the output at their own risk.

who determines the safeness ? thats what double QA RP mentioned is


