Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SSIVW-0004pA-Hf
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 03:49:30 +0200
Received: by yhjj56 with SMTP id j56so1068814yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 18:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=c32XX8FNKHgV4/dvhrbCin4GhYClsXddvGIbYxO1TbU=;
	b=yQXhyZ++sgMGH6ZOANeoKjk+qV3QiDggwgzpwVaGLFIP0GqVArP27g8SF7gpAdB7OO
	Xv2lB2z8htKYzEB/RG8873jKpi4TFTnlhliqauzyDHzIQcDrAeb1Y3EtECSD8prxDHLB
	oigKUX6ovcUB6mwjpzTzthS7IcEwIyfj+KVD8ER0dgcr68/O6P2qvUB0MIJEh/e7yDyO
	m09UERN+Ga9LBPQpYQKWoPLKmD+EiHuD+PcKizZHC2Cm+C5F54t6R4oYEBTSBrJ9eeZI
	0UbbD9d+k4VvSKQk4WzTcBElXX6NfuRbuGvjIe5hVtc/XQkg+eJZV0PaTeg7akWkUp5e
	z+2g==
MIME-Version: 1.0
Received: by 10.50.47.196 with SMTP id f4mr1272278ign.21.1336613976331; Wed,
	09 May 2012 18:39:36 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Wed, 9 May 2012 18:39:36 -0700 (PDT)
In-Reply-To: <4FAB0784.2080703@linux.intel.com>
References: <CAF6bG8eVQcJHEH8RHsAGV2CP6ZjH1+sZUyvBTFLvB6cv--ZUhw@mail.gmail.com>
	<4FAB0784.2080703@linux.intel.com>
Date: Thu, 10 May 2012 04:39:36 +0300
Message-ID: <CAF6bG8c9mxVDMer=gB4N48UYz6DxDNq=_6GWHqQQnCMtGPRyQg@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] package_deb.bbclass: don't handle advanced dependency marker
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
X-List-Received-Date: Thu, 10 May 2012 01:49:30 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 10 May 2012 03:10, Saul Wold <sgw@linux.intel.com> wrote:
>
> Marko,
>
> I am not sure what's wrong with this patch or the others you sent recentl=
y
> but none of them are applying cleanly with "git am" what are you using to
> format the patch and mail it?
>
> Please use git format-patch and git send-email or the scripts
> create-pull-request/send-pull-request.
>
> Thanks
> =C2=A0 =C2=A0 =C2=A0 =C2=A0Sau!

 Mailer problems. I reworked my setup somewhat, but sending patches
round the world back to myself still results in corruption somewhere.
As there's slight hope that remaining problem is in patch's way back
home, and not in sending, I'll test resending this one to list.


 - ML


