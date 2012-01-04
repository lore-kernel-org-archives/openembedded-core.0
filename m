Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1RiTtN-0004az-EB
	for openembedded-core@lists.openembedded.org;
	Wed, 04 Jan 2012 17:40:46 +0100
Received: by qadb17 with SMTP id b17so11071131qad.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 04 Jan 2012 08:33:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	bh=BEszr7Z7GUs/AoDHyGk3cIazdLi8eiOwMy3a+ATwKu8=;
	b=naL7vGCJbxlVD/t4i16IizGw2TFZGFcGBPh72AN19R5xxfEfZGf0IdiZ0BNKHPNE8Q
	rhaLw/Fp18MFMuRiE2NFN/XMK9ts5i2dDkbizBFohIRDqfne6KGA7DeDaPn21XMT5Ks+
	Cb9OJ3maRIURIrWuUBqQAYQ9bU4etwtxssNW0=
Received: by 10.224.34.202 with SMTP id m10mr67043518qad.62.1325694798974;
	Wed, 04 Jan 2012 08:33:18 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.187.141 with HTTP; Wed, 4 Jan 2012 08:32:57 -0800 (PST)
In-Reply-To: <CAEsOVNcsY-dNYBz1Y6BVAQ-N7hVyaxOMcsniev9z455m9GYh5A@mail.gmail.com>
References: <1325689535.28005.59.camel@phil-desktop>
	<1325691189.20759.14.camel@ted>
	<CAEsOVNcsY-dNYBz1Y6BVAQ-N7hVyaxOMcsniev9z455m9GYh5A@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Wed, 4 Jan 2012 09:32:57 -0700
X-Google-Sender-Auth: EMzGEEWfoSxv9kik3UJjDGPiSxE
Message-ID: <CABcZANmEZ6Oy6q7gL2WCCtphSA7fEHJsM0dre0tNpXvPdn2crQ@mail.gmail.com>
To: McClintock Matthew-B29882 <B29882@freescale.com>, 
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: sstate compression
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
X-List-Received-Date: Wed, 04 Jan 2012 16:40:48 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Jan 4, 2012 at 9:31 AM, McClintock Matthew-B29882
<B29882@freescale.com> wrote:
> On Wed, Jan 4, 2012 at 9:33 AM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> There has already been a patch allowing different compression mechanisms
>> from Matthew posted on this mailing list. Its not been merged yet as I'd
>> really prefer one format and we didn't (and still don't) have good
>> statistics about what the tradeoffs are.
>
> I think there will always be size/speed tradeoffs and we should keep
> multiple types available.

Agreed. Sstate can get truly massive, being able to opt-into xz or
something would be lovely for us as well.
-- 
Christopher Larson


