Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 9BFE4772D9
	for <openembedded-core@lists.openembedded.org>;
	Mon,  5 Sep 2016 19:34:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u85JY29x020731; Mon, 5 Sep 2016 20:34:02 +0100
Received: from dan.rpsys.net ([127.0.0.1])
	by localhost (dan.rpsys.net [127.0.0.1]) (amavisd-new, port 10024)
	with LMTP id mBn1dB_6lH-c; Mon,  5 Sep 2016 20:34:01 +0100 (BST)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.14.4/8.14.4/Debian-4.1ubuntu1) with ESMTP id
	u85JXufM020728
	(version=TLSv1/SSLv3 cipher=AES128-GCM-SHA256 bits=128 verify=NOT);
	Mon, 5 Sep 2016 20:33:57 +0100
Message-ID: <1473104036.20226.16.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>, Marek Vasut
	<marex@denx.de>
Date: Mon, 05 Sep 2016 20:33:56 +0100
In-Reply-To: <CAP9ODKpB9ofyxgNJtt3DpxNiVzKvF_ta708xZvj9vuNUZFyoAg@mail.gmail.com>
References: <20160904162130.13313-1-marex@denx.de>
	<1473024487.20226.3.camel@linuxfoundation.org>
	<9f3a5dfd-8303-b6d0-cd5e-07f2aac7c588@denx.de>
	<1473027091.20226.4.camel@linuxfoundation.org>
	<252ea4f7-871c-60a5-0a2f-f59a5d35683e@denx.de>
	<00e9ef55-2e08-5c92-0a5a-32e9ce1f61fa@denx.de>
	<1473073354.20226.9.camel@linuxfoundation.org>
	<1fbc36ad-f031-9f85-7861-1ba302273ace@denx.de>
	<CAP9ODKqO1ffXbra1QU0F6CwyXWW2sU5A9UoSuXeNtyMu=DbHAg@mail.gmail.com>
	<15ec9cec-d76f-233e-486a-89afb93083de@denx.de>
	<CAP9ODKp_ypN2JVrbcLnaHW_Unsr5N8eMD8-+4s_FQWjdg0AnqQ@mail.gmail.com>
	<d3411db9-1d02-d493-72e6-e85625f849a9@denx.de>
	<CAP9ODKpB9ofyxgNJtt3DpxNiVzKvF_ta708xZvj9vuNUZFyoAg@mail.gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3 
Mime-Version: 1.0
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] u-boot: Factor out common bits
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
X-List-Received-Date: Mon, 05 Sep 2016 19:34:04 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Mon, 2016-09-05 at 13:26 -0300, Otavio Salvador wrote:
> On Mon, Sep 5, 2016 at 1:24 PM, Marek Vasut <marex@denx.de> wrote:
> > 
> > On 09/05/2016 06:22 PM, Otavio Salvador wrote:
> > > 
> > > On Mon, Sep 5, 2016 at 1:16 PM, Marek Vasut <marex@denx.de>
> > > wrote:
> > > I would love to see the proposed patches.
> > > 
> > That'd depend on whether they'd be NAK'd right away for breaking
> > BSPs or
> > not.
> It will depends on the type of breakage and the benefits it puts on
> the table.

I would note that we are past feature freeze at this point and I'm
struggling to get stability in the patches we have queued without
anything in addition to that.

If there is a pressing attractive reason we should do this now I'm
willing to listen but it might be better waiting for 2.3...

Cheers,

Richard


