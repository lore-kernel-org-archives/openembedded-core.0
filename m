Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f174.google.com (mail-vc0-f174.google.com
	[209.85.220.174])
	by mail.openembedded.org (Postfix) with ESMTP id 759FA6D3D5
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 10:57:45 +0000 (UTC)
Received: by mail-vc0-f174.google.com with SMTP id ld13so232783vcb.33
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2013 02:57:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=TjYG9IzOUUzp6D+v0RJGyMzdWFn2IlsaolR/HoPRlhw=;
	b=WKptE1oROE7hNlWJEA4XNItUeYvR5c9zzHw1gipWnKp3s62Ur3E8nMLE4SxAWCEuJU
	DW7ra4kqpEmvuoIByxrY3u4CBQ5AxICt1b55V4dJePvS8CnfSauUpySmyiTkYdaf6BG6
	Dn0jUjYHjlOdVwBXKGac3l1OYpn90tGwdyhZ/Ff9SuuMYEjXzbZW1XcY7DqduP8hwQDq
	5EFdbGOunFnBDqIXdpqqFrNU7OIgmyCBZh7Kvoymq1pNpYR+9WyJdL7QPSdKDbgM8hpw
	wy1jAnRmniZjAuapR/QJt7/MP6RQWz5My382V8mf5z3KXZjC99Ost43b4vAoV4ZYwO2E
	RilQ==
X-Gm-Message-State: ALoCoQkUA+c1T1ePpBGPsv4+Dnm65l8hQz1+C+eaieHJeFYPX5c5VDL/PlKGmqzXVhR72Z4vZF9A
X-Received: by 10.58.11.73 with SMTP id o9mr6260255veb.8.1383821866922; Thu,
	07 Nov 2013 02:57:46 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 7 Nov 2013 02:57:24 -0800 (PST)
In-Reply-To: <527B703D.8080600@pseudoterminal.org>
References: <1383546675-23002-1-git-send-email-net147@gmail.com>
	<20131104090831.GC3684@jama> <527B703D.8080600@pseudoterminal.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Nov 2013 10:57:24 +0000
Message-ID: <CAJTo0Laa01Nmf_KnENMKT+aZ75rTkkEpnqXCvdGnaaJYfBKpPg@mail.gmail.com>
To: Carlos Rafael Giani <dv@pseudoterminal.org>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] eglibc_2.18.bb: accept make versions 4.0 and greater
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
X-List-Received-Date: Thu, 07 Nov 2013 10:57:46 -0000
Content-Type: text/plain; charset=UTF-8

On 7 November 2013 10:49, Carlos Rafael Giani <dv@pseudoterminal.org> wrote:
> The make 4.0 issue is already fixed in the glibc and eglibc repositories, so
> this patch should be marked with "Upstream-Status: inappropiate [other]".

The log says its a backport of an upstream fix, so Upstream-Status:
Backport is correct.

Ross

