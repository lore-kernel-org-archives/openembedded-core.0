Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SkTKm-0003CF-W8
	for openembedded-core@lists.openembedded.org;
	Fri, 29 Jun 2012 07:01:33 +0200
Received: by eaal1 with SMTP id l1so1117631eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 28 Jun 2012 21:50:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=XjvakhFwc/1qb2QGZu659Sqf7HsYEN4+AsUjKvvKsqc=;
	b=v9pcRQbIsb5dxuDIijHAeyBxbdwhH4Q6D3Rxpl6Jgw8avD4W+oL4KaYiTgzzdbN01A
	wjxMxSvcLC6s9yRAdHazxc0y62WGodfLK4gHBFkhrgAcoKCzME8gLdpI/s+bJH6DWGbk
	kCsCFslPanDjlx3Y7AQ/aCD6WdXqCVKvDLfLtqILYJVhXGy3/N/fN9i8WlOkDEwedt24
	vk4/AbuJaIvIOYhgpC9lmn7lIfN8mx7rReSCIFE7Ws1kpt/GjyOST8O2bTyk718diS50
	jnuDPu+JjQ0Dh+23kza9/AeMg4GpwKls7D1qe79W9Vuk13Uh8+zN3764dqCO65u13NJb
	hnaQ==
Received: by 10.14.185.137 with SMTP id u9mr57120eem.220.1340945437550; Thu,
	28 Jun 2012 21:50:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Thu, 28 Jun 2012 21:50:07 -0700 (PDT)
In-Reply-To: <e5738406d99b07701d77d873a5a6c9ea95b4adb2.1340942930.git.dvhart@linux.intel.com>
References: <cover.1340942930.git.dvhart@linux.intel.com>
	<4263ffefaa6f3b0069bc41c0f7578d36717edcfc.1340942930.git.dvhart@linux.intel.com>
	<e5738406d99b07701d77d873a5a6c9ea95b4adb2.1340942930.git.dvhart@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 28 Jun 2012 21:50:07 -0700
Message-ID: <CAMKF1sqpt2uONWcXBM2mH8otYE2XXoGSGW1uDwi-3VCLcV033Q@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
Cc: Poky <poky@yoctoproject.org>, openembedded-core@lists.openembedded.org
Subject: Re: [poky] [PATCH 2/4] linux-yocto: Use INC_PR and move kernel require to linux-yocto.inc
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
X-List-Received-Date: Fri, 29 Jun 2012 05:01:33 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Jun 28, 2012 at 9:18 PM, Darren Hart <dvhart@linux.intel.com> wrote:
> +INC_PR = "r0"
> +

it is diverting a recipe which once had PR = "r2"
back to "r0" this should instead be

INC_PR = "r3" here which is largest pr value + 1


