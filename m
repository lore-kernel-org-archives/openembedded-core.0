Received: from mail-wi0-f171.google.com ([209.85.212.171])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1SB7Qq-0007pe-70
	for openembedded-core@lists.openembedded.org;
	Fri, 23 Mar 2012 17:33:40 +0100
Received: by wibhj13 with SMTP id hj13so1979623wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 23 Mar 2012 09:24:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=yPOHyTfEJ+wQCirvtWWT0pT9GMoJ6oBuN2/pI9q5YGs=;
	b=Ctv9O1wrJmoT7bO959mHAOc0sPn0K/bPZNCB2nSBxtSB8h3fHlaVFocJ7nUEJ2cI4W
	xxmBaa3KcPVanH0j5piKpTw1eax3go61+l7wuxWIOnIgWh5XCQV960+UMTsSvblVvA6q
	qrmz9J6Lv0FnWDLCGQpd4hXfxNee/pO6+rtir6E5+rkMYfsy//wkqXf5m/z7SEO0Fcgq
	vF1wgRiQU//D5oIVtuPpEr2F8psk1lCo4JWifg7L+UQQLjMCAAUjFPjTGO4E57QPR6pS
	S9F5W8f9ORguINgSS1vaVolOhC+FbZ+3cCG9cSmbUKCMzTHcb1GEuBnYYkC3re6u55H+
	PTQA==
Received: by 10.180.102.231 with SMTP id fr7mr7923992wib.10.1332519884132;
	Fri, 23 Mar 2012 09:24:44 -0700 (PDT)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id n15sm14972663wiw.6.2012.03.23.09.24.42
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 23 Mar 2012 09:24:43 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <3214701.W7HFGlpmRA@helios>
Date: Fri, 23 Mar 2012 17:24:38 +0100
Message-Id: <B31C3748-FFDF-4546-AB8F-4063AD96401D@dominion.thruhere.net>
References: <1332429941-19621-1-git-send-email-koen@dominion.thruhere.net>
	<4330166.INQO86P9ch@helios>
	<DB5813F2-48CD-4353-BE92-A090AEA00FBC@dominion.thruhere.net>
	<3214701.W7HFGlpmRA@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkhrETzESZoZ1j8LLfuRyrQ8w04qqkSs6GvzvxHwfCZDliyeUyZ8LQwSveeWpV4oAaKuC5y
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCHv3 2/3] buildhistory: record all builds
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
X-List-Received-Date: Fri, 23 Mar 2012 16:33:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 23 mrt. 2012, om 16:53 heeft Paul Eggleton het volgende geschreven:

> On Friday 23 March 2012 16:48:35 Koen Kooi wrote:
>> I get that, but I'm having trouble coming up with something that =
isn't
>> already covered but the "record all builds" statement :(
>=20
> I know what you mean, but I think that just stating its "so that the =
commit=20
> log of the buildhistory repo provides a complete log of all builds =
performed,=20
> not just those that resulted in changes" would be sufficient.

Added that, thanks!

I'll respin 3/3 with Chris' feedback as well.

regards,

Koen=


