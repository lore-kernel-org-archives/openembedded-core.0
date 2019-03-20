Return-Path: <alexey.brodkin@synopsys.com>
Received: from smtprelay.synopsys.com (smtprelay2.synopsys.com
	[198.182.60.111])
	by mail.openembedded.org (Postfix) with ESMTP id C08646D749
	for <openembedded-core@lists.openembedded.org>;
	Wed, 20 Mar 2019 21:34:01 +0000 (UTC)
Received: from mailhost.synopsys.com (dc2-mailhost2.synopsys.com
	[10.12.135.162])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtprelay.synopsys.com (Postfix) with ESMTPS id B0BAB10C2195;
	Wed, 20 Mar 2019 14:34:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1553117642; bh=4flnvvCqmVRvwEJN0NTaz3arw+8SIQJdT2+zw/dyN/0=;
	h=From:To:CC:Subject:Date:References:In-Reply-To:From;
	b=DoUHfJPqao0Tbmvt6yOBUZP/K3zjaxKkDB8rSdGV3VOIBOtNJX62oCtqFccDdfQqt
	thbuwtRW1EtpxfbmHe54YMeJVU50ldMHpAAtEjS7pLpTy88hAi2/TcY4TEWN2dc77H
	3B64q52+mPC4CN/XGdq3G4lKRDkPl7ftYQcSRV7zKQc+afPdE4DAuXvtl8viJHRJN/
	Yi1GEwOspaFJMbSpXB8bLXCt8MdJIx0GvP5D+om8zSDAnkCPOT0CIjFk2Ew/I+LG1m
	IPJr2tYR/CSja4rpNIjOj0DQcaMPa6SzAONTAtMn6H47GpmfqfBXq9bp6l7t3wr41B
	qTmgQNuYvFm1g==
Received: from US01WXQAHTC1.internal.synopsys.com
	(us01wxqahtc1.internal.synopsys.com [10.12.238.230])
	(using TLSv1.2 with cipher AES128-SHA256 (128/128 bits))
	(No client certificate requested)
	by mailhost.synopsys.com (Postfix) with ESMTPS id 71C4FA0097;
	Wed, 20 Mar 2019 21:34:02 +0000 (UTC)
Received: from DE02WEHTCA.internal.synopsys.com (10.225.19.92) by
	US01WXQAHTC1.internal.synopsys.com (10.12.238.230) with Microsoft SMTP
	Server (TLS) id 14.3.408.0; Wed, 20 Mar 2019 14:34:02 -0700
Received: from DE02WEMBXA.internal.synopsys.com ([fe80::a014:7216:77d:d55c])
	by DE02WEHTCA.internal.synopsys.com ([::1]) with mapi id 14.03.0415.000;
	Wed, 20 Mar 2019 22:34:00 +0100
From: Alexey Brodkin <alexey.brodkin@synopsys.com>
To: "kai.kang@windriver.com" <kai.kang@windriver.com>
Thread-Topic: [PATCH] fixup! qemu: backport patches to fix cves
Thread-Index: AQHU3x8jRtvSCqvhbUCLMs21tZ0OsaYVCkEw
Date: Wed, 20 Mar 2019 21:34:00 +0000
Message-ID: <4881796E12491D4BB15146FE0209CE6468225794@de02wembxa.internal.synopsys.com>
References: <20190320131619.58439-1-kai.kang@windriver.com>
In-Reply-To: <20190320131619.58439-1-kai.kang@windriver.com>
Accept-Language: en-US, ru-RU
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.225.15.89]
MIME-Version: 1.0
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] fixup! qemu: backport patches to fix cves
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
X-List-Received-Date: Wed, 20 Mar 2019 21:34:01 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Kai Kang,

> -----Original Message-----
> From: kai.kang@windriver.com <kai.kang@windriver.com>
> Sent: Wednesday, March 20, 2019 4:16 PM
> To: richard.purdie@linuxfoundation.org
> Cc: alexey.brodkin@synopsys.com; openembedded-core@lists.openembedded.org
> Subject: [PATCH] fixup! qemu: backport patches to fix cves

Just wondering if you were able to reproduce mentioned problem
on your side before fixing it?

Given Richard's input this problem was supposed to be caught
before your previous commit hit OE master branch but somehow it
slipped through the cracks...

Or otherwise my setup should be somehow very special if it only
happens for me.

-Alexey


