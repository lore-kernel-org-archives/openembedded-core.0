Return-Path: <martin.donnelly@ge.com>
Received: from exprod5og118.obsmtp.com (exprod5og118.obsmtp.com [64.18.0.160])
	by mail.openembedded.org (Postfix) with ESMTP id F217260881
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Jun 2013 08:48:26 +0000 (UTC)
Received: from cinmlip11.e2k.ad.ge.com ([165.156.4.1]) (using TLSv1) by
	exprod5ob118.postini.com ([64.18.4.12]) with SMTP
	ID DSNKUaxYW02/43yDUxEgniFRd2m0xD1SJ5bb@postini.com;
	Mon, 03 Jun 2013 01:48:28 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by cinmlip11.e2k.ad.ge.com with ESMTP/TLS/RC4-SHA;
	03 Jun 2013 04:48:26 -0400
Received: from selma.edi.geip.ge.com ([3.26.68.70])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 03 Jun 2013 04:48:26 -0400
Received: from [3.26.68.199] (fyvie.edi.geip.ge.com [3.26.68.199])
	(using TLSv1 with cipher DHE-RSA-CAMELLIA256-SHA (256/256 bits))
	(No client certificate requested)
	by selma.edi.geip.ge.com (Postfix) with ESMTPS id 47667E04D5;
	Mon,  3 Jun 2013 09:48:25 +0100 (BST)
Message-ID: <51AC5859.70003@ge.com>
Date: Mon, 03 Jun 2013 09:48:25 +0100
From: Martin Donnelly <martin.donnelly@ge.com>
Organization: GE Intelligent Platforms
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <51A9294F.1090101@windriver.com>
In-Reply-To: <51A9294F.1090101@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: gcc 4.8 - ICE
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
X-List-Received-Date: Mon, 03 Jun 2013 08:48:27 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 31/05/2013 23:50, Mark Hatle wrote:
> 
> I suspect the ppce500v2 tuning hasn't been used much, but it appears to
> trigger the failure case.
> 
> Should I enter a bug for this issue in the YP bugzilla?  I can also
> attempt to file a bug w/ gnu this weekend or early next week.

There is already one there
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4495

Cheers

-Martin

