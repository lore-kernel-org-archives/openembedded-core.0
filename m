Return-Path: <stefan@agner.ch>
Received: from mail.kmu-office.ch (mail.kmu-office.ch [178.209.48.109])
	by mail.openembedded.org (Postfix) with ESMTP id 6077A75560
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2018 13:57:51 +0000 (UTC)
Received: from webmail.kmu-office.ch (unknown [IPv6:2a02:418:6a02::a3])
	by mail.kmu-office.ch (Postfix) with ESMTPSA id 646205C1ADB;
	Thu, 14 Jun 2018 15:57:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=agner.ch; s=dkim;
	t=1528984671;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	content-transfer-encoding:content-transfer-encoding:
	in-reply-to:in-reply-to:references:references;
	bh=9MIhHOK+w3flGyQKzXe4ezsAbolNQ+3XdJQ0p2ihFHU=;
	b=p3kOyqN9+TFrpi/6opRLYqUyj0Q7a3BA/VyprkdUOmSBXHZ/SweH42OZH1yCGrz3u4iE5k
	Cd9yR+uNnamyDeK4opMnQkHE6uxMytBbItbgJllC+AeJHMOkn8qx+ZSosc1lmy+vgf/V9F
	rE+2NHJr1s1DOIRGC2SHLAGBFB3AOzE=
MIME-Version: 1.0
Date: Thu, 14 Jun 2018 15:57:50 +0200
From: Stefan Agner <stefan@agner.ch>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>
In-Reply-To: <bbbf2ec8-8c75-5195-b0ff-475c499853e3@linux.intel.com>
References: <20180516091352.29279-1-stefan@agner.ch>
	<84556032da03a0e29a955e347028db45@agner.ch>
	<bbbf2ec8-8c75-5195-b0ff-475c499853e3@linux.intel.com>
Message-ID: <72038ce45486336b7f3d611d7181e95f@agner.ch>
X-Sender: stefan@agner.ch
User-Agent: Roundcube Webmail/1.3.4
X-Spamd-Result: default: False [-0.10 / 15.00]; TO_MATCH_ENVRCPT_ALL(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[]; MIME_GOOD(-0.10)[text/plain];
	FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[]; DKIM_SIGNED(0.00)[];
	TO_DN_SOME(0.00)[]; RCVD_COUNT_ZERO(0.00)[0];
	ASN(0.00)[asn:29691, ipnet:2a02:418::/29, country:CH];
	RCVD_TLS_ALL(0.00)[]; BAYES_HAM(-0.00)[20.67%]; ARC_NA(0.00)[]
Cc: Stefan Agner <stefan.agner@toradex.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH v2 0/3] postinst fixes for opgk/dpkg
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
X-List-Received-Date: Thu, 14 Jun 2018 13:57:51 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 04.06.2018 18:18, Alexander Kanavin wrote:
> On 06/04/2018 07:06 PM, Stefan Agner wrote:
> 
>> Anything holding us back merging this changes?
> 
> Please read the Yocto project status mail:
> 
> " ·         Patch review/merging was slow over the past week due to
> Ross being on vacation and changes in Richard’s employment/hardware
> situation but at least some of the backlog was resolved over the
> weekend and the hardware issues should be worked around now."
> 

Gentle ping on that again.

This week it read:
"Due to the milestone, patch merging is slowing to stabilize."

Also, there have been patches merged which were posted after this
patchset... It is really rather important for us since it is hard to fix
in lower layers...

So I am getting nervous whether it still makes it?

--
Stefan

