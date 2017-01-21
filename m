Return-Path: <tanuk@iki.fi>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com
	[66.111.4.25])
	by mail.openembedded.org (Postfix) with ESMTP id 55D8771B86
	for <openembedded-core@lists.openembedded.org>;
	Sat, 21 Jan 2017 00:47:48 +0000 (UTC)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailout.nyi.internal (Postfix) with ESMTP id 8D695207D7
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 19:47:48 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute5.internal (MEProxy); Fri, 20 Jan 2017 19:47:48 -0500
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=
	messagingengine.com; h=content-transfer-encoding:content-type
	:date:from:in-reply-to:message-id:mime-version:references
	:subject:to:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=
	smtpout; bh=lALGWrISaopnhrdO0kT8dZ/6E4g=; b=aaB8pVSCrebQNkt+s8vV
	+2oiV0SQVOX+5QhucHujO/kyngBUbuTMxESRPTs8s3j8CfOlB764+nvZ7tUdAXie
	98KjZKYCFZWWwebQeE6ulg+rFQdGof/JxdF8Mrcd6ZvBexH4Qnsp7EfRUqyowUkC
	5JlUIAWnOqaLe3ADOIygxUM=
X-ME-Sender: <xms:tK-CWA14f1AlwaWjoY7MeoDZp0ucIur7CsgkYg7O7-oX378v7Um3wg>
X-Sasl-enc: Rlz8OIEQoxnEsht41uTypOeue/E7kGC2xNXDGoACAhEg 1484959668
Received: from laptop (unknown [192.40.95.2])
	by mail.messagingengine.com (Postfix) with ESMTPA id 0F9AF7EC41
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Jan 2017 19:47:47 -0500 (EST)
Message-ID: <1484959666.17033.1.camel@iki.fi>
From: Tanu Kaskinen <tanuk@iki.fi>
To: openembedded-core@lists.openembedded.org
Date: Sat, 21 Jan 2017 02:47:46 +0200
In-Reply-To: <CAJTo0LazMARfg0pFQjC8+=v3xnQcD0P=-8ByrrSnddOSUmriNg@mail.gmail.com>
References: <1484917866-24351-1-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LbjMd+wJtgGePXRTy7YZVBb4rfr69jhcfeawiUGAYLrCQ@mail.gmail.com>
	<CAJTo0LazMARfg0pFQjC8+=v3xnQcD0P=-8ByrrSnddOSUmriNg@mail.gmail.com>
X-Mailer: Evolution 3.22.3-1 
Mime-Version: 1.0
Subject: Re: [PATCH V2] alsa-lib: update 1.1.2 -> 1.1.3
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
X-List-Received-Date: Sat, 21 Jan 2017 00:47:48 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2017-01-21 at 00:16 +0000, Burton, Ross wrote:
> On 21 January 2017 at 00:12, Burton, Ross <ross.burton@intel.com> wrote:
> 
> > Computing transaction...warning: Can't install
> > alsa-lib-dev-1.1.3-r0.0@core2_32: Can't install
> > alsa-lib-dev-1.1.3-r0.0@core2_32: no package provides alsa-lib =
> > 1.1.3-r0.0
> > 
> 
> Had a ten second look at 1.1.2, there's an alsa-lib package that contains
> /usr/lib/alsa-lib/smixer/*.so.  If these disappeared (or were
> non-deterministic) in the 1.1.3 build alsa-lib itself would be empty, and
> the dependency would break.

The smixer libraries indeed disappeared in 1.1.3 (when python support
isn't enabled):
http://git.alsa-project.org/?p=alsa-lib.git;a=commit;h=a668a94238dc67b19ae187b52a161e027d79ee5d

-- 
Tanu

https://www.patreon.com/tanuk

