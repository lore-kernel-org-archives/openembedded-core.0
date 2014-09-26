Return-Path: <ross.burton@intel.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by mail.openembedded.org (Postfix) with ESMTP id 385BB60809
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 21:13:51 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id x3so4435410qcv.13
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Sep 2014 14:13:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=GpbeBCeRlJYRZbHzIBTJMgGEJSrYA4g6Dtybfy8eMIM=;
	b=WuuDPyUjFweY8fBcIHRpM/ZrByyrscpIB1LwViqdkMpiyb5DMRJrGakXS8lhpOC16L
	JW3umtL/xJSSbFikpwY7vuQO4eQkafeDri8c91bjUncA/HA0rSGDi/BQQ+WwqkEaARsY
	skEc61m2YP7MgC04qXCswdpHUvg6JzaQXEj4wTb5O4Z/gQ7MX9mcvKRhyOA7620cGESM
	rwvfhWGBmxVJ9H97ik6q2p9/liWdNSMZiPt2QMCXjObQLpTEpnzq31PzLVy83fCUeFdH
	+r9qA3jv1iQxV6eIsl3VUmEKcImhNPiClMvR+j4tCugajRFzGv8TCVbpzilfTQaGgvLg
	icIQ==
X-Gm-Message-State: ALoCoQmQR6kdjwb7d+RIjzlqj4VGSOmVhJ9EgrL3cieBrlVSvjmrlTKGtroyUsYQG6j/EjqS8ZYi
X-Received: by 10.140.40.84 with SMTP id w78mr37528339qgw.87.1411766032125;
	Fri, 26 Sep 2014 14:13:52 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.34.180 with HTTP; Fri, 26 Sep 2014 14:13:32 -0700 (PDT)
In-Reply-To: <CAMKF1spTpCemh0Z8vF1nwNzBgTQV10oep41wu90-R+P2DNdKOg@mail.gmail.com>
References: <1411749218-11056-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LbE-jeFDQ0JcQEK0aDT297HtFXNOyh-sH=nB+j--vC5kQ@mail.gmail.com>
	<CAMKF1spTpCemh0Z8vF1nwNzBgTQV10oep41wu90-R+P2DNdKOg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Sep 2014 22:13:32 +0100
Message-ID: <CAJTo0LbjLiFs1_vnYtzuVFc5EhMPb2RVA99pKSSRS5ZTf0AtYQ@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] bash: Fix shellshock vulnerability
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
X-List-Received-Date: Fri, 26 Sep 2014 21:14:03 -0000
Content-Type: text/plain; charset=UTF-8

On 26 September 2014 22:07, Khem Raj <raj.khem@gmail.com> wrote:
> Now that I see, you posted half fix like my first set. So either way
> the second patch I sent
> it needed to complete this vulnerability. I dont care whichever goes
> in for the first one.

I've rebased your second patch onto what I already had in mut, thanks Khem.

Ross

