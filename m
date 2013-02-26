Received: from mail-vb0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UAImC-0004Fg-BX
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 12:33:13 +0100
Received: by mail-vb0-f41.google.com with SMTP id l22so21036vbn.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 03:16:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=zphlrsZDLPf4wch7LJSVhJKqSsarrJWhS/P5xNkzLvQ=;
	b=hI70Y/2HqXlB7DO8lZakAB9dkVr4/Yj0JBpj6clRGNVe1rrPX3zTEAd5k5BQ2aVycP
	Q4O1RUg9vS/JeF/9IrsmMbbLzWYKVyGFD3PthgMdF76gOeKQVGmzD+JZqhPyZ8DEh6nr
	P5mfFOalag2NytwBnJvA3/3i4RgcI13mEQgUfL2PrankCsepeSoHjWN8RRJ+x5g7ScCo
	ELBujUYTN0pEUwNinnZJG6znCbgNNLZB8r7P7YiAMb+2YEB+OBgXrCDVTrCl8XG4FunI
	pfla4qUt0eUnS21hNVowrqnWVL1wj+kLSmGFKqxuk+jUZBCYuAKR799OdCadsKB/xeAc
	YjeQ==
X-Received: by 10.220.149.81 with SMTP id s17mr11397105vcv.31.1361877392946;
	Tue, 26 Feb 2013 03:16:32 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.77.105 with HTTP; Tue, 26 Feb 2013 03:16:12 -0800 (PST)
In-Reply-To: <512C981C.3090001@communistcode.co.uk>
References: <1361782141-18273-1-git-send-email-cristian.iorga@intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB16205C3C@IRSMSX102.ger.corp.intel.com>
	<512BF975.90206@linux.intel.com> <512C7F88.8030907@communistcode.co.uk>
	<969F26A8BAB325438E7EB80D3C3134FB162063D2@IRSMSX102.ger.corp.intel.com>
	<512C981C.3090001@communistcode.co.uk>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Feb 2013 11:16:12 +0000
Message-ID: <CAJTo0LZ3c-nS109EJvSJbJvYkTPK-gr2OS_jGweNd36tEybQjg@mail.gmail.com>
To: Cristian Iorga <cristian.iorga@intel.com>
X-Gm-Message-State: ALoCoQmxC6DSt2NsUfBgWAKivDMzwFG05kozK/O443Bw1U/9sxNi6/SaiJmsuzDtPx4NtzS0oIwN
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH V2] connman: enable connman client
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
X-List-Received-Date: Tue, 26 Feb 2013 11:33:26 -0000
Content-Type: text/plain; charset=UTF-8

On 26 February 2013 11:10, Jack Mitchell <ml@communistcode.co.uk> wrote:
> I think it is best to be defined as a separate package connman-client within
> the current connman recipe. My reasoning for this is that connman is widely
> used as an embedded network manager and its main interface is dbus rather
> than the 'helper' program connmanctl.

Cristian - in another commit can you also add connman-client to the
tools-testapps image feature?

Ross


