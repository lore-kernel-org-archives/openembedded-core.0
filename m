Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pd0-f173.google.com (mail-pd0-f173.google.com
	[209.85.192.173])
	by mail.openembedded.org (Postfix) with ESMTP id 741D67626F
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 11:45:24 +0000 (UTC)
Received: by pdbbh15 with SMTP id bh15so23212451pdb.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 04:45:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc:content-type;
	bh=uGe4IVo6zNJKup4QU7E4dm1IMpvg5B/eeoa6vg77EdM=;
	b=MjGCHWyTpYPoQ7FoJrovmcL5/47gB3HPtYFKYXpOKEzJNuAN8WHNwBrpIX1g0lud+p
	G2qdSh768+9+VAZfuylHaEhsP421njFVFRkv45MZq8wAfVg5MwvPuIe+e4ZYulymdOw6
	omMJyZ/0vQj6tbGmfq+x+T02EVdVltaTJAcVx7vFaiCrdLrdZiA49hn6xwq1xtoaqS9r
	UZOFp52ruMfOR0+TE82WctpL1faw7WgSaCFeQkDY3VQ+LQ7dj+aLS8dgwIcw5HUieiWy
	eBUYvFrUWao1hybtdee0NDJURpyS+OSJPcCG9GFQnUNLfN+xSuk/HT9e8e1zUTLnE7eO
	IVBg==
X-Gm-Message-State: ALoCoQkcOD1I5MsBbkRCSZbUIvKYOJB0GMLYORb2vmdfyKNOCH+dLW4AjOjnV/2Gx1iDsVB5kXNy
X-Received: by 10.70.34.69 with SMTP id x5mr105674693pdi.28.1438256724555;
	Thu, 30 Jul 2015 04:45:24 -0700 (PDT)
Received: from mail-pa0-f44.google.com (mail-pa0-f44.google.com.
	[209.85.220.44]) by smtp.gmail.com with ESMTPSA id
	nl10sm1813047pdb.38.2015.07.30.04.45.23
	for <openembedded-core@lists.openembedded.org>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 30 Jul 2015 04:45:23 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by padck2 with SMTP id ck2so22507088pad.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 30 Jul 2015 04:45:22 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.138.40 with SMTP id qn8mr105850233pab.19.1438256722454;
	Thu, 30 Jul 2015 04:45:22 -0700 (PDT)
Received: by 10.70.59.105 with HTTP; Thu, 30 Jul 2015 04:45:22 -0700 (PDT)
In-Reply-To: <1438207697.11208.78.camel@linuxfoundation.org>
References: <1438125665-14966-1-git-send-email-armccurdy@gmail.com>
	<1438125665-14966-2-git-send-email-armccurdy@gmail.com>
	<1438207697.11208.78.camel@linuxfoundation.org>
Date: Thu, 30 Jul 2015 08:45:22 -0300
Message-ID: <CAP9ODKrkn65wp_uM5HqCCJiKSN5fUPa=pgNb8QqAJEMuHDDicg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/8] busybox: merge login-utilities.cfg into defconfig
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
X-List-Received-Date: Thu, 30 Jul 2015 11:45:26 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jul 29, 2015 at 7:08 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> Obviously any more split up hasn't happened as yet and I know that
> personally, given my workload I'm unlikely to find time soon :(. I'd be
> interested to see what others think?

Having a second thought on this, I second your view here. The more
fragmented the better.

It helps distros to customize it without having to carry a full (and
likely unmaintained) defconfig, benefiting from fixes and
contributions sent for OE-Core.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

