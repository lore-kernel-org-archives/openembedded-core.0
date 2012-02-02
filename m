Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Rt1cJ-00040Q-Kg
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Feb 2012 19:42:43 +0100
Received: from mail-iy0-f180.google.com ([209.85.210.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 02 Feb 2012 10:34:45 -0800
Received: by iabz7 with SMTP id z7so3732907iab.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Feb 2012 10:34:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.42.168.202 with SMTP id x10mr3731215icy.4.1328207685166; Thu,
	02 Feb 2012 10:34:45 -0800 (PST)
Received: by 10.50.190.161 with HTTP; Thu, 2 Feb 2012 10:34:45 -0800 (PST)
In-Reply-To: <CALbNGRQg80gvCMjwEXeddMnUO2A4aMVG9KZsT04iH082b=MJTA@mail.gmail.com>
References: <1327795253-24794-1-git-send-email-schnitzeltony@googlemail.com>
	<1327795253-24794-2-git-send-email-schnitzeltony@googlemail.com>
	<4F26CD01.4050700@linux.intel.com>
	<CAPhnLPCXc6j4W8k_Ed=_Q52fLYvDB5EqFm0V8-Yg19ZC36JNEw@mail.gmail.com>
	<CALbNGRQg80gvCMjwEXeddMnUO2A4aMVG9KZsT04iH082b=MJTA@mail.gmail.com>
Date: Thu, 2 Feb 2012 10:34:45 -0800
Message-ID: <CAPhnLPBjgEJOkO7rDNyF2p_P5Lz0OQwEp=OZ4P-a74Y-5-oSgA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2 1/1] atk: add native / disable introspection / merge atk.inc->recipe / change license
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
X-List-Received-Date: Thu, 02 Feb 2012 18:42:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 1, 2012 at 1:20 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> On Wed, Feb 1, 2012 at 2:07 AM, Flanagan, Elizabeth
> <elizabeth.flanagan@intel.com> wrote:
>>
>> - LICENSE needs to be ast parsable. It should be:
>>
>> LICENSE =3D "GPL-2.0+ & LGPL-2.1+"
> I grepped around: We have exactly ONE hit for each ( GPL-2.0+ /
> LGPL-2.1+ ) in oe-core. This approach does not seem common to me..

It's not, but it really should be. I've been lax of late calling these out.

>>
>> - LGPLv2.1. It really does matter, IMHO.
>>
>> For some reason OBS says this is only LGPL-2.1+ I haven't looked at it
>> too closely, but COPYING is pretty clear here.
>>
>> -b
>>
> Sorry to say so: The original patch did not touch license at all. It
> just moved it from inc -> bb. I feel a bit hijacked here and loose
> motivation of further versions of this patch...
>

I apologize. That wasn't my intent as I didn't see the move from inc
to bb. I'll correct LICENSE after the pull.

-b

> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
Elizabeth Flanagan
Yocto Project
Build and Release


