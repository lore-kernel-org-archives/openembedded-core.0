Received: from mail-lb0-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SAZgu-0002NC-3K
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Mar 2012 05:32:00 +0100
Received: by lbbgi4 with SMTP id gi4so1362861lbb.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 21 Mar 2012 21:23:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=RZ51mzh/ph551BX1/brwpOVs3oi1upMZsp3G/XIts5c=;
	b=JGU9wVkWB3BmhjIOEzgxN2a+HE85mmWKDjwTY3kWAYBECvfADZVMiLLbT4AFp1Okc6
	SL7y2B9LdRVksZCUX8bpkK7/1J+SaoUG9Ff7rrDyh5ZgPMOFVIa/VONCTf/G3Ia4YiKc
	Rk0zAmwZXKdBj4EmiulClFiXtXpl95aUr/dQ+zrm27XZJKKEWGbL2gDJaVnJgA5Hq8wb
	449l+CpXRTrYNgbNVQSSA4JXINq8vm28t7Nzs2RpI0xuGwfRudOEilISPRcJ8cdKGnWB
	JP8UH4F0ZanDzsUyPXoxBAGVdsa1lK66JK2Hn0Vkpn5nk+9kVSfvn1D7uVlYZNWjx/4Y
	3ApQ==
Received: by 10.152.102.145 with SMTP id fo17mr4699253lab.2.1332390185380;
	Wed, 21 Mar 2012 21:23:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.2.71 with HTTP; Wed, 21 Mar 2012 21:22:35 -0700 (PDT)
In-Reply-To: <20120322012358.GF6857@denix.org>
References: <cover.1330053959.git.raj.khem@gmail.com>
	<bab8960657c873358e301979445c8fa4e81cc15f.1330053959.git.raj.khem@gmail.com>
	<1330100504.5477.6.camel@ted>
	<CAMKF1srNpxainQ2ZyZ=wKZmmuLdp_fEjyTr1JKMRGVO4X8QV2w@mail.gmail.com>
	<4F5531C5.30007@linux.intel.com> <20120322012358.GF6857@denix.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 21 Mar 2012 21:22:35 -0700
Message-ID: <CAMKF1soKyp62Q7K7xiAY-6YDdP+qezAC281-6qS3XYYf8emY+w@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] default-distrovars: Add empty weak definition for DISTRO variable
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 22 Mar 2012 04:32:00 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Mar 21, 2012 at 6:23 PM, Denys Dmytriyenko <denis@denix.org> wrote:
>
> -DISTROOVERRIDES ?= "${DISTRO}"
> +DISTROOVERRIDES ?= "${@d.getVar('DISTRO', True) or ''}"

whats wrong with patch I proposed ?


