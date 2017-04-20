Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f47.google.com (mail-wm0-f47.google.com [74.125.82.47])
	by mail.openembedded.org (Postfix) with ESMTP id A4DBF605C2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 21:33:13 +0000 (UTC)
Received: by mail-wm0-f47.google.com with SMTP id r190so3136915wme.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Apr 2017 14:33:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=UjHv5fv3nJpMBNQfGODj8OBar2+PI1Kc3KDuSsAP53Q=;
	b=enWGX629bbkt455nblGIK2nedTuahVQGJhC7KZY7zJdM8iV5S5Ofc+I2lIZykSQ0Mm
	vUzbSzC23loVWXlcxbvnzaU8GZAS0lT6vt/herCQZA0Qx5o+B4wH9kDKXYeGwY6JmRem
	ufbVezJy0GAycMs9tmp2l15BHMW9cmkjItPgdLToL3oNw9HD2Np47rsh6p9pDoQLE5Az
	/cy26mRdiHcN2ybVjPWRaJJbSP3L9dmQL+jV/wVfBR2FNthTHqrSMZYGACjx3nvx8hp7
	0YlwUPqm7nFqtGdaxN++r5fNjvZNKqW/jRh63r2oC60521UCNCOVzQMjrwHdrzA8Vh6k
	5h5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=UjHv5fv3nJpMBNQfGODj8OBar2+PI1Kc3KDuSsAP53Q=;
	b=FfMXhqComhp8wXu4KWAzoZfka1yaWwJxxP7St+gkANr+bDBQ6sQylbDlg/9lkE494B
	W7F+L1dlMlI0x7Y2Vo++G2tPCsNYEDTXlFffDZY/SmRXPh3W+3kmnlaZeHda/hWYXu1Z
	Rv2FFebI3DaQ7ei+Thp4//LuPEbjBqWuPGDozL9frPt6UGRc/I9rhDRSUTpy7VInXfqQ
	M9kzvIpWIAjpDmiVWckWPC04E3nxA2/RpnL0nOR7MMu7O2PO2DSa8/9UpHVyxesH2Q5q
	oJxKKS03IFucXIpR195H5srNy6XSGicTpd6PXc66A8cfrA+aCnSnkrLvLnWMnEZL4Saf
	bGtg==
X-Gm-Message-State: AN3rC/64IhBAwNVjAbtybXVR7y6plrzNtevJaUtPJ2FiCiyhnKirVhs8
	8mOcy73suzoV8lmKM2w2FNpfXBUCGA==
X-Received: by 10.28.87.70 with SMTP id l67mr4875146wmb.37.1492723994293; Thu,
	20 Apr 2017 14:33:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.141 with HTTP; Thu, 20 Apr 2017 14:32:43 -0700 (PDT)
In-Reply-To: <CAJTo0Lb+0MeDwtN7OmeXAOOgdXvLRwoi6otefAcBWEjAaO-RRg@mail.gmail.com>
References: <20170420182028.31964-1-raj.khem@gmail.com>
	<20170420182028.31964-3-raj.khem@gmail.com>
	<CAJTo0Lb+0MeDwtN7OmeXAOOgdXvLRwoi6otefAcBWEjAaO-RRg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Apr 2017 14:32:43 -0700
Message-ID: <CAMKF1sqwg42RoLuojZmwd1SrVJZoymUu_ygLYyztsK3KMg=m3Q@mail.gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/5] bitbake.conf: Add pr to list of hosttools
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
X-List-Received-Date: Thu, 20 Apr 2017 21:33:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 20, 2017 at 2:30 PM, Burton, Ross <ross.burton@intel.com> wrote:
>
> On 20 April 2017 at 19:20, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> pr is used by gstreamer1.0-libav during configure
>
>
> So how does this work at the moment, or what's the problem with it failing?
>

I build for rpi3 may be thats why you are not seeing it.

> Ross

