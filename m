Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SfZ5q-0006WJ-PB
	for openembedded-core@lists.openembedded.org;
	Fri, 15 Jun 2012 18:09:50 +0200
Received: by dalh21 with SMTP id h21so4111419dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 15 Jun 2012 08:59:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=eDiTTg/dy9tHy+6/yVN4Xbxj7CaXwkOhYLt4ajXG+xc=;
	b=IcyxKfe+XhSR9EJd/dRkdGNF19uNvNtOYSL7B8KHlcNv1AvcOokGTxTER92Ey84DwF
	rj7wOzfR1VdrGzy9Mu3mIOZ657IydcYukR6xJUl+K/aoOtuEJ7vDX0TVlftOY/Ki8ZT6
	LjRg9pgIQ+EMtaG6IBb3ovv6szx2XbsjawgKL0YzB/Yi6pW2lzJ89vItt1BI//cGeJ30
	PGrnFbnr2F/CleO9ZUN+DotLEITym0e9slMmH++t3T7JRQFJR068Dy2+xm3e2ZNRjwRW
	TPT5jhLtB0jP+70SA8l2z4PXLKUAX1s3WaDtQAlM95oBSuWmGMRwXK8aCRrZSgc7kL8e
	L1lw==
Received: by 10.68.238.68 with SMTP id vi4mr20735304pbc.123.1339775951530;
	Fri, 15 Jun 2012 08:59:11 -0700 (PDT)
Received: from [192.168.1.71] (99-57-140-209.lightspeed.sntcca.sbcglobal.net.
	[99.57.140.209])
	by mx.google.com with ESMTPS id nh8sm13627644pbc.60.2012.06.15.08.59.09
	(version=SSLv3 cipher=OTHER); Fri, 15 Jun 2012 08:59:10 -0700 (PDT)
Message-ID: <4FDB5BD2.1040203@gmail.com>
Date: Fri, 15 Jun 2012 08:59:14 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <20120615063647.GU3140@jama.jama.net>
	<CAMKF1srmOijugSfqfOivt2Sqfi0CvUVfZDRgUCprSShJ4nzf_w@mail.gmail.com>
	<1339771010.4471.14.camel@ted>
In-Reply-To: <1339771010.4471.14.camel@ted>
X-Enigmail-Version: 1.4.2
Subject: Re: openssl does not build on recent distributions with perl-5.16.0
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
X-List-Received-Date: Fri, 15 Jun 2012 16:09:51 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 6/15/2012 7:36 AM, Richard Purdie wrote:
> On Fri, 2012-06-15 at 07:15 -0700, Khem Raj wrote:
>> On Thursday, June 14, 2012, Martin Jansa wrote: Hi,
>> 
>> openembedded-core/meta/recipes-connectivity/openssl/openssl.inc
>> 
>> is using perlpath.pl:
>> 
>> do_configure () { cd util perl perlpath.pl
>> ${STAGING_BINDIR_NATIVE}
>> 
>> I wonder why it's using host perl and not staged perl-native May
>> be missing inherit perlnative
> 
> perlnative is not meant to be used as a replacement for the host 
> system's perl, its meant for building target modules and target
> perl itself.
> 

ah yes I was thinking of openssl and not openssl-native when replying

> We require perl to be on the host system. We're not meant to be
> using anything outside the standard perl install though. The
> alternative means effectively totally cratering build time as we'd
> have to build perl-native before pretty much anything else.
> 
> So the best solution is likely to have something that adds find.pl
> to the native sysroot and have these recipes depend on it, at least
> short term. I'm extremely reluctant to start adding perl-native
> dependencies throughout the system due to performance
> considerations.
> 

may be right fix should be fix openssl itself to not ask for obsolete
perl feature.


> Cheers,
> 
> Richard
> 
> 
> 
> 
> 
> 
> 
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (MingW32)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk/bW9IACgkQuwUzVZGdMxSdLACeOs47dlvb7HSwaRYf9dimuKl1
dfAAn0B52pE7ozkC+umlRloUsCZ8GZvW
=s8Bs
-----END PGP SIGNATURE-----


