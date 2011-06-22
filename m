Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QZW0o-00075A-F3
	for openembedded-core@lists.openembedded.org;
	Thu, 23 Jun 2011 00:35:06 +0200
Received: by vxa37 with SMTP id 37so1077629vxa.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Jun 2011 15:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=1rzhm5VIvoB0rFBZ4/qPhzxIUp9NJ8TYrP6clGozqHc=;
	b=b8X1sxaA2mGnTUFO1+0kOkey3uYwP+NGxtxAAZUNmbiiMFyw74cD/VtJB0x/K+kOwt
	TjDWJiZNPWnE9/Hmxy3n/cbdnc/39sH+HW27G5BJQqP6E6pJUNwVlAoc1cAeLtdAODL2
	Ru75zb+RoX61DV9lF9iquKJycqdQmLvWxYT1M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=lof02lWDzhUbtjH0HzFNvoh069iCSZbPRddFt50OA2FaJ9cJz6tB5xNZ/9sBybuQy5
	wa1nOaBk8XllScQVhWekgTLkC6vq22B3/ns2wMhK4j+oqVsEG/FfISG7hMVD8cfwJedP
	srlhBlY5xzxtXC9WkkPkjmSObSFzrZ8IV//FM=
Received: by 10.52.32.68 with SMTP id g4mr1695132vdi.216.1308781890101; Wed,
	22 Jun 2011 15:31:30 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.52.163.103 with HTTP; Wed, 22 Jun 2011 15:31:00 -0700 (PDT)
In-Reply-To: <4E025052.6070300@windriver.com>
References: <cover.1308706423.git.raj.khem@gmail.com>
	<1308758279.20015.79.camel@rex>
	<4E0235DA.8060200@windriver.com> <4E025052.6070300@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 22 Jun 2011 15:31:00 -0700
Message-ID: <BANLkTin7j9VwfP_sF69j_U=T-ZkUj12V=A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] eglibc 2.14 upgrade
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
X-List-Received-Date: Wed, 22 Jun 2011 22:35:06 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 22, 2011 at 1:28 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 6/22/11 1:35 PM, Mark Hatle wrote:
>> Since applying this update, I'm not longer getting an rpc/rpc.h file, wh=
ich
>> breaks various things like busybox mount.
>>
>> Is anyone else seeing this behavior?
>
> Reverting:
>
> 2a68cf4d315cdd18766de0c75928ff17846a6cd7 and
> 190a946e9a4213944e3ee675c4b3e18701698e87
>
> fixed the problem for me. =C2=A0So there is definitely a problems in the =
upgrade.
>

onward looking rpc is now maintained with libtirpc starting glibc 2.14 rpc =
is
not to be used from bundled code in glibc. If we dont have recipes for libt=
irpc
then I will add that.

> --Mark
>
>> --Mark
>>
>> On 6/22/11 10:57 AM, Richard Purdie wrote:
>>> On Tue, 2011-06-21 at 18:43 -0700, Khem Raj wrote:
>>>> This patchset upgrades eglibc 2.13 -> 2.14
>>>> Needed a binutils fix for x86_64
>>>> Package sotruss which is new in eglibc 2.14
>>>>
>>>> The following changes since commit 78de64f58b98101f5be5778e9ecbdaae5ba=
32997:
>>>>
>>>> =C2=A0 binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86=
_64 (2011-06-21 17:58:06 -0700)
>>>>
>>>> are available in the git repository at:
>>>> =C2=A0 git://git.openembedded.org/openembedded-core-contrib kraj/eglib=
c-2.14
>>>> =C2=A0 http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib=
/log/?h=3Dkraj/eglibc-2.14
>>>>
>>>> Khem Raj (4):
>>>> =C2=A0 eglibc: Upgrade recipes from 2.13 -> 2.14
>>>> =C2=A0 eglibc-package.inc: Package newly added sotruss and supporting
>>>> =C2=A0 =C2=A0 libraries
>>>> =C2=A0 binutils_2.21.bb: Fix ld segfault exposed by eglibc 2.14 on x86=
_64
>>>> =C2=A0 tcmode-default.inc: Bump EGLIBCVERSION to 2.14
>>>
>>> Merged to master, thanks.
>>>
>>> Richard
>>>
>>>
>>> _______________________________________________
>>> Openembedded-core mailing list
>>> Openembedded-core@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


