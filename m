Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TZOhb-0002fe-Kr
	for openembedded-core@lists.openembedded.org;
	Fri, 16 Nov 2012 17:23:35 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 16 Nov 2012 08:09:35 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so13005641oag.0
	for <openembedded-core@lists.openembedded.org>;
	Fri, 16 Nov 2012 08:09:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=FLMHJZ7zLO8xViuoqGhSo0PFmfUjQr986tAd7/Qi9RE=;
	b=bAkGBQwpC5zbPIq9ohM1JhpR8RwfdzXM0oPZkTsK3Lz6OJQt6dEIt3eSFs2bi5gG94
	Fj8KYEox1BSi85oj2wE8OPCVvW8dbPMGA6DvcmHgNWRcAqpq5l7LArMcYBbQhA9VDSWk
	rdsDxQuaYnJntCfDhN8Pu3IS5wSSdymomQR1QYOAEM5q/ozZ1Axfr42JTtz4lJHw6dwz
	6kkg7O9pLZKyE6X2QBtTueT8U4sOuImWYVz77IdH4Qw8fRd7cSuseDSqDRJO3W0Wi+5p
	o9bXFBIaZOmCS7D4tz6ttnKzgpTZClnruVlcMSYpBt7lG0496RBjYITPh8e0Vf/iuiSO
	S5jQ==
Received: by 10.60.171.11 with SMTP id aq11mr4167821oec.104.1353082174880;
	Fri, 16 Nov 2012 08:09:34 -0800 (PST)
Received: by 10.60.171.11 with SMTP id aq11mr4167814oec.104.1353082174774;
	Fri, 16 Nov 2012 08:09:34 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.148.201 with HTTP; Fri, 16 Nov 2012 08:09:14 -0800 (PST)
In-Reply-To: <CAP9ODKrfu8CMJ+ZWqkwQUCP+56WU_4sLf0Js9j_fYYGfDr7a0w@mail.gmail.com>
References: <1353079960.3709.93.camel@ted>
	<CAP9ODKrfu8CMJ+ZWqkwQUCP+56WU_4sLf0Js9j_fYYGfDr7a0w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 16 Nov 2012 16:09:14 +0000
Message-ID: <CAJTo0LY8kKnOVuPj5AKYDy1gtFph5QBNd0tiRv416Dog7i=vLQ@mail.gmail.com>
To: Otavio Salvador <otavio@ossystems.com.br>
X-Gm-Message-State: ALoCoQliUmk8kogSZ0xJvthCqJKTDXoCpGnZU6bVmEwsLv077KAGy+DV/A+us8EI/bnTXTJAQ6y3OHbusDdSpZ23UYqqsQM40wRKwiTki9tsSC4uUyjvpchnbvoMCwxscl66i8knm2HMX/KhboGugGUpYY77xqzudpRjruMTnNQH49aUIfQwUL0erpVd4dFXlthYQ/A4OyHD
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] sstate: Implement a setscene dependency validation routine to allow skipping of some sstate installation
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
X-List-Received-Date: Fri, 16 Nov 2012 16:23:35 -0000
Content-Type: text/plain; charset=UTF-8

On 16 November 2012 15:58, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> Its a start at the logic and errs on the
>
> s/errs/errors/

http://www.thefreedictionary.com/errs+on+the+side

Ross


