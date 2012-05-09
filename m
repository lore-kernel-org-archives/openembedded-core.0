Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <cazfi74@gmail.com>) id 1SSGuU-0003bm-Qq
	for openembedded-core@lists.openembedded.org;
	Thu, 10 May 2012 02:07:10 +0200
Received: by yhjj56 with SMTP id j56so991296yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 May 2012 16:57:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=uyCaXX5CtHKuvV9JSSA5Gm2xr0v3QzLpHQb1TlyfXTI=;
	b=fzyL5HeUE8sZkpOL2JOk+gLpG4QjxrJeanqravCP7LpMzEoK7syfn28W5fqSPAT9z0
	0ArPEROXt4wvASE0FEXlajqMDwrkEIuuK6DBg5CMXt7JVYYqOrVMNLBkq7LWTEerDAo3
	yqqP/Lv3iZa1Fa5sKqpOYB6Loj9YQ0gY4M+DThykTpSi2CkU2ezQpaeEUL3NhL/ogmX5
	pO7YW7kryhdKTsSkICnl/kvIEHxQFnpzKKrz2ypRvGqm6gX3Bh8/3v0y/UagsNWCYr6a
	6PwjM8dohCY1ib7csTfpNrVinFLERTfntG9aOY8DW81vxs0bLQclZ8BuMx99kfv7eqiA
	pJ5A==
MIME-Version: 1.0
Received: by 10.50.94.234 with SMTP id df10mr1174944igb.31.1336607836953; Wed,
	09 May 2012 16:57:16 -0700 (PDT)
Received: by 10.64.59.130 with HTTP; Wed, 9 May 2012 16:57:16 -0700 (PDT)
In-Reply-To: <CAF6bG8fT5RvJxcwwQKzBUpG=XZtJzVJ6Cm8L7w-SRZ-wLWNzfw@mail.gmail.com>
References: <cover.1336524034.git.raj.khem@gmail.com>
	<fa8d138dc96a622f36b8783457c375186a84e411.1336524034.git.raj.khem@gmail.com>
	<CAF6bG8f21=Pcxjt3-pPemiBiF0TqPT2e8snxry_7VQWGa5BcNw@mail.gmail.com>
	<CAMKF1so-48aBWL7VytBmtuQt8rhdp6x05r8oJT5RZ3CB8cnrNQ@mail.gmail.com>
	<CAF6bG8fr9fMQjd4Gxt9uukj=UKDHUxyhmptTiZOM1EPeW8qcqQ@mail.gmail.com>
	<CAMKF1sp0-We3JrGue+J-scDv0JCOHg5O44G9AZaPO3xfzNO2AQ@mail.gmail.com>
	<4FAA8415.40006@windriver.com>
	<CAF6bG8fT5RvJxcwwQKzBUpG=XZtJzVJ6Cm8L7w-SRZ-wLWNzfw@mail.gmail.com>
Date: Thu, 10 May 2012 02:57:16 +0300
Message-ID: <CAF6bG8cVwJNNnDRho6RhrAbJyteQsP+kpE-RTz8viZ34wN7xMg@mail.gmail.com>
From: Marko Lindqvist <cazfi74@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] uclibc.inc: uclibc rtld does support GNU_HASH
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
X-List-Received-Date: Thu, 10 May 2012 00:07:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 9 May 2012 18:46, Marko Lindqvist <cazfi74@gmail.com> wrote:
> On 9 May 2012 17:49, Mark Hatle <mark.hatle@windriver.com> wrote:
>>
>> Who can definitively state what the legal RPROVIDE format is in OE?
>
> =C2=A0If we are to define it now, and selecting from existing alternative=
s,
> parenthesis could denote either:
>
> deb style) Single version number override. Recipe 1.0.0 can provide
> some 1.0.1 package.
>
> rpm style) General marker (does it even handle multiple ones?)
>
> =C2=A0Any use-case relevant to OE I see for deb style handling can be
> handled with smart use of rpm style, but not the other way around.

 Working on assumption that deb-side was the broken one, I submitted
patch http://patchwork.openembedded.org/patch/27417/


 - ML


