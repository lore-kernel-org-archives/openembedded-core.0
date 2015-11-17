Return-Path: <pb@pbcl.net>
Received: from hetzner.pbcl.net (mail.pbcl.net [88.198.119.4])
	by mail.openembedded.org (Postfix) with ESMTP id 6A8816010B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Nov 2015 17:09:42 +0000 (UTC)
Received: from [2a00:14f0:e04c:1:e23f:49ff:fe47:b7fd] (helo=phil-desktop)
	by hetzner.pbcl.net with esmtpsa (TLS1.2:RSA_AES_128_CBC_SHA1:128)
	(Exim 4.80) (envelope-from <pb@pbcl.net>)
	id 1ZyjlG-0006WJ-3i; Tue, 17 Nov 2015 18:09:42 +0100
Message-ID: <1447780178.1472.29.camel@pbcl.net>
From: Phil Blundell <pb@pbcl.net>
To: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 17 Nov 2015 17:09:38 +0000
In-Reply-To: <CAJTo0La98Rv=0ZwdHce4FTknVAmZnGEnNmpXopK9+8cKqbnj8Q@mail.gmail.com>
References: <1447739760-14395-1-git-send-email-armccurdy@gmail.com>
	<1447773377.1472.28.camel@pbcl.net>
	<CAJTo0La98Rv=0ZwdHce4FTknVAmZnGEnNmpXopK9+8cKqbnj8Q@mail.gmail.com>
X-Mailer: Evolution 3.16.5-1 
Mime-Version: 1.0
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] directfb.inc: force bfd linker for armv7a
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
X-List-Received-Date: Tue, 17 Nov 2015 17:09:47 -0000
Content-Type: multipart/alternative; boundary="=-TI9qYjqriTtY4UBU9krn"

--=-TI9qYjqriTtY4UBU9krn
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2015-11-17 at 16:44 +0000, Burton, Ross wrote:
> 
> On 17 November 2015 at 15:16, Phil Blundell <pb@pbcl.net> wrote:
> > Does the resulting directfb-csource binary actually work with that
> > change?  My recollection is that ld.bfd will just silently permit
> > relocs that gold (correctly) refuses to allow.
> > 
> Personally I don't use DirectFB (and am constantly surprised it's
> still a thing) so at this point I'm not going to merge either of
> these patches until someone can confirm that their fix *works on
> hardware* instead of just fixing the build.
I think that's a reasonable position.  In any case, the underlying
issue is a compiler bug and ought really to be fixed there rather than
patching directfb or any other package that just happens to fall over
it.
p.

--=-TI9qYjqriTtY4UBU9krn
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: 7bit

<html><head></head><body><div>On Tue, 2015-11-17 at 16:44 +0000, Burton, Ross wrote:</div><blockquote type="cite"><div dir="ltr"><div><br><div class="gmail_quote">On 17 November 2015 at 15:16, Phil Blundell <span dir="ltr">&lt;<a href="mailto:pb@pbcl.net" target="_blank">pb@pbcl.net</a>&gt;</span> wrote:<br><blockquote type="cite"><div id=":4vj" class="a3s" style="overflow:hidden">Does the resulting directfb-csource binary actually work with that<br>
change?&nbsp; My recollection is that ld.bfd will just silently permit<br>
relocs that gold (correctly) refuses to allow.</div><br></blockquote></div><br>Personally I don't use DirectFB (and am constantly surprised it's still a thing) so at this point I'm not going to merge either of these patches until someone can confirm that their fix *works on hardware* instead of just fixing the build.</div></div>
</blockquote><div><br></div><div>I think that's a reasonable position. &nbsp;In any case, the underlying issue is a compiler bug and ought really to be fixed there rather than patching directfb or any other package that just happens to fall over it.</div><div><br></div><div>p.</div><div><br></div></body></html>

--=-TI9qYjqriTtY4UBU9krn--
