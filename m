Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjBck-0002ZS-7p
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 16:50:14 +0200
Received: by pvf24 with SMTP id 24so3895865pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 07:46:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=YpTh1cIqKx5EIvbqOUXLfNVFHOqg0RrDG86EoJSqbI4=;
	b=tU+FfSwK4HEhq3Z0MAs3tXxrcwfaubOBqM6fRQvMryCMf5vBtRexNCTSRgw7ctCsrX
	2fKldkwB5abUo41cgyjyPBB/I9EiAd5+nUemI7ynC+U3lDYepUOYPiqh5DgajOqOay1m
	I5ImYbA3SS/0jO3CPNCFutygLf4jX9VrQ9TZM=
Received: by 10.68.35.105 with SMTP id g9mr8386726pbj.479.1311086768040; Tue,
	19 Jul 2011 07:46:08 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Tue, 19 Jul 2011 07:45:38 -0700 (PDT)
In-Reply-To: <1311073650.30326.26.camel@phil-desktop>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
	<bcd71928a9187721cbbd00795a8bde5f2b503710.1311034342.git.raj.khem@gmail.com>
	<1311073650.30326.26.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jul 2011 07:45:38 -0700
Message-ID: <CAMKF1sqJQw6HvHN3WaoBCdmcEuCCKZc33J5cVVFoJQEmMdJsEw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/16] uclibc_0.9.32: Implement sync_file_range2.
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
X-List-Received-Date: Tue, 19 Jul 2011 14:50:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2011 at 4:07 AM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2011-07-18 at 17:17 -0700, Khem Raj wrote:
>> ++#if defined __NR_sync_file_range2
>> ++#define __NR_sync_file_range __NR_sync_file_range2
>> ++#endif
>
> Does that really work? =C2=A0If I remember right, the argument lists for
> those two syscalls are not the same. =C2=A0It isn't entirely obvious to m=
e
> that it makes sense to just define one as an alias for the other.
>
It wont work.
sent a wrong patch. I have a better one.

> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


