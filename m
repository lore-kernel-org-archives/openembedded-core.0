Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S1nIK-0006Ie-TC
	for openembedded-core@lists.openembedded.org;
	Mon, 27 Feb 2012 00:14:20 +0100
Received: by wgbdr12 with SMTP id dr12so1189615wgb.24
	for <openembedded-core@lists.openembedded.org>;
	Sun, 26 Feb 2012 15:05:55 -0800 (PST)
Received-SPF: pass (google.com: domain of koen@dominion.thruhere.net
	designates 10.216.144.138 as permitted sender)
	client-ip=10.216.144.138; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	koen@dominion.thruhere.net designates 10.216.144.138 as
	permitted sender) smtp.mail=koen@dominion.thruhere.net
Received: from mr.google.com ([10.216.144.138])
	by 10.216.144.138 with SMTP id n10mr2537992wej.56.1330297555625
	(num_hops = 1); Sun, 26 Feb 2012 15:05:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=gamma;
	h=subject:mime-version:content-type:from:in-reply-to:date:cc
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=jMACJaNz1I4uYflmLLzaYSlWoZwug0n3s8pfmMHafOU=;
	b=ydVYWG3xKgJw5m5eUJMbFJrAF1JVYvEtsA6yJCrUrHdlg8GreRB5HIVizPNfpPmWg/
	H/oo8vpyaPV5/Lf0jY2RDvK7DGUkh8oNc/MKQ/M6ji4iYyryDULMIIBC0v+WExgR1LSA
	K4jgSSqb5Rk3dFDIZjtw3xWP7koPqWEjQx1yg=
Received: by 10.216.144.138 with SMTP id n10mr2044564wej.56.1330297555557;
	Sun, 26 Feb 2012 15:05:55 -0800 (PST)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id dr5sm46005316wib.0.2012.02.26.15.05.54
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sun, 26 Feb 2012 15:05:54 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <1770784.lEEKdoRJtu@helios>
Date: Mon, 27 Feb 2012 00:05:53 +0100
Message-Id: <A6DE8A8B-66DB-4D6E-90ED-ECAED8C60A3A@dominion.thruhere.net>
References: <cover.1330294151.git.paul.eggleton@linux.intel.com>
	<b5c5d99d64381f508be653cc48e793f1e25eb2fe.1330294151.git.paul.eggleton@linux.intel.com>
	<1A634368-87AC-4206-8B0C-3729A478FF0C@dominion.thruhere.net>
	<1770784.lEEKdoRJtu@helios>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQm0Gr0+vt36ghHN9ONxT3kQGfo7IqHqjTx75EBynBiSHuDZNlM8jH1mO4IIaZqw4Qtuz2q9
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/4] qt4: fix compile error in Qt 4.8.0 with gcc 4.6
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
X-List-Received-Date: Sun, 26 Feb 2012 23:14:21 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 feb. 2012, om 23:59 heeft Paul Eggleton het volgende geschreven:

> On Sunday 26 February 2012 23:55:25 Koen Kooi wrote:
>>> +Upstream-Status: Inappropriate [configuration]
>>> +
>>> +Signed-off-by: Paul Eggleton <paul.eggleton@linux.intel.com>
>>=20
>> Can I bribe you to make those proper git patches? :)
>=20
> Is it useful given that it's not suitable for sending upstream?

It's useful for people like me that have a custom PATCHTOOL that uses =
git-am. It also makes git am -3 work when updating to a newer version.

regards,

Koen=


