Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T6Sk8-0001eW-VN
	for openembedded-core@lists.openembedded.org;
	Tue, 28 Aug 2012 22:50:37 +0200
Received: by eekb57 with SMTP id b57so1728072eek.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 28 Aug 2012 13:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=GpQ0Wg09SzP9z/1Ir6yqn7Dcf8gh0V9ViPPmNWpKtSw=;
	b=DtQthX7vUa8n+yMsJR6nNAoo/fXHWN3WUF3E98zd0SSKnDb8d20MRPg/R0qJUMiaJp
	CpPM3QIZb8++o2pFSqtqawNLn4/ztM+NKirvUxJ+bN0qbCusv9e43stuLthBPc3B0WOd
	Q5wuD3iCTpGp8ZNXJ0Ftcp4027UIQq5lR6imHw3EtRlufBbzR1oXdQvq9UgJ7zPCeTOZ
	/hYz7Of5mJ7ZzVZ8sYMs3QOHfhWnE03KmgTgDhOoWrvMoQy8NuwAVgcaUCV0kFw4M8LA
	68RAVfRNfIT8K57krvEMcN/jwAbfBHh2QyCNh719TFGI/+JKUtFfJgfTplVR/JPd6D7B
	BfaA==
Received: by 10.14.202.71 with SMTP id c47mr4399447eeo.42.1346186304117; Tue,
	28 Aug 2012 13:38:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Tue, 28 Aug 2012 13:37:53 -0700 (PDT)
In-Reply-To: <3785680.STh40WuoVt@helios>
References: <cover.1338603853.git.kergoth@gmail.com>
	<acae76c50ae66d8167038782cc623f5de64e1365.1338603853.git.kergoth@gmail.com>
	<3785680.STh40WuoVt@helios>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 28 Aug 2012 13:37:53 -0700
Message-ID: <CAMKF1srm3nnSyuB=rnzKhgzEf7ziv7RNxpDc-v0ojPcQoo36cw@mail.gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
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
X-List-Received-Date: Tue, 28 Aug 2012 20:50:37 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Aug 28, 2012 at 3:54 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
>>      libpcre \
>> -    portmap \
>>      rpcbind \
>>      sysfsutils \
>>      tcp-wrappers \
>
> I came across this while digging back through the history in master. Does this
> mean we ought to be switching to rpcbind in our other tasks which currently
> bring in portmap (e.g. task-base-nfs, task-core-apps-console)?
>

I guess yes because rpcbind is more featureful than portmap. its
better to use rpcbind as default portmapper. Things like ipv6, nfsv4


