Return-Path: <sgw@linux.intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by mail.openembedded.org (Postfix) with ESMTP id 20DFC66078
	for <openembedded-core@lists.openembedded.org>;
	Mon, 23 Jun 2014 01:24:59 +0000 (UTC)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 22 Jun 2014 18:25:00 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.01,526,1400050800"; d="scan'208";a="561626591"
Received: from unknown (HELO [10.255.12.166]) ([10.255.12.166])
	by orsmga002.jf.intel.com with ESMTP; 22 Jun 2014 18:24:58 -0700
Message-ID: <53A781EA.3050805@linux.intel.com>
Date: Sun, 22 Jun 2014 18:24:58 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Jate S <jatedev@gmail.com>, openembedded-core@lists.openembedded.org
References: <CAPphmgZKCc=XCDgC8fHGaLqYLFOwrpocfRzz7BDZUhRkr5NkYQ@mail.gmail.com>
In-Reply-To: <CAPphmgZKCc=XCDgC8fHGaLqYLFOwrpocfRzz7BDZUhRkr5NkYQ@mail.gmail.com>
Subject: Re: resolvconf bugs
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
X-List-Received-Date: Mon, 23 Jun 2014 01:25:01 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 06/20/2014 12:29 PM, Jate S wrote:
> I have been using the resolvconf recipe, and I have discovered a few
> things which keep it from working.
>
> The resolvconf script uses /lib/resolvconf/list-records, but the
> recipe does not install it. This causes an error when
> /etc/resolvconf/update.d/libc runs. This can be resolved by adding the
> list-records script.
>
Please submit a patch adding the list-records to the FILES section.

> I am using system V init. The initscripts recipe generates the
> symbolic link to /etc/resolv.conf, but resolvconf checks this and
> generates a warning. I have fixed this by adding the correct symbolic
> link to this package. This overrides the link created by initscripts
> Is this compatible with resolv.conf generated in a systemd based
> system?
>
You may need to use UPDATE_ALTERNATIVES to get the correct behavior.

Sau!


>
> - Jate S.
>

