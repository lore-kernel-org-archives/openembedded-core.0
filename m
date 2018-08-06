Return-Path: <prvs=749c0e306=Mikko.Rapeli@bmw.de>
X-Greylist: delayed 651 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 06 Aug 2018 07:07:53 UTC
Received: from esa5.bmw.c3s2.iphmx.com (esa5.bmw.c3s2.iphmx.com
	[68.232.139.67])
	by mail.openembedded.org (Postfix) with ESMTP id E4E6F60402
	for <openembedded-core@lists.openembedded.org>;
	Mon,  6 Aug 2018 07:07:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
	t=1533539276; x=1565075276;
	h=from:to:cc:subject:date:message-id:references:
	in-reply-to:content-id:content-transfer-encoding: mime-version;
	bh=gcRiGgp6EmeudEzZHgZe/IsThDYDERKrVy+q6VhXD4M=;
	b=QXZVq/+F0IzgzIFC8HdHrk6lDBhlLRcgZqPLMxLlV8lpCygDQJVG4uUL
	ujPNo3H/ILODPOLDSU+2v25UyutAw3b5rnxfbeVh17iFFycWWMgnXQDAq
	Sp9laT+fX27pj+nq1Bw7d7m34QXFKom2yEAEMgdteCiAoAd8TpyLcSwRR A=;
Received: from esagw1.bmwgroup.com (HELO esagw1.muc) ([160.46.252.34]) by
	esa5.bmw.c3s2.iphmx.com with ESMTP/TLS; 06 Aug 2018 08:56:56 +0200
Received: from esabb3.muc ([160.50.100.30])  by esagw1.muc with ESMTP/TLS;
	06 Aug 2018 08:56:54 +0200
Received: from smucm10l.bmwgroup.net (HELO smucm10l.europe.bmw.corp)
	([160.48.96.48])
	by esabb3.muc with ESMTP/TLS; 06 Aug 2018 08:56:54 +0200
Received: from smucm10k.europe.bmw.corp (160.48.96.47) by
	smucm10l.europe.bmw.corp
	(160.48.96.48) with Microsoft SMTP Server (TLS;
	Mon, 6 Aug 2018 08:56:54 +0200
Received: from smucm10k.europe.bmw.corp ([160.48.96.47]) by
	smucm10k.europe.bmw.corp ([160.48.96.47]) with mapi id 15.00.1367.000;
	Mon, 6 Aug 2018 08:56:54 +0200
From: <Mikko.Rapeli@bmw.de>
To: <gtertych@cisco.com>
Thread-Topic: [OE-core] [PATCH 1/2] cve-report: add scripts to generate CVE
	reports
Thread-Index: AQHULVKohA9q6/6tL0GbhhBkHPrO9g==
Date: Mon, 6 Aug 2018 06:56:54 +0000
Message-ID: <20180806065653.GG8291@hiutale>
References: <1533335883158.4719@cisco.com>
In-Reply-To: <1533335883158.4719@cisco.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [192.168.221.37]
MIME-Version: 1.0
Cc: xe-linux-external@cisco.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] cve-report: add scripts to generate CVE reports
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 06 Aug 2018 07:07:54 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-ID: <0A8AC695BE82C342829A0F5E843F69AE@bmwmail.corp>
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 03, 2018 at 10:37:05PM +0000, Grygorii Tertychnyi (gtertych) vi=
a Openembedded-core wrote:
> cvert-kernel - generate CVE report for the Linux kernel.
>   NVD entries for the Linux kernel is almost always outdated.
>   For example, https://nvd.nist.gov/vuln/detail/CVE-2018-1065
>   is shown as matched for "versions up to (including) 4.15.7",
>   however the patch 57ebd808a97d has been back ported for 4.14.
>   cvert-kernel script checks NVD Resource entries for the patch URLs
>   and looking for the commits in the local git tree.

This is an interesting approach.

For the kernel I've been using information not from NVD but from
https://github.com/nluedtke/linux_kernel_cves/

As an example, all CVE fixed in 4.14 kernel series point releases AND all
non-fixed CVE are listed in:

https://github.com/nluedtke/linux_kernel_cves/blob/master/4.14/4.14_securit=
y.txt

I have not tried to automate this, but I do find the information there
much better than NVD.

-Mikko=

