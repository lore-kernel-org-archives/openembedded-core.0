Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <leon.woestenberg@gmail.com>) id 1QKpea-0000Fd-Jv
	for openembedded-core@lists.openembedded.org;
	Fri, 13 May 2011 12:31:28 +0200
Received: by pzk36 with SMTP id 36so1161316pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 May 2011 03:28:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=LC2qwNyKPIsxeLHRv5Xj17V7leWZVC37U7APv6MOtxQ=;
	b=OOk9+ATuPhjKB8mjEZCv2cjA0ycF7qn0KoA+U9LvkagNqknKW0h9IrlBPeyrPB2jlh
	NpVgkt/LHZHdodWjCdqB+nqrR0YZP8QaZ9GaCSIR17XeiYByconO5m7PK6V4ma4xeRXW
	iyg5i9y9/B2xEfTLwTWOt9uS60ny0t0LNA2bA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=J4uR4evX678HkHLYvzymlUfnB+GzwMdlsIIJW6KQi72UmAy3Wj5JoBGXX5QKCl6UQO
	FX7VtBd5P+kZZManMJun2HCoy5WYKhUqmMbNYr+Q2zci5UVRvzQW+aKAL+TWvd5OfNK3
	Qz2Oq4W/9IQjRWcT1arZF09c1h4n9iR+3gFj8=
MIME-Version: 1.0
Received: by 10.68.32.1 with SMTP id e1mr1886099pbi.404.1305282519031; Fri, 13
	May 2011 03:28:39 -0700 (PDT)
Received: by 10.68.52.232 with HTTP; Fri, 13 May 2011 03:28:38 -0700 (PDT)
In-Reply-To: <BANLkTi=C-5rjKtd0675Y70VX+g4MdL64Uw@mail.gmail.com>
References: <cover.1305109178.git.leon@sidebranch.com>
	<687fb20407ee32261a840c9e475b489319d8ee62.1305109178.git.leon@sidebranch.com>
	<BANLkTi=C-5rjKtd0675Y70VX+g4MdL64Uw@mail.gmail.com>
Date: Fri, 13 May 2011 12:28:38 +0200
Message-ID: <BANLkTi=zwa4m050EcKkSp_KV8LOUYQK67g@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] siteinfo.bbclass: Add powerpc-linux-gnuspe.
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
X-List-Received-Date: Fri, 13 May 2011 10:31:28 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Khem,

On Fri, May 13, 2011 at 5:50 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Wed, May 11, 2011 at 3:29 AM, Leon Woestenberg
> <leon.woestenberg@gmail.com> wrote:
>> From: Leon Woestenberg <leon@sidebranch.com>
>> Re-add powerpc-linux-gnuspe, from OpenEmbedded. Also adds support
>> to poky.conf so that minimal-core-image builds with DISTRO=poky,
>
> you need to rebase this patch on latest oe-core
>
Yes, I was using oe-core-contrib/master as a base, wrongly assuming
that that is the correct base for -contrib fixes/additions.

Regards,
-- 
Leon


