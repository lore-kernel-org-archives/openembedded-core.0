Return-Path: <schnitzeltony@gmail.com>
Received: from mail-il1-f193.google.com (mail-il1-f193.google.com
	[209.85.166.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3523F6D7C1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 23:40:02 +0000 (UTC)
Received: by mail-il1-f193.google.com with SMTP id f6so4638225ilh.9
	for <openembedded-core@lists.openembedded.org>;
	Fri, 22 Nov 2019 15:40:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=WiY8gvA0vOKYc82QXHlw9tLjxEX4OuC4vu8gdSFxCHQ=;
	b=qule6j9dLEQtPlgeR5w+go8I+M3FdapGtNOtWm8py/HA1y3uGWkk/5b1plXp7DtjOB
	PM9TD6cxitfJwqq4jdbPNO4MCEeEMAFu7DFHT2AeFLMB24qh/4jTc7/JTusrh8f72jLE
	aRHZNQN4pVpIidb23ysj3K5Gt34ltqnq6+PEP83SzQm38bu4SoM53AtIPzfhuvLgN/hf
	lOKp4A81LegkmNbH1DoFMwieB/AGfFlPCEnWOFVWc56cJoEkkzMEA5q0wbRqg1w0yq4R
	wj18aNhAObSewmwlzdSrmleJUPkKSpBwho00v7D9GQHPBgL7jSUjNIOV/X9s/wmY8jVs
	tF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=WiY8gvA0vOKYc82QXHlw9tLjxEX4OuC4vu8gdSFxCHQ=;
	b=UGBoVdRU6XSFc9bJqbRA4g1TiHE8Lj57F+dr2IvIgHNmmSQsMDwixqMHMZxMklHlgi
	ZTAsKvBOnyZY0Q2+pnzfqkZPtLsUfZNYFHBhXkniysE0Zyj+ZVh3vcN7MK7jQ8Vh8Yje
	T9rs43Yu9V9zEhdPNd1scw4ftif9WJ+3JseKQNAY4CpI7da0edhWa7gFdLn5pdzmA7Qt
	76S35xouQ/RSYM3ywPuvQj8YW12d0Hz+K1oqL1vFerPqcWof3yJjzuujlN0mAx0sqUG2
	SF62CO7lqRmyJysM0dLN47s3GD6pTQUtnAQuD5XUdbbK7zUj+6liUMJbVLP04i2vxCrH
	gRgA==
X-Gm-Message-State: APjAAAW5MZoxV3Ylr86TphCHnAmyBfjHUeC+/UO58CGsumQ5S0sIJCEh
	8VPlMTVSys0DkOa2bJ+x57WEROiNxM2iRZV+e3c=
X-Google-Smtp-Source: APXvYqxhwQ3yloTf9xIKsGX6/jftCtQsHW7HjO51O5APucB9H3OUyVOJhi/ChOo+8SniJcCbTpa47ylRd0AXLpitRB4=
X-Received: by 2002:a92:d80e:: with SMTP id y14mr20410343ilm.267.1574466003146;
	Fri, 22 Nov 2019 15:40:03 -0800 (PST)
MIME-Version: 1.0
References: <1573778407-13250-1-git-send-email-denis@denix.org>
	<CALbNGRQFFrkNuv8---ck=16VLaN09_9G+=r1Ppb-yAerQYEbEw@mail.gmail.com>
	<6396b0dfd5c33ac1633eecd3a2f6d519d87438df.camel@linuxfoundation.org>
	<20191122231639.GN4735@denix.org>
In-Reply-To: <20191122231639.GN4735@denix.org>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Sat, 23 Nov 2019 00:39:51 +0100
Message-ID: <CALbNGRRGYyJzUx21DT8p+SVLCN0Mj4GvEJ6Uv5ELnyGW9R-cPw@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	Denys Dmytriyenko <denys@ti.com>
Subject: Re: [PATCH v2] distro_features_check: expand with MACHINE_FEATURES and COMBINED_FEATURES, rename
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
X-List-Received-Date: Fri, 22 Nov 2019 23:40:02 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 23, 2019 at 12:16 AM Denys Dmytriyenko <denis@denix.org> wrote:
>
> On Fri, Nov 22, 2019 at 11:10:14PM +0000, Richard Purdie wrote:
> > On Fri, 2019-11-22 at 23:58 +0100, Andreas M=C3=BCller wrote:
> > > Whatever this patch does renaming does nothing but causing me lots of
> > > useles (rebasing) efforts. To me ist is simlpy the worst patch of
> > > this
> > > year and thanks for blocking me with this. I am really really
> > > upset!!!!!!!
> >
> > FWIW you can probably unblock yourself by adding a local copy of the
> > compatibility bbclass with the warning removed. That will then let you
> > fix the fallout at a time of your choosing.
>
> I thought warning would be relatively harmless... Why would it be blockin=
g?
> Do you want this to be a notice instead?
am somewhat special:

* Am sitting on 50+ patches for meta-openembedded and there was a
patch sent adjusting features that causes me lots of nasty rebasing
and go through the patches again.
* (Try to) maintain MANY recipes. Did not run a test yet but I expect
lots of warnings. Problem is that you might miss important so they
should be fixed. But since I expect distro-features to go in the long
term spawning a warning is the right thing to do.

I understand the intention but sometimes we should just keep things
stable or as is.

Time for zzz

Andeas

