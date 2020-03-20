Return-Path: <SRS0=qdqA=5F=stusta.de=bunk@stusta.mhn.de>
Received: from mail.stusta.mhn.de (mail.stusta.mhn.de [141.84.69.5])
	by mail.openembedded.org (Postfix) with ESMTP id D07AD6064E
	for <openembedded-core@lists.openembedded.org>;
	Fri, 20 Mar 2020 11:28:10 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1])
	by mail.stusta.mhn.de (Postfix) with ESMTPSA id 48kM2x3y4Kz40;
	Fri, 20 Mar 2020 12:28:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stusta.de;
	s=default; t=1584703689;
	bh=8MPSLh5ERIY3zBtsP/+Dz5ePXYA5uENIeaErFufrbk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MWnlS7rmiM0bqFqdSJ2UF4xYBDazmRY3S5w1LnRYfG7LvfTTzj24mMuQzHn8CvkQG
	iEsIXXmmCARMLGHJeCdlQVF0HIJ7sczoOpob563TwGl9l62bKv3mS1sqNoEGBOMmul
	NnwGoApedo2ft/x2T6ivpGAi2K3MT1ZlXQDDUw2ZmID0sZDxuKQCUIXq6WRK/OWro5
	WIABFlOz5y1wjpI3UVYodhjc6I1P2oN4A5cO2+C+4Jyxhg7wRtSJPJh4ZqhmakU/Uq
	OrropYhNAIqVLZDq4OYd1DvhcO7YtbA1V8gKC5EGe+uO/Qg1xWGaAaOILZbJlZMOdL
	b8K47KZ/mS+GMMXe+LEihKu+BT/ATMP98CtHSh4Pl1jUGB0hW9XrxFPemkv68Wczvt
	m57YW6tN0I4yLIOT2ZOU22wtB9eVP5a/4pAFQlksJlkCKzr+N346+M9D9zE4nZFXwO
	jbrXwVepeaeb7gR+NStT/iKp6nnrfk63lNuZZhzmhzn8qJi/KS1P9WxfTN08BzYnFW
	3z46ECMloohpf2yeZWj0frQiiat/371SbUzRd/U3fuZgRVMOIOtZAJtjfSokvXqEMF
	zjOtLYW4vT037EaG0rYpMz+mpH8KwoBdl29a8Pwn3iDEQSHYui1u8S+3OcUgE1+/hp
	9Niw2IprGvAI3SqOZqMYpeaU=
Date: Fri, 20 Mar 2020 13:28:07 +0200
From: Adrian Bunk <bunk@stusta.de>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-ID: <20200320112807.GB31090@localhost>
References: <alpine.LFD.2.21.2003200649320.8492@localhost.localdomain>
MIME-Version: 1.0
In-Reply-To: <alpine.LFD.2.21.2003200649320.8492@localhost.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: recipe design curiosity: how to best install a package configuration file?
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
X-List-Received-Date: Fri, 20 Mar 2020 11:28:11 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Fri, Mar 20, 2020 at 07:04:05AM -0400, Robert P. J. Day wrote:
>...
>   in this current situation, it turns out that that sample conf file
> just happens to be appropriate,
>...

I'd guess you are wrong on that.

  IPv4_interface 192.168.100.100
  Interface eth2


> rday

cu
Adrian

