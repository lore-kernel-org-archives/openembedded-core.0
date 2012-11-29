Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Te2Vl-0006JQ-SC
	for Openembedded-core@lists.openembedded.org;
	Thu, 29 Nov 2012 12:42:38 +0100
Received: from mail-ia0-f197.google.com ([209.85.210.197])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 29 Nov 2012 03:28:16 -0800
Received: by mail-ia0-f197.google.com with SMTP id r13so5887783iar.0
	for <Openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2012 03:28:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=UCrxBxMLZSWFav4XHlzJ5iY7q/bDHyx+6DlOcvUWUCM=;
	b=lNNKzeFulh0xHZtwfyvkDrpMv7gLjZu+puSb5kcikS4FQeYbgoo8VB4JzliHDAOVZd
	Ji7LKmk7Gq60z2F5whrdJ9QZOE9Zr8lB1Yr7IkH1KdyLj1a2EDbNitJIyTnWp/QB6BYQ
	ZAXxpOhYIfc5ef52SWa17rvhO8m+FIxoHnYRyFZbJnz8riuh+zNZ2DwO+mntbomu2sTy
	6IHNBCIZBV+IEeW67LaCtAonkdpxY8X8BSn0MYN1+VIEHGiHuurpVM+1smIZKcP7vT0d
	YeTtPVJYRQd1MbzDV/x2sTFh61NbB78ZY8SYcEnP9yeGgRRM6p9qhW2dzjNPDpL56Qe1
	xfEA==
Received: by 10.182.240.109 with SMTP id vz13mr7473345obc.81.1354188494821;
	Thu, 29 Nov 2012 03:28:14 -0800 (PST)
Received: by 10.182.240.109 with SMTP id vz13mr7473341obc.81.1354188494733;
	Thu, 29 Nov 2012 03:28:14 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Thu, 29 Nov 2012 03:27:53 -0800 (PST)
In-Reply-To: <1354133261.28084.102.camel@empanada>
References: <cover.1354126748.git.nitin.a.kamble@intel.com>
	<1354133261.28084.102.camel@empanada>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 29 Nov 2012 11:27:53 +0000
Message-ID: <CAJTo0LbshbjjaDKaj63BABuF0mkLfgo7mnhEwwqiUOw2UHV7nQ@mail.gmail.com>
To: Tom Zanussi <tom.zanussi@intel.com>
X-Gm-Message-State: ALoCoQkJ5ueA6/3aaavSO2HIYHnT/cDKNM6NTpxL5NxGdNFHOSPcfFBptMs8bokA6MDktQtt7JCPvkmJifg+JqkeEOCYG8/FGNZbRVo6XS5hkL68TnE1SkbeGm2UoTNdb6YxyEQPEqvIokGcsN3zyb6RRQwgXHoqSVm/o0OK8k3JGpkNDfEP//MlS8B1OciuR69yUuIReiUB
Cc: meta-intel@yoctoproject.org, darren.hart@intel.com,
	Openembedded-core@lists.openembedded.org
Subject: Re: [meta-intel patch 0/3] Fixes for rescent X breakages in meta-intel layer
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
X-List-Received-Date: Thu, 29 Nov 2012 11:42:38 -0000
Content-Type: text/plain; charset=UTF-8

On 28 November 2012 20:07, Tom Zanussi <tom.zanussi@intel.com> wrote:
> So does this conflict with Ross's patch, which seems simpler...

I do prefer my patch as the same breakage will occur for anyone else
using oe-core master but also building their own older X server.
Whilst the delta is so minimal, I don't see the problem in supporting
both in oe-core.

Ross


