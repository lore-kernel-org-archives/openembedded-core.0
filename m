Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <brandon@rascalmicro.com>) id 1S0IFf-0004vt-1j
	for openembedded-core@lists.openembedded.org;
	Wed, 22 Feb 2012 20:53:23 +0100
Received: by ghbf19 with SMTP id f19so274180ghb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 22 Feb 2012 11:45:00 -0800 (PST)
Received-SPF: pass (google.com: domain of brandon@rascalmicro.com designates
	10.50.34.202 as permitted sender) client-ip=10.50.34.202; 
Authentication-Results: mr.google.com; spf=pass (google.com: domain of
	brandon@rascalmicro.com designates 10.50.34.202 as permitted
	sender) smtp.mail=brandon@rascalmicro.com
Received: from mr.google.com ([10.50.34.202])
	by 10.50.34.202 with SMTP id b10mr28940507igj.2.1329939900530 (num_hops
	= 1); Wed, 22 Feb 2012 11:45:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.50.34.202 with SMTP id b10mr23442563igj.2.1329939900293; Wed,
	22 Feb 2012 11:45:00 -0800 (PST)
Received: by 10.231.199.138 with HTTP; Wed, 22 Feb 2012 11:45:00 -0800 (PST)
X-Originating-IP: [146.115.15.122]
In-Reply-To: <1329939097.32110.9.camel@ted>
References: <CA+b4E8x4_cCvhUw-UgLK=9ymuoXsiih8BMZc=ts0B7Qf=oaNuQ@mail.gmail.com>
	<1329912732.20261.110.camel@ted>
	<CA+b4E8znKGcGq=3q+SXn6+N=A9o9Z=rkrVjT3Pf4v7CMBtipzg@mail.gmail.com>
	<1329932828.32110.6.camel@ted>
	<CA+b4E8znHQ3oXSH9y-iWi_Sy7WkJEjNunVkKKWAWTTJTWCzN7A@mail.gmail.com>
	<1329939097.32110.9.camel@ted>
Date: Wed, 22 Feb 2012 14:45:00 -0500
Message-ID: <CA+b4E8ygur-mmrCCBgyCTNkOK7+YWODrm8_szUREstR4xeYpNw@mail.gmail.com>
From: Brandon Stafford <brandon@rascalmicro.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQlLbCFmeBiTu2M9NDZDMoOBKsprFjqvg6gZjIx2tIBasYyaF/Doj0tB8Kl0CFqdEq8i03wt
Subject: Re: Cannot satisfy the following dependencies for task-core-basic: libusb-compat (>= 0.1.3)
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
X-List-Received-Date: Wed, 22 Feb 2012 19:53:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Feb 22, 2012 at 2:31 PM, Richard Purdie
<richard.purdie@linuxfoundation.org> wrote:
>>
>> One last question-- somehow, the first build of gnupg was expecting to
>> find libusb-compat by the wrong name. This was cached in sstate, and a
>> subsequent build fixed it. Why would it work the second time if the
>> recipe was unchanged?
>
> That is a question I'd love to have the answer to. Something went wrong
> but I don't know what. If you had the old sstate package, it would have
> been interesting to compare the old and new ones but you've probably
> deleted that now :(. If you do still have them I'd be very interested in
> a copy of the two files.

bitbake -c cleansstate would have deleted the old sstate, right?

At some point in the next few weeks, I'll be rebuilding all this from
scratch. If I run into the same error, I'd be happy to try to save
trees before and after the cleansstate/rebuild.

> Was this with master or the 2011-1 release branch (or are you using poky
> and one of its release branches)?

This is master, last pulled Feb 8, 2012, commit
4ef5e70f531f48cef90805402c16ec02ad3f2b92.

Thanks again for the help.

Brandon


