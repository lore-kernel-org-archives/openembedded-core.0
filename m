Return-Path: <twoerner@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 0975277147
	for <openembedded-core@lists.openembedded.org>;
	Sun,  5 Jun 2016 13:15:13 +0000 (UTC)
Received: by mail-io0-f177.google.com with SMTP id k19so105472724ioi.3
	for <openembedded-core@lists.openembedded.org>;
	Sun, 05 Jun 2016 06:15:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=9wDgroHaHKfDKbzjrEaAMd86Y+kwkHS6sL//By7tg4Y=;
	b=0HZ48mMEkMZGsIVMvea/lfyDfi2MytxVR5dw5XRu/9dsKzXklbfaGbXbqkHjpUCS8/
	lffbPABOSxqm8tgqAk/hA7DWnUdcnPEZ6+yZ3HIlF9TDoTays2kWl3QaL+vR2Blognsa
	aO8JI9UdlPhkFiNLA4yRJvYsJhcApYAUjfB9NYRPFDLWmG6cAkkTo2pb6825qJett+M8
	FrZY9H2z1zlbWtcpKGkXn0Ck4YqX0CkjMYXmOmDDz2ufDVurONdvHpAmeApIczou0IbQ
	R18Ail2GbETY3HCl2JrVUszRSPl0k7bXa+sBzlOiutq+pMjpP1NVdXXPmpCUI5KBVU9C
	EWkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=9wDgroHaHKfDKbzjrEaAMd86Y+kwkHS6sL//By7tg4Y=;
	b=QPbJ7744d8y7+z2/qnPOVN9Umt7gAQYrwSaJAeskgMzRhubBXrUAW/qPf39lXrRKmP
	tIr3aKmYpVk5gTSq6F8G4JNX9rRfLKz7n/yb1VKMFcb6k8XZVffb6qs1Siej6Zgv+jaN
	qdWy3qY5xfTSB+0HNQLxg+uq4zt2XOq2DyxVjMY3YP1XsxUJsXTztsZ+lUpytTmF1l4z
	k6ZIbubX96IczSccDmc/7pDf5J/iYkhz2zBAhLlqhES2P3V2Q8yXDZH3bYCkJdQwOT/E
	v8ueWQkwWvxR9IpAIio/DkIe/k7P3sPeTINU02IhzyPaFAX57FehOnarnSb2TcBtxyly
	g6Mg==
X-Gm-Message-State: ALyK8tJ8IG/uzMZM0egGU5qYLGT01SIZBY2Pgs//6TnEJTz0jHEvE0rJhnaOq5qj9KdSnA==
X-Received: by 10.107.25.13 with SMTP id 13mr15639966ioz.104.1465132514503;
	Sun, 05 Jun 2016 06:15:14 -0700 (PDT)
Received: from openSUSE-i7.site (dsl-67-55-28-109.acanac.net. [67.55.28.109])
	by smtp.gmail.com with ESMTPSA id
	k79sm6855075ioi.36.2016.06.05.06.15.13
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 05 Jun 2016 06:15:13 -0700 (PDT)
Date: Sun, 5 Jun 2016 09:15:17 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20160605131517.GE5652@openSUSE-i7.site>
References: <20160604225509.GB28175@openSUSE-i7.site>
	<1465111211.13979.38.camel@linuxfoundation.org>
	<20160605130253.GB5652@openSUSE-i7.site>
	<20160605130412.GC5652@openSUSE-i7.site>
	<20160605130650.GD5652@openSUSE-i7.site>
MIME-Version: 1.0
In-Reply-To: <20160605130650.GD5652@openSUSE-i7.site>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: INHERIT += "image-buildinfo" doesn't parse
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
X-List-Received-Date: Sun, 05 Jun 2016 13:15:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Sun 2016-06-05 @ 09:06:50 AM, Trevor Woerner wrote:
> On Sun 2016-06-05 @ 09:04:12 AM, Trevor Woerner wrote:
> > oh... wait, sorry my mistake I didn't test properly, let me try again...
> 
> yes, that fixes it :-D
> 
> (i was using git://git.yoctoproject.org/poky's meta instead of
> git://git.openembedded.org/openembedded-core.git's)

... and now that I check, I see that you've already pushed this to poky as
well. Sorry for the confusion, both work (my build was using one, I updated
the other, it didn't seem to work).

