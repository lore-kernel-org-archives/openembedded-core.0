Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SwaUN-0002Pp-GW
	for openembedded-core@lists.openembedded.org;
	Wed, 01 Aug 2012 17:05:31 +0200
Received: from mail-qa0-f45.google.com ([209.85.216.45])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 01 Aug 2012 07:53:51 -0700
Received: by qaeb19 with SMTP id b19so2302081qae.4
	for <openembedded-core@lists.openembedded.org>;
	Wed, 01 Aug 2012 07:53:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=Ck5goYt/1dPWm43Bqb8L/Sm619C34idpnGzNY1T6r94=;
	b=W6g9znDrUZr3os3xhMzsShBSDSRVR2vps3ozONoQnxOao4clI6wRDVEf54OUCa+KTo
	0rcXm6U5znIZ2HaZ5p4KstClfUbeqa68vBevnsQ/3HeZHWajMjOMjZcE4pARu8INmCVt
	XTE1fLt3WyWC5wdo4yFFvonqqkmJ55EOxZWsJ3p4MRIM/n3Qh4Hm0z/oeYYYP44KoKUH
	i7eGSKVcrMz/4Kvo/2vbvBRaKoQGPqMce1hjhvSZvANgQkfK1KTXXCsO2N0TUOOFB8qA
	0YXXhRv1Rpg3nfyxh49FYOf835fyVA+B3LuA3C3Ndtaok83+2lIMqcN0b6CDcYqHQZFd
	zq9w==
Received: by 10.182.51.37 with SMTP id h5mr29607306obo.35.1343832830199; Wed,
	01 Aug 2012 07:53:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.43.99 with HTTP; Wed, 1 Aug 2012 07:53:30 -0700 (PDT)
In-Reply-To: <20120801124455.GE16306@jama.jama.net>
References: <cover.1343823907.git.ross.burton@intel.com>
	<6d27974b9045ca97ce135095a9d48715ac5bdc6c.1343823907.git.ross.burton@intel.com>
	<20120801124455.GE16306@jama.jama.net>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 1 Aug 2012 15:53:30 +0100
Message-ID: <CAJTo0LaTWibL0ep=H0UsLXrL9mrFroX6vVcQGW-1vySoDAX_sA@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmxYOMzJuBIvpGB3q0WR0sNIse7Bseogp3X1eeoMfthvMGNWNcsiW+qlTmAN1GRCLF7h2KW
Subject: Re: [PATCH 07/12] mesa: enable GLESv2
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 01 Aug 2012 15:05:31 -0000
Content-Type: text/plain; charset=UTF-8

On 1 August 2012 13:44, Martin Jansa <martin.jansa@gmail.com> wrote:
>> +PROVIDES = "virtual/libgl virtual/libgles2"
>
> Shouldn't be this provided only for opengles2 in DISTRO_FEATURES?

I've changed my mind on this -- gles2 is just another library so if it
isn't used on the distro it won't be installed.

Ross


