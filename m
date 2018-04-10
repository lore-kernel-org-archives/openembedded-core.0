Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 8B284745AF
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Apr 2018 16:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 180B420B53;
	Tue, 10 Apr 2018 16:48:57 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id D54-KgjsLQ-f; Tue, 10 Apr 2018 16:48:57 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id F0F08203A8;
	Tue, 10 Apr 2018 16:48:55 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 7D3BA16342E; Tue, 10 Apr 2018 12:48:55 -0400 (EDT)
Date: Tue, 10 Apr 2018 12:48:55 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Message-ID: <20180410164855.GE3228@denix.org>
References: <1515690095-6391-1-git-send-email-richard.purdie@linuxfoundation.org>
	<1515690095-6391-4-git-send-email-richard.purdie@linuxfoundation.org>
	<20180410143311.GD3228@denix.org>
	<1523378214.2942.158.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <1523378214.2942.158.camel@linuxfoundation.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] sstate: Avoid indirect bison/flex-native dependencies
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
X-List-Received-Date: Tue, 10 Apr 2018 16:48:56 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Tue, Apr 10, 2018 at 05:36:54PM +0100, Richard Purdie wrote:
> On Tue, 2018-04-10 at 10:33 -0400, Denys Dmytriyenko wrote:
> > Richard,
> > 
> > Was this patch ever merged? I don't see it in master - were there any
> > problems 
> > or concerns?
> 
> There was some kind of failure in testing on the autobuilder which made
> me abandon it, I can't remember what it was though :(

Thanks, do you still want to revisit it at some point or completely drop it?

-- 
Denys

