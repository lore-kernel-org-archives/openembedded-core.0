Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qqvzr-0007H0-Pk
	for openembedded-core@lists.openembedded.org;
	Wed, 10 Aug 2011 01:46:07 +0200
Received: by pzk2 with SMTP id 2so1045888pzk.34
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Aug 2011 16:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=UCsia94wgR7RJ7jdxiaLnOnvPXoKmCPBPbKNLtNChHw=;
	b=SmaSDqm4gcIgBnk5V6J79ZYoibDblpWmii0Yr44URGfoAC48OvfLWzBlrGk1/O8ERD
	/7Zfaoph8tZPe0OQg4H+1sJX25yQJYuCufWpklOuy3bACvckdwBQ45aN76aYVDGyixnw
	P1jajZaDTHnKVKF+3YROaA6qZWxTiImo4wtKw=
Received: by 10.142.234.5 with SMTP id g5mr758405wfh.347.1312933295087; Tue,
	09 Aug 2011 16:41:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.68.46.137 with HTTP; Tue, 9 Aug 2011 16:41:05 -0700 (PDT)
In-Reply-To: <201108100121.11110.schnitzeltony@gmx.de>
References: <201108100121.11110.schnitzeltony@gmx.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 9 Aug 2011 16:41:05 -0700
Message-ID: <CAMKF1sqTmTomP3WeF1UtfCec0NOd18QAHgYuLLKug=788voF2w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Howto create image with -O0 optimization
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
X-List-Received-Date: Tue, 09 Aug 2011 23:46:08 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 9, 2011 at 4:21 PM, Andreas Mueller <schnitzeltony@gmx.de> wrote:
> Hi
>
> I am debugging thunar to find the reason for segfault and modified the recipe to
> be compiled without optimization -O0. Now I need to step into shared libraries
> too but since they are compiled with optimization it causes confusing step
> seqences.
>
> So: How do I force -O0 optimization for whole images?
>

couple of ways. Set DEBUG_BUILD = "1" in your local.conf and recompile
this will build stuff with -O1 which is better for debugging then -O2

otherwise you can override SELECTED_OPTIMIZATION = "whatever you want"
in local.conf

> Andreas
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


