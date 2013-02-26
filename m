Received: from mail-oa0-f46.google.com ([209.85.219.46])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UAPDl-0003Qv-4V
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 19:25:47 +0100
Received: by mail-oa0-f46.google.com with SMTP id k1so5816906oag.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 10:09:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=3eMc92ZhodlsO6Tpz8cEUgovnR9Z3ilOJFcdoyRCrkY=;
	b=UfUHN6BK0Mlh0K0Wcen57cTTGSZF8MMwQ1OkW0/HKdLx1Ho6GL5uFC/Ld6qKyTPyds
	UkntM73IGQG4+jOynxT+EdYLNFxGI25y24Jtlzt+NvAxRnkNyGw150xMkwQ/mWYqdapQ
	fshvffNypdSO22jykQO9q52j18Y0hE6NMxXB6TqQBLwgfl945IuDsdeRFVv1TZbE7d2+
	pHC03pnTOKlrR3thU653NBrgauRL7Vog9nFDK8/dd5VEbTmeKojyFEib7WgQw2fZYs49
	sveccgMFkd3jy+lHBIdPn6hW5TvLdPPbHIKvny82ktEvvOAKk2/7v9DHLJVzhLWhyVgN
	tfjg==
MIME-Version: 1.0
X-Received: by 10.60.13.65 with SMTP id f1mr2335393oec.87.1361902165204; Tue,
	26 Feb 2013 10:09:25 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.251.165 with HTTP; Tue, 26 Feb 2013 10:09:25 -0800 (PST)
In-Reply-To: <CAJTo0Las-tCaN47Dz8Jn_W-YP6O__0Wqts3EBZDLbqAkv4F7FQ@mail.gmail.com>
References: <1361882216-8152-1-git-send-email-ross.burton@intel.com>
	<CAP9ODKrv9kbMuhMK6OnEGNqNRn0ZHM1R7xZwYAFa=QjivCcigg@mail.gmail.com>
	<CAJTo0LYFL_-YuemRozDYKaGaa1+mKtv8YgHUJdGnnHqPRKzDQA@mail.gmail.com>
	<CAP9ODKrSYh2vxAotVRFmvy+JbP_yexyRqb6hftsR=FOde4AjZQ@mail.gmail.com>
	<CAJTo0Las-tCaN47Dz8Jn_W-YP6O__0Wqts3EBZDLbqAkv4F7FQ@mail.gmail.com>
Date: Tue, 26 Feb 2013 15:09:25 -0300
X-Google-Sender-Auth: fevUBa0Hbke73HRBWoJbZY36FG4
Message-ID: <CAP9ODKrc92rZ5-+6dyHZ00Q5XPSBqeT5paN3R5n=a_yDt4wdPQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xkeyboard-config: this is architecture-indepedent, so set PACKAGE_ARCH
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
X-List-Received-Date: Tue, 26 Feb 2013 18:25:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 26, 2013 at 2:55 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 26 February 2013 17:47, Otavio Salvador <otavio@ossystems.com.br> wrote:
>> If it changes the build depending in target and host, in the end it is
>> not architecture independant code.
>
> I think this is just autotools being nosy and failing when it doesn't
> know what "alllinux" is.  The files don't change as they are literally
> just installed.

allarch does more than PACKAGE_ARCH so I think it'd be good to use it.
Maybe it'd not be hard to disable this call in configure.ac? I don't
have a strong opinion about it but using PACKAGE_ARCH only seems like
a workaround for me.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


