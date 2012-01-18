Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RnOTj-0002bb-Jx
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jan 2012 06:54:35 +0100
Received: by lami14 with SMTP id i14so2634693lam.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 17 Jan 2012 21:46:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=199zcDWR6lt6wL/wMUiHaU4neWzqjuWcLcZJQ/XPL4E=;
	b=waHOpdXVPjnsk8z54epP+2ZPEZGLm7Bl1eDxaVDHeKAWKy19iUPOh3a0miDYgv8Sy6
	UpuO2zhc+M2tFh/sINat7WNi3eaydvi78V0xzPhByu/xJ9/pJ405GDGPa6aFbVUnnWKY
	oYl4XFdKpU68umdVlQio6ZVWBkFPjyh8S2a2U=
Received: by 10.112.36.132 with SMTP id q4mr5019587lbj.3.1326865617518; Tue,
	17 Jan 2012 21:46:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.21.161 with HTTP; Tue, 17 Jan 2012 21:46:26 -0800 (PST)
In-Reply-To: <ADD6A3980E8C39419A432FF422031B4C0128F67C@ORSMSX105.amr.corp.intel.com>
References: <cover.1326831402.git.nitin.a.kamble@intel.com>
	<b042b10b86d6e28290a64e42e1e23de81621630b.1326831402.git.nitin.a.kamble@intel.com>
	<CAMKF1sriceDbz_scyB-TthDOWEzK+t9i0wgEJ_No=v_NF18JjA@mail.gmail.com>
	<ADD6A3980E8C39419A432FF422031B4C0128E66B@ORSMSX105.amr.corp.intel.com>
	<ADD6A3980E8C39419A432FF422031B4C0128F67C@ORSMSX105.amr.corp.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 17 Jan 2012 21:46:26 -0800
Message-ID: <CAMKF1sq4Q7VjNkbLTbqdsmne+NQz-vE4vY58uipsL+kqKxz+-Q@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/5] bdwgc: new recipe for autogen
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
X-List-Received-Date: Wed, 18 Jan 2012 05:54:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 17, 2012 at 5:33 PM, Kamble, Nitin A
<nitin.a.kamble@intel.com> wrote:
>
>
>> -----Original Message-----
>> From: openembedded-core-bounces@lists.openembedded.org
>> [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf Of
>> Kamble, Nitin A
>> Sent: Tuesday, January 17, 2012 5:29 PM
>> To: Patches and discussions about the oe-core layer
>> Subject: Re: [OE-core] [PATCH 1/5] bdwgc: new recipe for autogen
>>
>> Khem,
>> Here was the configure error:
>> | configure: error: Package requirements (bdw-gc) were not met:
>> |
>> | No package 'bdw-gc' found
>> |
>> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
>> | installed software in a non-standard prefix.
>> |
>> | Alternatively, you may set the environment variables BDW_GC_CFLAGS
>> | and BDW_GC_LIBS to avoid the need to call pkg-config.
>> | See the pkg-config man page for more details.
>> | ERROR: oe_runconf failed

yeah I see guile-2 needs a garbage collector. Did you try the original libg=
c ?
http://anonscm.debian.org/gitweb/?p=3Dcollab-maint/libgc.git;a=3Dsummary


>>
>> Nitin
>>
> And it is being used in this c file: libguile/threads.c
>
> Thanks,
> Nitin
>
>>
>> > -----Original Message-----
>> > From: openembedded-core-bounces@lists.openembedded.org
>> > [mailto:openembedded-core-bounces@lists.openembedded.org] On Behalf
>> Of
>> > Khem Raj
>> > Sent: Tuesday, January 17, 2012 3:23 PM
>> > To: Patches and discussions about the oe-core layer
>> > Subject: Re: [OE-core] [PATCH 1/5] bdwgc: new recipe for autogen
>> >
>> > On Tue, Jan 17, 2012 at 12:30 PM, =C2=A0<nitin.a.kamble@intel.com> wro=
te:
>> > > This recipe is needed by guile.
>> > > And guile is needed for autogen.
>> >
>> > is this really needed by guile. if yes what part of guide need it ?
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


