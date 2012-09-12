Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TBhu6-0004No-3s
	for openembedded-core@lists.openembedded.org;
	Wed, 12 Sep 2012 10:02:34 +0200
Received: by eekb57 with SMTP id b57so912193eek.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Sep 2012 00:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=o8W0MwAd8ngDTuRMe+y5JF0g7vB4Qx+jPjAWuDk4WXg=;
	b=Mtt4anvw2ohfhLibr0cA34Y7Nrv9sn4JTq7+p5TWj7PK9kO4Rz3+72E59iVHAgmUy/
	z3rblKncvCJA21Ee9ez4Oxm01j3zM7JaYE6/IZ+UATOT9wNEPNbCDGo2Kcu4Epz2nRHi
	m3gmICyvrWVKOBph8oke0X0LEnsku2fHz2tXZSEgtSXcWKKDxk7h1FN5pQTPhR4l92hH
	P0YLrJGyCOlV8cefyUCKflJi9i5VhzCldn6TIHkmS0+MO9Bzv1hrUiYEV227qzbfanK0
	6TNQUuokyl4ztT/vm0Mp+KL+iXo6pIPC4KY/N0XA5Kgtx8O5CAQlZ1V7JU7VOLheg95Y
	zOEw==
Received: by 10.14.173.131 with SMTP id v3mr23673440eel.15.1347436202263; Wed,
	12 Sep 2012 00:50:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Wed, 12 Sep 2012 00:49:32 -0700 (PDT)
In-Reply-To: <1347431522.29443.92.camel@x121e.pbcl.net>
References: <1347429555-32159-1-git-send-email-raj.khem@gmail.com>
	<1347431522.29443.92.camel@x121e.pbcl.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 12 Sep 2012 00:49:32 -0700
Message-ID: <CAMKF1srBJoHJiARTyvDFuY9OQiFXg3j6ODVayuHUuXmHhCaEcw@mail.gmail.com>
To: Phil Blundell <philb@gnu.org>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH V2 1/3] kernel.bbclass, module-base.bbclass: Use CC to form KERNEL_CC
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
X-List-Received-Date: Wed, 12 Sep 2012 08:02:34 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 11, 2012 at 11:32 PM, Phil Blundell <philb@gnu.org> wrote:
> On Tue, 2012-09-11 at 22:59 -0700, Khem Raj wrote:
>> kernel compiler is not special and we currently have it so
>> we want to pass -march and -mtune options as CFLAGS to kernel
>> build so that compiler picks the right subarch flags when
>> compiling assembly files in particular.
>
> Historically, the kernel compiler has indeed been special: there have
> been some machines where, due to bugs in the kernel or the compiler or
> both, we need to use a different version of the compiler for the kernel
> than we use for userspace.  The most famous example of this were the old
> ARM kernels back in the day which needed gcc-2.95 long after everyone
> else had stopped using it, but I think there might be a few cases where
> the same situation obtains even today.

I agree with history but we have moved away from 2.9x for long.
moreover v1 of this patch has been posted for weeks no one raised a
concern which I take that such cases are not there anymore with
OE-Core

>
> If you remove ${KERNEL_CCSUFFIX} then we will lose the ability to do
> that (easily).  I'm not necessarily opposed to such a change but I think
> it does need to be justified with clear benefits.
>

again if there is a usecase with OE-Core of such a kind. I will be
happy to deal with it no one has shown me one.

> p.
>
>


