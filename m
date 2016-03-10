Return-Path: <obi@opendreambox.org>
Received: from mail.dream-property.net (mail.dream-property.net
	[82.149.226.172])
	by mail.openembedded.org (Postfix) with ESMTP id B187A601B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 10 Mar 2016 01:39:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mail.dream-property.net (Postfix) with ESMTP id EB5A9315FC84;
	Thu, 10 Mar 2016 02:39:00 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.dream-property.net
Received: from mail.dream-property.net ([127.0.0.1])
	by localhost (mail.dream-property.net [127.0.0.1]) (amavisd-new,
	port 10024)
	with LMTP id 6_SFMSRJLH9N; Thu, 10 Mar 2016 02:38:58 +0100 (CET)
Received: from [172.22.22.61] (55d41e29.access.ecotel.net [85.212.30.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.dream-property.net (Postfix) with ESMTPSA id 7F1CD315FA9B;
	Thu, 10 Mar 2016 02:38:58 +0100 (CET)
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
	Martin Jansa <martin.jansa@gmail.com>
References: <cover.1457535622.git.alexander.kanavin@linux.intel.com>
	<c9d3e96135173503ef0e3730cc80c993b5bf951e.1457535622.git.alexander.kanavin@linux.intel.com>
	<56E0B734.4000607@opendreambox.org> <20160310000955.GP2542@jama>
	<1457568909.2804.209.camel@linuxfoundation.org>
	<56E0BF1B.5030006@opendreambox.org>
	<1457569722.2804.211.camel@linuxfoundation.org>
From: Andreas Oberritter <obi@opendreambox.org>
X-Enigmail-Draft-Status: N1110
Message-ID: <56E0D032.4090302@opendreambox.org>
Date: Thu, 10 Mar 2016 02:38:58 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <1457569722.2804.211.camel@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 06/24] gobject-introspection.bbclass: add a class that enables gobject introspection
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
X-List-Received-Date: Thu, 10 Mar 2016 01:39:03 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

On 10.03.2016 01:28, Richard Purdie wrote:
> On Thu, 2016-03-10 at 01:26 +0100, Andreas Oberritter wrote:
>> How does this work out on a shared package feed, of which some
>> machines
>> have the required qemu support and others don't?
> 
> Generally its done by "tune" rather than machine and we're dependent on
> qemu's support of that architecture/tune, not machine. A given package
> feed corresponds to a tune and that will either be supported by qemu or
> not so I'd have thought it would all be consistent.

Right. I hadn't thought about that.

I guess a less confusing implementation should encode the knowledge
about the necessary qemu support into conf/machine/include/tune-*.inc
then (using a different variable), so all builds get consistent settings
automatically.

Regards,
Andreas


