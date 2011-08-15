Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <s.stirtzel@googlemail.com>) id 1QstBx-0000eR-QO
	for openembedded-core@lists.openembedded.org;
	Mon, 15 Aug 2011 11:10:41 +0200
Received: by qyk4 with SMTP id 4so878994qyk.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Aug 2011 02:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=/dRXfXxiD8XH/WcurxlVghZyP0ZpW/hAJBspnjN+O44=;
	b=jV/gZuxb+1Kh2AXtGo+8x/GOwhe1hDwoW+TcwXREiCRoL12fETNRlBiuvxQVEddrzj
	JpCnbVippQOdJXW24UO9UPlP4wa1hj3VQnnG5R5kCxKe4NYBviPTIEcFDFifAKXLiuut
	fHASQf6f7r65sLnl159rrlJTD9tzoGlieh5Do=
MIME-Version: 1.0
Received: by 10.229.133.141 with SMTP id f13mr2406415qct.135.1313399165228;
	Mon, 15 Aug 2011 02:06:05 -0700 (PDT)
Received: by 10.229.186.7 with HTTP; Mon, 15 Aug 2011 02:06:05 -0700 (PDT)
In-Reply-To: <CAFu+nvEY-=wvh0zn3WgOCNjM0e54Q3LSK2N5jWb6-Yi3hnDZxQ@mail.gmail.com>
References: <CAGiJk9fq+p3LcBOOz=V+_kprRppAOR-nOAOW6tgK3zwE78Skwg@mail.gmail.com>
	<201108121008.03554.paul.eggleton@linux.intel.com>
	<CAGiJk9dGQ5N0xd+L81Bit-jp4YDYPwSBjNvn5_io38vyH2nREg@mail.gmail.com>
	<201108121147.58438.paul.eggleton@linux.intel.com>
	<CAFu+nvEY-=wvh0zn3WgOCNjM0e54Q3LSK2N5jWb6-Yi3hnDZxQ@mail.gmail.com>
Date: Mon, 15 Aug 2011 11:06:05 +0200
Message-ID: <CAGiJk9eNHP2iCuku7ADst3upiQZ8GSx40aV4sodtaJFgASqd_Q@mail.gmail.com>
From: Samuel Stirtzel <s.stirtzel@googlemail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Questions about the layer structure in OpenEmbedded-Core
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
X-List-Received-Date: Mon, 15 Aug 2011 09:10:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

2011/8/12 George C. Huntington, III <george.huntingtoniii@gmail.com>:
> that graphic is nice, could it be included in the wiki?
>

Well I would not mind, but I've noticed the graphic has still flaws:
The distros would unlikely impact on the hardware specific code (or
would they?), and I don't know if/how they affect the yocto layer.
In this case I should investigate further before this image can be
used as an overview.



Regards
Samuel


