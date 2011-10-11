Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1RDjVr-0004lo-T8
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Oct 2011 23:05:23 +0200
Received: by eyd9 with SMTP id 9so45259eyd.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Oct 2011 13:59:41 -0700 (PDT)
Received: by 10.223.91.87 with SMTP id l23mr43160696fam.5.1318366781339;
	Tue, 11 Oct 2011 13:59:41 -0700 (PDT)
Received: from [172.20.0.96] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id x22sm182521faa.5.2011.10.11.13.59.40
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 11 Oct 2011 13:59:40 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1244.3)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4E94AB7A.6050603@intel.com>
Date: Tue, 11 Oct 2011 22:59:35 +0200
Message-Id: <CBC51C50-4E8D-45AC-98D5-7131F7A5A28E@dominion.thruhere.net>
References: <1317403283-17471-1-git-send-email-msm@freescale.com>
	<4E94AB7A.6050603@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1244.3)
Cc: Matthew McClintock <msm@freescale.com>
Subject: Re: [PATCH v3 01/16] libnl2: Fix a race on route/pktloc_syntax.h
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
X-List-Received-Date: Tue, 11 Oct 2011 21:05:24 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 11 okt. 2011, om 22:47 heeft Saul Wold het volgende geschreven:

> On 09/30/2011 10:21 AM, Matthew McClintock wrote:
>> From: Tom Rini<tom_rini@mentor.com>
>>=20
>> At issue is that route/pktloc.c (not generated) depends on
>> route/pktloc_syntax.h (generated).
>>=20
>> Signed-off-by: Tom Rini<tom_rini@mentor.com>
>> Signed-off-by: Matthew McClintock<msm@freescale.com>
>> ---
>>  .../libnl/fix-pktloc_syntax_h-race.patch           |   26 =
++++++++++++++++++++
> I just noticed that this patch get put in the libnl directory, not the =
libnl-2.0 directory.
>=20
> Can you pull all the libnl changes together and resbumit this, also is =
there a reason you can not just update this to the latest libnl 3.2.1?

libnl3 is *again* incompatible with its previous version, like libnl2 is =
incompatible with libnl1.




