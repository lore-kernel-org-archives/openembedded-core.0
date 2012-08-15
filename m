Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1T1YPZ-0003gO-Ry
	for openembedded-core@lists.openembedded.org;
	Wed, 15 Aug 2012 09:53:05 +0200
Received: by eaad12 with SMTP id d12so309852eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 15 Aug 2012 00:41:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=zVDf4qU+y7iQxlZ2dVtvvtDAskc0FFUW8HRYwvtXqWo=;
	b=G4ubHf97cavTN2JLsHl1f0yGQNSe/kvO9QWF0o3O4ScBAu2YA6dP8OuCcEvCX7rdzb
	lmXGH34l7aarAR3GPO/0mFzXfDyXDlgOzoO1SYM0q2G6S+nUzoo1srXEhveGBAG56x0Y
	78AUxGHOh9gduO1orc9KNgbOohgUzT1jbSYarfBeb2FcJ0n+/i1e8JTlOhrO1UFwE3si
	vBC7BTMEwsL9/8iqnX9veDYTwCjQazmRlBguEpwM7HYHicsF1wu9R/VvEcoVRTWQEBqd
	QRMZDuxicBy999sQCgE+CtgO++xKRg6cMsjVKHW5w/N/vIb25+9ESBPH2+IU1RsEMm2a
	71/g==
Received: by 10.14.206.201 with SMTP id l49mr19868595eeo.3.1345016470264;
	Wed, 15 Aug 2012 00:41:10 -0700 (PDT)
Received: from [172.20.0.10] (ip4da2a5ae.direct-adsl.nl. [77.162.165.174])
	by mx.google.com with ESMTPS id h2sm1872961eeo.3.2012.08.15.00.41.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 15 Aug 2012 00:41:09 -0700 (PDT)
Mime-Version: 1.0 (Mac OS X Mail 6.0 \(1485\))
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CAMKF1so5imbcuFU1Ad2FXD8zQmAyLSTbfSS0kNtvQSE_Wj9JbQ@mail.gmail.com>
Date: Wed, 15 Aug 2012 09:41:12 +0200
Message-Id: <8C7A9127-A67A-40DF-AB9E-FB9E4B80F9C4@dominion.thruhere.net>
References: <1345000125-3865-1-git-send-email-b19537@freescale.com>
	<CAMKF1so5imbcuFU1Ad2FXD8zQmAyLSTbfSS0kNtvQSE_Wj9JbQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1485)
X-Gm-Message-State: ALoCoQl4fEjELNHHoQkCuTy6GGSdLpY64YYBwSsN0QuUenBeGqn6tNZbu5pv04IQtsKbN0XuoiJC
Subject: Re: udev: update rcS to auto-detect hostname
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
X-List-Received-Date: Wed, 15 Aug 2012 07:53:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 15 aug. 2012, om 05:01 heeft Khem Raj <raj.khem@gmail.com> het =
volgende geschreven:

> On Tue, Aug 14, 2012 at 8:08 PM,  <b19537@freescale.com> wrote:
>> echo `cat /proc/cpuinfo | grep model | cut -d "," -f 2 | tr "[A-Z]" =
"[a-z]"`
>=20
> $ echo `cat /proc/cpuinfo | grep model | cut -d "," -f 2 | tr "[A-Z]" =
"[a-z]"`
> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
> model : 23 model name : intel(r) core(tm)2 quad cpu q9300 @ 2.50ghz
>=20
> is that what we want ?

On ARM it will be empty:

root@beaglebone:~# echo `cat /proc/cpuinfo | grep model | cut -d "," -f =
2 | tr "[A-Z]" "[a-z]"`

root@beaglebone:~#=


