Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1T2IgA-0007UJ-92
	for openembedded-core@lists.openembedded.org;
	Fri, 17 Aug 2012 11:17:18 +0200
Received: by yhjj56 with SMTP id j56so4116491yhj.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 17 Aug 2012 02:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=lcmW+dVZXBFAbmIJSv6pIT38/HWZP3aXq54i+jxTII4=;
	b=TvCTVmIw8dbOdnVRW5EBvFEuuRvnn5LYOFf93ujV3LIRYPvMmOihdJAAcuJWuSEbqH
	PK9G1b1+/8c7bnm8+4tiUtCn3YAHdjllA0H76Da+iHe4EsW4doX5179Ao+2FQXhcO9lf
	zYqHICTei5dG4UUlKp+F4rPknQJvslHKxxA/u/UENNXIKRRu5YaqUoCAJUr7fcU7AUzs
	xvD0EdW3f9SZ6LvZ4g/OlZ6FZgfhQyRk+0oqh1xeUjVm12kupNYxTAgViP9akI1WGXpy
	1v49+n8hxsYR+USnehlwxvQ8DDRkXUPAhnshKWERxGn4btcljQ947zToj5UrbVjlCyq3
	eGzA==
MIME-Version: 1.0
Received: by 10.50.191.165 with SMTP id gz5mr1047043igc.50.1345194319048; Fri,
	17 Aug 2012 02:05:19 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Fri, 17 Aug 2012 02:05:19 -0700 (PDT)
In-Reply-To: <CAJTo0LYBdGj1ANujgM0f0mU8OE5XXovegKzQqVhXROT=qa=6ZQ@mail.gmail.com>
References: <1345193717-23225-1-git-send-email-schnitzeltony@googlemail.com>
	<1345193717-23225-2-git-send-email-schnitzeltony@googlemail.com>
	<CAJTo0LYBdGj1ANujgM0f0mU8OE5XXovegKzQqVhXROT=qa=6ZQ@mail.gmail.com>
Date: Fri, 17 Aug 2012 11:05:19 +0200
Message-ID: <CALbNGRSsFXRR4eqY_EDJmtdOzxnPU7i+vVqbbbL4zRg6YhVGLA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] webkit-gtk: update to 1.8.2
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
X-List-Received-Date: Fri, 17 Aug 2012 09:17:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 17, 2012 at 11:00 AM, Burton, Ross <ross.burton@intel.com> wrot=
e:
> On 17 August 2012 09:55, Andreas M=FCller <schnitzeltony@googlemail.com> =
wrote:
>> -SRC_URI[md5sum] =3D "f2f01b1fdc7262a2eede81ebed0970b2"
>> -SRC_URI[sha256sum] =3D "9a126a76b40ca61adb1f1626e1567f976740af2332948cc=
5189489dbd01e3b28"
>> +SRC_URI[md5sum] =3D "f7bd0bd4f323039f15e19c82a9a8313c"
>> +SRC_URI[sha256sum] =3D "0cd69b7c4bf4af3442a5e6777a1487cabf14db15baeeed9=
6d0865419f69b81e6"
>
> I've got this patch in a branch too, but I was... concerned by the
> hashes of the tarballs not matching the hashes in the release mail.  I
> mailed the person who sent the release announcement but no reply.
>
> Did you chase upstream about this -- I presume it's a genuine mistake
> (maybe the tarball was re-generated) but I'm curious.
>
> Ross
I did
* use the 1.8.1 hashes and let oe tell me the new ones
* add new hashes in recipe
* bitbake -ccleanall webkit-gtk
* bitbake webkit-gtk

Andreas


