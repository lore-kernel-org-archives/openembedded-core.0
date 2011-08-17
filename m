Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QtYSW-0001i9-8c
	for openembedded-core@lists.openembedded.org;
	Wed, 17 Aug 2011 07:14:32 +0200
Received: by pzk2 with SMTP id 2so540091pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 16 Aug 2011 22:09:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=oDwRHqeNmpiI5o5F3uciJNGznNWXNJJX6SJfOOOsxqQ=;
	b=G/jyBuaJgV6mylsyjs7kahVn3G9st7UmIIWM90/FqQ7eDSHP0ZO9Wgn+GN5x6rNJjc
	eLwBttsEGAH1y1Y7L1qt2+tE1SvHNRApuxQOf4sr1NIravgfce3LM9vVbs7kmfYefmCH
	OFPwYAR1coUwGPDDXRfNtEVcT8kh6JBlK+6cM=
Received: by 10.142.59.21 with SMTP id h21mr251100wfa.404.1313557793093; Tue,
	16 Aug 2011 22:09:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.46.197 with HTTP; Tue, 16 Aug 2011 22:09:23 -0700 (PDT)
In-Reply-To: <1865303E0DED764181A9D882DEF65FB6B884EF8590@shsmsx502.ccr.corp.intel.com>
References: <cover.1313533911.git.raj.khem@gmail.com>
	<ded8261127515a76b256d6c8dcbcbae156a19cff.1313533911.git.raj.khem@gmail.com>
	<1865303E0DED764181A9D882DEF65FB6B884EF8590@shsmsx502.ccr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 16 Aug 2011 22:09:23 -0700
Message-ID: <CAMKF1soGnFf5SAC_vu=G3G7j=rUh5KVbf=PcL5SqoDXWPn-H8w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/5] tcf-agent: Add openssl to DEPENDS
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
X-List-Received-Date: Wed, 17 Aug 2011 05:14:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 16, 2011 at 7:44 PM, Cui, Dexuan <dexuan.cui@intel.com> wrote:
> Khem Raj wrote on 2011-08-17:
>> It ends in errors like below otherwise
>>
>> | framework/channel_tcp.c:34:27: fatal error: openssl/ssl.h: No such
>> file or directory
>> | compilation terminated.
>> | make: *** [obj/GNU/Linux/arm/Debug/framework/channel_tcp.o] Error 1
>> | make: *** Waiting for unfinished jobs....
>> | + die 'oe_runmake failed'
>> | + bbfatal 'oe_runmake failed'
>> | + echo 'ERROR: oe_runmake failed'
>> | ERROR: oe_runmake failed
>> | + exit 1
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>> =C2=A0meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb | =C2=A0 =C2=A04 =
++--
>> =C2=A01 files changed, 2 insertions(+), 2 deletions(-)
>> diff --git a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb
>> b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb index
>> 3f97f69..37591c2 100644 ---
>> a/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb +++
>> b/meta/recipes-devtools/tcf-agent/tcf-agent_svn.bb @@ -8,7 +8,7 @@
>> LIC_FILES_CHKSUM =3D
>> "file://../epl-v10.html;md5=3D7aa4215a330a0a4f6a1cbf8da1a0879f
>>
>> =C2=A0SRCREV =3D "1855"
>> =C2=A0PV =3D "0.0+svnr${SRCPV}"
>> -PR =3D "r0"
>> +PR =3D "r1"
>>
>> =C2=A0SRC_URI =3D
>> "svn://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk;module=3Dag
>> ent;p roto=3Dhttp \
>>
>> http://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk/epl-v10.h
>> tml;na me=3Depl \ @@ -19,7 +19,7 @@ SRC_URI =3D
>> "svn://dev.eclipse.org/svnroot/dsdp/org.eclipse.tm.tcf/trunk;module=3Dag
>> =C2=A0SRC_URI[epl.md5sum] =3D "7aa4215a330a0a4f6a1cbf8da1a0879f"
>> =C2=A0SRC_URI[epl.sha256sum] =3D
>> "4fd64aeed340d62a64a8da4b371efe0f6d0d745f4d2dbefacba86c646d36bc7 2"
>>
>> -DEPENDS =3D "util-linux"
>> +DEPENDS =3D "util-linux openssl"
>> =C2=A0RDEPENDS_${PN} =3D "bash"
>>
>> =C2=A0S =3D "${WORKDIR}/agent"
> Hi, I have sent out the same patch 8+ hours ago. :-)

thanks for doing that

>
> Thanks,
> -- Dexuan
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


