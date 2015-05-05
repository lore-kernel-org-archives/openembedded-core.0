Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-oi0-f54.google.com (mail-oi0-f54.google.com
	[209.85.218.54])
	by mail.openembedded.org (Postfix) with ESMTP id EC89471144
	for <openembedded-core@lists.openembedded.org>;
	Tue,  5 May 2015 07:58:08 +0000 (UTC)
Received: by oiko83 with SMTP id o83so134971981oik.1
	for <openembedded-core@lists.openembedded.org>;
	Tue, 05 May 2015 00:58:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=NsCFnuGAjco891PNO7IbzctKgVc74VaGCSVSxDq32Ow=;
	b=fgT92zp7/YahGvbIxUj1K5D6JuoQ1myZWuRly/Kb55G5+Ex2cLZ6x5UBWCO3IL0Mgg
	vLAr8xDbck/hCTYjJlKFwdbDziW3Z74EVOU1872mLhYFrml74zuGai6nO3+OqwGFmri+
	OZoN9o3oZW22EiKQy3TmCIpwBhv6u5e+2jSSXjjaUwalbDDL/oX0JnV6oTxXz52EsQs7
	A4h2Nfah/aa3KQo9W4pHsPvnLGt/8XAj4rsHyzTnwO268dL3W917dLrW3Z4qavAGxoBv
	62AI36X2lEBQbf8ty8g8sI/akXPbdsJtmJdUU5ccUEHbEyBrQSc03xMIIOyjETRcfIor
	f3VQ==
X-Gm-Message-State: ALoCoQm6vBCwztDf0V2TcV6O2DniI3lGAv8KR0Ld7TiKNsKEBT9mb3YIqPdhScbTMNyHBgFhrX0g
X-Received: by 10.182.65.194 with SMTP id z2mr21269863obs.30.1430812689221;
	Tue, 05 May 2015 00:58:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.225.2 with HTTP; Tue, 5 May 2015 00:57:38 -0700 (PDT)
In-Reply-To: <CAMKF1sr7joRJQMLsX4==4e6f185hzkgC9QdwBFhxSVsHjkz64w@mail.gmail.com>
References: <1430735858-6704-1-git-send-email-jussi.kukkonen@intel.com>
	<CAMKF1sr7joRJQMLsX4==4e6f185hzkgC9QdwBFhxSVsHjkz64w@mail.gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Tue, 5 May 2015 10:57:38 +0300
Message-ID: <CAHiDW_FrGE1ryPPZinOTg-CbmT7ZUQPa3fNod79dwBY1oT=_mA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] shared-mime-info: Upgrade 1.3 -> 1.4
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
X-List-Received-Date: Tue, 05 May 2015 07:58:12 -0000
Content-Type: text/plain; charset=UTF-8

On 4 May 2015 at 23:22, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, May 4, 2015 at 3:37 AM, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>
> Looks ok. In future use git format-patch -M option to let git work
> harder on detecting renames

Thanks. For anyone else wondering how to get that behaviour as the
default for git diffs, this seems to do the trick in git config:

[diff]
        renames = true


Cheers,
  Jussi

