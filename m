Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QU0Mg-00079i-TT
	for openembedded-core@lists.openembedded.org;
	Tue, 07 Jun 2011 19:46:55 +0200
Received: by wwb17 with SMTP id 17so4368228wwb.24
	for <openembedded-core@lists.openembedded.org>;
	Tue, 07 Jun 2011 10:43:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-type:content-transfer-encoding;
	bh=xEndl0IDIpROy/RopWH9xs4q9OgmPiUCoFdFFHBGTMA=;
	b=KWZg62az2u8YmwmetqptQvTetW64AfzWJQbkg6pVQQKTi5d2UFeYAijDjb7ONYw4Iv
	QN9fTkMzVOIGIkA6ZJfodC/n4Ya75QsDcqRk5MmcBhEIg9Iz40ib2/04fcJzvpHCot9M
	elog61uTdUkydfhyM4tpQUTpfCDsj7YNYxujc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=hUbYen1wbMTUINLpOKVXuQBLHtK4cX7bPVmD11XjKTRi19UZSB9GYQ2BKM/pwiVRB4
	U2O+xrxq9KSHtk06Tnf1WfFpVN8y8fSk36FDOLjxonIoteBSh9FO/RtK+fMYn2yuuehI
	GFbwyncPDeYimJHN60g+2cYXav3QDVrXqRix0=
Received: by 10.216.239.67 with SMTP id b45mr4091737wer.44.1307468617106; Tue,
	07 Jun 2011 10:43:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.216.28.19 with HTTP; Tue, 7 Jun 2011 10:43:07 -0700 (PDT)
In-Reply-To: <1307439362.2529.4741.camel@phil-desktop>
References: <1307102133.2529.260.camel@phil-desktop>
	<1307439362.2529.4741.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 7 Jun 2011 10:43:07 -0700
Message-ID: <BANLkTim4y6zp6nMOhNNhfxmZPdYuWjOimA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] uclibc: remove PACKAGE_ARCH, fix compilation on i586
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
X-List-Received-Date: Tue, 07 Jun 2011 17:46:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 7, 2011 at 2:36 AM, Phil Blundell <pb@pbcl.net> wrote:
> Ping?

Both changes are fine.

change from being machine specific is futuristic it will not work for
all architectures that
uclibc supports but is sufficient for what we support/use in oe for now.

Acked-by: Khem Raj <raj.khem@gmail.com>

>
> p.
>
> On Fri, 2011-06-03 at 12:55 +0100, Phil Blundell wrote:
>> There is no good reason for uclibc to be machine specific. =C2=A0Remove =
local
>> assignment to PACKAGE_ARCH so that it gets the default target
>> architecture and bump PR for that change.
>>
>> See http://lists.linuxtogo.org/pipermail/openembedded-core/2011-May/0030=
64.html
>>
>> Also replace a chunk of anonymous python with a COMPATIBLE_HOST
>> declaration.
>>
>> Signed-off-by: Phil Blundell <philb@gnu.org>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


