Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrV2A-0005jn-4k
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 16:15:22 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 18 Jul 2012 07:03:59 -0700
Received: by qcmv28 with SMTP id v28so857558qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 07:03:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=X3nBp3ToVxqz3x3beVLjR/YnDpMdlxYXdQ5uVtMqmHg=;
	b=mbpxDDIB34GXV9PS7Xdlip1oPYsDGWwWi20HfjLaBC9zLE0+k9E2NRwxKVNBRmxssp
	U8+qSfyeN5bi+uQQAHE1OGSG/6aKXWCumpv18ezdKx6bcgHcXPxFxL3CnDwWn8zsXypA
	9iDmdD/KJ90pEypbW9vCamHKo9Tn3+qwn94fPoU/Lt0mRCsWr1gcJHq93Au0Eu89EWON
	FXG+tLxlHrL5A5h0FRZrtgWQ9qopojqlSDi7Hnp60moDaNKSUjwIydZyCmNYfMrKcLWS
	MZhDwvLYlYcrCkAqhbWo/7USlMCXAEcBHsZ60xzcDVbgZvpzo2wLDOATb4rdvyIoNEF1
	5QKw==
Received: by 10.224.191.138 with SMTP id dm10mr5862398qab.94.1342620238678;
	Wed, 18 Jul 2012 07:03:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.82.74 with HTTP; Wed, 18 Jul 2012 07:03:38 -0700 (PDT)
In-Reply-To: <20120718135449.GQ22569@jama.jama.net>
References: <cover.1342597081.git.sgw@linux.intel.com>
	<0c170de4b028140df155b3e88230b81ad1a0eb86.1342597081.git.sgw@linux.intel.com>
	<20120718135449.GQ22569@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Jul 2012 15:03:38 +0100
Message-ID: <CAJTo0LasLhzsPr0yiXgo=AN0=b2dny7HxxuMfJzDX_4C0G9biA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmdKAhmeg8OCfNZXHQ/8zCF5k6OAbO4inloCBKchU4/kFzFFpLS8IzxKCadG2AnCOcBm+bU
Subject: Re: [CONSOLIDATED PULL 14/18] webkit-gtk: remove spurious install_prepend hack
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
X-List-Received-Date: Wed, 18 Jul 2012 14:15:24 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2012 14:54, Martin Jansa <martin.jansa@gmail.com> wrote:
> Both patches (or at least the 2nd) should have PR bump so that if this
> change causes some issues it would be found asap, not with next upgrade
> when nobody will remember that this was changed here..
>
> But as webkit-gtk takes quite long to build I'm fine with it this time
> (my second builder haven't upgraded webkit-gtk yet anyway..), so I'll
> test it there.

I've re-pushed my webkit branch with PR bumps.  After the parallel
build my machine rebuilds webkit in under half an hour, which I'm
positively pleased with.

Ross


