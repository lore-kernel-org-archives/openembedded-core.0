Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id C0E7B719C0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Oct 2016 07:22:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id 25FB53183CC8;
	Mon, 24 Oct 2016 09:22:29 +0200 (CEST)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id QMMZhR8tF8jX; Mon, 24 Oct 2016 09:22:27 +0200 (CEST)
Received: from [172.22.22.61] (55d47c89.access.ecotel.net [85.212.124.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 0F12F3183BC2;
	Mon, 24 Oct 2016 09:22:26 +0200 (CEST)
To: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
References: <cover.1476345470.git.jackie.huang@windriver.com>
	<07b4065b12f5cf9dfe816e7cdb68a5e7d83e04c0.1476345470.git.jackie.huang@windriver.com>
	<5c605407-d802-456e-a876-317cefaef461@opendreambox.org>
	<1B858668EC6A94408DCA5225FDFA85AA013A310347@ALA-MBA.corp.ad.wrs.com>
From: Andreas Oberritter <obi@opendreambox.org>
Message-ID: <cf2817c8-6311-07e2-9d12-c6dbfbf937fd@opendreambox.org>
Date: Mon, 24 Oct 2016 09:22:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <1B858668EC6A94408DCA5225FDFA85AA013A310347@ALA-MBA.corp.ad.wrs.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] ppp: fix building with linux-4.8
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
X-List-Received-Date: Mon, 24 Oct 2016 07:22:30 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

On 24.10.2016 03:11, Huang, Jie (Jackie) wrote:
> I didn't realize 4.4 is still be used, sorry about that, feel free to send
> patch to fix it if you have one already, if not, I will fix it later as follow-up.

Thanks! I don't have a patch. I figured switching to
linux-libc-headers-4.8 would be easier in the long run. Having set 4.4
as preferred version was just a leftover from a previous release, I think.

Regards,
Andreas

