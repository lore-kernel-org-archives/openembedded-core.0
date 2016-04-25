Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id 45299601D3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 09:31:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 6F7A33141F75;
	Mon, 25 Apr 2016 11:31:00 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id O340UCzQMPKN; Mon, 25 Apr 2016 11:30:54 +0200 (CEST)
Received: from [172.22.22.61] (55d44b30.access.ecotel.net [85.212.75.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 506DF3141EFD;
	Mon, 25 Apr 2016 11:30:54 +0200 (CEST)
To: "Burton, Ross" <ross.burton@intel.com>
References: <1461569133-13241-1-git-send-email-obi@opendreambox.org>
	<CAJTo0La317pVNc9NLZTc3coUS94v40SBND00RbC-aa7mtex5dw@mail.gmail.com>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <571DE3CD.6010803@opendreambox.org>
Date: Mon, 25 Apr 2016 11:30:53 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0La317pVNc9NLZTc3coUS94v40SBND00RbC-aa7mtex5dw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: explicitly disable tomcrypt
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
X-List-Received-Date: Mon, 25 Apr 2016 09:31:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 25.04.2016 11:11, Burton, Ross wrote:
> On 25 April 2016 at 08:25, Andreas Oberritter <obi@opendreambox.org> wrote:
> 
>> Configure autodetects libtomcrypt, but then it adds libtommath to
>> $LIBS and fails to link subsequent tests if it's unavailable.
>>
> 
> There was a patch last week to add a PACKAGECONFIG instead, so I'll pick
> that instead of this.

Oh, I didn't notice. Note that the other patch doesn't add the necessary
dependencies, so enabling tomcrypt won't work. And it would be nice to
include the user-visible error message in the commit log.

Regards,
Andreas


