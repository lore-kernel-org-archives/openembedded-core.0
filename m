Received: from mail-ee0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SV9h4-00086G-NO
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 01:01:14 +0200
Received: by eekd49 with SMTP id d49so642634eek.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 15:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=kcDS7hvWvt2T6thTCGhcNzgLAsmTrpuFl6Io7cdvooI=;
	b=c6TL8TqcWCCG4ZFhyadEZhx86Djj8kRhOe1rhdtVyCbX953mCg/vD63sYSHB4ZKYdn
	Y/5DV6YN+UIE/WmHd3LZFF8wFjkmNxpo3s5TsCW/dD0QIGG4/zua1v3OTv/cGCArZO5g
	++Yty/vK0YAj2cYe3VHoP0PRuqlBRIgjC9lds93r2l+mpR361Wh6IUAcm2merIDBJ6h6
	Gg5TQFzsXIvB9lNnDt6SVuOTV1qsD9zylQXFlRY/0Z0XKOd7B1iX/xZ/sYhSK2zpFTw/
	OEyytBwEEbzMsflN3CznCObFZEfLx2EBUFuUnA6rE0DAZfN2N/w3sMoa3oGCp/0O98vl
	VXNQ==
Received: by 10.14.127.201 with SMTP id d49mr1798301eei.52.1337295071735; Thu,
	17 May 2012 15:51:11 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.2.132 with HTTP; Thu, 17 May 2012 15:50:41 -0700 (PDT)
In-Reply-To: <CAP9ODKqc5eubLWKrbPowvunHaUX0Fhbk-XLFgH=b+pr8m+tGcQ@mail.gmail.com>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<1337288563.7473.24.camel@ted> <20120517211637.GD23562@bill-the-cat>
	<2398024.EpgDMcMvMx@helios>
	<CAP9ODKqc5eubLWKrbPowvunHaUX0Fhbk-XLFgH=b+pr8m+tGcQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 17 May 2012 15:50:41 -0700
Message-ID: <CAMKF1spc=LG+_MqOPXvwg5tSpipfTaFm8ME+Mvp_vjJFdZb=WQ@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] Revert "kmod: Use base_libdir for installing libkmod"
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
X-List-Received-Date: Thu, 17 May 2012 23:01:14 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 17, 2012 at 2:51 PM, Otavio Salvador
<otavio@ossystems.com.br> wrote:
>
> From time to time it is easier to avoid to work in OE-Core and work in
> meta-oe or another layer; udev is no different. It has been update in
> meta-oe long time ago and many people use and depends on it.

if udev has been in meta-oe for long enough and verdict is that its
tested well enough now lets move it to OE-Core.


