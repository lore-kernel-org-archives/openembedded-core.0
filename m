Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1REMQ0-00017c-IL
	for openembedded-core@lists.openembedded.org;
	Thu, 13 Oct 2011 16:37:56 +0200
Received: by bkat8 with SMTP id t8so654213bka.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Oct 2011 07:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=QkfRHCeZCbBonyY3kZSKEl9tAv2nrEuA2HkFnJFMHPg=;
	b=HufSzb9FM6waFHKQd2BYJyNc2N/IeYqqB18hk1MpVTqWFX2tWQ74NEw+x/hTTxvFBs
	Ots3xZPRLpmyInBVIpEC9/+9rxrTaHL6N64GiF6gLs3gSApgPnwPpm5fbJhejQ24Qdgh
	XNh9fRc4FwZ2CQKpPOr9F340IpcZ0pFSLcInc=
MIME-Version: 1.0
Received: by 10.204.136.4 with SMTP id p4mr3063859bkt.46.1318516332750; Thu,
	13 Oct 2011 07:32:12 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.138.72 with HTTP; Thu, 13 Oct 2011 07:32:12 -0700 (PDT)
In-Reply-To: <1318514192.23801.229.camel@ted>
References: <cover.1318505196.git.Martin.Jansa@gmail.com>
	<c30a13301850b76b1e7362b99322ffad72598612.1318505196.git.Martin.Jansa@gmail.com>
	<1318512243.23801.217.camel@ted>
	<20111013133221.GC28525@jama.jama.net>
	<1318514192.23801.229.camel@ted>
Date: Thu, 13 Oct 2011 11:32:12 -0300
X-Google-Sender-Auth: p8z-TPiaL6YxqKP6Ko93Q51iYDE
Message-ID: <CAP9ODKp-CRpH0U7=k3inmg3gKqLFuHSUOA2JTc9+Jev+Op5p_Q@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe-core 14/20] mesa-dri: introduce MACHINE_DRI_MODULES
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
X-List-Received-Date: Thu, 13 Oct 2011 14:37:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 13, 2011 at 10:56, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
...
>> btw: in old recipes there was --with-dri-drivers with only one -, so may=
be it
>> wasn't actually working even for i915, i965 before or configure has bene=
volent syntax
>
> It defaults to enable all modules. We don't have libdrm-nouveau (or
> llvm) so we had to change the config options to explicitly enable the
> pieces I know are cared about on x86 in the latest version. This is why
> the COMPATIBLE_HOST is there too since that recipe was always meaning to
> compile these modules.
...

At least here it hadn't built i915 or i965 drivers.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


