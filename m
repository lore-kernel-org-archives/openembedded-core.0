Return-Path: <bruce.ashfield@gmail.com>
Received: from mail-la0-f54.google.com (mail-la0-f54.google.com
	[209.85.215.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0C92065D4F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  3 Nov 2014 05:15:20 +0000 (UTC)
Received: by mail-la0-f54.google.com with SMTP id s18so3540684lam.13
	for <openembedded-core@lists.openembedded.org>;
	Sun, 02 Nov 2014 21:15:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=PaG4EmM0eK51ZycvFGIC4g1WeIhe5NsbdITTybv1itw=;
	b=zX+TsM5MjGZNAjt98uQo7zMNnwV4szdITzi9LjOQIGnmIDvYu4poq1MNm/oVTUEYKO
	sd3wA7LVZYViL5dbqYAagziWE+3/coTExJqK5O3Wn3Z2CIC5e9YfVOAwymSg9cyj98nU
	tcmEwIinGf/QK8V+yMrT6sW5YH5FD2wTWDHoLF13V4I16c4tBCetJ6nJJ+tFeT42bZNZ
	J8QumkLigpixnMtOkuXLJ45SxejmrBz3gAYz3qA2945h5+M6GU3+hL1+aJfuqUQRv2Y4
	5oZPLX789kqKFLjScJPTeteRX1SwiH0WcQACHblMR1H0Pf5HzFvtLvS/NXy2vDV2ZJAA
	Zd7g==
MIME-Version: 1.0
X-Received: by 10.112.148.161 with SMTP id tt1mr48682175lbb.67.1414991720690; 
	Sun, 02 Nov 2014 21:15:20 -0800 (PST)
Received: by 10.112.4.168 with HTTP; Sun, 2 Nov 2014 21:15:20 -0800 (PST)
In-Reply-To: <d9b048eceb9f46ae8bfef3c79a6ab9cf@BL2PR03MB497.namprd03.prod.outlook.com>
References: <d9b048eceb9f46ae8bfef3c79a6ab9cf@BL2PR03MB497.namprd03.prod.outlook.com>
Date: Mon, 3 Nov 2014 00:15:20 -0500
Message-ID: <CADkTA4NKG2FnE7dXmDTobNeBg16agWNa+i7zk1QwJoYH9Dc7Rw@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Benlei Xu <B51469@freescale.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: openstack dashboard can not use console, need your help
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 03 Nov 2014 05:15:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 2, 2014 at 9:40 PM, Benlei Xu <B51469@freescale.com> wrote:
> Hello all,
>
>
>
>                 I have a issue need to ensure, I am launching instance on
> powerpc arch board, but there is a issue  that =E2=80=9CError: internal e=
rror:
> process exited while connecting to monitor: VNC support is disabled=E2=80=
=9D. If
> =E2=80=9Cvnc_enabled=E2=80=9D is set False in nova.conf, the instance can=
 created
> successfully.  I guess that there is no vnc server in yocto packages.

You probably want to ask openstack questions on meta-virtualization, since =
that
is where both meta-virt and meta-cloud-services are discussed.

But to answer your question, everything that is needed for a VNC console is
part of meta-openstack (both the python bindings and novnc).

Cheers,

Bruce

>
>
>
>                 So,  I want to know, where yocto support vnc server or no=
t
> and how can I get vnc server package on powerpc arch.
>
>
>
> Thanks.
>
>
>
> Best Regards,
>
> Benlei
>
>
>
>
> --
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"

