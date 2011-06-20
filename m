Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QYUUz-0001M1-Gx
	for openembedded-core@lists.openembedded.org;
	Mon, 20 Jun 2011 04:46:02 +0200
Received: by pvf24 with SMTP id 24so635315pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 19 Jun 2011 19:42:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=ScVTGXoZz/eV1nqmxMjMQMIYMgcdG1SLe6RRGF7wyUM=;
	b=EPztmLnnUCbXP8sXU3sbvaWDecLlNnkrMEGmfzSo2SxuQvrguLDfpF5VAK7VyrVBk8
	+YCDytgSXxhL/BUuLffIq57s/HUKf2zvlLvH6Jw26tCqk3Hzlg94auBl0W+qEaumhwlv
	cMfB+y6JcvKYOMj7iHlLeW4iTmA1FlaJ1TI+0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=HLqSDJBodAMQYiTZmbVi07l/ZsGBK799C0fBSAQnxWn8gEX/mC47jD1uI5i7J9/0gj
	SgGd3JQ/1Vk1Ys9sxuLbDdUlGVQN2c5TcVD3wsoXN1KOhJOhOAqHq0h+T31yteanBBqx
	6ApqDpaN4IMG4cy4S/PnX1zB0goBUF5r7z6+g=
Received: by 10.68.36.234 with SMTP id t10mr1892697pbj.361.1308537748379; Sun,
	19 Jun 2011 19:42:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.55.195 with HTTP; Sun, 19 Jun 2011 19:41:57 -0700 (PDT)
In-Reply-To: <4DFEACB3.7090405@windriver.com>
References: <cover.1308249837.git.scott.a.garman@intel.com>
	<3a0dd72238fb6dbdbfc9ff1f0230f310fde0fff9.1308249837.git.scott.a.garman@intel.com>
	<4DFA97A1.9090909@gmail.com> <4DFB820B.9070303@intel.com>
	<BANLkTi=_Moowev-2U0tmYiuNwAt2BD9WXA@mail.gmail.com>
	<4DFB8CAE.8030100@intel.com>
	<BANLkTin19xUSV4Rg7u16e3C_s9xkKieasQ@mail.gmail.com>
	<4DFB98A2.9040303@intel.com> <4DFEACB3.7090405@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Sun, 19 Jun 2011 19:41:57 -0700
Message-ID: <BANLkTinnb_w2PNoADc3jgqpxeLcyG=z6YA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] base-passwd: disable problematic login.defs options
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
X-List-Received-Date: Mon, 20 Jun 2011 02:46:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 19, 2011 at 7:13 PM, Mark Hatle <mark.hatle@windriver.com> wrot=
e:
> On 6/17/11 1:10 PM, Scott Garman wrote:
>> On 06/17/2011 10:22 AM, Otavio Salvador wrote:
>>> On Fri, Jun 17, 2011 at 17:19, Scott Garman<scott.a.garman@intel.com> =
=C2=A0wrote:
>>>> Sorry, I forgot to mention that shadow-utils-native is what is used to
>>>> modify the passwd/group files in the target sysroot. It seems that hav=
ing a
>>>> -native recipe install files into a target sysroot would be worse than
>>>> including an optional file with base-passwd that may or may not be use=
d in
>>>> target systems.
>>>
>>> Why not make an shadow-target package with this?
>>
>> To just install a login.defs file? I'm open to it if a few more people
>> think this is a better idea.
>
> The file is needed in order for the utilities that add, remove and modify
> users/groups to function properly. =C2=A0The full version from shadow uti=
ls is used
> so we are sure we can dead with both shadow-less and shadowed filesystem =
images.
> =C2=A0(It's also more full featured then busybox, yet busybox is still co=
mpatible
> with it.)
>
Will shadow be able to override this file ?
one thing I see is that it wont get any updates that shadow might
do to this file in future.

> As for the separate package, that should be fine.. but remember this is a=
 very
> small file, so is it worth "another" package? =C2=A0(If so, then base-fil=
es likely
> should depend on it for build-time, but not run-time.)
>
> --Mark
>
>> Scott
>>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


