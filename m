Received: from mail-vb0-f41.google.com ([209.85.212.41])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UKXmR-0000TP-Rm
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Mar 2013 18:35:29 +0100
Received: by mail-vb0-f41.google.com with SMTP id l22so4717235vbn.28
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Mar 2013 10:18:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=U6DAgk3CvUDKDxl0O8zYi0flVoGBUkaUpYNSzgt+xqg=;
	b=X8PzyZE1cu5ZuXDoN40R86JidiIkQFGwL3YH8TrR9dcI/VNfNfLKuDJsovo8rPSZsO
	7h0sKvSC4ENSyRnXus+fxUyoBup/RByN9NUqO31jbnU8KWJT1Hln9pXKAxkG5VOV029y
	QrsDuObBG/143E6d+j7qvhjlV3Kcdjs1McoecTehOtIoHZeD37IPYS/aUVkDS6epD5Hr
	zR1k1GMkKD11zu7rEm2GO0CLArl7fKEjdWyW/qUvHZ2A3x/TSwjPVoEWe2TtF/1i0vNo
	3bAD2Ij3BaoNvNBxl8m5ifSJVBzDE0kL7j/5rZdtNj0YeRHLmUkAAg0rfRCksDE4c375
	+rbg==
X-Received: by 10.58.214.231 with SMTP id od7mr20120768vec.44.1364318307400;
	Tue, 26 Mar 2013 10:18:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.58.134.74 with HTTP; Tue, 26 Mar 2013 10:18:06 -0700 (PDT)
In-Reply-To: <E7E52452-31CB-497E-B1BE-35D9961884B4@gmail.com>
References: <1363816759-24737-1-git-send-email-obi@opendreambox.org>
	<CAJTo0LbXkrf=8ii=OfStD03jQXM_Rxy4baoshQ_VXttgydFgcA@mail.gmail.com>
	<E7E52452-31CB-497E-B1BE-35D9961884B4@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 26 Mar 2013 17:18:06 +0000
Message-ID: <CAJTo0Laf0Zj+j___3MrwOqdWHMWapwBJb1TGXKSYT1=z59w9yA@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Gm-Message-State: ALoCoQnbW5PeZd3xX8UB0V1V+jF16ZcfrgFuBCbJUtXly9RU+EMrpDa64/xyAOBHkimPq2ODj3dw
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] busybox: fix FILES_${PN}-syslog assignment
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
X-List-Received-Date: Tue, 26 Mar 2013 17:35:30 -0000
Content-Type: text/plain; charset=UTF-8

Hi Khem,

On 21 March 2013 18:20, Khem Raj <raj.khem@gmail.com> wrote:
> Ross, I have 198 update pactch in branch here
>
> http://git.openembedded.org/openembedded-core-contrib/commit/?h=kraj/systemd-198&id=51d4993c7375a7339a3ee91cf6b24da25b2d9b50
>
> this one is good. Other two I need to address comments
> can you pick this one too into your branch ?
> so I can ride with you

I hope you don't think that I've been ignoring this - I wanted a
stable base to finish the integration branch and a new upstream
version wasn't the stability I was after.  I'll look at merging this
work tomorrow.

Ross


