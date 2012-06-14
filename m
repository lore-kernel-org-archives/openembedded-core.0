Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SfD32-000239-0E
	for openembedded-core@lists.openembedded.org;
	Thu, 14 Jun 2012 18:37:28 +0200
Received: from mail-pz0-f52.google.com ([209.85.210.52])
	by mga01.intel.com with ESMTP/TLS/RC4-MD5; 14 Jun 2012 09:26:27 -0700
Received: by dano14 with SMTP id o14so2803148dan.25
	for <openembedded-core@lists.openembedded.org>;
	Thu, 14 Jun 2012 09:26:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=e5PXpqMbqsDWO3zlp2m4OzhlCU0PsjTTYFSpDW7vt1Q=;
	b=hPLW9HfsFaVUbqw01FwEubY1Jk3aIgLAyXRWrQS4E54xL7tqYdNkOw6d6CyMEjNw5k
	OSpOnXY5CqxEbxYRySxCBD5IurbaZXp9ePttdTDyNVejbPVGpFrm2eHnrlGev/fYC6/a
	cGkMaD9hJEHDqd6S1ajE8QOeiVC7CxAk28p4iR2OrXDV2oZqRKnL9/QsSM1FW2pUYhLY
	ygdH7G3ivjgO5Dw4L6a/vRhPh7AZzJfjNZYk+Z++iby9e4G4BXukXRVxshU6YwY4atAi
	EoMXRijduxfZIbVxCpEYQPXK66AUN6xXLIrx0jPnG9bCYqbbPfrkRUk0zof9w6GcV+Qv
	cPYw==
Received: by 10.68.228.130 with SMTP id si2mr6849137pbc.59.1339691187617; Thu,
	14 Jun 2012 09:26:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.251.142 with HTTP; Thu, 14 Jun 2012 09:20:52 -0700 (PDT)
In-Reply-To: <1339690704.14857.102.camel@phil-desktop>
References: <cover.1339689908.git.ross.burton@intel.com>
	<31c81258425b08340416818f8ad50d5adf1515ba.1339689908.git.ross.burton@intel.com>
	<1339690704.14857.102.camel@phil-desktop>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 14 Jun 2012 17:20:52 +0100
Message-ID: <CAJTo0LawKqbJi1sGsuAuuL_uoWK1Kcx-GsAwKqZGofhA2=gJkg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQkk5jX2VeJD0UA729kZSi1QKkZuioW54x1JPL0qs+nVQFPCiMJvbgwkdbqyZSGjVhSWUV5X
Subject: Re: [PATCH 1/2] connman: upgrade to 1.0
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
X-List-Received-Date: Thu, 14 Jun 2012 16:37:28 -0000
Content-Type: text/plain; charset=UTF-8

On 14 June 2012 17:18, Phil Blundell <philb@gnu.org> wrote:
> Why did --enable-client change to --disable?

Yeah, forgot to document that.  The client is pretty much useless.

Ross


