Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f51.google.com (mail-qg0-f51.google.com
	[209.85.192.51])
	by mail.openembedded.org (Postfix) with ESMTP id A9A50605F8
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:41:30 +0000 (UTC)
Received: by mail-qg0-f51.google.com with SMTP id q108so15297936qgd.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 24 Feb 2014 07:41:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=sBUZRm8zPkjWjgRIJ4RIHg7qNcbjeJMNUOknhjp1rmg=;
	b=WBgWVg3P2Pk9+eZAbJqOYmY+R06iZXpI4OHsGqcEH8GVrBxz6V3VPQGc5gsEx2oorb
	ja6lyvcLW7Z1/kX27xSKJG/RnTBCW7wmqJOIaQlyB0ysgmsJPdBLOZAn5UDbAtYNg++O
	bXMBpJqIkthbwZnptW4foHjXQnX+7TqVarOc83wdC1Ijg5OA3xjtejNJFxi1RvxdG2wg
	GHDSnddT34LmH5JnfoJ0Di2oi1xmkh4wUxYMPrQwXoupYj+HvdBhJ/aCoyAlAhttTSLt
	6qubw+DQZB2AmFcHnoAABARJwdoUrvWDxM1zlZEo1hcbpn9k0glzqcXcSIaL0n7Z2RKk
	HxaA==
X-Gm-Message-State: ALoCoQlS7ZnXwQXKjRgd4LcVsDqZrFYiJtxGs497F6GYCyzfHr+k/JIH0jvZrEYkxr5uwXXXXRDg
X-Received: by 10.224.43.144 with SMTP id w16mr30975107qae.93.1393256491465;
	Mon, 24 Feb 2014 07:41:31 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.48.79 with HTTP; Mon, 24 Feb 2014 07:41:11 -0800 (PST)
In-Reply-To: <20140224152753.GG26981@jama>
References: <1393253881.31769.6.camel@ted> <20140224152753.GG26981@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 24 Feb 2014 15:41:11 +0000
Message-ID: <CAJTo0LYBuZv5NDyM1gsQEL5KQfOvMsRpvOn5kjFaYBi5XL8wCw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: RFC: Separate build dir for autotools
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
X-List-Received-Date: Mon, 24 Feb 2014 15:41:35 -0000
Content-Type: text/plain; charset=UTF-8

On 24 February 2014 15:27, Martin Jansa <martin.jansa@gmail.com> wrote:
> Can we start by adding
> include conf/distro/include/seperatebuilddir.inc
> to
> conf/distro/defaultsetup.conf
> ? so that more people start using it and possibly report issues in their
> builds?

That list is opt-in and mainly covers oe-core, so this gets tested
every time the YP autobuilder does a world build.  We need a meta-oe
world build where autotools.bbclass sets B="${WORKDIR}/build": it's
literally just this one-line patch.

I guess a good first step would be to make this change in oe-core and
do a world build there, adding explicit B=$S statements to any recipes
that break with B!=S.

Ross

