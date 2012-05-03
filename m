Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SPwqa-0005Hb-Ah
	for openembedded-core@lists.openembedded.org;
	Thu, 03 May 2012 16:17:32 +0200
Received: by pbbrq2 with SMTP id rq2so2165951pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 May 2012 07:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:x-enigmail-version:content-type
	:content-transfer-encoding;
	bh=6JqYW7X5YxNjTNE209rrMFPxdCl0DpRXU1iWY1jzQRQ=;
	b=tzPS30hhZn37z5eMpmWUB+iv/4lh/KI5onBAd9ibwW+PQdXkCuKacQ/wgUW3zXIMFv
	UKrFGhT3XbzED1eTVJSd/+HwuWTPMiFfJYXtX6Ubo6HKgEjKSAMsSrF86sd56lXaFDq7
	qoa2dN67kUPxtViaj+o0opDi/dYPPG0QkHonNHz0ZgKAwIFPuZVk2W3SdQlHDDUMWdbc
	K7SmifHHOBQKJnIrcG6nerzmsxCnr26X0PqN5nkYwDmayUvtCOBMCPsRcznuIjhCXIdp
	fABhWKvEeQ3AXrNVaxBgBK/c7Iw0us2BKktfp88R4bvUgL9SxeZUgewGvBq7qIO+m4M+
	zbDA==
Received: by 10.68.225.104 with SMTP id rj8mr7883618pbc.135.1336054066051;
	Thu, 03 May 2012 07:07:46 -0700 (PDT)
Received: from [172.23.4.147] (natint3.juniper.net. [66.129.224.36])
	by mx.google.com with ESMTPS id od1sm1305460pbb.35.2012.05.03.07.07.43
	(version=SSLv3 cipher=OTHER); Thu, 03 May 2012 07:07:44 -0700 (PDT)
Message-ID: <4FA2912D.4070305@gmail.com>
Date: Thu, 03 May 2012 07:07:41 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120411 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1335967122.git.Martin.Jansa@gmail.com>
	<eec6dc7f29ff7e5297e2827196cc81ffd9a76831.1335967122.git.Martin.Jansa@gmail.com>
	<20120502140940.GB3682@jama.jama.net> <4FA1A25F.9030502@gmail.com>
	<20120503053806.GC4658@jama.jama.net>
	<CAMKF1so4ut2C8xKXqSV9KXG1pYN9bqqbDCXFYiyR0L+x_rHJbg@mail.gmail.com>
	<20120503054649.GD4658@jama.jama.net>
	<1336035344.30113.51.camel@ted>
	<20120503092955.GE4658@jama.jama.net>
	<1336051765.30113.107.camel@ted> <1336052808.30113.116.camel@ted>
In-Reply-To: <1336052808.30113.116.camel@ted>
X-Enigmail-Version: 1.4.1
Subject: Re: [PATCH 1/2] site/arm-common: alignment values for guin32, guin64 and unsigned long
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
X-List-Received-Date: Thu, 03 May 2012 14:17:32 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 05/03/2012 06:46 AM, Richard Purdie wrote:
> I should also note that there is a wider problem here I'm
> complaining about. The glib issue is actually less of a concern.
> 
> People keep sending patches without sensible descriptions in the
> commit message. I think I've made some comments on list to Saul
> about this to pick on someone in particular. The last set of
> patches from Khem contains one which removed pretty much the whole
> qemu patch set from the git version with no explanation in the
> commit message.

OK provide that feedback to the patch. I will improve on it. Are you
talking about below commit.  I did mention patches are not forward ported

qemu-git: Move to tip of git

There are a lot of armv7 and sh4 fixes that its worth moving to latest
version. The patch forward porting can happen later.

Signed-off-by: Khem Raj <raj.khem@gmail.com>

> 
> No, its not going in and I find it a a bit of an insult that I'm
> being expected to read the diffs, notice these changes and spent
> time replying to the patch with a nicely worded rejection email. I
> might just start replying "no".
> 
> So what I'm asking is that people think about the changes they
> submit and try and help me, not use patch submission as a sounding
> board and not to hope I don't spot something.
> 
> To scale this project we need to develop trust relationships with
> people taking ownership of areas of the codebase. I consider Mark
> Hatle to "own" most things rpm for example. To scale we need to do
> more of this but trust is important. If some people don't want to
> do this and just contribute things when they can which interest
> them, that is fine but we are going to reach a point where we have
> to take longer to test and take such changes.
> 
> Cheers,
> 
> Richard
> 
> 
> 
> _______________________________________________ Openembedded-core
> mailing list Openembedded-core@lists.openembedded.org 
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)
Comment: Using GnuPG with Mozilla - http://enigmail.mozdev.org/

iEYEARECAAYFAk+ikS0ACgkQuwUzVZGdMxSK0wCdHTtEilAecZpvXkbd0Mak2LPw
NgIAn36cIeZ2fHbC85OFKXPrEkOsbU0q
=uyc9
-----END PGP SIGNATURE-----


