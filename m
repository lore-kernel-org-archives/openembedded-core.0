Received: from mail-qc0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1ShgkK-0002Bx-Kn
	for openembedded-core@lists.openembedded.org;
	Thu, 21 Jun 2012 14:44:24 +0200
Received: by qcso7 with SMTP id o7so251680qcs.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 21 Jun 2012 05:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=ysqub5Any0H8PvLHBPWk0bQujKsbyIji+7EvXbjZqJU=;
	b=M/4ADeQcjim2G01Syz5Nei9KsfLkpWJqOUzygo3OHqwFMj8ZIcc1dhBHALEWmuN9ox
	nmQjPSeZQ05KP91N0qNY0Xr4slevJrvOJ4Wt2X7GeMILzzsOsFW9kaeFooJH2/kGw2WQ
	lVke3kGcMrY07HMpTETpAguahX1gilEv5g8Udqm7nSZrFPIbSStOT+djxAUi6qVYqHSl
	ikQ2niWw/jl94HKKS5ZnjI/MwfEc4F+5IkRSHphAyvW8IK4Q9aeAzt8yIf62zNUxb8Bh
	PwtXunH2VoSKhvnu7fdN8NB2NQPl9g/cFbhVuZS5dNZKASO7ogxWk+XbOFp/85hWXtjg
	QOKQ==
MIME-Version: 1.0
Received: by 10.224.208.66 with SMTP id gb2mr47750620qab.29.1340282018351;
	Thu, 21 Jun 2012 05:33:38 -0700 (PDT)
Received: by 10.229.51.10 with HTTP; Thu, 21 Jun 2012 05:33:38 -0700 (PDT)
In-Reply-To: <CAMZjud0p_349MXBVFUj4q-jxKy0S+1bz3_onEjx16XdkKtRPQw@mail.gmail.com>
References: <1340180732-26710-1-git-send-email-bogdan.a.marinescu@intel.com>
	<1340281789.1640.106.camel@ted>
	<CAMZjud0p_349MXBVFUj4q-jxKy0S+1bz3_onEjx16XdkKtRPQw@mail.gmail.com>
Date: Thu, 21 Jun 2012 08:33:38 -0400
Message-ID: <CADkTA4M6tN=zGrKe6-1ZVmcW3Facm-cLT+70cqMs7+Q_U6DXOg@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] linux-tools: multilib compilation fix
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
X-List-Received-Date: Thu, 21 Jun 2012 12:44:24 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 21, 2012 at 8:32 AM, Marinescu, Bogdan A
<bogdan.a.marinescu@intel.com> wrote:
> On Thu, Jun 21, 2012 at 3:29 PM, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Wed, 2012-06-20 at 11:25 +0300, Bogdan Marinescu wrote:
>>> This patch makes linux-tools compile properly on multilib configuration=
s
>>> (which failed because of some invalid dependencies). Tested by compilin=
g
>>> lib32-core-image-sato-sdk.
>>>
>>> Signed-off-by: Bogdan Marinescu <bogdan.a.marinescu@intel.com>
>>> ---
>>> =A0meta/recipes-kernel/linux/linux-tools.inc | =A0 =A02 +-
>>> =A01 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/meta/recipes-kernel/linux/linux-tools.inc b/meta/recipes-k=
ernel/linux/linux-tools.inc
>>> index 3b03c05..048608c 100644
>>> --- a/meta/recipes-kernel/linux/linux-tools.inc
>>> +++ b/meta/recipes-kernel/linux/linux-tools.inc
>>> @@ -34,7 +34,7 @@ do_install_perf[umask] =3D "022"
>>>
>>> =A0PERFDEPENDS =3D "virtual/${MLPREFIX}libc:do_populate_sysroot ${MLPRE=
FIX}elfutils:do_populate_sysroot ${MLPREFIX}binutils:do_populate_sysroot"
>>> =A0PERFDEPENDS_libc-uclibc =3D ""
>>> -PERFRDEPENDS =3D "python perl elfutils"
>>> +PERFRDEPENDS =3D "${MLPREFIX}python ${MLPREFIX}perl ${MLPREFIX}elfutil=
s"
>>> =A0PERFRDEPENDS_libc-uclibc =3D ""
>>>
>>> =A0do_compile_perf[depends] =3D "${PERFDEPENDS}"
>>
>> Bruce has just totally rearranged this code. Could you check if the new
>> recipe still suffers from this issue please?
>
> Sure, I'm on it.

Yep. We still need this addition to the recipe .. luckily, easy to do :)

Cheers,

Bruce

>
> Thanks,
> Bogdan
>
>>
>> Cheers,
>>
>> Richard
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


