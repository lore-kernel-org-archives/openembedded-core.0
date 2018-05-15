Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 7E58474824
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 May 2018 16:07:46 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id AED4F5C0E8F;
	Tue, 15 May 2018 18:07:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1526400466;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=OVjYRdsD9oZQ50wcwzW35fFNvbvZLXAGGXuVDdTkdTo=;
	b=qrFZXAowSMcGHAAijS4tp4Tm4DIZ6rQSbsUTvEdLKMmB4OLl44nhMjG2b3JhZFkVMZ2eaQ
	8/JqPNiBhSd5Z3nGUoBfpi0oBzlgCNgj31QDouxwUJGnNzMTmB9YItImJr9k3r8yVnGtzB
	zS3/x6jAUfsX/zHl/FJ6Sev0c2BOf0Q=
MIME-Version: 1.0
Date: Tue, 15 May 2018 18:07:46 +0200
From: Stefan Agner <stefan@agner.ch>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
In-Reply-To: <b80d6b0c-6f27-8c28-26d3-b62019c303c9@linux.intel.com>
References: <20180515140451.60660-1-stefan@agner.ch>
	<b80d6b0c-6f27-8c28-26d3-b62019c303c9@linux.intel.com>
Message-ID: <e2efa2cc72ff1bf2c9620e1fd9ebaece@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.4
X-Spamd-Result: default: False [-0.10 / 15.00]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[]; MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[]; DKIM_SIGNED(0.00)[];
	TO_DN_SOME(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
	RCVD_TLS_ALL(0.00)[]; ARC_NA(0.00)[]
Cc: muhammad_shakeel@mentor.com, Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/3] postinsts fixes
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
X-List-Received-Date: Tue, 15 May 2018 16:07:46 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 15.05.2018 17:03, Alexander Kanavin wrote:
> On 05/15/2018 05:04 PM, Stefan Agner wrote:
>> This follows up on the discussion a while ago:
>> https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg104996.html
> 
> Took me a moment to realize all three patches are specific to
> opkg/dpkg and do not change how rpm (or general 'postinst handling')
> works. Perhaps you could amend the commit messages to emphasize that?

Patch 1 has opkg in the subject.

Patch 2/3 mention opkg/dpkg in the commit log.

Patch 3 also really edits the DpkgOpkgRootfs class, which should make it
rather obvious.

But I agree for patch 2 it would be good to emphasize it.

How about adding this after the first paragraph:
The behavior for rpm stays the same.

--
Stefan

