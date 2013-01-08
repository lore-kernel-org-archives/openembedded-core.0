Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TsarD-0001pY-7g
	for openembedded-core@lists.openembedded.org;
	Tue, 08 Jan 2013 16:12:52 +0100
Received: from mail-yh0-f72.google.com ([209.85.213.72])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 08 Jan 2013 06:57:39 -0800
Received: by mail-yh0-f72.google.com with SMTP id q46so1036276yhf.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 08 Jan 2013 06:57:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=8Uqxv8t94d0NWCOD3hUs4SYq5oRNtPYlQmPNwJOx5ZQ=;
	b=eVYgMqSAri8a11cykwg1NNdcX3gGtlbGQaZfh9L9enrTJ1f5qeQ4gQAt/tK0X1WgrO
	9+xeQaIWEYA6o+07VTvxFRdm6Bq0U9ArSaqdzEgYHPUo/w/XYDJ3Cvk8O+Gxqw+pSF1S
	qCiIkLK6PK6AimaOs7RUrSuS6vnaHhymsqYWrMXGsRT344T9S0iAKa0LujIMNBlO6K+C
	r6HkaP3maNK2GZwss4Ij9mvpQUoyUaUw+cwEvTwOGRftvV6yj69ZVaoNNz36l57DCCRC
	oB0Qldt3aAbMNesfsGO1Vx3QFVmLoHE3bzZvPQHlpkEn3p26m6mJdGYdwAgs9zgD94ai
	Xr5Q==
X-Received: by 10.52.72.232 with SMTP id g8mr75630678vdv.69.1357657058143;
	Tue, 08 Jan 2013 06:57:38 -0800 (PST)
Received: by 10.52.72.232 with SMTP id g8mr75630673vdv.69.1357657058073; Tue,
	08 Jan 2013 06:57:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Tue, 8 Jan 2013 06:57:17 -0800 (PST)
In-Reply-To: <50EC34AF.5010303@intel.com>
References: <cover.1357647338.git.radu.moisan@intel.com>
	<lyvcb7n87x.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<50EC34AF.5010303@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 8 Jan 2013 14:57:17 +0000
Message-ID: <CAJTo0LbEV2STP5gYz77rRT5dOXMJ+yMYivzuyHkD7YkpeXH6Hg@mail.gmail.com>
To: Radu Moisan <radu.moisan@intel.com>
X-Gm-Message-State: ALoCoQlZYNa+cZqNjRNOulImqboY26wlT6kEfFcxpy8jFJFA4y4T4S9wpiDhU0f6RmS5qIzAQ6j/ODzwRsaVAtLj60VrZIOhYCTMAVGriXhX3OGQLQNWSLV8iDiNBNMz7a0YLeZ6d4dJYkYRBwwA9Uubip45Fkp2BoaoI8yJP89oZMbX3Y/te62cBq5dGWDzUSBkVJIP8D5V
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
X-List-Received-Date: Tue, 08 Jan 2013 15:12:58 -0000
Content-Type: text/plain; charset=UTF-8

On 8 January 2013 15:01, Radu Moisan <radu.moisan@intel.com> wrote:
> I am pretty sure that I added a 'Signed-off-by:' field to my patch but
> it is missing in the commit.  Other patches don't have the signed-off-by
> of the original author neither.
>
> Was this removal done on purpose?
>
>
> I had to port the patch manually so I guess it got lost then. Do we want to
> have Sign-off-by from author as well?

By the time the patches land in oe-core there'll have been a lot of
rebasing and merging as I don't intend to see a series that contains
fixes in oe-core.  We should ensure that everyone who contributed to
meta-oe gets a credit in the series.

Ross


