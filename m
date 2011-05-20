Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QNUU9-0002lD-8I
	for openembedded-core@lists.openembedded.org;
	Fri, 20 May 2011 20:31:41 +0200
Received: by ewy5 with SMTP id 5so1310086ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 May 2011 11:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type;
	bh=37o0Vz/82Xtmp9dcIit8K2JMMnfbTJvCL9rx2xeO0LY=;
	b=cOwk3o3TOAhzF0xwy5Vmw8Usn4C+EyTTavj9B1Uroz8/EUGXZauwfj3rMr/yTgIeGP
	5ntgw44Kblmm/Q84rHfiqx0FEC+hZpoEHgtq5I7/TwJUUbmzYy247sluEaSL81IsXY37
	fcXAprObPx2mk7OEpxA0DlPqFwXMDsWpvY288=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=lzB0H1Nf23M35b+HkyaqbpkmCqxo/1LPvaPI/uOQ+QLWZTrdnEnVwCYMeaClnHhqS9
	b77kVCGqb5Djn8cakqpy6VTGijr8x2Eb2POJd2JVC9gdHCOwoSIGLhyJqRZPODP2MuTt
	C4zhI0nljY0YoW+wKdyN8ZRrh7Fvr9sfTFHkE=
Received: by 10.14.49.210 with SMTP id x58mr1687259eeb.12.1305916124149; Fri,
	20 May 2011 11:28:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.53.78 with HTTP; Fri, 20 May 2011 11:28:14 -0700 (PDT)
In-Reply-To: <1305892146.3424.595.camel@rex>
References: <cover.1305848960.git.raj.khem@gmail.com>
	<0a1ad440f372eec668b742c775188249c9609f11.1305848960.git.raj.khem@gmail.com>
	<1305892146.3424.595.camel@rex>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 20 May 2011 11:28:14 -0700
Message-ID: <BANLkTi=rbaGo8DX1CzDmKfgWWsRd=gkm3Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/2] opkg_svn.bb: Install rcS.d into ${D} instead of ${IMAGE_ROOTFS}
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
X-List-Received-Date: Fri, 20 May 2011 18:31:41 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 20, 2011 at 4:49 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>
> This needs to be $D, I didn't miss the brackets in my previous email :)
>
>

but that wont be relative right ? it will encode current builddir into
sstate isnt it ?


