Received: from Galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
 by mx.groups.io with SMTP id smtpd.web12.2206.1592897283948655866
 for <openembedded-core@lists.openembedded.org>;
 Tue, 23 Jun 2020 00:28:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: linutronix.de, ip: 193.142.43.55, mailfrom: torbenh@linutronix.de)
Received: from torbenh by Galois.linutronix.de with local (Exim 4.80)
	(envelope-from <torbenh@linutronix.de>)
	id 1jndLd-0003RR-0I; Tue, 23 Jun 2020 09:28:01 +0200
Date: Tue, 23 Jun 2020 09:28:00 +0200
From: "Torben Hohn" <torbenh@linutronix.de>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [OE-core] [PATCH] kernel-fitimage.bbclass: allow passing UBOOT_SIGN_EXTRA_OPTS to uboot-mkimage
Message-ID: <20200623072800.GA20916@linutronix.de>
References: <20200622135025.16141-1-torben.hohn@linutronix.de>
 <ccbfaaf49b7c20b3b9dfef021d726f1ddf54b2f2.camel@linuxfoundation.org>
MIME-Version: 1.0
In-Reply-To: <ccbfaaf49b7c20b3b9dfef021d726f1ddf54b2f2.camel@linuxfoundation.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Mon, Jun 22, 2020 at 11:06:53PM +0100, Richard Purdie wrote:
> On Mon, 2020-06-22 at 15:50 +0200, Torben Hohn wrote:
> > To use pkcs11, it is necessary to pass "-N pkcs11".
> > And there are also a few more options, that are useful.
> > 
> > Pass UBOOT_SIGN_EXTRA_OPTS to uboot-mkimage, when signing the
> > fitImage.
> > 
> > Signed-off-by: Torben Hohn <torben.hohn@linutronix.de>
> > ---
> >  meta/classes/kernel-fitimage.bbclass | 1 +
> >  1 file changed, 1 insertion(+)
> > 
> > diff --git a/meta/classes/kernel-fitimage.bbclass
> > b/meta/classes/kernel-fitimage.bbclass
> > index 72b05ff8d1..afb62f1071 100644
> > --- a/meta/classes/kernel-fitimage.bbclass
> > +++ b/meta/classes/kernel-fitimage.bbclass
> > @@ -474,6 +474,7 @@ fitimage_assemble() {
> >  			${@'-D "${UBOOT_MKIMAGE_DTCOPTS}"' if
> > len('${UBOOT_MKIMAGE_DTCOPTS}') else ''} \
> >  			-F -k "${UBOOT_SIGN_KEYDIR}" \
> >  			$add_key_to_u_boot \
> > +                        ${UBOOT_SIGN_EXTRA_OPTS} \
> >  			-r arch/${ARCH}/boot/${2}
> >  	fi
> >  }
> 
> Does this new option need documenting in the class headers? or at least
> somewhere? I don't think it currently exists?

Yes. its new.

> 
> At the very least there should be a ??= assignment to "" as a default
> somewhere?

Shall i put that in meta/classes/uboot-sign.bbclass ?


> 
> Cheers,
> 
> Richard
> 

-- 
Torben Hohn
Linutronix GmbH | Bahnhofstrasse 3 | D-88690 Uhldingen-Mühlhofen
Phone: +49 7556 25 999 18; Fax.: +49 7556 25 999 99

Hinweise zum Datenschutz finden Sie hier (Informations on data privacy 
can be found here): https://linutronix.de/kontakt/Datenschutz.php

Linutronix GmbH | Firmensitz (Registered Office): Uhldingen-Mühlhofen | 
Registergericht (Registration Court): Amtsgericht Freiburg i.Br., HRB700 
806 | Geschäftsführer (Managing Directors): Heinz Egger, Thomas Gleixner
