Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QuOdr-0000p6-F9
	for openembedded-core@lists.openembedded.org;
	Fri, 19 Aug 2011 14:57:43 +0200
Received: by ywa12 with SMTP id 12so1191439ywa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 19 Aug 2011 05:53:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=genu5zxe/fXlae854vMzM2sIw4pbpbypkHHZjz+NDCM=;
	b=sEvKz0KB1/sdbo80EClJjA+vr9VxpWYiO8o+bXaPWY1/5CScTLQGCAEFRn250HRFST
	5iwCiJrj7EEyKoZjNU7ibWLlCMFRkqKz2oZj/2O7fcS1oBmjjicTf9SYEWxQ1uJyw4sD
	ruNoYfr5bTTJlFAk46O5dOzdVGAWONveb0aQQ=
MIME-Version: 1.0
Received: by 10.101.163.16 with SMTP id q16mr2197269ano.76.1313758381548; Fri,
	19 Aug 2011 05:53:01 -0700 (PDT)
Received: by 10.100.95.3 with HTTP; Fri, 19 Aug 2011 05:53:01 -0700 (PDT)
In-Reply-To: <1313746981.6733.268.camel@phil-desktop>
References: <cover.1313730559.git.bruce.ashfield@windriver.com>
	<e7036174cf607031e13323564f402c7b805e4572.1313730559.git.bruce.ashfield@windriver.com>
	<1313746981.6733.268.camel@phil-desktop>
Date: Fri, 19 Aug 2011 08:53:01 -0400
Message-ID: <CADkTA4MaaydRfb0YCgXOF1NGZbVcGV3Z+iEAo_qqtxSz57rdyw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/3] linux-yocto: restoring LINUX_VERSION ?= "3.0"
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
X-List-Received-Date: Fri, 19 Aug 2011 12:57:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 19, 2011 at 5:43 AM, Phil Blundell <philb@gnu.org> wrote:
> On Fri, 2011-08-19 at 01:20 -0400, Bruce Ashfield wrote:
>> diff --git a/meta/recipes-kernel/linux/linux-yocto_3.0.bb b/meta/recipes=
-kernel/linux/linux-yocto_3.0.bb
>> index 44f1ebe..5d9871f 100644
>> --- a/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>> +++ b/meta/recipes-kernel/linux/linux-yocto_3.0.bb
>> @@ -11,7 +11,7 @@ KMACHINE_qemuarm =A0=3D "yocto/standard/arm-versatile-=
926ejs"
>> =A0KBRANCH =3D ${KMACHINE}
>> =A0KMETA =3D meta
>>
>> -LINUX_VERSION ?=3D "3.0.1"
>> +LINUX_VERSION ?=3D "3.0"
>> =A0LINUX_VERSION_EXTENSION ?=3D "-yocto-${LINUX_KERNEL_TYPE}"
>>
>> =A0SRCREV_machine_qemuarm =3D "36b4cdddcafc711f0ec9ad97882f23a6443c61b2"
>
> That's going to cause PV to go backwards, right? =A0If you're going to do
> that then you probably ought to consider bumping PE to retain
> monotonicity.

Indeed. I always just think of LINUX_VERSION as yet another package interna=
l
variable (from non-bitbake experience), so tweaking it has no impact
on this sort
of thing.

I can look into changing the epoch .. but not until Monday or later in
the weekend.

Cheers,

Bruce

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


