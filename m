Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f176.google.com (mail-ve0-f176.google.com
	[209.85.128.176])
	by mail.openembedded.org (Postfix) with ESMTP id D58646AECA
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 10:22:04 +0000 (UTC)
Received: by mail-ve0-f176.google.com with SMTP id c13so7021308vea.7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jul 2013 03:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=S59MfTYjbMoqhF7ro4prVJRAHSAWPThEg1VyxnMBNoQ=;
	b=M1RuNV8xlX/KwjMS/DxT3B9dgyoF4oF6IZ+/wfsFTrFA20BXd+oNfPMASo/q1ErwCR
	Ox/+9IEmk/ucEvT2ULuY84AWHNy5+jSFoT7sY8PTnh1g6p41wkF2VqoHuesPzja9gUBP
	x8CGOI2kcM5Cd8glmVc0FIvDjWvLGSE31AO7AIxYXYx6rkCUuqLqDSKGO/xBx94mCs4x
	GsH0tv+dPpuwwbF1cOyiuPibmwpEq6nWTlxlUn0UID/cs0YTSgeAeeo+Z2tSzZvTpfVO
	TcoOno9ItdF0+QavVc6YEKpQD1pgaa3JFZIk+owATMge3Lx1mtrOzcQ4oqBI7kDcsXzG
	p/sw==
X-Received: by 10.220.42.147 with SMTP id s19mr21221009vce.46.1373538125249;
	Thu, 11 Jul 2013 03:22:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Thu, 11 Jul 2013 03:21:45 -0700 (PDT)
In-Reply-To: <c100a9e3184984c52b4c8743039537711123b5fb.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
References: <cover.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
	<c100a9e3184984c52b4c8743039537711123b5fb.1373359791.git.emilia.maria.silvia.ciobanu@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 11 Jul 2013 11:21:45 +0100
Message-ID: <CAJTo0La0gTguJVoZNY57B4XfDKHY8y4BjBrozA3ChNwkCHmeiA@mail.gmail.com>
To: Emilia Ciobanu <emilia.maria.silvia.ciobanu@intel.com>
X-Gm-Message-State: ALoCoQnmSpE5o3dEEh6gPOBq2XnkeG/ijZ1xSOfV4tZMSR/xH52u2BHUmnphkoiutzvdzvMPg59l
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] zip: rename recipe
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
X-List-Received-Date: Thu, 11 Jul 2013 10:22:05 -0000
Content-Type: text/plain; charset=UTF-8

On 9 July 2013 09:57, Emilia Ciobanu
<emilia.maria.silvia.ciobanu@intel.com> wrote:
> Current local version is 30.

Explaining why this has to happen would be useful.  I presume the
situation is that the package report system is reporting updates
because upstream is at version "30" but we're at "3.0", when the
reality is that upstream is sticking to 8+3 filenames so drops the
dots in the version number.

I'm not sure making our packages have the wrong version just because
upstream tarballs versions are mangled is wise.  Can we extend the PRS
so that it can transform the PV before comparing it to upstream?

Ross

