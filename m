Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 6A5C170276
	for <openembedded-core@lists.openembedded.org>;
	Mon,  7 Jul 2014 23:37:29 +0000 (UTC)
Received: from localhost (dan.rpsys.net [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu4) with ESMTP id
	s67NbOKQ021221; Tue, 8 Jul 2014 00:37:25 +0100
X-Virus-Scanned: Debian amavisd-new at dan.rpsys.net
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id y_mH-lnx-57a; Tue,  8 Jul 2014 00:37:24 +0100 (BST)
Received: from [192.168.3.10] (rpvlan0 [192.168.3.10]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-2.1ubuntu1) with ESMTP id
	s67NbLu5021188
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES128-SHA bits=128 verify=NOT);
	Tue, 8 Jul 2014 00:37:22 +0100
Message-ID: <1404776235.1458.51.camel@ted>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Robert Yang <liezhi.yang@windriver.com>
Date: Tue, 08 Jul 2014 00:37:15 +0100
In-Reply-To: <28a4822de67dfb01eddd7cc9f10bd820411e1425.1404465351.git.liezhi.yang@windriver.com>
References: <cover.1404465351.git.liezhi.yang@windriver.com>
	<28a4822de67dfb01eddd7cc9f10bd820411e1425.1404465351.git.liezhi.yang@windriver.com>
X-Mailer: Evolution 3.8.4-0ubuntu1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass/buildtools-tarball: cleanup the RDEPENDS
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
X-List-Received-Date: Mon, 07 Jul 2014 23:37:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2014-07-04 at 02:16 -0700, Robert Yang wrote:
> The "RDEPENDS =" should be replaced by RDEPENDS_${PN}, the similar to
> RRECOMMENDS

Why?

PACKAGES = "" for these recipes so there is no ${PN} package to add
these dependencies too?

I suspect this is from your image class modifications but did you test
without those modifications?

Cheers,

Richard


