Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 4A0B26093C
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 11:59:35 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 8FD1E20AEB
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 06:59:36 -0500 (EST)
Received: from frontend2 ([10.202.2.161])
	by compute5.internal (MEProxy); Fri, 03 Feb 2017 06:59:36 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	smtpout; bh=Bdk9PD/hUOftkRTcB74Di6vI2Bw=; b=lg6GY39oswdGOHFwIqJn
	IDlOjP8FKcq2NiH4GhXm4ixUfqwi3zmvcLfOVSXlCFga0z3CBvaOjlyaWtufhHjC
	y+3oOb2VBiFPCex6SgJ80G9MsDoY7b+TO7uF6dBXPEWZwIn6pALLsFVXTnOdv9f6
	s7xznUS379lRwaBFP76dFYA=
X-ME-Sender: <xms:qHCUWFnuHwm7g7hduZyj8RnAGPN1sko7wJVp1kZFZfqdZ3F_QKKSzg>
X-Sasl-enc: 1lsBskd9VH3wefamE4ONtsA4X6iDHdNemvZoqvfYzO8m 1486123176
Received: from laptop (unknown [192.40.95.9])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0AB3124594
	for <openembedded-core@lists.openembedded.org>;
	Fri,  3 Feb 2017 06:59:35 -0500 (EST)
Message-ID: <1486123174.15532.1.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Fri, 03 Feb 2017 13:59:34 +0200
In-Reply-To: <8fa96caf-d21c-e845-533e-473e38ce7420@linux.intel.com>
References: <20170203070635.30804-1-tanuk@iki.fi>
	<8fa96caf-d21c-e845-533e-473e38ce7420@linux.intel.com>
X-Mailer: Evolution 3.22.4-1 
Mime-Version: 1.0
Subject: Re: [PATCH] pulseaudio: 9.0 -> 10.0
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
X-List-Received-Date: Fri, 03 Feb 2017 11:59:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2017-02-03 at 13:42 +0200, Alexander Kanavin wrote:
> On 02/03/2017 09:06 AM, Tanu Kaskinen wrote:
> > 
> > Dropped json-c and gdbm from DEPENDS. The new release doesn't use json-c
> > any more. gdbm isn't used when --with-database=simple is passed to
> > configure, so it should have been removed from DEPENDS a long time ago.
> 
> Does anything else in oe-core still use json-c? We're generally trying 
> to trim such dangling recipes.

According to "git grep json-c", the only thing still using it is
systemtap.

-- 
Tanu

https://www.patreon.com/tanuk

