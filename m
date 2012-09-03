Received: from mail-we0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T8XTf-0006gs-JK
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 16:18:11 +0200
Received: by weyr6 with SMTP id r6so3147181wey.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2012 07:05:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=zxgAsJooXH6VcJn96U7cIEEvpmZ6quyBiJRhl64q9QA=;
	b=Wni/VtB1zYg3Kitk5LNdViMFuYMY/zN2Kk1amjlQFY2iXERv28pfStMlfjUJQm0X8G
	cfpst2L3hC3mh0MUcr3seX9ZsaC0FXpS8UD7lxiQJ4GkbXKpG5sIZ07YsyIwYQQ/qG7r
	mgL7CCx81yOQtV/2hrMQaJoghEDT/o61wwe5sYUnWRRWQM+XT3hJbAzrBEXJ00tDrEEz
	ilZmmuBk+F574hRCdU9L/xPWBqnS/5U66dQSuLoYSJ477vmgDarUY1SSzd80xsfP6Ma+
	alp03hUlpCbhaPmpFXGT0bOLN1OLWTLHHhTUKm6Wj4DWdLSNHynskdR4t0x1hnCPjimg
	P2GA==
Received: by 10.180.14.8 with SMTP id l8mr23582632wic.6.1346681149097;
	Mon, 03 Sep 2012 07:05:49 -0700 (PDT)
Received: from [172.20.0.49] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id hv8sm19614165wib.0.2012.09.03.07.05.46
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 03 Sep 2012 07:05:48 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1486\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAJTo0Lbn5ow1yMDj5X-c77CxNDNQJri4cWH_WdBEU3guWJdfrg@mail.gmail.com>
Date: Mon, 3 Sep 2012 16:05:43 +0200
Message-Id: <83D2678E-81E3-40A6-8766-53CD395C8205@dominion.thruhere.net>
References: <1345650627-3232-1-git-send-email-paul.eggleton@linux.intel.com>
	<1345653628.3907.124.camel@ted>
	<CAJTo0Las+a6gpTqgu3221qaeyO4B7BuLRDzFrSJNgN1WD48Rig@mail.gmail.com>
	<8068324.QSSVEOGDPm@helios>
	<CAJTo0Lbn5ow1yMDj5X-c77CxNDNQJri4cWH_WdBEU3guWJdfrg@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
X-Mailer: Apple Mail (2.1486)
X-Gm-Message-State: ALoCoQkHHPtlBq1r2oqGyhxWxW1pFLhqaCQPFdqtMfMo/ZS8Be7OPoWmeS3d5HVWwUHVbI0dV1En
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] zeroconf: remove - RFC
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
X-List-Received-Date: Mon, 03 Sep 2012 14:18:11 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 3 sep. 2012, om 15:53 heeft "Burton, Ross" <ross.burton@intel.com> =
het volgende geschreven:

> On 3 September 2012 14:47, Paul Eggleton =
<paul.eggleton@linux.intel.com> wrote:
>> So, where does that leave us with this patch then?
>=20
> I'd say merge it, if anyone really needs a tiny mDNS responder they
> can dig it out.

And put it in meta-networking instead of oe-core :)=


