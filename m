Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QhRym-0004BP-Oc
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jul 2011 21:53:48 +0200
Received: by pvf24 with SMTP id 24so534667pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jul 2011 12:49:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=bsFKzLSuyg73BGLuT0XbANLzKW0htjuOd4+98aRg6QE=;
	b=ZKIqSkBA8s33GIuOXZ8CJXCnn8bAaHhJTXkw8Wa6eAmEEbTMK4hdyVrBeo6ZgajdmE
	51etw7k9r5nP2kj2g4OxgDeojBAUonJqBBC+3nuKw+gF5KKwZZjYMLczkZQLaBr5AQd9
	ys8UVBbIad9PrNh1b4mZTYawcgjWZNvYR3H1E=
Received: by 10.68.33.200 with SMTP id t8mr3067821pbi.144.1310672988212; Thu,
	14 Jul 2011 12:49:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Thu, 14 Jul 2011 12:49:18 -0700 (PDT)
In-Reply-To: <9DA5872FEF993D41B7173F58FCF6BE94DE31041C@orsmsx504.amr.corp.intel.com>
References: <cover.1310497097.git.nitin.a.kamble@intel.com>
	<af851424130d145cef560c4bfaf2ba88ea4c3da6.1310497097.git.nitin.a.kamble@intel.com>
	<0FDDF2A7-BB8C-46D1-B0AE-985C71CCFFBB@gmail.com>
	<9DA5872FEF993D41B7173F58FCF6BE94DE31041C@orsmsx504.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 14 Jul 2011 12:49:18 -0700
Message-ID: <CAMKF1sr3xuts6kfJyUXqFnHT7Uj7--x1TO4yag=Cf145HcYAJw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] siteinfo.bbclass: hack for x32
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
X-List-Received-Date: Thu, 14 Jul 2011 19:53:49 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 13, 2011 at 8:41 AM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: Tuesday, July 12, 2011 11:20 PM
>> To: Patches and discussions about the oe-core layer
>> Cc: openembedded-core@lists.openembedded.org
>> Subject: Re: [OE-core] [PATCH 1/5] siteinfo.bbclass: hack for x32
>>
>>
>>
>> On Jul 12, 2011, at 12:02 PM, nitin.a.kamble@intel.com wrote:
>>
>> > From: Nitin A Kamble <nitin.a.kamble@intel.com>
>> >
>> > Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>> > ---
>> > meta/classes/siteinfo.bbclass | =C2=A0 =C2=A03 +++
>> > 1 files changed, 3 insertions(+), 0 deletions(-)
>> >
>> > diff --git a/meta/classes/siteinfo.bbclass
>> b/meta/classes/siteinfo.bbclass
>> > index 78b7008..035355f 100644
>> > --- a/meta/classes/siteinfo.bbclass
>> > +++ b/meta/classes/siteinfo.bbclass
>> > @@ -59,6 +59,9 @@ def get_siteinfo_list(d):
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"x86_64-linux":=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"endian-little bit-64
>> common-glibc",\
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0"x86_64-linux-u=
clibc": =C2=A0 =C2=A0 "endian-little bit-64
>> common-uclibc"}
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0if target in targetinfo:
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0target=
_cc_arch =3D bb.data.getVar('TARGET_CC_ARCH',
>> d, 1)
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 if target_cc_arch =
=3D=3D "-mx32":
>> > + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 target =3D "i686-linux"
>>
>> What would/could target be when using -mx32 ?
>> I suppose it's one of the entries in dictionary above
>>
> So far x86_64 is the target for x32.

yes I refreshed myself with the new ABI. x32 seems to be a true multilib ca=
se
of amd64 ABI.

>
> Nitin
>
>>
>>
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info =3D target=
info[target].split()
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info.append(tar=
get)
>> > =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0info.append("co=
mmon")
>> > --
>> > 1.7.5.4
>> >
>> >
>> > _______________________________________________
>> > Openembedded-core mailing list
>> > Openembedded-core@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
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
>


