Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T73sd-0005jJ-Ni
	for openembedded-core@lists.openembedded.org;
	Thu, 30 Aug 2012 14:29:51 +0200
Received: by wibhn17 with SMTP id hn17so170917wib.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Aug 2012 05:17:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=S9gN/YBTf4Dbq37d1RHgO2IOFe3NswXMqbVlzcALCvc=;
	b=lCA6DDE5w2MEZGKrEuwml6geopSnql5q7soNam+3XqgMqvSwaYKFu1Hv1PcfcORBCs
	KnV31rQloX5eeiZABsT+pAhLn4gQgtkxdwgPMmKppkwv8HIACfKtcaO70ItGaGtaXKje
	rq1VPOdJJ7TKyEYd7MSsu7JLGG2yR+wgKn2/nl8ys0auLOMRMD92XSHlCkf1Bj9ohPt/
	d3Hnlgt/m54zK6Bc9B4ByqaqQ/yrqZc1c/1ovjXvQP/9v5NufEwu+dEWW0en3GGBoLkz
	h3LK/uDj76x2eznfHhWbfj90d3eeJuNcJZ8NJJekAfImlr8Whio2E5QiN0sMPwHBdG70
	iYfA==
Received: by 10.180.20.11 with SMTP id j11mr187419wie.12.1346329056586;
	Thu, 30 Aug 2012 05:17:36 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id cu1sm539572wib.6.2012.08.30.05.17.34
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 30 Aug 2012 05:17:35 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0LY5=R5=7BGtt3LkstRhRb2Ycd1oDJFDoKygtc8KcC4W8w@mail.gmail.com>
Date: Thu, 30 Aug 2012 14:17:35 +0200
Message-Id: <F37371D0-84A6-4E9C-9455-72409B92E29C@dominion.thruhere.net>
References: <1346255613-13401-1-git-send-email-ross.burton@intel.com>
	<92175252-0A9C-401F-87F5-751E4CFB8611@dominion.thruhere.net>
	<CAJTo0LY5=R5=7BGtt3LkstRhRb2Ycd1oDJFDoKygtc8KcC4W8w@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQm6XG+D9PyK6h4awIFnRxxpVEK58ffYejpkLT1xh3dzsPLW6zZ17GBT53HD/quK5RxNa6eq
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] xserver-xorg: ship the exa module in a separate package
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
X-List-Received-Date: Thu, 30 Aug 2012 12:29:51 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 30 aug. 2012, om 13:28 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 29 August 2012 17:51, Koen Kooi <koen@dominion.thruhere.net> wrote:
>> FWIW, the idea of those subpackages was to split every module out, =
but I haven't kept up with xorg modules for some years now.
>=20
> There's also a lot of work ensuring that the dependencies are in place
> because they can't be automatically inferred.  I'm happy leaving
> fb/fbdev/shadow/shadowfb in the main package for now...

Indeed. In the past I had every device using full Xorg in OE on my desk, =
but with the demise of kdrive and the adoption rate of OE it has become =
impossible to have access to each device :)=


