Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f42.google.com (mail-qa0-f42.google.com
	[209.85.216.42])
	by mail.openembedded.org (Postfix) with ESMTP id 1C65765E48
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 16:28:18 +0000 (UTC)
Received: by mail-qa0-f42.google.com with SMTP id j15so4750921qaq.15
	for <openembedded-core@lists.openembedded.org>;
	Fri, 25 Jul 2014 09:28:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=nN25Qnons2wwCE2YcXX7rGNlEYDZUTY5Koii54co5IU=;
	b=YqeLWwPIY+20cMC2M4Ej+ZPCaWF/pL7S69rkB7HjbQdMcSehkDmQNisvWAVS3wGidd
	x6ylJ8/Fk2FF02d/bnNK07E4TvNxDJhLuxVfAQXvltXwJAvOmOnTedjpXPxcDH3z1u7a
	vJWoP9qZBIRqpoPTKJDPyCYq6ihHjc823/xmZ+qsqM6evyhQjAGt7wLC7bcdVmJuX318
	opmpxbRSmLh+rsULKZfBcVLQuxllaH6EtpbcgYVrqcFJVCdeahiEcZtVOfLcMyRzGMSq
	wNKM5Lr3ZRaTEIK75xPE+2pS5ggDrq8W8W7++HcXgmCQZ9/TcnixjScKeIK/ngHvQzST
	dzQg==
X-Gm-Message-State: ALoCoQnBQ8ZclzqgnX24ooWIuySSz3RP4QW2SKewTCT9WKqsv+t40RmgZfnBDRVHTl7ASeuTqZ+O
X-Received: by 10.224.167.136 with SMTP id q8mr28317764qay.35.1406305699363;
	Fri, 25 Jul 2014 09:28:19 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.86.99 with HTTP; Fri, 25 Jul 2014 09:27:59 -0700 (PDT)
In-Reply-To: <CAMKF1so3=BnFtOS988XY9pNmGZCx9Cgg7sALnomE=bvoYOZv=Q@mail.gmail.com>
References: <1402915976-12506-1-git-send-email-ross.burton@intel.com>
	<CAMKF1so3=BnFtOS988XY9pNmGZCx9Cgg7sALnomE=bvoYOZv=Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 25 Jul 2014 17:27:59 +0100
Message-ID: <CAJTo0LbsgfEXhTqBvX_mdQnGHfa6CobYqa3ddguZo7JrS88Bqg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] wget: use GnuTLS instead of OpenSSL
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
X-List-Received-Date: Fri, 25 Jul 2014 16:28:23 -0000
Content-Type: text/plain; charset=UTF-8

On 25 July 2014 17:22, Khem Raj <raj.khem@gmail.com> wrote:
> it would be nice if this was either virtual/ssh or some sort of
> PACKAGECONFIG so folks who
> have ssl on the system dont need to pull gnutls as well.

There's API differences so it would have to be a PACKAGECONFIG but
agreed.  For what it's worth I'm planning on doing a PACKAGECONFIG for
xserver as it supports three crypto libraries for SHA and pulling in
gnutls just for that is madness.

Ross

