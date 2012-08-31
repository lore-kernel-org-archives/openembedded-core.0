Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1T7XQC-0000fX-MT
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 22:02:28 +0200
Received: from mail-ob0-f175.google.com ([209.85.214.175])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 31 Aug 2012 12:50:03 -0700
Received: by obblz20 with SMTP id lz20so6396049obb.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 12:50:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ww8cDvj5nxY6XqbIGt6rKoMbk5qlB/3jlva+jrYRIeM=;
	b=bNCsFN6gCNwZoZR3qSl1RFESsmcXrCP/Csf36gWwqT6leK+7CGPJk8/fPMCYCMTxa2
	MhUTNgdOU9WRVFNmlSw8ghKw0U4/KWRsyUw5RT/5DGFyIZzUmKjDdRVpPei30aEe1IHb
	wHoL4fOzJvnwnxi7Eu9V/ZK3aWbsq6225lcH6cXyge/Dh82vYYZ8wQLNcMQQ0zhXbseU
	6bsyEo36xWVcn0MN1KHgEGgNB/uTBR6gYf1IAKY49+s7gPRYohfNH5UUCGtaJGr4PPzI
	1Xtm6ZeorMooMi/+5L1CRmWFAYiS76x2ZBYkI3n2w3cndVf2DxnttNqCLPuxl39HMqcy
	GGRA==
Received: by 10.60.19.195 with SMTP id h3mr8780859oee.102.1346442602406; Fri,
	31 Aug 2012 12:50:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.79.105 with HTTP; Fri, 31 Aug 2012 12:49:42 -0700 (PDT)
In-Reply-To: <5040E5FD.604@linux.intel.com>
References: <cover.1346346320.git.ross.burton@intel.com>
	<b01489d1b7731846021040962e4ef625d311a4e7.1346346320.git.ross.burton@intel.com>
	<5040E5FD.604@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 31 Aug 2012 20:49:42 +0100
Message-ID: <CAJTo0LYMmz6edsk6b--QoL1SvJ9pAjdu1f8aL5i6-oE-u0XJcg@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQlxyshh0uEA37dzWN7ECesHEfQaSmZ3vzHz1CY+m+IfjDs5knI/WaqwAOwdomu40nB+k+83
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/6] xserver-kdrive: remove.
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
X-List-Received-Date: Fri, 31 Aug 2012 20:02:29 -0000
Content-Type: text/plain; charset=UTF-8

Hi Saul,

On 31 August 2012 17:27, Saul Wold <sgw@linux.intel.com> wrote:
> I really can't take this patch set until the corresponding change is made to
> the meta-yocto BSPs as this will cause breakage there.

I understand why I accidentally removed those patches.  Thanks to the
magic of git reflog I recovered them, put them on the ross/xorg
branch, and mailed them to poky@.

Ross


