Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SeNNm-00068F-7Q
	for openembedded-core@lists.openembedded.org;
	Tue, 12 Jun 2012 11:27:26 +0200
Received: from mail-qa0-f49.google.com ([209.85.216.49])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 12 Jun 2012 02:16:49 -0700
Received: by qabj40 with SMTP id j40so234495qab.15
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Jun 2012 02:16:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=A9+aeY6y61P6/++QNheOltyTy+eFI1m1GA+l9xNqINE=;
	b=bWZzvN1UvmpBlqh3QQNHQ6x4aK9JfA9vi+RjfeUdi2Xn+JQZ/relyM0naN5wsk3Rrt
	RivTN6SlQqNYoXq9QMq50W5ZAM+/2DGAyMVrd3VVczC2/+kaF0m9nWUFXhTCblRDQlMF
	+zgpUVx33nBsedQcySm59ky6WGNPicbSnS4dAHOu6l4ve8FJJzB0Uq4pOKoEi0U9299K
	Sc2X1DxkNerLsPiAsXeh6alDIHcNQNEdYYqZEXu9vzyu8YUVsgI42IV/q6YXpAG8Z9IQ
	CzRUlFPMsZ6DT4bDWIjWnUxtKL9PUj3UN3hE7yqIROSg2Ec3xgICKrNOPiMXVnyLLrVv
	BrrA==
Received: by 10.229.137.15 with SMTP id u15mr8121408qct.113.1339492608338;
	Tue, 12 Jun 2012 02:16:48 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.251.142 with HTTP; Tue, 12 Jun 2012 02:16:27 -0700 (PDT)
In-Reply-To: <4FCF7959.3070102@linux.intel.com>
References: <1338960862-17401-1-git-send-email-sgw@linux.intel.com>
	<CAJTo0LY0QBDM5O8t9tvyMxnCnFWBSM3ct7AZZU8W4YZd7Ke-Pw@mail.gmail.com>
	<4FCF7959.3070102@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 12 Jun 2012 10:16:27 +0100
Message-ID: <CAJTo0LbwkmnRrQQ5-s6ca2btXSGiiq1B2iKXsF017kbeSb2K_w@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
X-Gm-Message-State: ALoCoQmofp5tom8aduMuSK5S1AIz/2fnQ/WRAiX6l+3B0DOxhN7ZgPPq3Qjt0jyrAC0L5PPfQ8uq
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnomebase: add GNOME_COMPRESS_TYPE variable
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
X-List-Received-Date: Tue, 12 Jun 2012 09:27:26 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 6 June 2012 16:38, Saul Wold <sgw@linux.intel.com> wrote:
>> Considering all future tarballs are going to be .xz, would it make
>> sense to default to .xz and fix the recipes where there isn't a .xz?
>>
> I think until we get a predominant number of the gnome packages updated
> there is not much point in doing that as it would require extra recipe
> edits. =C2=A0I think if we can do a batch update and then switch the defa=
ult that
> would make more sense. =C2=A0I will leave that up to the new gnome recipe
> maintainer Valentin.

Yeah, good point, agreed.

Ross


