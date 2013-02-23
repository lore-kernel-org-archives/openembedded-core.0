Received: from mail-ve0-f173.google.com ([209.85.128.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U9CQf-0006sO-C6
	for openembedded-core@lists.openembedded.org;
	Sat, 23 Feb 2013 11:34:28 +0100
Received: by mail-ve0-f173.google.com with SMTP id oz10so1243244veb.18
	for <openembedded-core@lists.openembedded.org>;
	Sat, 23 Feb 2013 02:17:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=QZ3f6IN/SHhf43qoV12Ealsz8COB7h0Ki8H4CaQAKQs=;
	b=Q0d4miXXu0Cy2WHXh29Bu7LpFDaeW8bX7H+nqjeP5xS7uwB1r3zFXNeWqobXR26ADC
	+Zd9ppvA1Tf/bdSGx440dUWgVDo3C9xmMFh2i9/ah+QoxpCwdUhN6+3yZnkhgDyGErjy
	xkqYeey5ejZpOfnD17qJSX16JyCaFtBY8CDcmmr4pcCV0bM5xGgpVnyUJ1hLZoLDTZKb
	D++UJfdMuh6I+Cwz6LSiyi4RsQO+Wa1SHt6rsWEDkAA0eeWDDbgLMGGRZf7O6ahZleZO
	f+kCssSDOItKS+VMaDNa3inVOO0ZbXdhO8RdxZR3F1ybyLPRYVkhoh/ELMCk94SSIq1+
	/dlw==
X-Received: by 10.52.24.98 with SMTP id t2mr5858884vdf.69.1361614670231; Sat,
	23 Feb 2013 02:17:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Sat, 23 Feb 2013 02:17:30 -0800 (PST)
In-Reply-To: <51288CD7.2070800@topic.nl>
References: <cover.1361464203.git.sgw@linux.intel.com>
	<CAJTo0LbDEX1evEJHX9_dfB2+wEK_wYTB6kJd1iwxbXivmwtY0w@mail.gmail.com>
	<51271A2A.6070604@topic.nl>
	<CAJTo0LaWCAtjiQWq5=FUWq68ty+O2fPYJ8DLLPT-35zqwWn6eg@mail.gmail.com>
	<51288CD7.2070800@topic.nl>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Sat, 23 Feb 2013 10:17:30 +0000
Message-ID: <CAJTo0Laa8syrJ83ZEKmcokPsUwX+5L1Mna8OgfSQ==VsdybdLQ@mail.gmail.com>
To: Mike Looijmans <mike.looijmans@topic.nl>
X-Gm-Message-State: ALoCoQmbxJ3SG/K8dEgvJ7E2M3h9qNwcgwtNZ8EE+WSutt1NYI92KAaJmd14bMkjRpvxm3Xb0xnD
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/41] Selected Updates and fixes
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 23 Feb 2013 10:34:50 -0000
Content-Type: text/plain; charset=UTF-8

On 23 February 2013 09:33, Mike Looijmans <mike.looijmans@topic.nl> wrote:
> This is what opkg reports on my running systems, with the libmount patch
> applied, looks fine to me, a few require libmount1, and none require
> util-linux itself. For example:

Good, just local weirdness for me then.

Ross


