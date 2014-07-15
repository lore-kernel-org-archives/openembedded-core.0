Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f44.google.com (mail-qa0-f44.google.com
	[209.85.216.44])
	by mail.openembedded.org (Postfix) with ESMTP id 8B5E665DA3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 21:52:02 +0000 (UTC)
Received: by mail-qa0-f44.google.com with SMTP id f12so21686qad.31
	for <openembedded-core@lists.openembedded.org>;
	Tue, 15 Jul 2014 14:52:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=AwyF1jEIzFvz/55sQxVPZ6+vjfW0WyIILZ756ZmNtro=;
	b=AaNJ7ia//S1Ju513x7aOuxGFR7p0r9ZFWPZxf4uO5XfyX4osle0mxrG0rLfoEtVvby
	/EDoaz3GPsjiKFuBlJ0fHaI2JmvwaT2ajDdqOnDwSiwf5sJRuPuMTmscU21cHIoIVI+3
	/vEjfAGUpbqEZdl7MPf+TlEC9WjsSNhrMa/FLJqLb9pbVeZzoYXvs3F1x9rfpWo3e63S
	6IgFJBcAKBNvG884zY/bqMNyAXrll6+h4aCpQ1HoVAXkyYFzcZBOqmIEGsiHjKpdhhe8
	LpHZe6o0x+Fq2SU0FZGFInDdx03KUWePpsTAHCaIUsWv45hc0AhseE0EqzJ/WX5+6FCA
	s+Qw==
X-Gm-Message-State: ALoCoQkhEzPQ3Leysp9sI+3fJTtN1GCaTAVBWV7WR6T1xEnc/o8bCZULKtTllWzY5sZiameUQNSc
X-Received: by 10.140.100.233 with SMTP id s96mr14987594qge.92.1405461123388; 
	Tue, 15 Jul 2014 14:52:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Tue, 15 Jul 2014 14:51:43 -0700 (PDT)
In-Reply-To: <CAMKF1sptj_ctzUmMSxm+6VW5LYG8xCm26b3_j4=8GMMS1HPr8w@mail.gmail.com>
References: <cover.1405440532.git.ross.burton@intel.com>
	<406153008dc78f4e3198c012f2db98fcac09b5c1.1405440532.git.ross.burton@intel.com>
	<CAMKF1sptj_ctzUmMSxm+6VW5LYG8xCm26b3_j4=8GMMS1HPr8w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 15 Jul 2014 22:51:43 +0100
Message-ID: <CAJTo0LajRNrS1nWfnE1n=ar6tO3A6US4too4sf8GwxZU1KyDwQ@mail.gmail.com>
To: OE-devel <openembedded-devel@lists.openembedded.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [oe] [PATCH 7/7] autoconf: remove automake patch enforcing --foreign
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
X-List-Received-Date: Tue, 15 Jul 2014 21:52:11 -0000
Content-Type: text/plain; charset=UTF-8

On 15 July 2014 21:14, Khem Raj <raj.khem@gmail.com> wrote:
> can it be somehow made such that it can be passed via option flags so we
> dont have to patch the packages not using above automake macro

Packages that don't use the right automake macro are generally very
old and we're already carrying patches to fix the autoconf/automake
files, so I'm not sure this is actually worth it.  I'm trying to drop
the patches we're carrying against core build tools, not increase it.
:)

Ross

