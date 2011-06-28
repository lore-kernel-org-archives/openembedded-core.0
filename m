Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QbbAw-00031h-Tt
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Jun 2011 18:30:11 +0200
Received: by vws2 with SMTP id 2so307277vws.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Jun 2011 09:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=nErEvnu55v0HHRHx3AEy/bXCUoeJyhFdE+Vr/i9hZ4w=;
	b=NHKtrjvZurDttqAX2ZjVV1h3GWXjFKRpGnnJLBUCGDWltaf1TtD1n/b8kBsnt2Vt68
	GXEujv5+oeyJxoik0coZ+ADKPFhBErhF7uFVUR4gEBRXy6FHmkWHLheLC9A0PPtmKOcc
	3K3mVYuI9Y3d6QzSRETC2JiVmQBP2HxYNMAoU=
Received: by 10.52.176.101 with SMTP id ch5mr6411996vdc.129.1309278389059;
	Tue, 28 Jun 2011 09:26:29 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.181.2 with HTTP; Tue, 28 Jun 2011 09:26:09 -0700 (PDT)
In-Reply-To: <1309271509.20015.310.camel@rex>
References: <1309271509.20015.310.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 28 Jun 2011 09:26:09 -0700
X-Google-Sender-Auth: NDEVPYuEXO8W8LYGcXnWtc9Cvvg
Message-ID: <BANLkTiktykyb-X0v2W7Hd926ikOkkja8Pw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Heads Up: Bitbake minimum version change imminent
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 28 Jun 2011 16:30:11 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jun 28, 2011 at 7:31 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> I just wanted to let people know that we have a minimum version of
> bitbake change imminent for OE-Core.
>
> I've already pushed the changes we need to bitbake for umask, shared
> work directory and multilib and updated its version to 1.13.2. I'm
> planning to merge patches to OE-Core which depend on these changes later
> this week (and bump the minimum version OE-Core requires at the same
> time).
>
> In case it isn't clear, I've been batching things up to try and ensure
> we only have to do this once for a variety of improvements :)

I have to say that it's *extremely* unintuitive to have a minimum
version requirement on a version that hasn't even been tagged in the
git repository. If it's good enough to depend on, it should be good
enough to consider released.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


