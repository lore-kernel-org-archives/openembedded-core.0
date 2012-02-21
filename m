Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Rzx46-0007J0-Im
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 22:16:02 +0100
Received: by bkwq11 with SMTP id q11so6033109bkw.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 13:07:43 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.47.225 as permitted sender) client-ip=10.112.47.225; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.47.225 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.47.225])
	by 10.112.47.225 with SMTP id g1mr10198807lbn.52.1329858463438
	(num_hops = 1); Tue, 21 Feb 2012 13:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=KTpQrLmXIytTuRJGW3C65fHjQIR4MYjS8som0+R1wf0=;
	b=PL3K7rXkix00zNNeXcgTSUVWiwtBlzBPqP7g6XEdpD/MA8dIRCoycosGQXAwHhJmRs
	9eBaXqtV7Gt6fR2Sun721Z3QOu2jUD0SZLZoZTWtZwSNgJxw/cn/TWmDy6eM9OHJe0ZC
	GZRoMu6574JBji9MMjBI7Uvsw0h1xYHvD/rGg=
Received: by 10.112.47.225 with SMTP id g1mr8543518lbn.52.1329858463268; Tue,
	21 Feb 2012 13:07:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Tue, 21 Feb 2012 13:07:13 -0800 (PST)
In-Reply-To: <CAGDS+nkxwj33z1zP2Uc9+oH97WkOy_v0yP2cs0VDcDgxm3SYog@mail.gmail.com>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
	<1e2722b29db9486276198e13f06345babce10518.1329147583.git.Martin.Jansa@gmail.com>
	<4cb8ea6acd12fec8ff072912292a374aaac56dcb.1329147583.git.Martin.Jansa@gmail.com>
	<CAGDS+nkxwj33z1zP2Uc9+oH97WkOy_v0yP2cs0VDcDgxm3SYog@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 21 Feb 2012 13:07:13 -0800
Message-ID: <CAMKF1sqMP5yyeFo8qUhjd1xPkOvV6JcpzSwRP33VNyc0wf+C_A@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 4/4] recipes: bump PR to rebuild .la files without libz.la
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
X-List-Received-Date: Tue, 21 Feb 2012 21:16:02 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Feb 21, 2012 at 11:25 AM, Steve Sakoman <sakoman@gmail.com> wrote:
>
> | configure: error: Package requirements (cairo-xlib >= 1.6) were not met:
> |
> | No package 'cairo-xlib' found

Add DEPENDS += "cairo"

>
> I won't have time to look into this until this evening or tomorrow
> morning, but will send a patch when I find a fix.
>
> Unless someone beats me to it :-)


