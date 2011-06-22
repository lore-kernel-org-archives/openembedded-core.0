Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <anders.darander@gmail.com>) id 1QZGN8-0001o9-1O
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Jun 2011 07:53:06 +0200
Received: by fxm19 with SMTP id 19so457507fxm.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Jun 2011 22:49:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=FZwPhT87TvJT6Xmi7V3CaVE6aTG2P7Oj1mZI8PGFo+Y=;
	b=t2CCD95aNCObdTZHeTELEFAHTXPMsUqtMfNHPS8UXKv7uhGLzu12+bv2AZrUSF5J0z
	zAx8RnuY9dUXTAKYQdZHwKqP2uIPi5IYYLo074IFUNowZu9+kkFhXOuLuQ7+n5qvpXnd
	u5ixxSFYlYi1ytZC0m/oifh48Jb70b6Wmz/1U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=Dc2yw43QGOulGMzCxbWmaz6DHzbUvKpY43Y3pQaRa3+06wDTxc0znI21yUM7/h3Zm7
	MscLeWI38aQ6ROi26dZSz00ZBjmslqF/9Sm7oryFWqXF1OE6beXI4uj/kbppxw63izBi
	LMMy9QHjgt+x7s3l8ccvsqBs80GuPWk2CF6d8=
MIME-Version: 1.0
Received: by 10.223.33.80 with SMTP id g16mr301122fad.125.1308721772086; Tue,
	21 Jun 2011 22:49:32 -0700 (PDT)
Received: by 10.223.114.1 with HTTP; Tue, 21 Jun 2011 22:49:32 -0700 (PDT)
In-Reply-To: <BANLkTik3rm8gG9Hik9O0QoVNp7ft2xW-ZQ@mail.gmail.com>
References: <cover.1308680000.git.anders@chargestorm.se>
	<8e57843c8775752059dc6acacdbd7751b1ed7082.1308680000.git.anders@chargestorm.se>
	<1308682002.3083.12.camel@lenovo.internal.reciva.com>
	<BANLkTik3rm8gG9Hik9O0QoVNp7ft2xW-ZQ@mail.gmail.com>
Date: Wed, 22 Jun 2011 07:49:32 +0200
Message-ID: <BANLkTikzKKXvC0FFWfUPhicM3-Ana4Nqww@mail.gmail.com>
From: Anders Darander <anders.darander@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC PATCH 2/5] module-init-tools-cross: add provides for depmod-3
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
X-List-Received-Date: Wed, 22 Jun 2011 05:53:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 21, 2011 at 21:03, Anders Darander
<anders.darander@gmail.com> wrote:
> On Tue, Jun 21, 2011 at 20:46, Phil Blundell <pb@pbcl.net> wrote:
>> On Tue, 2011-06-21 at 20:18 +0200, Anders Darander wrote:
>>> -PROVIDES += "virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}depmod-2.6"
>>> +PROVIDES += "virtual/${TARGET_PREFIX}depmod virtual/${TARGET_PREFIX}depmod-2.6 virtual/${TARGET_PREFIX}depmod-3"
>>
>> Can we not just ditch the versioned virtuals and have all the
>> dependencies use plain virtual/depmod now?
>
> Well, when thinking about it, that sounds like a good idea. If we are
> ditching 2.4-support, as in my patches, there will only be one module
> format, as well as one depmod (or two, if we count the busybox
> version).

I'll try to address this, as well as an update to module-init-tools 3.16 in a
v2. It'll probably take a few days before I can find the time necessary, though.

Regards,
Anders


