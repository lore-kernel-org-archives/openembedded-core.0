Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T9tJS-0003qz-PE
	for openembedded-core@lists.openembedded.org;
	Fri, 07 Sep 2012 09:49:14 +0200
Received: by eekb57 with SMTP id b57so950409eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 07 Sep 2012 00:36:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=eC6pjft1qCfn4GRLm5Nh5S0+15yfQhkpx55a1tVXWCo=;
	b=cJ5ZKgP+cdJ+dSGK79ZBo/ejxXXsgzgx40YIfYdFk0DINXuQck4S13xivJhH57Tj3x
	dPgxmLiKnlObo4gL6ebozTzh3XqcLFCo9kjSOx+U4BlBXFnOLhBbARUeIcWtlNiPz9DM
	rbQo6aA2i/O4KnMkLDmUH3AtiwmHs23qPcCT1ysKtP+XpO0/V/vs6UE4F0U+EQJVHc4O
	5a6r18deMHODrwV+WXIV0eL5APLJxem9lMVxZYd0nysX25cxZ2UAbmOHg/wSeVN9twhk
	6925+nMetTCkZ3IGVOW0MVMHW/n41BA0yEG7Mn29jfYTgy8b3LiokVRgE0mMALz1YN09
	Rspg==
Received: by 10.14.211.3 with SMTP id v3mr6377140eeo.43.1347003409563; Fri, 07
	Sep 2012 00:36:49 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 7 Sep 2012 00:36:19 -0700 (PDT)
In-Reply-To: <CAOHjBZvb3Zne1eQbw=2J4fVXdQH3QpynzrXsnE17gRNxowFi0A@mail.gmail.com>
References: <CAOHjBZs0nD_7QjvxpQjF+on5a-e2nSDz_+NyatkVPKB4qyXkYw@mail.gmail.com>
	<CAOHjBZvb3Zne1eQbw=2J4fVXdQH3QpynzrXsnE17gRNxowFi0A@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 7 Sep 2012 00:36:19 -0700
Message-ID: <CAMKF1sqCgp-yH7hP-izT=L0qiWfuGpkiCSbuJQ0OtGZ1TgfGgQ@mail.gmail.com>
To: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Cannot find -lssp during uclibc package build
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 07 Sep 2012 07:49:14 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Sep 7, 2012 at 12:11 AM, Giuseppe Condorelli
<giuseppe.condorelli@gmail.com> wrote:
> Any news?
>
>
> 2012/9/3 Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
>>
>> Hi Khem, All
>>
>> I'm building an uclibc image using gcc 4.6.3 instead of the 4.7 version
>> oe-core provides.
>> I'm falling in the following linker error during uClibc package build:
>>
>> "Cannot find -lssp"

have a look at the 4.6 recipes from meta-openemebedded/toolchain-layer
does that work for you ?

and may be you have 'ssp' in DISTRO_FEATURES then remove that.

>>
>> Now, ssp support is enabled in the uClibc package and disabled in the
>> gcc-cross-initial package, so
>> ld should not include that by default. Instead it does and if I switch to
>> old OE-Core repository (June 2012)
>> I can see all goes right just because the gcc-cross-intermediate package
>> was still present and uClibc depends on it
>> for building. Now, I know the -intermediate package was moved out and the
>> -initial one should include it, but
>> that's it.
>> I've not tested that with gcc 4.7 version, this is out of my scope.
>> Please, can you address me to solve this issue?
>>
>> Best Regards,
>> Giuseppe
>>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


