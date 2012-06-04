Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Sba8L-0007A1-SJ
	for openembedded-core@lists.openembedded.org;
	Mon, 04 Jun 2012 18:27:57 +0200
Received: by eekd49 with SMTP id d49so1604392eek.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 04 Jun 2012 09:17:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=2jaNt7zBMxz8xfoSTiAVZYv+J1Ts58Wv1dpNo7mAsgg=;
	b=cfcL96c8244P7p14VLdn+ktWAQjuV2vp96rG5alB25xGcx24cpxAXgujP0rrkeytPe
	q4POIQ3VmSX8YFXzimtQeC8esI3lxbcSj1CO2y8x93UuE2AMjA4Csi330uuvOzftGMW/
	U+qAsQh4ZI9fiXUp609f+3JteClmVuLDCd2CEK2Yk4OuTjAsQ9f6LzyXY5L/Bo02na8L
	Te9mFFFjLsXWovYPQLaxXtTrxTMR9FQjB4r3tqqmK4eRR9hWLi91TyPBtySuZJBYq+uH
	NzU7ZL/gWM74Tv/GpFqA9zdXs5BT93OdomAft+GZ0+a1h/jc+ZqlZKKHLre5ihCcI6GF
	wqFg==
Received: by 10.14.100.194 with SMTP id z42mr6498539eef.146.1338826652739;
	Mon, 04 Jun 2012 09:17:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Mon, 4 Jun 2012 09:17:02 -0700 (PDT)
In-Reply-To: <CAOHjBZvFwiq97xv2kf6OjvCbPUCmX5tQ0P5NjvWXb--97oVvgg@mail.gmail.com>
References: <CAOHjBZukor5Cy+2N-s0rFiiwR8Epp2vDaPuw7o5B4u-BMno3LQ@mail.gmail.com>
	<CAOHjBZvFwiq97xv2kf6OjvCbPUCmX5tQ0P5NjvWXb--97oVvgg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 4 Jun 2012 09:17:02 -0700
Message-ID: <CAMKF1sotQWH+E5+28gKXfRfLJ9mQUN3EQpe2sUziBgu1CXYiZQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: libiconv/gettetxt circular dependency on eglibc
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
X-List-Received-Date: Mon, 04 Jun 2012 16:27:58 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jun 4, 2012 at 1:33 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> Solved,
> I missed to set TARGET_OS = "eglibc" leaving it to "uclibc", my previous
> build...

thats wrong. If you are using OE-Core then the variable to set it TCLIBC
and TARGET_OS is usually not needed to set.

and libiconv is internal to eglibc so when using eglibc it should
provide the libiconv
package.

>
> Cheers,
> Giuseppe
>
> 2012/6/4 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
>>
>> Hi All,
>>
>> I'm falling in a circular dependency error between libiconv and gettext
>> during eglibc build.
>> libiconv (as set in tclibc-eglibc.inc) is set to "eglibc", so the recipe
>> for libiconv shouldn't be included
>> in the build list (it inherits gettext and gettext depends on libiconv).
>> Please can you clarify this?
>>
>> Many thanks,
>> Giuseppe
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


