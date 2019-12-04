Return-Path: <prvs=124166d38b=holzmayr@rsi-elektrotechnik.de>
X-Greylist: delayed 725 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 04 Dec 2019 21:19:48 UTC
Received: from mo4-p00-ob.smtp.rzone.de (mo4-p00-ob.smtp.rzone.de
	[81.169.146.161])
	by mail.openembedded.org (Postfix) with ESMTP id CC5357F7DB;
	Wed,  4 Dec 2019 21:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1575494388;
	s=strato-dkim-0002; d=rsi-elektrotechnik.de;
	h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
	X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
	bh=ds5R5AXKU8ZC40j9faprVpm9hMzcDOp97yjDeo6VCek=;
	b=MGSbKSSC2R7lqCrDoW8edN5TxIkbwcI+J2i3uC3+0Jfw8nuYMs+pqP8vx7D+YSsWew
	2wyck4A7z/g9m5hUWhkri837WHE47ffo3cp4LBfY1uJj+6OCcBFq3JJ/7K1yw6tiz3I3
	CPccBm6t90f3ce8u2SgdQTOFRp3JvIrLOxKb7ZdiP0/BRVTnyEHkbhUYd/ADaotT5sSv
	FaPJkCBxXp4TDNGUg0LVk9bOQ+GLSoOzpD8fOv4nRHAlWKRaoSxNDAx3/0K7PUBWxrrE
	CPfHuatzS18LrsEnLk1Va2cGzPfW6E17JYul3jgLL/l0kxXFIHlZwf+htstcl33QQwH1
	c8pw==
X-RZG-AUTH: ":fz5RJhWIaexwuXGosGLfiBc0xYyi1Y5bd+wRKqrzPXw4V1/KqCOd+ZZzzoK8epFp9XQIUl6aPGQL"
X-RZG-CLASS-ID: mo00
Received: from mail.rsi-elektrotechnik.de by smtp.strato.de (RZmta 46.0.2 AUTH)
	with ESMTPSA id K047a1vB4L7h97i
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256 bits))
	(Client did not present a certificate);
	Wed, 4 Dec 2019 22:07:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/relaxed;
	d=rsi-elektrotechnik.de; s=MDaemon; t=1575493663; x=1576098463;
	i=holzmayr@rsi-elektrotechnik.de; q=dns/txt; h=Date:From:To:Cc:
	Subject:Message-ID:References:MIME-Version:Content-Type:
	Content-Disposition:Content-Transfer-Encoding:In-Reply-To; bh=ds
	5R5AXKU8ZC40j9faprVpm9hMzcDOp97yjDeo6VCek=; b=lt3mg4nzXwVcKKKWBZ
	LmO5eHUO7hqfb8FYI/r0LKzBJPZZcjyvNS9VbIqH72S4mE8pablDyIQMtDJpdW0k
	1V4OkK2gDNeMLE3eTCN7gL8+qDHGfuoYRl1m6dkM0IeNztlk8+sqFQIgUOlFhLZj
	WFvayOPa2H8mCrT5rJok+qRfM=
Received: by mail.rsi-elektrotechnik.de (MDaemon PRO v19.5.1) with ESMTPSA id
	md50000224346.msg; Wed, 04 Dec 2019 22:07:43 +0100
X-Spam-Processed: mail.rsi-elektrotechnik.de, Wed, 04 Dec 2019 22:07:43 +0100
	(not processed: message from trusted or authenticated source)
X-MDRemoteIP: 178.27.65.232
X-MDHelo: jholzmayr.localdomain
X-MDArrival-Date: Wed, 04 Dec 2019 22:07:43 +0100
X-Authenticated-Sender: holzmayr@rsi-elektrotechnik.de
X-Return-Path: prvs=124166d38b=holzmayr@rsi-elektrotechnik.de
X-Envelope-From: holzmayr@rsi-elektrotechnik.de
Date: Wed, 4 Dec 2019 22:07:30 +0100
From: Josef Holzmayr <holzmayr@rsi-elektrotechnik.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20191204210730.g5hrp6ur4d4fgeis@jholzmayr.localdomain>
References: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <216e9c7062d44b98a54b6fd572128266383e83ad.camel@linuxfoundation.org>
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: OE-Core python minimum version requirement
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
X-List-Received-Date: Wed, 04 Dec 2019 21:19:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Dec 04, 2019 at 05:45:03PM +0000, Richard Purdie wrote:
> I just enabled hashequiv's server in local mode by default in poky.
> 
> This causes an unintended side effect of requiring python 3.5 as the
> minimum version.
> 
> We had thought that the servers would be 'rare' and a 3.5 version
> requirement for that was fine. It turns out a local server is also
> extremely useful.
> 
> The code needed the python 3.5 async support and trying to write it any
> other way is a nightmare, we need that performance for the server.
> 
> At this point I think we just give in and require python 3.5 as a
> minimum. Any objections?

A quick check on packages.ubuntu.com says 16.04 is on python 3.5.1,
18.04 is on 3.6.something.

Hence, looks good to me.

Greetz

> 
> Cheers,
> 
> Richard
> 
> -- 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core

-- 
———————————————
Josef Holzmayr
Software Developer Embedded Systems

Tel: +49 8444 9204-48
Fax: +49 8444 9204-50

R-S-I Elektrotechnik GmbH & Co. KG
Woelkestrasse 11
D-85301 Schweitenkirchen
www.rsi-elektrotechnik.de
———————————————
Amtsgericht Ingolstadt – GmbH: HRB 191328 – KG: HRA 170393
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
Ust-IdNr: DE 128592548 

_____________________________________________________________
Amtsgericht Ingolstadt - GmbH: HRB 191328 - KG: HRA 170363
Geschäftsführer: Dr.-Ing. Michael Sorg, Dipl.-Ing. Franz Sorg
USt-IdNr.: DE 128592548


