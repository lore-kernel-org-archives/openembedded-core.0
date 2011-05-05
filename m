Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bruce.ashfield@gmail.com>) id 1QHzqi-0001s0-FW
	for openembedded-core@lists.openembedded.org;
	Thu, 05 May 2011 16:48:16 +0200
Received: by gxk3 with SMTP id 3so47421gxk.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 05 May 2011 07:45:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=i3+0D93oT2X3kIXrLcXuXlqX+o7TvPQ2JcFuYYAnREk=;
	b=SUFelSj3OZzLGauUyL00HjiiWQAuwkV2sEG3CA2JwCfihll2f3+hSsoVyL6SMrwrYa
	9hEfafShKt6wM7WfjBtCOW90S9tusX5XjWT7VT25HxddqilIQfcKnUACvyNGmfF/1L5J
	rEfKm5xyT0TLuoK5jO7RczTZ0lF+i3tPW8zOQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=tuKxK6CkH+VkWxNbSLDsPUX17r0vxE7FCBo4WR8ak+eKFC8V4G8AIdfDVyxrRHjbaj
	lCfqESpiFUDAaZVF4WC9JanANtHOqo2z+N/D5swI5CH85vQvvGmyW1NvdSS+ViCUbmB+
	ltBlLMki/A3+YX2+8wGhJ4QE78ODaH+BO5umg=
MIME-Version: 1.0
Received: by 10.91.93.16 with SMTP id v16mr2040516agl.4.1304606735613; Thu, 05
	May 2011 07:45:35 -0700 (PDT)
Received: by 10.90.104.11 with HTTP; Thu, 5 May 2011 07:45:35 -0700 (PDT)
In-Reply-To: <20110505141219.GB6461@suse.de>
References: <cover.1304581769.git.sgw@linux.intel.com>
	<a2366eef6e0784848f35b93827407038eeea7ebc.1304581770.git.sgw@linux.intel.com>
	<20110505141219.GB6461@suse.de>
Date: Thu, 5 May 2011 10:45:35 -0400
Message-ID: <BANLkTi=VizL4=DUReoOUeZfov5EYsyPQGQ@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: Kyle McMartin <kyle@redhat.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>,
	Arnaldo Carvalho de Melo <acme@redhat.com>,
	Kang Kai <kai.kang@windriver.com>, Thomas Meyer <thomas@m3y3r.de>
Subject: Re: [PATCH 25/26] linux-yocto: update SRCREVs
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
X-List-Received-Date: Thu, 05 May 2011 14:48:16 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, May 5, 2011 at 10:12 AM, Greg KH <gregkh@suse.de> wrote:
> On Thu, May 05, 2011 at 12:57:33AM -0700, Saul Wold wrote:
>> From: Bruce Ashfield <bruce.ashfield@windriver.com>
>>
>> Updating the linux-yocto/2.6.37 SRCREVs to pickup:
>>
>> =A0 =A0 perf tool: Fix gcc 4.6.0 issues
>
> <snip>
>
> Because of this one patch, you sent mail to a whole bunch of people who
> don't care anything about the yocto project, or any of these 27 emails.
>
> Please be more careful in the future to not do this again.

Argh. Sorry about that, I was on a box that didn't have supress-cc
turned on.

Bruce

>
> greg k-h
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



--=20
"Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end"


