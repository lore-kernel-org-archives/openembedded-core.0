Return-Path: <tanuk@iki.fi>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com
	[66.111.4.28])
	by mail.openembedded.org (Postfix) with ESMTP id A7CE060017
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 May 2017 08:42:11 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 5BBCB207BB;
	Thu, 11 May 2017 04:42:12 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Thu, 11 May 2017 04:42:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=FhMum5JGj6XevT2x770XP7N3Q0/v3kokAkuJkO3si64=; b=c0r9PR+f
	3P/dVfWXirBWzEnOdIXafzULnXHgz9QyyMC/btpIUYRrhO03Ld3YpsF/pgrW5XEB
	WIJcWJHa2XNecOB+9rprxwBf48ZF+7E/XUQdFIuEzx9nWpl9gW83AXjqGaJp8jzT
	fCJdxYL2CxUajvKdN+6f86jZO/N1MpRLJxLgyB8dWM++8pdUTsPcHdu+g32jxMHk
	aS5Wio92ikaDR6qKdj+HkHEjXZrywF3luFGMCASupBPXb+OYzXxjMOF+O4hh4E4M
	NjKkj6DFIlFRUFEXZkyrVS7JFij9ANlqME5+O5Jg765JTbI5DzxnDK/vvcxPFhvj
	lohVWnIV4PYqEA==
X-ME-Sender: <xms:5CMUWVtTjnYHGvl2dWRauzCI_RLPcjeTj_f9pSxZqKyavvR4I87T3Q>
X-Sasl-enc: dfw77297J9iUSh2t691ew8Fpjmay45n+vy3SP30DPEZT 1494492131
Received: from laptop (unknown [192.40.95.28])
	by mail.messagingengine.com (Postfix) with ESMTPA id AD6217E962;
	Thu, 11 May 2017 04:42:11 -0400 (EDT)
Message-ID: <1494492130.3018.1.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: Koenraad Verheyden <koenraad.verheyden@gmail.com>
Date: Thu, 11 May 2017 11:42:10 +0300
In-Reply-To: <CA+rFJSGHBiVAwPqF9bqJQV=0wh+6DT5rdK-6V3TuZCg2qRYp=Q@mail.gmail.com>
References: <CA+rFJSHcJbmnrtA0jqXXscj7LpV3GR6EcGeBWCGdSPbZeES+SA@mail.gmail.com>
	<1492694665.22019.2.camel@iki.fi>
	<CA+rFJSHDqvsg23XXSQfk0XUpj+0bmcULM_EjddD0NwS9ZZC37Q@mail.gmail.com>
	<1492768432.2475.1.camel@iki.fi>
	<CA+rFJSGHBiVAwPqF9bqJQV=0wh+6DT5rdK-6V3TuZCg2qRYp=Q@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: PulseAudio with WebRTC echo cancellation (aec): support for webrtc-audio-processing package
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
X-List-Received-Date: Thu, 11 May 2017 08:42:11 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2017-05-09 at 13:59 +0200, Koenraad Verheyden wrote:
> Hi Tanu,
> 
> I've written a script myself, referencing how other scripts did this. Was
> indeed not so hard.
> This is the first time writing such a script so I can't guarantee
> everything is correct or the right way to do (especially the license
> stuff). But this works for me.
> 
> You can do with this script as you want.

Thanks! I already wrote a recipe myself, though. I haven't submitted it
yet, because it doesn't build on mips (and probably not on mips64 or
aarch64 either).

-- 
Tanu

https://www.patreon.com/tanuk

