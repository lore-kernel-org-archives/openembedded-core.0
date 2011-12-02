Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RWZGc-0001EQ-TP
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 20:59:31 +0100
Received: by qcqw6 with SMTP id w6so467407qcq.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 02 Dec 2011 11:52:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=POeACBVLRX/z5W246CoYcnKWDHqsE9Xrs/Y6/9VLKgg=;
	b=uWtfAo0AAI3O1Xu8otllcqlbBkpP2DPWVW08hc+5f4Ki7CRis5+0yecLcR9maTSgFt
	aCBgE+jndoz51sxLM7vgjxyOXO5sLkAauzlABQm4x0qfVPG73I27sKl+nE0ZTPRj+N6g
	kbbmoD37kc58FAhZfwuQ5So6y/IhJxIFV1T/s=
Received: by 10.229.237.194 with SMTP id kp2mr656491qcb.200.1322855567418;
	Fri, 02 Dec 2011 11:52:47 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.73.200 with HTTP; Fri, 2 Dec 2011 11:52:26 -0800 (PST)
In-Reply-To: <20111202161847.GF3770@jama.jama.net>
References: <95547EE2-9E3E-4FB6-AA2A-A9653029F971@dominion.thruhere.net>
	<20111201122407.GB19917@jama.jama.net> <1322743071.17484.119.camel@ted>
	<CAP9ODKpnTxcRDJxZKe0bue4RDqydJ44TmEf0ukv43ATgBcDV7Q@mail.gmail.com>
	<20111201130733.GF19917@jama.jama.net> <1322771625.17484.149.camel@ted>
	<ED3E0BCACD909541BA94A34C4A164D4C401A404C@post.tritech.se>
	<20111202161847.GF3770@jama.jama.net>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 2 Dec 2011 12:52:26 -0700
X-Google-Sender-Auth: qrpig6fVNflYQIrNK4DVcTA8HT4
Message-ID: <CABcZANnGcgHpTZ1g+bA7Aruft9TW-nViOge8J1vbv7nR32qiig@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Coordinating inter-layer dependencies
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
X-List-Received-Date: Fri, 02 Dec 2011 19:59:31 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 2, 2011 at 9:18 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> So if you have some layer adding
> layerB: PR .= ".b0"
> and other
> layerA: PR .= ".a0"
>
> and PR appends are evaluated in this order, then you will break upgrade
> patch forever if you have to remove layerB for some reason and you
> cannot even fix it by bumping numbers in your layerA unless you rename
> all PR appends as ".c0" right? That's why I prefer to use PRINC.

And if you *remove* a layer you used to use? Will this not result in
it decrementing and breaking the upgrade path in that way? Or does
this persist the way localcount does?
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


