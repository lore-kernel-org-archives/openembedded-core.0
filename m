Return-Path: <crg7475@mailbox.org>
Received: from mx2.mailbox.org (mx2.mailbox.org [80.241.60.215])
	by mail.openembedded.org (Postfix) with ESMTP id 8E1417FB2D
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Oct 2019 23:01:39 +0000 (UTC)
Received: from smtp1.mailbox.org (smtp1.mailbox.org
	[IPv6:2001:67c:2050:105:465:1:1:0])
	(using TLSv1.2 with cipher ECDHE-RSA-CHACHA20-POLY1305 (256/256 bits))
	(No client certificate requested)
	by mx2.mailbox.org (Postfix) with ESMTPS id 5098EA4A41
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 00:01:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mailbox.org; h=
	content-language:content-transfer-encoding:content-type
	:content-type:in-reply-to:mime-version:date:date:message-id:from
	:from:references:subject:subject:received; s=mail20150812; t=
	1572303697; bh=FYHbsuxDLK/A0KbrbJHLyzonZ+zxkm/+0TefDoWED3M=; b=B
	kTfA6gBSse8DvpPqYXvVbctVUNO9D8vYuZTGXsDoyNK5GjTMzos3G8KK4YQpHBBE
	SQOA3g3xfGHLaO2G8Q0gUjjnhAcmUYFRUHWNgaWQ/25Zif/U1N7HYXYp6JAOf8dd
	lDoi43B7qZctgIkAaJr657PqBlnGFqYOeZQRFHWBPM77n1V++URLT/zffCAA+qHG
	77la1xQbSoQ39LB7E66Qv6tgGqJKUYCx0KSZ1vxoar0Las5Ol2ucjz9wKh7FNUjM
	QGWwj19ohtLSrfWwdoOQpQUNjfPAPjxEHbysN8IocaCMwp1dZUVGRInhwK01a9dr
	EagWVE5hspJH7iUk1sNLQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org;
	s=mail20150812; t=1572303698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=7Yeha62OWZuD2GpouURCA5glbDPn/JyvsympXccLOSo=;
	b=WUTJA6uPKmd6U6kqnke7SGRjHbO2jBanOUgfudKIx8CfI/tWogwvZywhElnmMxbPfBZGSS
	PCn4TyZ3Hv8L/JC3ETEYdW1wmwzMz3kilwW4OElRnOY/5JbRFPQPln4akZ8HPnh6WhuS22
	WCWwANuLOYFJUaAFRKuYVAS3c1xGbj2WovYs+qUbSGVB8mkq6vRD/485mPzw8Z8qkX9qVJ
	FlYy7IT5IO98U19qRawJZnmmnJw8R06fSSlmex33MsFLAUVrkrF0ARSVJfyS0jeXMgnc4o
	XdXCADytPinMIqWGuqF2zkfsq9CAkEsyzOEkUq7kyLBr46ATtIMQakHQXeN96g==
X-Virus-Scanned: amavisd-new at heinlein-support.de
Received: from smtp1.mailbox.org ([80.241.60.240])
	by spamfilter06.heinlein-hosting.de (spamfilter06.heinlein-hosting.de
	[80.241.56.125]) (amavisd-new, port 10030) with ESMTP id j9emT928jpUv
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Oct 2019 00:01:37 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <f6132fd4-18d0-aba5-96d5-c259928a113d@mailbox.org>
	<15b9c8e2-4ccc-1564-af19-fe60f049cf2e@intel.com>
From: Carlos Rafael Giani <crg7475@mailbox.org>
Message-ID: <b0c45158-fad5-d6fe-c772-d7f853d0587d@mailbox.org>
Date: Tue, 29 Oct 2019 00:01:36 +0100
MIME-Version: 1.0
In-Reply-To: <15b9c8e2-4ccc-1564-af19-fe60f049cf2e@intel.com>
Subject: Re: GStreamer 1.0 meson build transition
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
X-List-Received-Date: Mon, 28 Oct 2019 23:01:39 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hm, true. Alright, I'll do that. For discussions about the recipe 
changes, should I create a fork of oe-core and place them there, just 
like how one would prepare merge requests? To me, it sounds more 
efficient than posting the patches in the mailing list for discussing them.

And speaking of upgrades, my changes are against 1.16.1, so the 1.16.0 
-> 1.16.1 upgrade needs to make it into master-next in first.

Carlos

On 28.10.19 17:44, Ross Burton wrote:
> On 26/10/2019 11:57, Carlos Rafael Giani wrote:
>> I think it would make sense to not try to get a meson based build 
>> done for GStreamer 1.16, and instead target it for 1.18. Minor 
>> version upgrades like 1.16.0 -> 1.16.1 aren't expected to bring major 
>> changes with them, while major upgrades like 1.16 -> 1.18 are 
>> generally known to potentially bring such changes. Also, there's a 
>> chance that new patches might make their way into 1.18 before its 
>> release.
>
> That's fine, but there is value in doing the migration separately to 
> the 1.16->1.18 upgrade: there should be no difference to the installed 
> files which makes verification easier.
>
> Basically I've no opinion on when the meson migration is merged, as 
> you say it's not trivial, but please have it as a separate commit to 
> an upgrade.
>
> Thanks,
> Ross

