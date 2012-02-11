Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rw2MS-0002rf-5C
	for openembedded-core@lists.openembedded.org;
	Sat, 11 Feb 2012 03:06:48 +0100
Received: by daln34 with SMTP id n34so2371499dal.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 10 Feb 2012 17:58:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=uSsiTZalSYAX+5GMhRfD+zCAryMsuxG5O5jVtbYMssE=;
	b=MojoLSeNhrp1Gm1i5ZYEVpt50okZiw0eM1GVf7ti6ae2kbTy4RUvmiLZWNzDbexVyH
	nxJFMen8s3n86EKUZhh5fF91wGqghnS1pEjz0z9zOt/JpCMehTeB/uIyxJEHhF4K1RkP
	GfkWc1BOhiymsvxg8iGlv0QxkH/hxhtRtC658=
Received: by 10.68.232.103 with SMTP id tn7mr21688957pbc.74.1328925520246;
	Fri, 10 Feb 2012 17:58:40 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id i10sm17919976pbg.10.2012.02.10.17.58.37
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 10 Feb 2012 17:58:38 -0800 (PST)
Date: Fri, 10 Feb 2012 17:58:34 -0800
From: Khem Raj <raj.khem@gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20120211015834.GB2095@sakrah.homelinux.org>
References: <1328832372.10451.47.camel@ted>
	<CAMKF1soksEad4TP5upRjW2vG6_OjeQjyYTAL88PH_qgy9yyiug@mail.gmail.com>
	<1328881254.13434.10.camel@ted>
MIME-Version: 1.0
In-Reply-To: <1328881254.13434.10.camel@ted>
User-Agent: Mutt/1.5.21 (2010-09-15)
Subject: Re: [PATCH] gcc-4.6: Some small performance tweaks
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
X-List-Received-Date: Sat, 11 Feb 2012 02:06:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (10/02/12 13:40), Richard Purdie wrote:
> On Thu, 2012-02-09 at 16:39 -0800, Khem Raj wrote:
> > On Thu, Feb 9, 2012 at 4:06 PM, Richard Purdie
> > <richard.purdie@linuxfoundation.org> wrote:
> > >
> > > +NATIVEDEPS = "mpfr-native gmp-native libmpc-native zlib-native"
> > 
> > 
> > note that we will need to ship zlib-nativesdk as well if we do this
> > so hopefully that case is covered by this.
> 
> Yes, zlib has a BBCLASSEXTEND on zlib-nativesdk so this should be fine.

OK and this is bundled with meta-toolchain too right ?
> 
> Cheers,
> 
> Richard
> 
> 
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core

-- 
-Khem


