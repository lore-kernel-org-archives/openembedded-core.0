Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <kergoth@gmail.com>) id 1T6mFh-00037n-4G
	for openembedded-core@lists.openembedded.org;
	Wed, 29 Aug 2012 19:40:29 +0200
Received: by lagv3 with SMTP id v3so810820lag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 29 Aug 2012 10:28:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YIUUs0tL+ku0p9Duto06KVo6LfIGzGBVE8FosBDr7Zw=;
	b=DfwGgbV+AxtBXcx0oyPepWvTOlN4m6RDpzFauxRoaVtCiL5KwhEtPfNV7jjsr6F8M9
	uOhiC0uhHzLnUv7gbXtHhSQkG4a1zrRUx6La776fuvF3IiUFjqUdSc9surEMdbo++gcB
	M8RSEw4NIXByaDIwW0EBYqb7M5HEieJhHx1TcILaVUtbNsrfwYQg7nTD+ZZuVydW5ijt
	w17M0UrtntmjT+L175yPyoSg0e6GQAzCYY6OnY85/IgNSHN7znJ7jtKdctVFBGPotq++
	k49yGMarsaOufSNNGzt8/CNfXL2C6dkJZDowYVU6W1Sco289NtVm7lViGnrUluCSxYSm
	zEdw==
Received: by 10.112.101.6 with SMTP id fc6mr515298lbb.110.1346261294728; Wed,
	29 Aug 2012 10:28:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.114.19.2 with HTTP; Wed, 29 Aug 2012 10:27:54 -0700 (PDT)
In-Reply-To: <CAMKF1srm3nnSyuB=rnzKhgzEf7ziv7RNxpDc-v0ojPcQoo36cw@mail.gmail.com>
References: <cover.1338603853.git.kergoth@gmail.com>
	<acae76c50ae66d8167038782cc623f5de64e1365.1338603853.git.kergoth@gmail.com>
	<3785680.STh40WuoVt@helios>
	<CAMKF1srm3nnSyuB=rnzKhgzEf7ziv7RNxpDc-v0ojPcQoo36cw@mail.gmail.com>
From: Chris Larson <kergoth@gmail.com>
Date: Wed, 29 Aug 2012 10:27:54 -0700
Message-ID: <CABcZANkyJKvbmMG_Z2pJ=kMWT2vRt15Oka8uH03+3o30oE-uTw@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 2/2] task-core-basic: drop portmap
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
X-List-Received-Date: Wed, 29 Aug 2012 17:40:29 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 28, 2012 at 1:37 PM, Khem Raj <raj.khem@gmail.com> wrote:
> On Tue, Aug 28, 2012 at 3:54 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>>>      libpcre \
>>> -    portmap \
>>>      rpcbind \
>>>      sysfsutils \
>>>      tcp-wrappers \
>>
>> I came across this while digging back through the history in master. Does this
>> mean we ought to be switching to rpcbind in our other tasks which currently
>> bring in portmap (e.g. task-base-nfs, task-core-apps-console)?
>>
>
> I guess yes because rpcbind is more featureful than portmap. its
> better to use rpcbind as default portmapper. Things like ipv6, nfsv4

Yeah, I think that would be best. It is worth noting that task-base
and portmap are in recipes-core, while rpcbind is, iirc, in
recipes-support, so such a change would probably be best done when
also swapping the locations of the two recipes.
-- 
Christopher Larson


