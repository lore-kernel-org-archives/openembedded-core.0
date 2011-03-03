Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1Pv9Qz-00026T-8B
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Mar 2011 15:23:20 +0100
Received: by wyb38 with SMTP id 38so1061269wyb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Mar 2011 06:21:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type;
	bh=zhHtd9YtarlVYQUPHjKvMY71NEicelD6vq3jfHCKEqo=;
	b=pkn8jKFa+6jRWSJq5wmvKVpLNI58jwbCpxnlYIWIgYNLzqEkPo7+JlHod78090V6An
	V5mOE2ACVaWleZx7m6ruSU5C1wFrUBY54E+Gd31eFj62copqinwQEXunihcSfmd6anqp
	K7vX9sPuNFuUbmXu39L3HT+77mcpr3NK17Yls=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type;
	b=WjDCV/ytWAJEn/s6h+8hQWQtz0aKZZzHhn5vlNYTBDFIwBZ8FwII/yUwp/HJNwuXsU
	2e8XNB5bTwHgeGJBW53O+KvyE6FVj9Dbn/2kGCoCSu/1VbIKCZD6ppepcQgE+oPi4I3M
	Vk/zSIXGTLyr9jfX2g2qNyFG4TphnPG/3sKOs=
Received: by 10.216.65.16 with SMTP id e16mr890250wed.73.1299162108031; Thu,
	03 Mar 2011 06:21:48 -0800 (PST)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.216.246.11 with HTTP; Thu, 3 Mar 2011 06:21:21 -0800 (PST)
In-Reply-To: <AANLkTinAUZ72Tfmm4K8F5kJDLUrfO6AmzEKaLfG9NX5x@mail.gmail.com>
References: <4D6E7EB1.5080602@windriver.com>
	<41F9E0FC-E0A1-4C7F-8999-3E1B53FDDEE1@dominion.thruhere.net>
	<1299157757.2550.5.camel@scimitar>
	<E900D076-3678-445D-89D2-973EC3A558A8@dominion.thruhere.net>
	<1299161111.2550.8.camel@scimitar>
	<AANLkTinAUZ72Tfmm4K8F5kJDLUrfO6AmzEKaLfG9NX5x@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 3 Mar 2011 07:21:21 -0700
X-Google-Sender-Auth: fOf9FZ7fgdpp8yLVvtFv1SBSdy4
Message-ID: <AANLkTikBJWF_azi5NzsOrSJLWGvcj+Fr+nm0+kFzdT-b@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: oe-core cleanup...
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
X-List-Received-Date: Thu, 03 Mar 2011 14:23:20 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Mar 3, 2011 at 7:14 AM, Chris Larson <clarson@kergoth.com> wrote:
> On Thu, Mar 3, 2011 at 7:05 AM, Joshua Lock <josh@linux.intel.com> wrote:
>> I agree, in fact yesterday I discovered we have the beginnings of such a
>> tool (bitbake-layers) written by Chris. Currently it prints out which
>> recipes are being modified by a .bbappend and .bbappend files for which
>> no recipe exists.

Note that it also warns about bbappending to a non-preferred version
of a recipe, but not bbappending to the preferred version of the
recipe, to cover the case where a bump of an earlier layer adds a new
version without removing the old.  I was trying to catch all the cases
where your local changes might seem "lost" when updating things.

On another note, I was really surprised at just how painless it was to
create a new standalone tool to do this, considering it bypasses much
of the infrastructure which the main bitbake tool uses.  There are
definitely still some hiccups in bitbake we should fix to make it
easier, but it wasn't bad at all, which was great to see, and we'll
have to think about what other standalone tools might be useful in the
long term.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


