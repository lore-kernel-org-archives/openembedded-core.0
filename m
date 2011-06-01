Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QRqGR-0005fd-0x
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Jun 2011 20:35:31 +0200
Received: by wwb17 with SMTP id 17so76987wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Jun 2011 11:32:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=NhcFpov+5jf8Zt+7+KG+PD1g+Z3wCkh0JMCqFRPwALk=;
	b=kY6bXotfPvpJzw61k6YFii+gG2ikuG8+Lzc+5MSvKDqBLDcWABR0f0DhRFktJQhlu5
	T2qj9QsGZa7AJQl2XrvCBQ2zLu/iRlC89EjUIP5lgMb2u6vlyY70VnrhQPsJ4t29iLag
	6uonSqkdZpmWL2zy0HaAMdnCy9e7rJGkVC6xg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=kxHxqZTwe0zbcdiR1s41blXk7OmMOCw4KhVn1m+E+BOXXvaVjvpwwzB86Vcshyf/5O
	Nb8O/lylnsrdWZyAvPXcKQkx+NvAKjaZ3Rajot+C3KXqxjGLd1sbQ5FJkoWcPsQu/4vB
	vxFoUt34UDGWEWwsfmEGdyRpFtXgdb++loUzo=
Received: by 10.216.67.72 with SMTP id i50mr7570875wed.29.1306953140120; Wed,
	01 Jun 2011 11:32:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.28.19 with HTTP; Wed, 1 Jun 2011 11:31:50 -0700 (PDT)
In-Reply-To: <4DE67BFB.2020705@linux.intel.com>
References: <4DE5CDA3.1020000@linux.intel.com> <4DE5D4AC.4090805@gmail.com>
	<20110601061050.GA3281@jama.jama.net> <4DE5DA86.7040808@gmail.com>
	<1306925194.2529.38.camel@phil-desktop>
	<4DE67BFB.2020705@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 1 Jun 2011 11:31:50 -0700
Message-ID: <BANLkTi=CkS10E96RWWWMAm11VL6CBjdT6w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] tcmode-default: disable ARMv7 Optimization for qt4-x11-free
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
X-List-Received-Date: Wed, 01 Jun 2011 18:35:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 1, 2011 at 10:50 AM, Saul Wold <sgw@linux.intel.com> wrote:
> On 06/01/2011 03:46 AM, Phil Blundell wrote:
>>
>> On Tue, 2011-05-31 at 23:21 -0700, Khem Raj wrote:
>>>
>>> On 05/31/2011 11:10 PM, Martin Jansa wrote:
>>>>
>>>> On Tue, May 31, 2011 at 10:57:00PM -0700, Khem Raj wrote:
>>>>>
>>>>> On 05/31/2011 10:26 PM, Saul Wold wrote:
>>>>>>
>>>>>> | ../../include/QtCore/../../src/corelib/arch/qatomic_arm.h:361:35:
>>>>>> error: output number 1 not directly addressable
>>>>>
>>>>> this is a coding error you can fix the source code I guess instead of
>>>>> pessimising the whole package
>>>>
>>>> FWIW: I haven't seen it in my armv7-a builds (nokia900), but I'm using
>>>> gcc-4.6 from meta-oe.
>>>
>>> this is because gcc 4.6 in meta-oe has fix for it its this patch here
>>> http://gcc.gnu.org/ml/gcc-patches/2011-03/msg01477.html
>>
>> I'm a bit confused by this. =C2=A0In the first quote above you said that=
 this
>> was a coding error and ought to be fixed in qt, but now you seem to be
>> saying that it's a compiler bug and should be fixed in gcc. =C2=A0If it'=
s the
>> latter, can we get that patch applied to the oe-core version of gcc?
>>
>> Either way, I agree, working around this by just frobbing the
>> architecture options seems like a bad idea.
>>
>> p.
>>
> Khem,
>
> Is there any chance that you would be willing to throw me a patch that
> address this issue based on the gcc patch? =C2=A0If not. let me know and =
I will
> try to muddle my way through it ;-)!

I dont have the environment to reproduce the error. If you can try to apply=
 gcc
patch I mentioned to gcc then it should help.

>
> Sau!
>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>


