Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 3F73F607AB
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 18:17:42 +0000 (UTC)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 591E22151B
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 Dec 2015 13:17:42 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute3.internal (MEProxy); Mon, 14 Dec 2015 13:17:42 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-sasl-enc:x-sasl-enc; s=smtpout; bh=Yo3xhCUTM5VcIBc
	ASeZmvSTZvM8=; b=NxY77Hrbg8/uNfuZUeYu9BDYYMDNirUS5tioseyUu7H34c7
	TDCHfi0syCf9li6kkN33Ahog0MXhkjBY9dr6JYeQqy3fMbEdGMkDC+B1BqLzeIq4
	U6fyaAWvSFBStU1qQGlWpa1mRelUR+FwWsEKGat4cMmaPLlY0nFBHE8iS+/o=
X-Sasl-enc: it6qJe5TKdMNOaCuNCPc21naJQASUcS4RbQ9txzGnWID 1450117061
Received: from laptop (a88-114-110-232.elisa-laajakaista.fi [88.114.110.232])
	by mail.messagingengine.com (Postfix) with ESMTPA id 9D050C016DA;
	Mon, 14 Dec 2015 13:17:41 -0500 (EST)
Message-ID: <1450117059.3147.41.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Mon, 14 Dec 2015 20:17:39 +0200
In-Reply-To: <566E973D.8010903@linux.intel.com>
References: <1449886992-642-1-git-send-email-tanuk@iki.fi>
	<566E973D.8010903@linux.intel.com>
X-Mailer: Evolution 3.18.2-1 
Mime-Version: 1.0
Subject: Re: [PATCH v2] libsndfile1: 1.0.25 -> 1.0.26
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
X-List-Received-Date: Mon, 14 Dec 2015 18:17:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Mon, 2015-12-14 at 12:17 +0200, Alexander Kanavin wrote:
> On 12/12/2015 04:23 AM, Tanu Kaskinen wrote:
> > Main points from the release announcement:
> 
> There's also other audio stuff in need of update (alsa, pulseaudio), can 
> you look into that? Now is a good time to do those version updates.

Yes, certainly. Those updates have been on my radar for a while, sorry
for not having done that already.

-- 
Tanu

