Return-Path: <markus.boos@kistler.com>
X-Greylist: delayed 613 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 30 Jan 2015 13:49:48 UTC
Received: from mx2.kistler.com (mx2.kistler.com [195.49.77.176])
	by mail.openembedded.org (Postfix) with ESMTP id 399EB606BF
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 13:49:47 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.09,491,1418079600"; 
   d="scan'208";a="2352369"
Received: from unknown (HELO kihagsepp01.int.kistler.com) ([192.168.52.67])
	by mx2.kistler.com with ESMTP/TLS/DHE-RSA-AES256-SHA;
	30 Jan 2015 14:39:33 +0100
Received: from kihagsepp01.int.kistler.com (localhost [127.0.0.1])
	by kihagsepp01.int.kistler.com (Postfix) with SMTP id 23AB1E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 14:39:33 +0100 (CET)
Received: from mx2.kistler.com (unknown [192.168.52.58])
	by kihagsepp01.int.kistler.com (Postfix) with ESMTPS
	for <openembedded-core@lists.openembedded.org>;
	Fri, 30 Jan 2015 14:39:29 +0100 (CET)
X-IronPort-AV: E=Sophos;i="5.09,491,1418079600"; 
   d="scan'208";a="2352368"
Received: from kihagwinex01.int.kistler.com ([192.168.100.23])
	by mx2.kistler.com with ESMTP/TLS/AES128-SHA; 30 Jan 2015 14:39:29 +0100
Received: from kihagwinex02.int.kistler.com ([fe80::10cf:df86:bb65:2502]) by
	kihagwinex01.int.kistler.com ([fe80::d70:7df0:c903:4e43%16]) with mapi
	id 14.03.0224.002; Fri, 30 Jan 2015 14:39:29 +0100
From: Markus Boos <Markus.Boos@kistler.com>
To: "'openembedded-core@lists.openembedded.org'"
	<openembedded-core@lists.openembedded.org>
Thread-Topic: run ptest for specific packages or layers
Thread-Index: AdA8j9t/YAgNox/FQR+MHtd+NA7d7g==
Date: Fri, 30 Jan 2015 13:39:28 +0000
Message-ID: <345DD4F0215D4B4CB8356943BA192C9913E976EE@kihagwinex02.int.kistler.com>
Accept-Language: de-CH, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.100.116]
MIME-Version: 1.0
Subject: run ptest for specific packages or layers
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
X-List-Received-Date: Fri, 30 Jan 2015 13:49:55 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi

We faced the problem that our image (built with ptest feature) doesn't fit =
into our flash [1].
I'd like to run the ptest on real hardware cause some packages need the mou=
nted FPGA functionality.

What is the best way to proceed?

Extend the ptest class [2] to read in a "local_ptest.conf" which is whiteli=
sting layer or packages where ptest should be built for?

Or is there another solution or proposal how to proceed?

Best regards
Markus

[1]: https://lists.yoctoproject.org/pipermail/automated-testing/2014-Septem=
ber/000077.html
[2]: https://github.com/openembedded/oe-core/blob/master/meta/classes/ptest=
.bbclass

