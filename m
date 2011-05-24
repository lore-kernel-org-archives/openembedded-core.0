Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QOw1A-0006UM-8b
	for openembedded-core@lists.openembedded.org;
	Tue, 24 May 2011 20:07:44 +0200
Received: by pzk36 with SMTP id 36so3164258pzk.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 24 May 2011 11:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=9xjyMz67iZtCKqgMGSg6484KYSid6NlRuggHf+Esv3E=;
	b=HEbbRQYmns5CvGn8gpDNbeK0qErrC6slcQJvb3VAEXC6uymvE/niszScDtliZquZI5
	s3z1CdK9l6M7/LcfurZp92umTtpy2V1C7hH3LuPxiWRE6zVWIIY3xYhIfZxm4NoLoTp6
	Td5RKZSy3uOI+cBol9ny0r59v/m7SexSV8BM8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=GDk3418UOuyRyOtix/Nlb5MONK/t2Me/wYlbxFi7qcB4+A07Qpm0fPl5Kr7AanAFvW
	vpaMpvOFCdIE3HFZUPjTm76YBTwllDu8RYTZRDOP70sc6+rFKTflTNKYKZPU4QJwHuT2
	pS4NtItKwlYM4TR5qhdIG5SHvaXuAp/Ych8j0=
Received: by 10.142.250.6 with SMTP id x6mr1106931wfh.243.1306260281866;
	Tue, 24 May 2011 11:04:41 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id k6sm6923704wfa.5.2011.05.24.11.04.39
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 24 May 2011 11:04:40 -0700 (PDT)
Date: Tue, 24 May 2011 11:03:23 -0700
From: Khem Raj <raj.khem@gmail.com>
To: Saul Wold <saul.wold@intel.com>
Message-ID: <20110524180323.GC18116@sakrah.homelinux.org>
References: <cover.1306037150.git.raj.khem@gmail.com>
	<c3ce108a01c4c250640528973e4cf12dfe062671.1306037150.git.raj.khem@gmail.com>
	<4DDBC45A.6090102@intel.com>
MIME-Version: 1.0
In-Reply-To: <4DDBC45A.6090102@intel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] eglibc.inc: Transfer PARALLEL_MAKE to PARALLELMFLAGS
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
X-List-Received-Date: Tue, 24 May 2011 18:07:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/05/11 07:44), Saul Wold wrote:
> On 05/21/2011 09:09 PM, Khem Raj wrote:
> >* Currently we are passing -jN flags to eglibc makefiles
> >   however eglibc uses a make variable called PARALLELMFLAGS
> >   to pass information about parallel build to sub-makes
> >
> >* Currently make install ran without parallelism but now
> >   it should have parallel building flags passed to do_install
> >   correctly which inturn should improve build time of
> >   eglibc on systems using parallel build -j with values>  1
> >
> Khem,
> 
> What kind of testing have you done with this patch, I get a
> consistent failure on multiple machines with eglibc-initial
> do_install.
> 
> Please review this error log, the make target `<number>' changes, which
> leads me to believe it's related to the PARALLEL_MAKE number.

OK I think I need to pass argument in quotes I will redo it



