Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TiXPN-00008B-0j
	for openembedded-core@lists.openembedded.org;
	Tue, 11 Dec 2012 22:30:36 +0100
Received: from mail-ie0-f197.google.com ([209.85.223.197])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 11 Dec 2012 13:15:54 -0800
Received: by mail-ie0-f197.google.com with SMTP id 16so19765613iea.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2012 13:15:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=SifIabEiU9ZolaHGa508RlTsn/3RUFTpBnnTawpNXeE=;
	b=Rz536elVm1tccQopmKZJt0cGPyZQHDzIP1hTRIbLSRHD4UR5COzBcxX/nJi/WvB6Nn
	uxIB7bNNOIu7h4x+SxH87DvxXwFoQ2KzvgbdXa3zdpORDSMYoF17mHs0Jo8wJ+Feero9
	Eszl3/8Z2OSmanyFpg15I/gu6ykbTaeKtzLTISFPlBQRPAExHFiWrA7RMKAFSt4DiaYP
	zr6UxIwMSeSlNX8hj20zB/ONb9hFZcjbTtVTeki7YXXcwePXRFByPVZ3LacPF9pczQUG
	ux+h5Ng5xP1oHmBHCCKslCUHGkkm3nm/AxfJlvEN9gi5CtFaajY7wxRVlQXIjSNC6cXa
	OLOg==
Received: by 10.60.12.99 with SMTP id x3mr10475950oeb.71.1355260553960;
	Tue, 11 Dec 2012 13:15:53 -0800 (PST)
Received: by 10.60.12.99 with SMTP id x3mr10475947oeb.71.1355260553886; Tue,
	11 Dec 2012 13:15:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 11 Dec 2012 13:15:33 -0800 (PST)
In-Reply-To: <5f3ae296667128f06fab2b1660dcc120d81ad6fd.1355214185.git.alexandru.damian@intel.com>
References: <cover.1355214185.git.alexandru.damian@intel.com>
	<5f3ae296667128f06fab2b1660dcc120d81ad6fd.1355214185.git.alexandru.damian@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 11 Dec 2012 21:15:33 +0000
Message-ID: <CAJTo0LaN=Qm8U3jAUuvQMbu9tstNhXDCJK7==_6DZKEsdV0t5w@mail.gmail.com>
To: Alex DAMIAN <alexandru.damian@intel.com>
X-Gm-Message-State: ALoCoQnXiW4RRvM61uaem6CfF3SfSfwg0LBDqasdUuEP/QQND/PBcP62tfhlAOp4COh5MbpnoJAAOHDI/8bUoJgq7zD73bB6ON/C0PtPYhNuAZtLzhRh0cL3UBBSrQV8fU8RUDAKaymDA6ncO2hOJcmKfT0NxZBSX0kUL6QPpNRi/oRsF5OSqnONBoEFEKtgTNbPdpCl+6o7
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 6/8] Fixes for the mesa-dri recipe
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
X-List-Received-Date: Tue, 11 Dec 2012 21:30:36 -0000
Content-Type: text/plain; charset=UTF-8

On 11 December 2012 08:29, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> This set of changes fix packaging and compilation
> options for the mesa-dri.
>
> It also affects priority so that the git version is preffered.

Why can't "use mesa-dri git" be part of the pre-requisites for now?
We may be happy with a well chose git snapshot of Mesa but the current
revision is literally just HEAD when I changed mesa-git for the new
build system in master.

>  DRIDRIVERS = "swrast"
> -DRIDRIVERS_append_x86 = ",i915,i965"
> -DRIDRIVERS_append_x86-64 = ",i915,i965"
> +#DRIDRIVERS_append_x86 = ",i915,i965"
> +#DRIDRIVERS_append_x86-64 = ",i915,i965"

That's not a "fix"...

Ross


