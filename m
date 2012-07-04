Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <alexandru.damian@intel.com>) id 1SmOrP-00011h-8D
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jul 2012 14:39:11 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 04 Jul 2012 05:27:00 -0700
Received: by lbbgj3 with SMTP id gj3so9164175lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jul 2012 05:26:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:cc:content-type
	:x-gm-message-state;
	bh=kpPgGYVFTkxiwv5vCNuoQ0Sa5lwwH2+/JO+2xky//dM=;
	b=DE+EKmlcR+mGNMdlw3i+xktKfR/WVZ8PYqXl4xDUZHsh2pUtGMxXht2hmKPNk+t1Sa
	tjZqwiPAwb5aqUV2x98haF4Xef0Cu1jnFfa6HDPAtKPGCHP6Bt6KqPG7HARsTHh6HfdI
	quU8Ghr/zcAG/0uMUunR6gtkPAqeCBeD9Jmv/n+eNYinjzk45YQLGW98uVNE93gL9rke
	EawHeFrg0dLF/UgkcwgvwXTuEDhnjxGJz7VnHRAlj2FD9jUm3mZo5OStfRGcm8piryL0
	Lfxe9BB0TiciTlyZ0PVcIyG40aqxlOTc879Db/ik9HADOmKvNbg3I40Jj/bznh7BRmpG
	r7FA==
MIME-Version: 1.0
Received: by 10.152.108.144 with SMTP id hk16mr21573455lab.2.1341404818251;
	Wed, 04 Jul 2012 05:26:58 -0700 (PDT)
Received: by 10.112.38.132 with HTTP; Wed, 4 Jul 2012 05:26:58 -0700 (PDT)
Date: Wed, 4 Jul 2012 15:26:58 +0300
Message-ID: <CAJ2CSBu1HFggNOqVQt4jnH6_swNmUa5T+RrWf06h-epcNBkbuA@mail.gmail.com>
From: "Damian, Alexandru" <alexandru.damian@intel.com>
To: Saul Wold <saul.wold@intel.com>
X-Gm-Message-State: ALoCoQkY1QI+3aJLWTR5mTCkLmCAz5E2ldAFjtHfz6HwvgmEU1O/bgYE9TkLIntiLshiYHXRA5WZ
Cc: openembedded-core@lists.openembedded.org
Subject: erroneously marked packages
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
X-List-Received-Date: Wed, 04 Jul 2012 12:39:11 -0000
Content-Type: multipart/alternative; boundary=bcaec54d4dd6b1212104c40025e1

--bcaec54d4dd6b1212104c40025e1
Content-Type: text/plain; charset=ISO-8859-1

Hi Saul,

Some packages don't need upgrade, even if they are in the list, because the
detection was wrong.

How do we handle those ?
I'm talking here about:
- u-boot-mkimage, the 2012.04.1 version is already in the tree
- js, the 1.6 (target) is older than current version
- mobile-broadband-provider-info, target 20090309 is older than current
version


Alex

--bcaec54d4dd6b1212104c40025e1
Content-Type: text/html; charset=ISO-8859-1

Hi Saul, <br><br>Some packages don&#39;t need upgrade, even if they are in the list, because the detection was wrong.<br><br>How do we handle those ?<br>I&#39;m talking here about:<br>- u-boot-mkimage, the 2012.04.1 version is already in the tree<br>
- js, the 1.6 (target) is older than current version<br>- mobile-broadband-provider-info, target 20090309 is older than current version<br><br><br>Alex<br>

--bcaec54d4dd6b1212104c40025e1--
