Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S8XnL-0005fa-M9
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Mar 2012 15:06:15 +0100
Received: by wibhj13 with SMTP id hj13so772609wib.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Mar 2012 06:57:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=onqfFmXC3VKBFXj1AS3aboopZl2HaFgZYxNCrV6pIy0=;
	b=RJKwmJyj/6FNcnNZR6Cm4iSxUOWyy1iVCOTnqa4Tht0HVEpp2t53xLByEOUsrqGvYA
	2xnsCToy6MBUq2+VhkhQf7/HaGIe4CZBvMm4BlqbbDpp4eiTCf1o2K+kouUjIyWAArNX
	6qakI03XPNguYpss9D+dGAg9Rg0g1+SvGsAPOjMCdG55t7RslRhfqoB/CGIjb/lJMk7D
	AUeE15xvQs0HY/d0mpuMyfA32Jg074ccnf8CqvvGwueqCwDp2BddstwSyJUo+Le9SRkm
	8AaeOE9v4x5opl8NJcd0O2DT/E7eYL6Z98uMsOJw5aNRQ0zygWZpf6ybPeSISWqOHU1N
	8IWQ==
Received: by 10.216.138.5 with SMTP id z5mr1718451wei.27.1331906248128;
	Fri, 16 Mar 2012 06:57:28 -0700 (PDT)
Received: from [10.68.37.3] ([87.111.147.121])
	by mx.google.com with ESMTPS id b3sm1553589wib.4.2012.03.16.06.57.26
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 16 Mar 2012 06:57:27 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAP9ODKrhrWvsXMLwz6GCcrNNWJVWzbVxOn55WS6fkN1O4AnFJw@mail.gmail.com>
Date: Fri, 16 Mar 2012 14:57:29 +0100
Message-Id: <C2F1C3EA-2E5C-4E0C-A2BC-4F05B759A9D8@dominion.thruhere.net>
References: <cover.1331859046.git.shane.wang@intel.com>
	<F29B7771-8017-4CB4-AFCF-19CB857CAAD1@dominion.thruhere.net>
	<3AB6CE7F274E534CAFD089D127A8A1FC23AED2D9@SHSMSX102.ccr.corp.intel.com>
	<CAP9ODKrhrWvsXMLwz6GCcrNNWJVWzbVxOn55WS6fkN1O4AnFJw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQm1tzI1Kz00uWgN1fopnbTlq4BZtavEuDKJYasCSeZML0cLCH3OurdVWWVye4r5YIVLbQg4
Subject: Re: [PATCH 00/60] Package Upgrade
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
X-List-Received-Date: Fri, 16 Mar 2012 14:06:15 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 16 mrt. 2012, om 14:47 heeft Otavio Salvador het volgende geschreven:

> On Fri, Mar 16, 2012 at 10:45, Wang, Shane <shane.wang@intel.com> =
wrote:
>> I built those recipes separately, built core-image-sato on qemux86 =
and qemuarm, and launched the image in the emulator and ran some =
applications.
>=20
> What Koen is concerned about is files being removed, huge size changes
> and so on. All those might affect the use of the referred application
> and ought to be check individually for validness.

That and and more. I can't remember a pull request with so many =
mechanical upgrades that didn't break horribly. I'm not a fan of =
spending a few weeks to debug the fallout when the submitter could have =
properly tested the changes first. Especially so close to the point =
where we want to stabilize a lot of layers to prepare for a matched =
oe-core + meta-oe + bsp layers release + branching.
Maybe this pull request is bug free, but I don't know and the submitter =
hasn't tested the most important thing: upgrade paths.=


