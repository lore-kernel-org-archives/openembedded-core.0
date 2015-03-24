Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id B975573A99
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 Mar 2015 19:30:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id AC3063151B0B;
	Tue, 24 Mar 2015 20:30:09 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 07qTpRELBMiS; Tue, 24 Mar 2015 20:30:03 +0100 (CET)
Received: from [172.22.22.61] (55d45afc.access.ecotel.net [85.212.90.252])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 1E5233151B0A;
	Tue, 24 Mar 2015 20:30:03 +0100 (CET)
Message-ID: <5511BB3A.40302@opendreambox.org>
Date: Tue, 24 Mar 2015 20:30:02 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: =?UTF-8?B?QW7DrWJhbCBMaW3Ds24=?= <anibal.limon@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <1427126707-38854-1-git-send-email-anibal.limon@linux.intel.com>
	<55115179.7050506@opendreambox.org>
	<55119205.9040605@linux.intel.com>
	<55119FF4.6050800@linux.intel.com>
In-Reply-To: <55119FF4.6050800@linux.intel.com>
Subject: Re: [PATCH] package_manager/deb: apt-ftparchive needs a valid config
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
X-List-Received-Date: Tue, 24 Mar 2015 19:30:13 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On 24.03.2015 18:33, Aníbal Limón wrote:
> I reviewed the code and the issue is why PM's and Indexer's are
> different classes i think they need to share common information.
> For now your patch is the best solution, now i'm doing a little
> improvements and i'll send v2 with your signature.

Thank you, Aníbal!

Btw., I think your development machine has a wrong timezone setting.
Your patches appear to have a time offset of about seven hours.

Regards,
Andreas


