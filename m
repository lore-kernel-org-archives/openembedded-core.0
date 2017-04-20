Return-Path: <tanuk@iki.fi>
X-Greylist: delayed 497 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 20 Apr 2017 13:32:43 UTC
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id D4CF4773B9
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 13:32:43 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 9312C20AE3;
	Thu, 20 Apr 2017 09:24:27 -0400 (EDT)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Thu, 20 Apr 2017 09:24:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	fm1; bh=MbZ8OdInzhmFTE3dtwvuZMz/qyRYX96V4e4sokpvr1A=; b=ebGuPpFV
	jYG/O1YCOr1GFpKssZnxpdD4Yw45eCUX35tozNCAGpsca86jq6QR1mMu2eawGa2a
	MO9+wdRf/qXTrhRO9r3emRm89ODP1+IresGLMzpxNGDkDet8lTMgGYSQJXwdRsfi
	lcaEkO890y0DnHK7g93FAQdAz+VVHp0wnYKcH6HVDqQeLgZjz0c6WuPbRm4NQNHi
	8cSkGRt75TsFz6XsFpSXr5Rt3Sf5Y65lJDCPyE0gvsyKj6ELgcWVpK8KJW8R8P7T
	7GKlmpCX1TpT/JuqZ/FO6FgPq0sv4JIvgKbuuWGqD3dtoCCvV2yyT1Zn5zsdy3ss
	vgNS6DePcYSyKw==
X-ME-Sender: <xms:i7b4WDiltlwMmwkEhjbG1RXMzdeXumZSIak9rhYSa3dMpxyyPuuH4w>
X-Sasl-enc: z4/dHKUehqkjb06M9IPG8f4Mnj1MYcl5JIrri8DpcLIo 1492694667
Received: from laptop (unknown [192.40.95.4])
	by mail.messagingengine.com (Postfix) with ESMTPA id E2CDE7E2E3;
	Thu, 20 Apr 2017 09:24:26 -0400 (EDT)
Message-ID: <1492694665.22019.2.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Thu, 20 Apr 2017 16:24:25 +0300
In-Reply-To: <CA+rFJSHcJbmnrtA0jqXXscj7LpV3GR6EcGeBWCGdSPbZeES+SA@mail.gmail.com>
References: <CA+rFJSHcJbmnrtA0jqXXscj7LpV3GR6EcGeBWCGdSPbZeES+SA@mail.gmail.com>
X-Mailer: Evolution 3.22.6-1 
Mime-Version: 1.0
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
X-List-Received-Date: Thu, 20 Apr 2017 13:32:45 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2017-04-20 at 14:25 +0200, Koenraad Verheyden wrote:
> Hey all,
> 
> I want to use PulseAudio with WebRTC echo cancellation. Enabling this
> depends on the webrtc-audio-processing library [1].
> In an earlier message to this list [2] it was decided to add the
> configuration option to the pulseaudio recipe, although the
> webrtc-audio-processing package isn't implemented yet in OE-core
> 
> Is there any progress on this?

I don't think anyone has been working on it.

You mentioned adding webrtc-audio-processing to oe-core, but to me
meta-oe would seem like a more natural place for the recipe, because
it's not a hard dependency of anything in oe-core.

-- 
Tanu

https://www.patreon.com/tanuk

