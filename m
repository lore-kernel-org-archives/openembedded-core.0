Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <koen@dominion.thruhere.net>) id 1S7Mvj-0001ZJ-9C
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Mar 2012 09:18:03 +0100
Received: by wibhj13 with SMTP id hj13so297398wib.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 13 Mar 2012 01:09:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=content-type:mime-version:subject:from:in-reply-to:date
	:content-transfer-encoding:message-id:references:to:x-mailer
	:x-gm-message-state;
	bh=1ouRWKbR0zLpnGCUN8hw0P3zhK0Hn3Eu7giwXLrqIZE=;
	b=SUXY1xOAYDYzbcZGN8ZfdJ+Qn6UKhAzstV+auEyQ9DrR/lt0foLYzJKmNnZsQ3IuB7
	vzsupl+1lDpxrFUBlCvVZZipSj6/u9DQKzNApPC6RGwWK2ufLH+AVMRUnRHKxrUXl+qR
	MHjrkEpVtAEbvmO1TuXEPdAkIdVrx3o6dqNwNWOKlAwtF3UOkU3Gbg/2jPlf988eXTr8
	v1ZBhfEUwaNQg4izhIRLarLPbu5qvQALuryowmnqlNAYgAXBdj9PX4w7TIUJsLtr1j8e
	zhbDj6l1mgOmcSwMGqZgiJuRxVPFSLHhxSVhrQiCD4/q+6U/c+ABwhCdkeKQoUP0PpVH
	bBMA==
Received: by 10.216.132.98 with SMTP id n76mr8876791wei.101.1331626159502;
	Tue, 13 Mar 2012 01:09:19 -0700 (PDT)
Received: from [10.68.37.11] ([87.111.147.121])
	by mx.google.com with ESMTPS id t20sm70160646wiv.0.2012.03.13.01.09.17
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 13 Mar 2012 01:09:18 -0700 (PDT)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <cover.1331604310.git.scott.a.garman@intel.com>
Date: Tue, 13 Mar 2012 09:09:22 +0100
Message-Id: <12986775-86F6-43E8-B0B5-20915F618CAD@dominion.thruhere.net>
References: <cover.1331604310.git.scott.a.garman@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkQG4fCWrDKZL0UPDLwAkJV7J00gWnCKq9O2X+lEbUYpxc36zMomZAHV1+2RY05tEsGdSSC
Subject: Re: [PATCH 0/3] ncurses library location fix
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
X-List-Received-Date: Tue, 13 Mar 2012 08:18:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit


Op 13 mrt. 2012, om 03:08 heeft Scott Garman het volgende geschreven:

> Hello,
> 
> This pull request improves the way ncurses libraries are installed,
> moving only libncurses, libncursesw, and libtinfo soname libs into
> base_libdir, and leaving everything else in libdir. This is how
> ncurses is packaged on my Ubuntu host, and doing things this way
> fixes bug #2070 so ncurses will work within python again.

Shouldn't there a PR bump for python as well in this series?

regards,

Koen


