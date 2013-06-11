Return-Path: <raj.khem@gmail.com>
Received: from mail-ie0-f169.google.com (mail-ie0-f169.google.com
	[209.85.223.169])
	by mail.openembedded.org (Postfix) with ESMTP id D59536AA07;
	Tue, 11 Jun 2013 15:02:00 +0000 (UTC)
Received: by mail-ie0-f169.google.com with SMTP id 10so6431531ied.0
	for <multiple recipients>; Tue, 11 Jun 2013 08:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=l2MdxKH6iGsAfUleGToplGJ6dPxQRqV25lavfw/+gYE=;
	b=cX6ls+r4nA9Uo2EI3a/yIbXvGoJCHJOmfp/fczpbd9BkXkGEOEVbAKzMQhpqWZ8e26
	vmmW07Q6koGxKFs5OXjRar0Vzg2mdtAzS1lZ3z3X/1tfQJbHI6Pg/yWtGyDd4iEjipmC
	fuPbKygB3euXZ1G0kDphBsNDkpAGLO8WfVvmEz9sTQLUPYU/yyTBL2hALkncBmy5NepZ
	B1cE3wS4zhEEDod1Q0yVTNhCdqq1/193GWjPjuob4xIFliXFIDAz92PWJCg9SiISOl8F
	MxvRnc4cufcAg0AQMO26qoMLzECrw9b4s+biFaRthw69GkbnMuvBSWorkoft3HuTj78M
	YHmQ==
X-Received: by 10.50.111.38 with SMTP id if6mr1133797igb.74.1370962921835;
	Tue, 11 Jun 2013 08:02:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.50.79.137 with HTTP; Tue, 11 Jun 2013 08:01:31 -0700 (PDT)
In-Reply-To: <20130611134543.GZ17357@timesys.com>
References: <20130607154357.606025038F@opal> <20130608091020.GO22710@jama>
	<20130608091556.GP22710@jama> <20130610155044.GS17357@timesys.com>
	<CAMKF1spvVOLu5uKFWXC=yqzHV73N61sOqUwj=gg1ZUVK=uN7OQ@mail.gmail.com>
	<20130611134543.GZ17357@timesys.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 11 Jun 2013 08:01:31 -0700
Message-ID: <CAMKF1srJ1-dzfa3AhrEAJRiNG3krvBoJy78sLbc+me8YExK16A@mail.gmail.com>
To: Andy Voltz <andy.voltz@timesys.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Andy Voltz : tune-cortexa.inc: create a common include for cortex-a armv7a tuning
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
X-List-Received-Date: Tue, 11 Jun 2013 15:02:01 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 11, 2013 at 6:45 AM, Andy Voltz <andy.voltz@timesys.com> wrote:
> I understand that. I sent an updated patch which reverts to mtune, but I'm getting

mtune/march is small issue with this patch. I would recommend to send
a revert of the patches
since all arm architectures are broken as of now in OE-Core

