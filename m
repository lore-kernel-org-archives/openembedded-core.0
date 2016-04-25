Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id A0F236E630
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Apr 2016 17:53:35 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [178.209.48.103])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id E29425C121E;
	Mon, 25 Apr 2016 19:51:50 +0200 (CEST)
MIME-Version: 1.0
Date: Mon, 25 Apr 2016 10:50:05 -0700
From: Stefan Agner <stefan@agner.ch>
To: Alejandro del Castillo <alejandro.delcastillo@ni.com>
In-Reply-To: <571BDEB6.3010906@ni.com>
References: <1461269276-23269-1-git-send-email-stefan@agner.ch>
	<571BDEB6.3010906@ni.com>
Message-ID: <665d0a085f51f1019c476d09707c0a98@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.1.3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1461606710; bh=uolRWH88ZolJ19rR8sohIPvviiHO5oYWhKowRD9tltg=;
	h=MIME-Version:Content-Type:Content-Transfer-Encoding:Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID;
	b=tSefnR5I5kPM14z0HJp49pOYSL28KwekwFMZCfhCJRPDDc01UqpzkcQQEZ+ta1g3zuA8ZUZKuiI4E3ddSi9tAxhGfirP7+IpOhylYCriJWg8AV++c+UzBUWLq1qiAFburoSmGqoTzOoME9HOPjAuwmc+G4MJG2MysUwaylaAd/g=
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH][jethro] opkg: backport fix for double remove of packges
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
X-List-Received-Date: Mon, 25 Apr 2016 17:53:35 -0000
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On 2016-04-23 13:44, Alejandro del Castillo wrote:
> On 04/21/2016 03:07 PM, Stefan Agner wrote:
>> From: Stefan Agner <stefan.agner@toradex.com>
>>
>> Backport the fix 7885da3974 ("pkg_get_provider_replacees: do not
>> add installed pkg to replacee list"). This avoids opkg trying to
>> remove a package twice e.g. when upgrading.
>>
>> Suggested-by: Alejandro del Castillo <alejandro.delcastillo@ni.com>
>> Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
>> ---
> 
> this bug also affects opkg 0.3.1 (included in krogoth)...can it be
> applied to krogoth too?

It does not cleanly apply for krogoth. Will send a seperate patch.

--
Stefan

