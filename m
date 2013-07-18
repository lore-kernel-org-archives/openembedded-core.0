Return-Path: <ross.burton@intel.com>
Received: from mail-vb0-f51.google.com (mail-vb0-f51.google.com
	[209.85.212.51])
	by mail.openembedded.org (Postfix) with ESMTP id F3D6D6B19D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 14:12:52 +0000 (UTC)
Received: by mail-vb0-f51.google.com with SMTP id x17so2384401vbf.10
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Jul 2013 07:12:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=09BWHG0x4tP0Z3OcSjq8dhGlPDzZby2OVoK704ytVO8=;
	b=NfSAX+QoCxdvidz93ylew72lRcKHko5lOAmqhWgx5JEjxQmL63fnXUepHwytSTy/6t
	VfBAAzlyACLGqvFxqXpSJIfAFvJp/owQfp6vF0pPX+QBO7mJGk0jLmLDVmgmcvEw2pmv
	SLVOVUNfLCHmTqvJjWNkNZltCGsgj+CKGQI+NkQehnNk8XDx6AldT000GlN2pfXDyR/m
	cVLEDP3I7VuJr4uoaz/vSaAkJNl9irTYW8TT3CAEwrnJMgVjKNIPwoGlFZ06uNYBKeUP
	uXX9Jwm39hUbzIJikA/afIJHnoh+syC098sOwMnE1KhtWCTNnfFZfS01d/IBK3aV4aOw
	V22Q==
X-Received: by 10.52.164.227 with SMTP id yt3mr3409271vdb.107.1374156773508;
	Thu, 18 Jul 2013 07:12:53 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.71.201 with HTTP; Thu, 18 Jul 2013 07:12:33 -0700 (PDT)
In-Reply-To: <1374157097-20939-1-git-send-email-net147@gmail.com>
References: <1374157097-20939-1-git-send-email-net147@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Jul 2013 15:12:33 +0100
Message-ID: <CAJTo0LbD2VUanu5cEKc+qaQ4VMiDopE8AKTu0g4s9vH0C4uzTw@mail.gmail.com>
To: Jonathan Liu <net147@gmail.com>
X-Gm-Message-State: ALoCoQmND5EuV8uPdcuoJX+Owlv1Qzq1htGmNy96qW5q3usKe1ap8KIUkvLcfFfoH4pHrJqSWkYv
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] mesa: update git recipe to 9.1.5 release
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
X-List-Received-Date: Thu, 18 Jul 2013 14:12:53 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2013 15:18, Jonathan Liu <net147@gmail.com> wrote:
> -SRCREV = "5a925cc5504575c22dbb7d29842d7fc5babcb5c7"
> +SRCREV = "42146f777b9aa89c3d2c01f2a5cde05749534508"

Oh, hang on, I knew something was bothering me.

$ git describe 42146f777b9aa89c3d2c01f2a5cde05749534508
mesa-9.1.5
$ git describe 5a925cc5504575c22dbb7d29842d7fc5babcb5c7
snb-magic-16820-g5a925cc

You've switched from a (random) commit on master from June 5th to
9.1.5, so that's not actually an upgrade.

Ross

