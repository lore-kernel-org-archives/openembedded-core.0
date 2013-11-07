Return-Path: <ross.burton@intel.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id A52006D3E0
	for <openembedded-core@lists.openembedded.org>;
	Thu,  7 Nov 2013 11:12:54 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id ks9so251100vcb.17
	for <openembedded-core@lists.openembedded.org>;
	Thu, 07 Nov 2013 03:12:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=KaC98deJ+GZR9+46af3zA5pi8cScwUxbMtlhrp/TDrs=;
	b=hqEUyYg07aclnD5fUM9MnfxWyMqgNNWvcyrDjx8X0vjRzB3U4x5Tkl0BlhuT97YvRk
	MtbdW3K8t7DjCzxKbtvXSkBu42G2RFrl/6KpJ+bvANvqWCCVO2rqic9pCTLvyrKlqTRe
	YHU3UNl0qOCkXygrV/pxsKysqDJvvKg7HN5RbU1vuSTGT1HnYtcUKh+tCiROU2ifT7yW
	JDBTuLRxsrU4SOVesWiRPNymqvROMDwtcusgYXSZ0jh0Im9i5AmoduRdGex69jB0AL9G
	PPWzLvztrLCtK+KfGuAAs0iez8f1b1RLecMe3hDwMNkJ/v4UKa3YviOdk+RCqn0fFluW
	E34g==
X-Gm-Message-State: ALoCoQmgsjQgBi2ADP5P1z2GYf1BLCKz2/HkBbpiBsx8wjhgqBtcYXrmwIVxcsmrNrc1bN+ZV4kB
X-Received: by 10.220.173.134 with SMTP id p6mr40633vcz.36.1383822775865; Thu,
	07 Nov 2013 03:12:55 -0800 (PST)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 7 Nov 2013 03:12:35 -0800 (PST)
In-Reply-To: <cover.1383821844.git.wenzong.fan@windriver.com>
References: <cover.1383821844.git.wenzong.fan@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 7 Nov 2013 11:12:35 +0000
Message-ID: <CAJTo0LZHwv3jbAP_utqA-RUALdE_R7OtpUQnzaWU67qup47fHQ@mail.gmail.com>
To: wenzong fan <wenzong.fan@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] udev: ship source files to related dbg package
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
X-List-Received-Date: Thu, 07 Nov 2013 11:12:54 -0000
Content-Type: text/plain; charset=UTF-8

On 7 November 2013 11:03,  <wenzong.fan@windriver.com> wrote:
> From: Wenzong Fan <wenzong.fan@windriver.com>
>
> Just ship these sources to their own dbg packages instead of udev-dbg:
>
>     libudev* -> libudev-dbg
>     gudev*   -> libgudev-dbg
>     others   -> udev-dbg

Why do this?  Multiple -dbg packages could make sense in a recipe
which builds a multi-gigabyte -dbg package (such as webkit) but what's
the rationale for doing this in udev?

Ross

