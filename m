Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QH26D-00012e-S7
	for openembedded-core@lists.openembedded.org;
	Tue, 03 May 2011 01:00:18 +0200
Received: by ewy5 with SMTP id 5so1893925ewy.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 May 2011 15:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=agcvPidi9oxb2DDugIh1a1+4pPSy6c/npsoOeEqaJiE=;
	b=spTmUmyTbPotxF7xB3mdQle6TJ+6/R0e9H6OUswnqTafLM28pddvLc3OLh/sqMJJuE
	8xOVPsXfGPBd7cskd+F8C2lwrR8j9dJ5xvH4Dh52+pv9BJbZDf/gqWB6NnMYxXa2CNTD
	9W7xl5PDvdFwjlc2YoYl9qCtnFqF5RBM+rBtQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	b=m52RvL8uekOV4veTENA/+3k/DHd4Q8L/HuXCf8PcOn1rkYUnaChsvu8YUa6kg8rtxp
	vBnlXVXIc4K9rFhxdupH8WhQ68Ep9RsMeJ7KubWrvCJNm6/kXpi7AGDzG5UdWIPdfrDK
	/Sgx3ahPjz+LKBU0YQL2POOp9kF6IraQ/j4i8=
Received: by 10.14.125.4 with SMTP id y4mr3536922eeh.109.1304377061209; Mon,
	02 May 2011 15:57:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.47.139 with HTTP; Mon, 2 May 2011 15:57:11 -0700 (PDT)
In-Reply-To: <4DBEAA2C.1020601@mlbassoc.com>
References: <4DB99F31.4000308@mlbassoc.com>
	<BANLkTikaf3MHYrnbvHDno3dSv_LhsLyFVg@mail.gmail.com>
	<BANLkTi=G-4UfXNdnJSy7qF3gb0-xLr6+4Q@mail.gmail.com>
	<4DBEAA2C.1020601@mlbassoc.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 2 May 2011 15:57:11 -0700
Message-ID: <BANLkTikvrYLdygcBRgOoxWA-QuoXk-uyyw@mail.gmail.com>
To: Gary Thomas <gary@mlbassoc.com>
Cc: Poky Project <poky@yoctoproject.org>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [poky] GCC 4.6.0 on ARM?
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
X-List-Received-Date: Mon, 02 May 2011 23:00:18 -0000
Content-Type: text/plain; charset=UTF-8

2011/5/2 Gary Thomas <gary@mlbassoc.com>:
> I was able to build my kernel (ARM OMAP/3530 based) using this, but

good.

> the USB still doesn't work, so no improvement, sorry.
>

bad. hmm I guess it needs to be debugged. Many times new compilers
unearth coding errors
sometimes compiler mess up too.


