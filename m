Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SeohB-00036g-Mh
	for openembedded-core@lists.openembedded.org;
	Wed, 13 Jun 2012 16:37:17 +0200
Received: by eaal1 with SMTP id l1so239972eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Jun 2012 07:26:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=ql25HX5HzF5EDpJ+FAu8VEU+A3Jtkj/GGhZ2UqpW4yI=;
	b=csfput0ZuKZoq4cBYCpTvcfpDuIr9N7iwqVu1P3hbAKkXrwfLJiyCO2hS5nZRRMYKF
	LenNFqgWC5kbmU8qckOTMYVkNSDKmhfgktdxvRNjP3tdhHPlGV/TJPdVF3aFe6rQ3DsN
	GR/Newaw3wRrOm2PULp81CsdH8Ls9fM7kVFtovXx3UlaTH1omUDHpFfcZVUnZEFpVscu
	c6dPgJqc1NHmy/486FWCY7ukFM1HIUYIz/TL2Wp4KkA6hJe7sw/RlyAnom9w21D28RB/
	VdZB0uzJjgsrpymiUHElVnOq9taagNUOObj9vOyWTafxzElcNimubLBBjJ8yzDN4lCGk
	PocQ==
Received: by 10.14.187.141 with SMTP id y13mr1117196eem.79.1339597601861; Wed,
	13 Jun 2012 07:26:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Wed, 13 Jun 2012 07:26:11 -0700 (PDT)
In-Reply-To: <CAOHjBZtg70_OdMNC9UGf30=t5+5tisBfyLnV0y7c9p+2qVYnVA@mail.gmail.com>
References: <CAOHjBZuZrjs+Uza6yF+WxVmfFoQ1GZfkry0U4UOr1g+0xzdNqA@mail.gmail.com>
	<CAMKF1srAO=qZzCkxiSo=Az+sdS+YCzaQnU-=u1KeThZO42Faig@mail.gmail.com>
	<4FD78DDA.5010907@windriver.com>
	<CAOHjBZtg70_OdMNC9UGf30=t5+5tisBfyLnV0y7c9p+2qVYnVA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 13 Jun 2012 07:26:11 -0700
Message-ID: <CAMKF1so9J5noXwZuyVMbTQHrcvbFtmPFg83e6=OHzyS_7BF-dQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: fixup_perms failure on linux-libc-headers
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
X-List-Received-Date: Wed, 13 Jun 2012 14:37:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 13, 2012 at 1:02 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> Hi Khem, Mark,
>
> I've not changed the location of the local repository since it was create=
d
> months ago.
> This problem appeared yesterday and I cannot find a why.

can you bisect and see if its some patch in OE or bitbake ?

> For information, I'm on a FC14 host machine and the repository is on a
> physical hdd and not
> mounted from NFS for example.
>
> Cheers,
> Giuseppe
>
>
>
> 2012/6/12 Mark Hatle <mark.hatle@windriver.com>
>>
>> On 6/12/12 8:57 AM, Khem Raj wrote:
>>>
>>> On Tue, Jun 12, 2012 at 2:07 AM, Giuseppe Condorelli
>>> <giuseppe.condorelli@gmail.com> =C2=A0wrote:
>>>>
>>>> OSError: [Errno 1] Operation not permitted:
>>>>
>>>> '/oelinux/condorg/openembedded-core/stlinux-3.0-build/tmp-uclibc/work/=
sh4-oe-linux-uclibc/linux-libc-headers-2.6.32-r1/package/usr'
>>>
>>>
>>> what is your host machine ? did you also update bitbake ?
>>
>>
>> It also could be the filesystem. =C2=A0What filesystem type are you usin=
g? =C2=A0(on
>> the host system...) =C2=A0If you are using something like fat32, you may=
 run into
>> problems like this because it does not have the ability to change
>> permissions and modes.. since the underlying filesystem does not support
>> them.
>>
>> --Mark
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


