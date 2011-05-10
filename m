Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QJraa-0008Ko-TR
	for openembedded-core@lists.openembedded.org;
	Tue, 10 May 2011 20:23:21 +0200
Received: by wwb17 with SMTP id 17so5952727wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 May 2011 11:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=5KpFuGgVLPThFJ8b7dsNIydsXnLs+Mp+CwNdqY01Vd0=;
	b=JQAdizsDUHLSetKIfa+8rLPO4+AnQBj+w74CSfyMngcSaj9ooBArVEGnKFqwG4rODi
	lCEB3YcyPaAW3B01azoWgdwWe4W8098N+m+bSIN02z2jmXrjEEoXtlQSjFYGzMD/cMNZ
	IVEunnDsU6s5/YUwPWCDzzPo9mSTZFzay8+8w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=Uk3x2Tc2gwm+AB6+iFsuHVQ1FkrxeBXQK5VthU+BtQ3OjGzc7WWseoD4LMqWPCPVtD
	oDFiyqhNDN+xAtfEM7eV4sskYoa1khDTOJuITSITE7oGp5zWX8pAqEOOHizy1zLeQRyN
	uCm3wDrlqplOUCjotQx/at7JTPsMNzweP6gsw=
MIME-Version: 1.0
Received: by 10.216.230.153 with SMTP id j25mr4738928weq.22.1305051635050;
	Tue, 10 May 2011 11:20:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.216.93.195 with HTTP; Tue, 10 May 2011 11:20:34 -0700 (PDT)
In-Reply-To: <4DC97D27.9080602@linux.intel.com>
References: <BANLkTi=424KO0PMR6b_2QC98qtUryMykdQ@mail.gmail.com>
	<4DC8CA7E.4020302@linux.intel.com>
	<BANLkTi=G0wk3a5N4hvTzRcC09U7n-HFH1Q@mail.gmail.com>
	<4DC97D27.9080602@linux.intel.com>
Date: Tue, 10 May 2011 15:20:34 -0300
X-Google-Sender-Auth: 5p6A4pl08JzmCqOO3-3EIFQ0qq0
Message-ID: <BANLkTikrvH3Z2R3u+tBFL_O=C=Cg8nqFew@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Pull request with misc changes
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
X-List-Received-Date: Tue, 10 May 2011 18:23:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, May 10, 2011 at 15:00, Saul Wold <sgw@linux.intel.com> wrote:
> Is there a reason you can't use the oe-core-contrib repo and create a bra=
nch
> there? =A0Can the script be modified to support github also?

Not a hard one but I prefer to have it into our repository since
people can fork it there and follow it.

> It creates get another remote that we need to fetch from.

Or it creates another remote I need to push to.

To merge you don't need to add a remote but pull from the git URL
included into the pull command line.

...
>> On the patch itself? Any doc describing an example of it?
>>
> Mark Hatle has (or will have shortly) a proposal out to the OE community =
for
> commit and patch message guidelines, as a starting point, you can look at
> the wiki:
>
> https://wiki.yoctoproject.org/wiki/Recipe_%26_Patch_Style_Guide

I have pushed it already. It is available on the mailing list, please
take a look.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


