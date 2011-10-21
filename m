Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RH7Z4-0004en-Tr
	for openembedded-core@lists.openembedded.org;
	Fri, 21 Oct 2011 07:22:43 +0200
Received: by ggnj1 with SMTP id j1so1986581ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Oct 2011 22:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=FQEjmwmIUT+hZMPCoaeh5H7qDvoaOP9u3OP1t8l4/XU=;
	b=ks/KvzVz/kBss2qXstpvjK239UqzyNGuyqOq8WmpIlIscHhchrlD6ly78xmN4cpLTN
	Re0VfqHsDxvZ5CTC4Jig0jP6AZ5XIVO+3Sc2T1FZOCdvw2n9h1YB0c8DcL4kbn+a4a2M
	ZLqQeoUe0J12liroID1uRkxaoLluIXfSgwNtw=
Received: by 10.68.23.6 with SMTP id i6mr25221458pbf.13.1319174209090; Thu, 20
	Oct 2011 22:16:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.48.230 with HTTP; Thu, 20 Oct 2011 22:16:19 -0700 (PDT)
In-Reply-To: <840A81C1B782724A8EB52725BD519EFF1A8929@MBX20.4emm.local>
References: <1319173361-11527-1-git-send-email-raj.khem@gmail.com>
	<1319173361-11527-3-git-send-email-raj.khem@gmail.com>
	<840A81C1B782724A8EB52725BD519EFF1A8929@MBX20.4emm.local>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Oct 2011 22:16:19 -0700
Message-ID: <CAMKF1soXuZ84hVv9sN+rgR+Fh-o0jaDKKn7BMWs80xikiF7_bQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/3] gcc-configure-sdk: Point sysroot to correct location
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
X-List-Received-Date: Fri, 21 Oct 2011 05:22:43 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 20, 2011 at 10:12 PM, James Limbouris
<james@digitalmatter.com.au> wrote:
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Khem Raj
>> Sent: Friday, 21 October 2011 1:03 PM
>> To: openembedded-core@lists.openembedded.org
>> Subject: [OE-core] [PATCH 3/3] gcc-configure-sdk: Point sysroot to corre=
ct
>> location
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/recipes-devtools/gcc/gcc-configure-sdk.inc | =C2=A0 =C2=A02 +=
-
>> =C2=A01 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc b/meta/reci=
pes-
>> devtools/gcc/gcc-configure-sdk.inc
>> index de80870..98fd4c1 100644
>> --- a/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
>> +++ b/meta/recipes-devtools/gcc/gcc-configure-sdk.inc
>> @@ -7,7 +7,7 @@ USE_NLS =3D '${@base_conditional( "TARGET_OS", "linux-
>> uclibceabi", "no", "", d )}'
>> =C2=A0EXTRA_OECONF_PATHS =3D "--with-local-
>> prefix=3D${SDKPATH}/sysroots/${TARGET_SYS}${target_exec_prefix} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0--with-gxx-include-dir=3D${target_includedir}/c++ \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0--with-build-time-
>> tools=3D${STAGING_DIR_NATIVE}${prefix_native}/${TARGET_SYS}/bin \
>> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--with-sysroot=3D${SDKPATH}/sysroots/${TARGET_SYS} \
>> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0--with-
>> sysroot=3D${SDKPATH}/sysroots/${TUNE_PKGARCH}${TARGET_VENDOR}-
>> ${TARGET_OS} \
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0--with-build-sysroot=3D${STAGING_DIR_TARGET}"
>>
>> =C2=A0#
>> --
>> 1.7.5.4
>>
>
> Shouldn't --with-local-prefix be changed too? I am testing with both ${TA=
RGET_SYS}'s replaced. Will post results shortly.

yes I think both places it should change

>
> James
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


