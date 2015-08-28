Return-Path: <raj.khem@gmail.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 69CF471633
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 14:24:02 +0000 (UTC)
Received: by qgeb6 with SMTP id b6so30001203qge.3
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Aug 2015 07:24:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=ORYSXhXRJAj0rrLcLxmD6JPshHEoMv37sueZqgsUdJE=;
	b=aBxLdz4YavpTgQolNJJq9SDtS7DhGdWd9JYoSJXQ8bNpMlgniIoa1sK2TT365F+x7g
	v3jrhzG7Vl03afsQalZXoypZbcqYtV0vfd/57nzkkUh9W6d4qaWN8APIIMQjjuz3nDGr
	wHWjwPjBn3qgIZsoV5FtacuiyQl4jZacKBeXg5U1j3NNwJxGPQWtN2a5mVQH2e++xFRC
	Ls+0L3OpA5ArfXLHy3F/ADlhsHtW08J60s0gx7E/Mwt9wPMF3AlYzYKfxaa+JPS8sFc5
	VFdyIazxARQGxmAKX3+dOwiH/3Wg/KVZikp/JMDxBfYfgpfNDQZufCTwwbmCysbfoZqi
	rj6w==
X-Received: by 10.140.194.132 with SMTP id p126mr17404328qha.30.1440771842651; 
	Fri, 28 Aug 2015 07:24:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.167.70 with HTTP; Fri, 28 Aug 2015 07:23:33 -0700 (PDT)
In-Reply-To: <55E05270.90404@collabora.co.uk>
References: <1440666743-12035-1-git-send-email-andrew.shadura@collabora.co.uk>
	<CAMKF1so6_ftdkbU5afVrGdnZA9LRDLhktNTgcdnZw2iqrYwSnQ@mail.gmail.com>
	<55E05270.90404@collabora.co.uk>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 28 Aug 2015 07:23:33 -0700
Message-ID: <CAMKF1sp-Wtg2j-EgVc=B1msLb8tS63cZH5=jYboWh8DCB6kw5A@mail.gmail.com>
To: Andrew Shadura <andrew.shadura@collabora.co.uk>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] dbus: merge .bb and .inc
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
X-List-Received-Date: Fri, 28 Aug 2015 14:24:05 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 28, 2015 at 5:22 AM, Andrew Shadura
<andrew.shadura@collabora.co.uk> wrote:
>> can you send patch generated with -M 1
>
> Gives me exact same patch, hmm.

try -C

