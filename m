Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f53.google.com (mail-qg0-f53.google.com
	[209.85.192.53])
	by mail.openembedded.org (Postfix) with ESMTP id 43AB6617B8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 16:40:04 +0000 (UTC)
Received: by mail-qg0-f53.google.com with SMTP id q108so3867371qgd.26
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Sep 2014 09:40:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=+guUjb9v9c20nAdBj3ZikseNb4aMjXKS4NzM2LU87vU=;
	b=gjM97wHAF5Pm0BrG/k2SEuXhuWE1sPFFdmSvZL19AA9ViAnSWOOev+rhzdF7M4wl/h
	mk/4IxRx1NikWTPasERSM8Tpf0VjOqa/mCi9ZtREXt7qYowtMHxipqGP+lfRNQ3kB/i8
	BNPnZKnZvUPeuq4yZvYfgI4jTV1CaAr+JqGRq763T4auaEYbjA6DUokCCkQz471RuyiF
	KzvyhIRZBkhlIhSEUcuQrGrIx9/C8ehi4Tt8tS0zELt4r4pddgKKRaj/WztRkZeOxwIQ
	Pd2eRZi999epNbFPFmWZTOTKjma62X1P1PVN5ZQRk1dy3+a0C4VCxbFEhyWlaJvPiZZo
	uD8w==
X-Gm-Message-State: ALoCoQk95LFzL7+lVvahnC+0JzB5BRgVsBwulJjySmU9zEuQr1HXjPtppb7XkIgNhFR1JQg3vgYA
X-Received: by 10.224.64.201 with SMTP id f9mr3409796qai.64.1410453600604;
	Thu, 11 Sep 2014 09:40:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Thu, 11 Sep 2014 09:39:40 -0700 (PDT)
In-Reply-To: <cover.1410369386.git.paul.eggleton@linux.intel.com>
References: <cover.1410369386.git.paul.eggleton@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Sep 2014 17:39:40 +0100
Message-ID: <CAJTo0Lbcro5LBXqzmVUJw3cAmv=5s-NJ6b=yAvAcbgAW9vT61A@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Locked sstate / SDK changes
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
X-List-Received-Date: Thu, 11 Sep 2014 16:40:10 -0000
Content-Type: text/plain; charset=UTF-8

On 10 September 2014 18:19, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> A couple of changes related to the developer workflow work (see
> https://bugzilla.yoctoproject.org/show_bug.cgi?id=6662 ).
> Unfortunately the user facing parts of that are some way off
> being ready for submission but here are a couple of the minimal
> core pieces we need to make those work.
>
> (Note that these are on top of Richard's locked sigs changes that
> are still in review.)

These mails took a day to arrive, can you re-base them on top of
Hongxu's series?

Ross

