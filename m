Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Sz6qL-0003w4-87
	for openembedded-core@lists.openembedded.org;
	Wed, 08 Aug 2012 16:02:37 +0200
Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 08 Aug 2012 06:50:48 -0700
Received: by qadc10 with SMTP id c10so1796512qad.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 08 Aug 2012 06:50:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=EoKLZUQHHs1VeFg9VckPxkCdWuXguF6e2wTNvkOqVdE=;
	b=Gh0gVC7M6uwE0fGDJ49zzAG9rMfrNFeiDLcF6w7jyiv8CHIqq+GKkAmt1pFIvei+yX
	HRFB95A3CihCsMgTr1MoGKqOMT6aymUrQfo+V3dteFjrK1IfsV3fBFp53wfAojFyFyuz
	i6QdiLab/+RppRTbqNubK/HjIUV8oSFrav6lBg1117MFsRXRu2tOOliqPHJBLCu78Hqy
	LvXdi40rnrYgrMBDUOr9WvEeEXxZ4eMc0w3K9EUD7rytlQyfGbBgxkMawLVuEXfZ+rja
	y6ijRL/NTbRUAS29S54LLA+Qzizo/vjyZE0Fcz2nrJJffuSqQqhgxrT4+eiPigW1cvMU
	PU/w==
Received: by 10.60.7.197 with SMTP id l5mr30530376oea.33.1344433847266; Wed,
	08 Aug 2012 06:50:47 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.45.10 with HTTP; Wed, 8 Aug 2012 06:50:27 -0700 (PDT)
In-Reply-To: <CABcZANkzqU=nqddBsQtFM=Hw4Bkzi07iKQiWKwJAEiAvJYou5Q@mail.gmail.com>
References: <CAJTo0Lb2jyRgUxqKE_ggZDwGr9FQuHig8rnQsYZTghdMXUpKhw@mail.gmail.com>
	<1344418236.23275.219.camel@phil-desktop>
	<CAJTo0La+0sDd00LS2n=3qJ7xgmaa0csFv-jaTz5jvevHrtceVA@mail.gmail.com>
	<CABcZANkzqU=nqddBsQtFM=Hw4Bkzi07iKQiWKwJAEiAvJYou5Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 8 Aug 2012 14:50:27 +0100
Message-ID: <CAJTo0LamXQkdizhearLXEjPNyag=1rAjLYphKXKRw_3av1rcdg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQnTm/8pEKnFCkJPRphgxz1FqrepLCuEuuMRLtwLXg1u8OzxKR1bTDDLJVk+5sDzYde2ionc
Subject: Re: Configurable host name
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
X-List-Received-Date: Wed, 08 Aug 2012 14:02:37 -0000
Content-Type: text/plain; charset=UTF-8

On 8 August 2012 14:36, Chris Larson <clarson@kergoth.com> wrote:
> To clarify, changing a global variable doesn't cause everything to
> rebuild. As was pointed out, it ends up in all the metadata for all
> the recipes, but that doesn't mean it ends up in the task checksums.
> The metadata checksumming tracks variable dependencies, and will only
> rebuild the tasks which use the variable, directly or indirectly. Now,
> *exported* variables are a rather different beast, but that's not what
> we're talking about here.

Ah, the checksuming isn't as aggressive as I suspected.  Thanks.

Ross


