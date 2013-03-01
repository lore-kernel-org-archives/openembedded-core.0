Received: from mail-ve0-f173.google.com ([209.85.128.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UBZLJ-0001Nj-BE
	for openembedded-core@lists.openembedded.org;
	Sat, 02 Mar 2013 00:26:26 +0100
Received: by mail-ve0-f173.google.com with SMTP id oz10so3377315veb.18
	for <openembedded-core@lists.openembedded.org>;
	Fri, 01 Mar 2013 15:09:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=aoADDAS12ELAbsQeNu3G7F8/pzgtp44aRNaiA6PD62Y=;
	b=m6dqqc0w+YPU42DgfXYfwlSS1VIihoBn/BSSsBHK3mU/yr3prGr26PCyjTxznTJt7N
	wOvh5jSORQOXeRQ/4KqkBc2HHJEZEAwMWiOYyd7lsENQIZL/304hjAVy2/4+YfXCwqYZ
	3mBbJh5b2iVgv9OtHCw9mV44Eu7J/nzAFgwF8Aw+fDySOO/d+Aaaezva6+zOI/6Pq5Jk
	e2Ew7TW89oVI0mThcc4UJZx3OwLosRbzO9JTc3+mUmchH1fTASafc0jj6tK0ZeCJWowN
	hzdsWaQzt0z/vtNCaVpPHJ9QSUzzQBF8FU8MNntA7dEnQkxOKjsekr6GqsHMLa+ZwlLY
	jtxQ==
X-Received: by 10.58.18.201 with SMTP id y9mr4070947ved.36.1362179397021; Fri,
	01 Mar 2013 15:09:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.219.195 with HTTP; Fri, 1 Mar 2013 15:09:36 -0800 (PST)
In-Reply-To: <CA+chaQewTJogM92pDtzTgQqz6f90U_F_57t8bQ0MfZx-J9h1rQ@mail.gmail.com>
References: <1362140387-5761-1-git-send-email-emilia.maria.silvia.ciobanu@intel.com>
	<1362141704.1055.56.camel@ted> <5130FD69.1020804@linux.intel.com>
	<CA+chaQewTJogM92pDtzTgQqz6f90U_F_57t8bQ0MfZx-J9h1rQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 1 Mar 2013 23:09:36 +0000
Message-ID: <CAJTo0LZBGhSsxcfxjyKLb2L1XNpTMLjgfGDaLxWPrNxkiqSs4A@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQni0WMWe9oaRMzdTvBHv/hbtQh9ZG8UfkXO5zjDHPlgnXLL1j1va71EfG0izcRTUwl+atUk
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] btrfs-tools: added PV to git package recipe
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
X-List-Received-Date: Fri, 01 Mar 2013 23:26:29 -0000
Content-Type: text/plain; charset=UTF-8

On 1 March 2013 19:24, Martin Jansa <martin.jansa@gmail.com> wrote:
> I don't think 0.20~rc1 sorts lower then 0.20 at least in opkg world:

Hmph, stupid opkg. That's just a quick change to the comparison logic
though right? Deb and rpm have these semantics for ~.

Ross


