Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RsFhE-0006E4-3C
	for openembedded-core@lists.openembedded.org;
	Tue, 31 Jan 2012 16:32:36 +0100
Received: by lahc1 with SMTP id c1so64567lah.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 31 Jan 2012 07:24:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=qzezWCU+n5B0IWv6U4Y5DxYVSLHiVyG4JOXxRIrpsEk=;
	b=u72cS3+SL026nrOKAsjpBQY0KEUIo9IkuNHE672IdynwFZrYg5wHR47AaFfCKQ3/Lk
	rT0A6ITYgr+UuW+3OmxTDYEE4YrzOJOMe+CBTpNpchoeKwr001x4+/ewLx5K0VtJgiox
	plwnB1uwYflVswhyYjknr7PFs2GNE8CzYJ1Os=
Received: by 10.112.101.34 with SMTP id fd2mr5655638lbb.16.1328023482265; Tue,
	31 Jan 2012 07:24:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.5.201 with HTTP; Tue, 31 Jan 2012 07:24:12 -0800 (PST)
In-Reply-To: <1328006918.29933.91.camel@phil-desktop>
References: <cover.1327980240.git.sgw@linux.intel.com>
	<79a999f69d58ca98393991d18d0efd274932ff56.1327980240.git.sgw@linux.intel.com>
	<1328006918.29933.91.camel@phil-desktop>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 31 Jan 2012 07:24:12 -0800
Message-ID: <CAMKF1sqmar=T71h+hQgmUxMJ33TNjreuugRHCjRRD0-_dwBxqA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [CONSOLIDATED PULL 16/19] tunearch/arm: Differentiate between thumb code generation and thumb capability
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
X-List-Received-Date: Tue, 31 Jan 2012 15:32:36 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 2:48 AM, Phil Blundell <philb@gnu.org> wrote:
> On Mon, 2012-01-30 at 20:13 -0800, Saul Wold wrote:
>> We have diverged a bit from oe.dev where thumb in OVERRIDES meant
>> the code was being compiled in thumb mode. With tunearch this got
>> a different meaning where it meant that if a core is capable of
>> generating thumb code them we will have this in overrides. With this
>> patch I am trying to address the problem where 'thumbmode' in TUNE_FEATU=
RES
>> means that code will be compiled in thumb mode by default and
>> 'thumb' is to denote that core is capable of thumb instruction set.
>
> So this patch is changing the meaning of the "thumb" override in
> oe-core, right? =C2=A0Is that really a good idea?
>

yes see below it bridges the gap that was created with tune overhaul

> Also, I'm not quite sure I understand what the "thumb" tuning would be
> useful for when this patch is applied. =C2=A0You seem to have removed mos=
t of
> the code which checks for "thumb" in TUNE_FEATURES which seems to leave
> it not doing anything very much.

it adds 't' or 't2' to package arch but it wont mean the package is
compiled in thumb
mode.

>
> Can you clarify what exactly is the problem that this patch is solving,
> what the old and new semantics of the overrides and tune flags are, and
> why it's an improvement?

recipes has used thumb override when they were being compiled in thumbmode
and not thumb enabled. Currently override gets added regardless of mode whi=
ch
is not right. This is what it fixes there are few recipes in oe-core
which use this
override and plus helps in porting recipes from oe.dev which uses the overr=
ide
as explained.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core


