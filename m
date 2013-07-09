Return-Path: <ross.burton@intel.com>
Received: from mail-ve0-f174.google.com (mail-ve0-f174.google.com
	[209.85.128.174])
	by mail.openembedded.org (Postfix) with ESMTP id 887156AD71
	for <openembedded-core@lists.openembedded.org>;
	Tue,  9 Jul 2013 16:05:30 +0000 (UTC)
Received: by mail-ve0-f174.google.com with SMTP id oz10so4787318veb.19
	for <openembedded-core@lists.openembedded.org>;
	Tue, 09 Jul 2013 09:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=ZEvoA9jV2SQJdO5JbEa0A56MGobWybJGZiPKrQSDDHM=;
	b=BEkFjWXp9Ywdu53O1txGWCL+oVytwVZOMoMnGhWygQWyQIAlPuIb93YC/TAJqkiGSq
	dO/OsYBJu5Gle8ObmE/Cb64gjJx//UqFODGuV8T1VJuqTqEwR4ncdB9Ad8QwEOqFJJsC
	JSUUbSgcYX1dunxOJNx49NkfIldRniVIGYADQoGj3/CWfT5Gz+xI+v/iZPdPnSwF9E3A
	CpOVE8WH+0Vf5Zlf76vO9f7fH7fBdR9fo7Kv6rAtX89KezTwsb/BsRImJaylmx5X7lUo
	lI1kh2OYjXAo5bXUGDNXgfwWIr0FuDYtS1aJd7SPMRtoUq8oUBtpwtAvFPZACcsB215v
	mJvA==
X-Received: by 10.52.29.106 with SMTP id j10mr13655644vdh.77.1373385931199;
	Tue, 09 Jul 2013 09:05:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.13.144 with HTTP; Tue, 9 Jul 2013 09:05:10 -0700 (PDT)
In-Reply-To: <3588463.kQicxHoPbN@helios>
References: <044c6bc4-86ca-4c96-bb24-50183cdf65b3@CH1EHSMHS029.ehs.local>
	<3588463.kQicxHoPbN@helios>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 9 Jul 2013 17:05:10 +0100
Message-ID: <CAJTo0LbP1EqKtxmULRhG8Pt_Am_nDSuopTyNv5URHuxXW2VdMw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
X-Gm-Message-State: ALoCoQnhxSE5JReh9VC8joVCMw2Asa+IAuWhoojCGItNiwXMOVTgxyQidx3qlRmA8Byf0Pjx1R0k
Cc: meta-xilinx@yoctoproject.org, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/2] scripts/runqemu: 'qemuzynq' and 'qemumicroblaze'
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
X-List-Received-Date: Tue, 09 Jul 2013 16:05:30 -0000
Content-Type: text/plain; charset=UTF-8

On 9 July 2013 16:54, Paul Eggleton <paul.eggleton@linux.intel.com> wrote:
> Since this is unlikely to happen immediately I've acked these patches going
> in, but I think we'll need to look at doing this some time soon.

Agreed.  To make sure this doesn't get forgotten, I filed #4827 yesterday.

Ross

