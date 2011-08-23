Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1QvpdY-0000VL-Sx
	for openembedded-core@lists.openembedded.org;
	Tue, 23 Aug 2011 13:59:20 +0200
Received: by bkbzu17 with SMTP id zu17so22888bkb.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 23 Aug 2011 04:54:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=LitYTY3A4rSsIyobzMVRNbnFuCG7DQcCxd0KM7ZbHGg=;
	b=MGvVXCXIrTDyI58UCz96+gDc7eTb121fE2yyS3oa6IPi2myt6kZidaWtygVXxy9ibA
	CVtIp24Wrn7JW+aVE2fix7OAtJzSu4OqistTLhzMyoekqjTayIYOTQvP4iADiCIDyc9A
	gYklZRFWZgWFOvWZImlFuK7WkBO3ADe5uxraw=
MIME-Version: 1.0
Received: by 10.204.8.13 with SMTP id f13mr1485506bkf.331.1314100475533; Tue,
	23 Aug 2011 04:54:35 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.204.15.66 with HTTP; Tue, 23 Aug 2011 04:54:35 -0700 (PDT)
In-Reply-To: <4E52D11B.6020603@linux.intel.com>
References: <cover.1313816148.git.otavio@ossystems.com.br>
	<7fbda567f12cd48df2dc292b370109681ce39cfb.1313816148.git.otavio@ossystems.com.br>
	<4E52D11B.6020603@linux.intel.com>
Date: Tue, 23 Aug 2011 08:54:35 -0300
X-Google-Sender-Auth: 0kmFHp5So7bPGJjrdsDJtlQThis
Message-ID: <CAP9ODKqdin7jFmLHy1B=L4FqEhCz9rq7Kv+14Z8bSGiKf1UUxg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 5/8] fix SDK building due TARGET_ARCH use in installation path
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
X-List-Received-Date: Tue, 23 Aug 2011 11:59:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 22, 2011 at 18:58, Saul Wold <sgw@linux.intel.com> wrote:
> On 08/19/2011 09:58 PM, Otavio Salvador wrote:
>> TARGET_ARCH makes the building too fragile since it changes during
>> building of target and nativesdk binaries thus making it difficult to
>> handle a proper path for installation of binaries. The fix for it is
>> to move it to toolchain tarball name.
...
> This is the same set that has been rejected before.
>
> I think this has been discussed before between Richard and Koen, Koen was
> going to look into a variation that Richard suggested, I am not sure if K=
oen
> has replied to that email (from back in early July).

It seems that the current way is broken and this even this solution is
not perfect this improves it a lot and works for most use cases.

Richard and Koen might make clear their concerns about it and then we
work to fix them, otherwise this is better then what we have now.

--=20
Otavio Salvador=A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0O=
.S. Systems
E-mail: otavio@ossystems.com.br=A0 http://www.ossystems.com.br
Mobile: +55 53 9981-7854=A0 =A0 =A0 =A0=A0 =A0 =A0 =A0http://projetos.ossys=
tems.com.br


