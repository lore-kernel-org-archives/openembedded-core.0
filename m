Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SQNZN-0005Te-WF
	for openembedded-core@lists.openembedded.org;
	Fri, 04 May 2012 20:49:34 +0200
Received: by laai10 with SMTP id i10so1544703laa.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 04 May 2012 11:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=E9s1+2h8zu8pBhzzZtpT4+WwP2yxHtSoassERshLPmY=;
	b=i4AfBlRyqHW6+XGvv4CC9mJFiIskd6eGhKRP/Zb7EY0XzKZRHng/VQmUXXFOy5GbI0
	s70VlhLHYDirZw5g9d0cGlkr2hD6WTcVpEVDyYBfnMwwEmw221q8qRVc32x+7VTC4s8M
	MfIFk2VDQQTVCv6KTPXl3OaO8MK/pxtx2MJLorM4ednZTWHDk7P7UdGWi5JeuTmFVcoU
	AIp+18ONLZxqYJ69w/y3qNwOkYa+KuwEpCKnZ1bKXfHyFpDXONiJaw4B90J6B+96hGCK
	rEpA620O893s1Kzb+F8DABkBgZyFh2b15je7V3OEH9xgbiFAnoxciy2zWK6GyaFAt2ZF
	OsBQ==
Received: by 10.112.86.101 with SMTP id o5mr3438640lbz.1.1336156786951; Fri,
	04 May 2012 11:39:46 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.152.129.134 with HTTP; Fri, 4 May 2012 11:39:16 -0700 (PDT)
In-Reply-To: <1930BED7-1C2F-4F35-AEBA-F0C02C7F10A0@gmail.com>
References: <D54EB56C-3187-439B-BF54-4C4ACD76C8CC@gmail.com>
	<20120504173337.GA14692@denix.org>
	<1930BED7-1C2F-4F35-AEBA-F0C02C7F10A0@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 4 May 2012 11:39:16 -0700
Message-ID: <CAMKF1srkUmGFRDGqsk2HAkoALNy3xfS_ASv-HLcFFnsCR6Hd=A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [meta-openembedded] [PATCH] networkmanager: silence systemd bbclass WARNING.
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
X-List-Received-Date: Fri, 04 May 2012 18:49:34 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 4, 2012 at 10:39 AM, Elvis Dowson <elvis.dowson@gmail.com> wrote:
>
>
> Me neither :-) ,... but this is what the warning message, suggested be done.
>
> It fixed the warning for networkmanager, though.

If you have sysvinit scripts for this package then it makes sense to
have this renamed package otherwise leave it out. I think warning is
harmless in this case


