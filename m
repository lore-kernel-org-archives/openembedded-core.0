Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1QPk4V-0002Bi-Ax
	for openembedded-core@lists.openembedded.org;
	Fri, 27 May 2011 01:34:31 +0200
Received: by vxd7 with SMTP id 7so1105438vxd.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 26 May 2011 16:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:from
	:date:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	bh=rPHtW1kTc/BTaD5bYnLa+N6Aa+KVHWO9RbDNX7u6Tzk=;
	b=b+TZ/gdBBF4QxwB7NZBOHTLBWPv52G0uCnDjtP+94GL9vWGgY6oVV9E8cDXahk0bLD
	Jq9lJ4wTkZgLGQvZxZyKfacgZw7O87Sg6EZVc98SQmIGgn0ghSkERQQh53ZSgr+ttNyA
	Wt82rSdmFa4kYyBdB+4KOCx9yyoOs2wdBSBUs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:cc:content-type
	:content-transfer-encoding;
	b=FMukXnzq76DkJ6zwEeaH7FJz0lxD9HBpw9vnh5rm1pVbOjyXCVxTGTWEFngZsbNuUg
	b6AvQyFHR2dnmEO9xO/k+X2Rx2oWC2V7iBMj3lZVx0APTnVwKWYlxrHG9UUuLGxOGPfm
	aKe/HeRLuSVby8VqQFHW1tdNU6lAsvqlTSiOA=
Received: by 10.52.73.195 with SMTP id n3mr2135255vdv.28.1306452682072; Thu,
	26 May 2011 16:31:22 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.52.109.202 with HTTP; Thu, 26 May 2011 16:31:02 -0700 (PDT)
In-Reply-To: <1306452282.27470.214.camel@rex>
References: <cover.1306444161.git.dvhart@linux.intel.com>
	<e5f5d48165bcb5dc3ccf160a29e16ca700f85395.1306444161.git.dvhart@linux.intel.com>
	<1306452282.27470.214.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 26 May 2011 16:31:02 -0700
X-Google-Sender-Auth: TK1YRqK41xwJ0pi0s_-1n7uUxdM
Message-ID: <BANLkTinNDht1n32CvsfDY221a6xW8ZL4zw@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: Darren Hart <dvhart@linux.intel.com>,
	Koen Kooi <koen@dominion.thruhere.net>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/2] u-boot: remove UBOOT_MACHINE and COMPATIBLE_MACHINES
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
X-List-Received-Date: Thu, 26 May 2011 23:34:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, May 26, 2011 at 4:24 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> On Thu, 2011-05-26 at 14:12 -0700, Darren Hart wrote:
>> Note: I used bb.note() instead of bb.debug() to ensure the message at le=
ast
>> =C2=A0 =C2=A0 =C2=A0 makes it to the console. From what I could gather, =
bb.debug() doesn't
>> =C2=A0 =C2=A0 =C2=A0 go anywhere during recipe parsing.
>
> Why?
>
> We exclude about 30 different recipes when parsing and would you really
> want to see a usability message from each one when you likely don't care
> about it?
>
> A bb.debug is fine and the user can see it if they run with -D to get
> more info. A bb.note is just irritating.

As alternative, *If* there's a need for a one time message when
building, which is questionable, and assuming the variable is
configuration, not recipe bound, one could always install a
ConfigParsed event handler and warn if e.g. UBOOT_ENTRYPOINT or
UBOOT_LOADADDRESS are set and UBOOT_MACHINE is not.
--=20
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics


