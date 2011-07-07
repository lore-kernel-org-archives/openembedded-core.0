Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QewOI-0008I1-VP
	for openembedded-core@lists.openembedded.org;
	Thu, 07 Jul 2011 23:45:47 +0200
Received: by pvf24 with SMTP id 24so788620pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Jul 2011 14:41:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=lQD4LVwKh6FomMACNMYUfgRmAABDxWLIS4vhdapQ9Js=;
	b=hG0jNjfuU1M0mD3LzfcFMhNCv5chriUhlgJ9x1RG+ZeRB3a7AvxoC4buJSJFLnfOvU
	SiiPdSYstxESi4Zw79un3O65EnnxYEFahUOOZ7Id5bBwlEvTjhPBUQUoXLF8Tms/kfSm
	jqlbYnyDNKzLaNRUcA91GY3UvAQ7fy70fa3zM=
Received: by 10.68.8.136 with SMTP id r8mr1587722pba.498.1310074912079; Thu,
	07 Jul 2011 14:41:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.57.104 with HTTP; Thu, 7 Jul 2011 14:41:22 -0700 (PDT)
In-Reply-To: <1310071349.18564.2.camel@lenovo.internal.reciva.com>
References: <629561972efd884a87edc521d0430af83511ae58.1310070283.git.nitin.a.kamble@intel.com>
	<24e836176430410a91d0c18fcef0854536798766.1310070283.git.nitin.a.kamble@intel.com>
	<1310071349.18564.2.camel@lenovo.internal.reciva.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 7 Jul 2011 14:41:22 -0700
Message-ID: <CAMKF1srLZ2XZxss7h_FAy3nkuBY29qL+K_S4nd2a0Ra-mzmyjg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/7] eglibc: fix installed but not packaged files
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
X-List-Received-Date: Thu, 07 Jul 2011 21:45:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 7, 2011 at 1:42 PM, Phil Blundell <pb@pbcl.net> wrote:
> On Thu, 2011-07-07 at 13:25 -0700, nitin.a.kamble@intel.com wrote:
>> -FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/* ${@base_conditional('=
USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdir}/ld.so.conf', ''=
, d)}"
>> +FILES_${PN} =3D "${libc_baselibs} ${libexecdir}/* ${sysconfdir}/rpc ${@=
base_conditional('USE_LDCONFIG', '1', '${base_sbindir}/ldconfig ${sysconfdi=
r}/ld.so.conf', '', d)}"
>
> I don't think we want /etc/rpc in libc6, it's just a waste of space if
> you aren't using sunrpc. =C2=A0Nobody has missed it thus far so I would b=
e
> inclined to delete it, but it could go in a package of its own if there
> is a feeling that it's valuable.

Moreover sun rpc is now obsolete in glibc 2.14 onwards so probably
removing it from package is right thing to do.
>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


