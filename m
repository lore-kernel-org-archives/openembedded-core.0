Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1T7UaJ-0005g7-Tr
	for openembedded-core@lists.openembedded.org;
	Fri, 31 Aug 2012 19:00:44 +0200
Received: by eekb57 with SMTP id b57so1089913eek.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 31 Aug 2012 09:48:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=vWtsOo32dpkzYwaCcJhXRaJnC85CE/Pjp0utAweA5x4=;
	b=qYkRzTIXh3VSRnG4H2wVsvcXdh4w9622WUu956vR2pSyyeyRDP1cd4FKB/waz86G/u
	eYDiGXaV4qIIHmSTy7nCwAgf64PRmdOW2fHk9vGv/ZvVciopNMksr+6O/q69znVuP+eu
	Ld0Q9DMOzPU2enoj38QHDfnGaRwjO8g2C8rD9mER5m4ZWAt15NYgmyCYI5zFJcmg3C9M
	Lg2JE6EXwZKJ3oZr+0FRY8jMR1iznXAmoKaB1KeDUAuxuT4MGCG0uVpErqwr3RnMPx1M
	F75FsMoEUjH3eLtgZfwjzr6CuIjlqXR06KX7nlzy1YDn4wP8nowcPOWtsLm5jexT8RbU
	SKjg==
Received: by 10.14.204.72 with SMTP id g48mr12060516eeo.45.1346431707413; Fri,
	31 Aug 2012 09:48:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.5 with HTTP; Fri, 31 Aug 2012 09:47:57 -0700 (PDT)
In-Reply-To: <5040E6EA.4010806@linux.intel.com>
References: <1346356090-13811-1-git-send-email-sgw@linux.intel.com>
	<CAMKF1sr=pHa21ihb5y6m9tkLYV4zG2__hWkBBZML=S9eRZhZfw@mail.gmail.com>
	<5040E6EA.4010806@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 31 Aug 2012 09:47:57 -0700
Message-ID: <CAMKF1sof_ULGZS62-OB=ZSedsUthdZJxfzC292azp80YQMbmGw@mail.gmail.com>
To: Saul Wold <sgw@linux.intel.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] poky-tiny: Enable x86-64 to build eglibc correctly
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
X-List-Received-Date: Fri, 31 Aug 2012 17:00:44 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Aug 31, 2012 at 9:31 AM, Saul Wold <sgw@linux.intel.com> wrote:
>
> Should I file an eglibc bug?

yes


