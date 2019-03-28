Return-Path: <ross.burton@intel.com>
Received: from mail-it1-f195.google.com (mail-it1-f195.google.com
	[209.85.166.195])
	by mail.openembedded.org (Postfix) with ESMTP id 37B1D7CD89
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 13:15:19 +0000 (UTC)
Received: by mail-it1-f195.google.com with SMTP id l4so8310792ite.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Mar 2019 06:15:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=G5HQZi6S8iEJqm7FgK+yVD/bcSMZMgw8BqxxmuU0Ob8=;
	b=lh41W6NpQJIvQsA+Wpk1zdHf02XvUrop1lUgKRvPEv2dS8oyV5eeY6uq6II0VYj+WH
	ie2mKlHKNJS397WGgFinqWaA6ctD2+WZp+jcnucMz27wkzvuySbKtfobWM1/2ThpXdpA
	o4fjUY4canRI5zTt2f+tnFVN8UHhs74HTEDvLjCzQ9quGRYM+g1U5aeFdELAHJ83Zc3r
	u6Jg0Fnm5lXh9Qj67Xuih9EfdX8l8cjqSE910ptOOjtVFANEf0jcFfu31hY30nSO39Rg
	82DkSvUrl83H5757BOj/mCOxzH8us3FKCMK/WF3Dot4G3R9xa3AzAzzJbJ0d5JDNCGzn
	t/3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=G5HQZi6S8iEJqm7FgK+yVD/bcSMZMgw8BqxxmuU0Ob8=;
	b=VrgTRGpbNWdC+byqCsin+1RPPU14asqn7v7gu2ry4+RtZrknUsrY6SiHXXHL4w0kw+
	WU41ThWQumDD2oh92qUsHKeIs8yRyKb7+2SiCETr6UQJMVuF7LPia9GXmYK8ty2J66gU
	R5doavwldWF8VNPE5bdaVI09GLhKibtcvi8YKsVr1ghaZxTe/C3QqGTLWbVbMIP9eoCU
	vICHs6qXRvTYZoz8JL7c2sdBzsji5/cRNqd594xgYNoprE8lNxEq/yX1BcmvXfzK5KXf
	zvbAMxpXnfhBXcfNxAv/+FKbBfYSiX3NNy1NWdozn3TNrwg1JqXnpRaf7rasRprYNZ0A
	HO7w==
X-Gm-Message-State: APjAAAVFos1ERuDnYpq1JyS2kwGs9u/6bCEc7hcb1IT8KNfk8wMCpQjz
	mplDDotbGNe0uLTzR0A1zB+XgwWTa7uArPIxTuZ6SQ==
X-Google-Smtp-Source: APXvYqxmEG9D2ky16fhahMXCv6FV6jmegMH2ueKN7PvKTJS0biEjcURlkroX2WIVPe6n17roDWjBJBSUkYjeCkfNK5A=
X-Received: by 2002:a02:7654:: with SMTP id z81mr31696761jab.79.1553778921153; 
	Thu, 28 Mar 2019 06:15:21 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1553775186.git.Qi.Chen@windriver.com>
	<a1544536fd186e7326faec46f7e35c6a1d33e45e.1553775186.git.Qi.Chen@windriver.com>
	<CANNYZj_xbMheU=FEenRYkccJwxG10mJPHSqmwekt+EqAV=FumA@mail.gmail.com>
In-Reply-To: <CANNYZj_xbMheU=FEenRYkccJwxG10mJPHSqmwekt+EqAV=FumA@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 28 Mar 2019 13:15:09 +0000
Message-ID: <CAJTo0La3fza0yn=dcWYWjSh00oJD1NQg8UMDOYSN0w_y4qODXw@mail.gmail.com>
To: Alexander Kanavin <alex.kanavin@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] binutils: fix PV to respect upstream tag and also cve database
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
X-List-Received-Date: Thu, 28 Mar 2019 13:15:20 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 28 Mar 2019 at 12:07, Alexander Kanavin <alex.kanavin@gmail.com> wrote:
> The problem with setting PV properly, is that 2.32 is less than 2.32.0
> and will cause the 'version going backwards' problem. But if RP/Khem
> are fine with it, I would prefer your patch.

I just had a look at the code in bitbake and yes, it actually even
tests that 1 < 1.0.  I'd say that there's an argument for handling .0
releases specially and considering 2.32 == 2.32.0.

Ross

