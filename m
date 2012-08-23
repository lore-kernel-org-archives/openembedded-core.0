Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T4M2Y-0001v1-82
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Aug 2012 03:16:54 +0200
Received: by eekb57 with SMTP id b57so46451eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Aug 2012 18:04:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=Q52jan/6N6wweqB3t//ny76zJzIkGai7j/K8j6DdHj4=;
	b=bHab0P5/6WCm/xwRm7QzBpDEJ3kH8KHpFWFmAjyWLKAE1pj9i5EDQfFHfAPnQp7uUN
	YEBZxvYSMCEJ98B8z2J82DT5Bq2gexKC+LBmRan6qkbWprWm4oV5ojwytRytDeMnx64I
	oFJ7hrW1qmS0NwWlc+vhW1cq6e3GBWhKZZ3jJGld8Vu1CigUZvg18Hw+oneG+f92R3/z
	3PIx59JPlMBnu3VQkx9bGAIXXYjPSAkgoLOJs7Y+vbPxvIIl8mvt7NUSc2S9ndGe6jiG
	qcmb0lQkAqo2zndL0XX20sF9y2nHH3+xQKt8QFjyAcYCyVDfn6FuvB4tUs6fBr0b1PTI
	3Txg==
Received: by 10.14.218.134 with SMTP id k6mr21222244eep.14.1345683888519; Wed,
	22 Aug 2012 18:04:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 22 Aug 2012 18:04:18 -0700 (PDT)
In-Reply-To: <CDED78A957032E45B3239CDDA7642D151C900ABE@ORSMSX105.amr.corp.intel.com>
References: <alpine.DEB.2.02.1208222028250.26220@oneiric>
	<CDED78A957032E45B3239CDDA7642D151C900ABE@ORSMSX105.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Aug 2012 18:04:18 -0700
Message-ID: <CAMKF1sp8pnZGWk=SGSf2aW-w78HTiMzXzLtW93qMWP98+3H5OA@mail.gmail.com>
To: "Stewart, David C" <david.c.stewart@intel.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: is there an image for the smallest feasible bootable system?
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 23 Aug 2012 01:16:54 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Aug 22, 2012 at 5:39 PM, Stewart, David C
<david.c.stewart@intel.com> wrote:
> I think you want the poky-tiny distro. :-)
>
>>-----Original Message-----
>>From: openembedded-core-bounces@lists.openembedded.org
>>[mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>>Of Robert P. J. Day
>>Sent: Wednesday, August 22, 2012 5:32 PM
>>To: OE Core mailing list
>>Subject: [OE-core] is there an image for the smallest feasible bootable
>>system?
>>
>>
>>  for the purposes of demo'ing in a class, i'm interested in building
>>the *really* minimal system that will boot to a shell prompt.  i've
>>examined core-image-minimal but it seems pretty clear that there's
>>stuff in that image that isn't, strictly speaking, essential.
>>
>>  anyone created an image file for a truly tiny bootable image?

ucslugc is pretty small 2.3Mb rfs + kernel

>>thanks.
>>
>>rday
>>
>>--
>>
>>===========================================================
>>=============
>>Robert P. J. Day                                 Ottawa, Ontario, CANADA
>>                        http://crashcourse.ca
>>
>>Twitter:                                       http://twitter.com/rpjday
>>LinkedIn:                               http://ca.linkedin.com/in/rpjday
>>===========================================================
>>=============
>>
>>_______________________________________________
>>Openembedded-core mailing list
>>Openembedded-core@lists.openembedded.org
>>http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


