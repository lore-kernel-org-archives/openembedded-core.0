Return-Path: <jussi.kukkonen@intel.com>
Received: from mail-ob0-f177.google.com (mail-ob0-f177.google.com
	[209.85.214.177])
	by mail.openembedded.org (Postfix) with ESMTP id 82EB873E11
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 08:28:45 +0000 (UTC)
Received: by obbhe7 with SMTP id he7so106408394obb.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Aug 2015 01:28:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nHoL/AcR2No7chbgnunXnRVmNpqrlTKwzuwaRzkho8s=;
	b=W2PzbnUXSTP/+FaYAfqeqKDvD0vDR6BAf4f00JBKbN/JT6GxTaRpNh/anCD4g0bGUv
	/vwyLJfNCGHZew0wd85VwmzaIQ0qfsUVBshkoQXv72V5bVTmADXz2jh7qY3CYf9j1z2F
	5TD2M3vIfnxkLHtEARAdDa84NlmmFwkjGHnfiBvW7bOtxDUXhUaJE3zfX4gr9kdozuRp
	XmzEOlmiL23CVIAsJiN9w8cwiKumcn5r9buuzPfG+pJ0AIOn2KHIH9cLhGp1zwMy1trI
	uyHslfHudoGE29jWGdhQSrrlpY+/dZIVrzsPJSJG0kfNLoWGOnh/tsnAtVO8Y/KOIzFO
	URpw==
X-Gm-Message-State: ALoCoQl7bFklc0hkUBODussjSqxxlk/TfR7jIqdZev2nrnd9M9uWkf27ocCam4lnuiyDRxRMFXPb
X-Received: by 10.182.246.41 with SMTP id xt9mr195993obc.55.1439800126126;
	Mon, 17 Aug 2015 01:28:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.202.221.70 with HTTP; Mon, 17 Aug 2015 01:28:16 -0700 (PDT)
In-Reply-To: <E8CC593E-A8EA-434A-8E13-09370E39E498@gmail.com>
References: <cover.1439318387.git.jussi.kukkonen@intel.com>
	<E8CC593E-A8EA-434A-8E13-09370E39E498@gmail.com>
From: Jussi Kukkonen <jussi.kukkonen@intel.com>
Date: Mon, 17 Aug 2015 11:28:16 +0300
Message-ID: <CAHiDW_FpA2VW=9=b+Tbs7vy0Zgvk99DJMm6TktKwP3Og5qtUfw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/4] Upgrades: openssh, nss, nfs-utils, rsvg
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
X-List-Received-Date: Mon, 17 Aug 2015 08:28:46 -0000
Content-Type: text/plain; charset=UTF-8

On 17 August 2015 at 08:15, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Aug 11, 2015, at 12:12 PM, Jussi Kukkonen <jussi.kukkonen@intel.com> wrote:
>>
>> The openssh upgrade adds a test that currently fails: that looks
>> like a failure in our test setup, I've filed a bug for that.
>
> openssl 7.0 has now been released,
> see
> http://www.openssh.com/txt/release-7.0
>
> it deprecates few things e.g. dsa is disabled by default but its good in general
> one can still add PubkeyAcceptedKeyTypes=+ssh-dss to ssh config files keep going. but in general it will be improvement

Well of course it now gets released after I grew tired of waiting and
sent 6.9... I agree that 7.0 would make sense, I can send another
update -- it should be mostly deprecations and default build config
changes compared to 6.9.

Thanks,
  Jussi

