Return-Path: <ross.burton@intel.com>
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com
	[209.85.166.41])
	by mail.openembedded.org (Postfix) with ESMTP id 776B96C463
	for <openembedded-core@lists.openembedded.org>;
	Thu,  3 Jan 2019 13:33:53 +0000 (UTC)
Received: by mail-io1-f41.google.com with SMTP id r200so26963049iod.11
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2019 05:33:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=neQn1jtAvoM9DoJp/ZGoSYsdJu/HkTgP2TvbC1TTt2o=;
	b=OYQyJtuVRNlelqvN9Cqk+XSR28n7kWd3T6TtG71piNYQ9f0n0potF5aJdWnPzuzfQz
	McxRzB5JFl6IMMC4L2gXnkV+O7TKU3KV436SLdbm10ymQ/kyRVHarc0/Btgynr92Kb8D
	yFwqRPGS4ukVLVLr71beMFAByu46wgN4aHCbGqgyNZYlFPMRGN+DpVMEYOGxXDo2FYtL
	WJvanP4Z1XdVLagLSZH1T5wJopms2uZotvtEa0zFnfZjoKG63xG1QFgPkP0yMGGRwcFA
	UJ/HkF0BT76eUXaJdTdvumSpW8V9lltkUHYkOdwklFNgHh73G5G10B8aZJWaVXThTmaB
	nBfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=neQn1jtAvoM9DoJp/ZGoSYsdJu/HkTgP2TvbC1TTt2o=;
	b=c/z60acIIzPRgdXswcgZ1pqcVAE8vxGljPt5MVfnXnnxv5f3dXxPnh33kr31lYC7+5
	Ld8c9U03nlTz8DeH9DkP4IignRd0vszhLD7YHShW2yw05+uPBgGMLJn/t8OGvX2q1/Ps
	ykiBEqZSfzUsDgwLU4NrGfDHVFWFSa2q/Shn9UPeX+KNXxLLfDeMzYjmnW6HFzdFu25X
	APMBJsszSw/MAijwUfHx/94528x+zdriiREE8DVvvENPZutByzegi/m3Oa70WzJrFDNP
	pv66RClsoshtRVM+EgrH5BVm+nYrGUN997eBWKQb9za0p4Aeq7KwwPSHmjgnaBXzwIVz
	6ORA==
X-Gm-Message-State: AJcUukegSQTMFzi/Cy7FcPJcM/WG/MZ0eXosuGPr0p+oRXiCxSbcVVRl
	T3oW1geyrfKda8ttAx35obBswxU2mDKMuOo0xT5eNQ==
X-Google-Smtp-Source: ALg8bN5+bq6SzLkIWVnGN7o/SpGZGleafrzrc1lzuJIiAbOSuJgN024caYf39mpP0juH+fO16mIPoAI1FwwEQVF/8/c=
X-Received: by 2002:a6b:acc5:: with SMTP id v188mr31771896ioe.20.1546522434566;
	Thu, 03 Jan 2019 05:33:54 -0800 (PST)
MIME-Version: 1.0
References: <321cb5cd28684311ba3f3c0dba168baf@svr-ies-mbx-01.mgc.mentorg.com>
In-Reply-To: <321cb5cd28684311ba3f3c0dba168baf@svr-ies-mbx-01.mgc.mentorg.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Jan 2019 13:33:43 +0000
Message-ID: <CAJTo0LZq7oWLQZJ2wv+3BeJRJL+vYjNCwvqDyAe5fbMHYntuOg@mail.gmail.com>
To: "Ahsan, Noor" <Noor_Ahsan@mentor.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: ovmf fails when python sqlite module is not installed on host
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 03 Jan 2019 13:33:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 28 Dec 2018 at 13:07, Ahsan, Noor <Noor_Ahsan@mentor.com> wrote:
> While building ovmf recipe I faced one issue regarding sqlite python modu=
le. The recipe is trying to access host python packages in order to build i=
t. On my system I had multiple puthon version installed and the one which O=
vmf was picking did not had sqlite module installed so I got this error

sqlite3 is part of the standard library, so what host distro are you
using where this isn't installed?

Ross

