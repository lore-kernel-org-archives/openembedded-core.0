Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QjHhC-0001oy-LD
	for openembedded-core@lists.openembedded.org;
	Tue, 19 Jul 2011 23:19:14 +0200
Received: by pvf24 with SMTP id 24so4195749pvf.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 19 Jul 2011 14:15:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=5mCsBVe07/H1UBGCmBjIZ0oVEbPh939l3I0fB0Pgyzg=;
	b=pPZ+dyRIK+SR0KZNIyHk5kemw/L6rxvshWTpY1fgHz1zvXKd7NFfpBcaRSToT7NTe5
	K27YAPd5zYp2m6qbBJkH8mGQbQmpFgv54jahS9eePgDUXKBu8ooHJLe4PXlzZrxr6hvj
	qoOaWcxRlgTD608dFH+RpROUJmPzDLYy1mXuQ=
Received: by 10.68.33.200 with SMTP id t8mr9354841pbi.144.1311110106130; Tue,
	19 Jul 2011 14:15:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.62.36 with HTTP; Tue, 19 Jul 2011 14:14:35 -0700 (PDT)
In-Reply-To: <CAMKF1sqJQw6HvHN3WaoBCdmcEuCCKZc33J5cVVFoJQEmMdJsEw@mail.gmail.com>
References: <1dd2e2b995b65326b14426fe01116b99a920d779.1311034342.git.raj.khem@gmail.com>
	<bcd71928a9187721cbbd00795a8bde5f2b503710.1311034342.git.raj.khem@gmail.com>
	<1311073650.30326.26.camel@phil-desktop>
	<CAMKF1sqJQw6HvHN3WaoBCdmcEuCCKZc33J5cVVFoJQEmMdJsEw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 19 Jul 2011 14:14:35 -0700
Message-ID: <CAMKF1sqLSufKhE3H2+apFMvtd96_Y4BKkCaE_6SwV3MhLVbYrg@mail.gmail.com>
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
X-List-Received-Date: Tue, 19 Jul 2011 21:19:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 19, 2011 at 7:45 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Jul 19, 2011 at 4:07 AM, Phil Blundell <philb@gnu.org> wrote:
>> On Mon, 2011-07-18 at 17:17 -0700, Khem Raj wrote:
>>> ++#if defined __NR_sync_file_range2
>>> ++#define __NR_sync_file_range __NR_sync_file_range2
>>> ++#endif
>>
>> Does that really work? =C2=A0If I remember right, the argument lists for
>> those two syscalls are not the same. =C2=A0It isn't entirely obvious to =
me
>> that it makes sense to just define one as an alias for the other.
>>
> It wont work.
> sent a wrong patch. I have a better one.

I have updated this patch in the pull request tree.

>
>> p.
>>
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>


