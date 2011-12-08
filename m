Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1RYYO4-0005Zw-Mn
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 08:27:24 +0100
Received: by lahd3 with SMTP id d3so563212lah.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 07 Dec 2011 23:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=usn2Z9i6+1kjg6N8Wo32nm/fsqnbsZGxoprHBcHaOnk=;
	b=Vtn9Ygva3tFvAJGuEWR/P4taMNgvPMmXBpbxB0lh8CH/rTiVEdiOfgk3DGdbK9uiZT
	SOOJUnod8p5ZDpOGF+EmLWLYVbZiPfdZRoptaM0v4Ih7Bk0mqEshMTDPbBxbPLodLfC7
	osO4244hq1KBSDPPXK4w/UD9/EPHrhuY02vx8=
Received: by 10.152.105.67 with SMTP id gk3mr1058913lab.48.1323328835323; Wed,
	07 Dec 2011 23:20:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.24.36 with HTTP; Wed, 7 Dec 2011 23:20:04 -0800 (PST)
In-Reply-To: <5ca5c0566bdfb8c66df8db831e116b35b7fbb3d8.1323323130.git.nitin.a.kamble@intel.com>
References: <cover.1323323130.git.nitin.a.kamble@intel.com>
	<664f652792df901dbc42d813b299093fa719a66a.1323323130.git.nitin.a.kamble@intel.com>
	<5ca5c0566bdfb8c66df8db831e116b35b7fbb3d8.1323323130.git.nitin.a.kamble@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Dec 2011 23:20:04 -0800
Message-ID: <CAMKF1sp=VgL+FoxWk47qPyLVXgYF5oSsv5BrSkeFGgyA3j0Lcg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Cc: hjl.tools@gmail.com
Subject: Re: [PATCH 02/11] mdadm: Make custom CC definition conditional
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
X-List-Received-Date: Thu, 08 Dec 2011 07:27:24 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Dec 7, 2011 at 9:48 PM,  <nitin.a.kamble@intel.com> wrote:
> +
> ++ifndef CC
> + CC = $(CROSS_COMPILE)gcc
> ++endif
> ++

may be you could do

CC ?= $(CROSS_COMPILE)gcc
here instead


