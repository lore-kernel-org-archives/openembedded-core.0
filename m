Received: from mail-wg0-f41.google.com ([74.125.82.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <twoerner@gmail.com>) id 1UZl3i-00074O-BK
	for openembedded-core@lists.openembedded.org;
	Tue, 07 May 2013 18:48:46 +0200
Received: by mail-wg0-f41.google.com with SMTP id y10so4103322wgg.4
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 May 2013 09:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type;
	bh=+kpzu+Tv9QJop3574SvHbif1fRoHyUoCqNDcGTIzneQ=;
	b=e5hZ4eFG8Gm35/s6M/9WDZ1tha5AGPg3O2mZ0aW5tpr5t1sB3T0mPfxenheg9t6pyf
	eSbQLwR+fFHlhv162FZpkcRygk0d9ZwOSELLw6GNoOIbvv3VedMjYsHu5oDSRsTusEmI
	ELC3+QqxACb1T+LJcVfQO09cLmPlC69H7gVF1NxOg4inoTd5OrYPb/MkxfBl2IwoGAS1
	gog72b90+0UXe70XqWkrcxIbVUuO32QojK60dhfGCzIhsdYMblEEAhlOMoXkkiusmilX
	jsPpgTFXNicNieWrkliopbCXiVROFpWQQICj0AA/uV36bjmnkKdtybhxLxXxZYAWYFO3
	S7Gg==
MIME-Version: 1.0
X-Received: by 10.180.185.135 with SMTP id fc7mr16156842wic.29.1367944198098; 
	Tue, 07 May 2013 09:29:58 -0700 (PDT)
Received: by 10.194.5.132 with HTTP; Tue, 7 May 2013 09:29:57 -0700 (PDT)
In-Reply-To: <1367930701.27116.31.camel@ted>
References: <1367930701.27116.31.camel@ted>
Date: Tue, 7 May 2013 12:29:57 -0400
Message-ID: <CAHUNapT--78aOf=eCava7w9VsHAD8fL3odbreW-6EATt6mujbA@mail.gmail.com>
From: Trevor Woerner <twoerner@gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
Cc: yocto <yocto@yoctoproject.org>,
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [yocto] Status Update
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
X-List-Received-Date: Tue, 07 May 2013 16:49:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, May 7, 2013 at 8:45 AM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
> 1.3.2
> =====
>
> I've merged a lot of queued changes that Ross prepared for 1.3.2 and
> this is now undergoing testing.

I have a patch for Danny to allow qemu-native of qemu-1.2.0 to compile
on openSuSE 12.3 (which, apparently, is also affected by the same (or
a similar) DSO linking change that affects fedora). Are the queued
changes available somewhere so I can check this hasn't already been
applied?


