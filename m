Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RWFi6-0002e6-Qz
	for openembedded-core@lists.openembedded.org;
	Fri, 02 Dec 2011 00:06:35 +0100
Received: by ghrr13 with SMTP id r13so2394351ghr.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 01 Dec 2011 14:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=B/29m05QrkrHGXiZCRem5N0nbwWaXxCuZwswoDsT3Zg=;
	b=qjBAS1mjIOtYxNU7FkXNE02RmPrpEGvArftvF/zzgf2eTDXs1kH3q129TOXzJZMdfw
	R7SoKum622b3VbxdZqVUHnOszSwbd4h0IaF5HZsITd4TVR6X6ySeH08HpY+BbJJclb9p
	vJbnEEzqY9fulm9mpPSV1ogDJQThypcEazDJQ=
Received: by 10.50.88.199 with SMTP id bi7mr10820548igb.45.1322780392401;
	Thu, 01 Dec 2011 14:59:52 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net. [99.57.141.118])
	by mx.google.com with ESMTPS id eh34sm26538576ibb.5.2011.12.01.14.59.49
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 01 Dec 2011 14:59:50 -0800 (PST)
Date: Thu, 1 Dec 2011 15:08:04 -0800
From: Khem Raj <raj.khem@gmail.com>
To: ulf@emagii.com, Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Message-ID: <20111201230804.GD9685@sakrah.homelinux.org>
References: <4EC24711.2010805@eukrea.com>
	<CAOd_LFzLRF3VvbQqrGekjtLSvfyXHQHeKyd=QcnAUFQpaGg8uA@mail.gmail.com>
	<1322743693.17484.120.camel@ted>
	<CAOd_LFwOiy9hR0M9FjRE5xRdN-HLwQUpMsWqiNKppr6QjvjzKw@mail.gmail.com>
	<4ED7A46E.2030603@emagii.com>
MIME-Version: 1.0
In-Reply-To: <4ED7A46E.2030603@emagii.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: Reproducible build problem with BB_NUMBER_THREADS=8
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
X-List-Received-Date: Thu, 01 Dec 2011 23:06:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (01/12/11 16:59), Ulf Samuelsson wrote:
> 2011-12-01 15:12, Cliff Brake skrev:
> >On Thu, Dec 1, 2011 at 7:48 AM, Richard Purdie
> ><richard.purdie@linuxfoundation.org>  wrote:
> >
> >>When you restart the build is the problem persistent or does it work the
> >>second time?
> >I set BB_NUMBER_THREADS  = "2" (was 4 when failing)
> >
> >I tried to restart the build and cleanall just the failing package,
> >and it still failed.  I then ran:
> >
> >bitbake -c cleanall gcc-cross gcc-cross-initial gcc-cross-intermediate
> >gcc-runtime
> >
> >and after that, everything worked.
> >
> >>Does someone have a complete console log for a build that failed with
> >>this they could share?
> >I'll restart the build and collect one.  So you just want the output
> >of the console for bitbake?
> >
> >Thanks,
> >Cliff
> >
> Here is my buildlog, creating the failure.
> The C++ compiler cannot find "string", even though it is in
> "<sysroot>/usr/include/c++"
> 

This probably might have something to do with-gxx-include settings
I will see if I can reproduce it here


