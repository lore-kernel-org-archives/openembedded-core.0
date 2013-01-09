Received: from mail-ie0-f173.google.com ([209.85.223.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1TszSB-00027L-Ql
	for openembedded-core@lists.openembedded.org;
	Wed, 09 Jan 2013 18:28:40 +0100
Received: by mail-ie0-f173.google.com with SMTP id e13so2384214iej.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 09 Jan 2013 09:13:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=qujdRWFWHm9vqqnE/g12yPzOiXGkt0F3eXq34i7Wg2A=;
	b=v90TItTL3OQJtAft1uUFExGU5i1Uw84wnwJ2L2X0JyHMD4oGmROR3bmW3siwzF6NgG
	pJH11qQ/nZ42q9S+RIS/vKjp64xzTzOAr6lA5wEjsbjoP4UO9AGVDQvtWbPMni3IPQOF
	dx36MXOqZETq8KLwArm/cQ6pd0MynWU8D3S+j1SvFgk1bRXF8o2wUVhO5r/36/J34ecK
	a9dNnw4FngN5xXIltCm1IVhelUqbTTnlqzgqWimz+zpQE3nZ9nWROrPTHioWFVZWYZU+
	Rn9PzLi+vOxhStbxsTOAQveyZSFK4Tpf1pEjiGNdWBhK2J2IuHqk32mgnHOlSqbXcAIo
	FQ6w==
Received: by 10.43.92.72 with SMTP id bp8mr52266978icc.49.1357751607118; Wed,
	09 Jan 2013 09:13:27 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.19.8 with HTTP; Wed, 9 Jan 2013 09:12:56 -0800 (PST)
In-Reply-To: <50EC34AF.5010303@intel.com>
References: <cover.1357647338.git.radu.moisan@intel.com>
	<lyvcb7n87x.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<50EC34AF.5010303@intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 9 Jan 2013 09:12:56 -0800
Message-ID: <CAMKF1sq_RowYH0g_8KQzA8CurgnTqknnx0m239ROQ4KMwg5_Cw@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/21][RFC v3] systemd Integration
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
X-List-Received-Date: Wed, 09 Jan 2013 17:28:41 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Jan 8, 2013 at 7:01 AM, Radu Moisan <radu.moisan@intel.com> wrote:
> Was this removal done on purpose?
>
>
> I had to port the patch manually so I guess it got lost then. Do we want to
> have Sign-off-by from author as well?
>

absolutely thats the purpose of SOB to track to certificate of origin
you should have git am'ed the patches and then fixed them to resolve
and added your SOB after the orignal SOB


