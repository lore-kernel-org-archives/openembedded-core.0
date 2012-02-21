Received: from mail-tul01m020-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sakoman@gmail.com>) id 1Rzxu1-0002SR-Ol
	for openembedded-core@lists.openembedded.org;
	Tue, 21 Feb 2012 23:09:41 +0100
Received: by obhx4 with SMTP id x4so9588117obh.6
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Feb 2012 14:01:21 -0800 (PST)
Received-SPF: pass (google.com: domain of sakoman@gmail.com designates
	10.182.1.104 as permitted sender) client-ip=10.182.1.104; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of sakoman@gmail.com
	designates 10.182.1.104 as permitted sender)
	smtp.mail=sakoman@gmail.com;
	dkim=pass header.i=sakoman@gmail.com
Received: from mr.google.com ([10.182.1.104])
	by 10.182.1.104 with SMTP id 8mr17003216obl.19.1329861681980 (num_hops
	= 1); Tue, 21 Feb 2012 14:01:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=7cfEbNH/SuQMS2zs1rhJvLvkdInM8ipQxFrVunLpTKY=;
	b=TSmfMUaOVBP8VBeHuAJASCnpIifQMez4yvmemrWL3YjQludBTQopCNLjvM1ETOVhEm
	PSg4YV0yRglFizl5JuD/QVMUeaMSy5DN8BVEOUmya4pIF2TqjwhtgT34+oy+jr90wQ0p
	2BAH7CA5b0OpBfYlI0BbPquPANtQ7cd27cidI=
MIME-Version: 1.0
Received: by 10.182.1.104 with SMTP id 8mr14470259obl.19.1329861681937; Tue,
	21 Feb 2012 14:01:21 -0800 (PST)
Received: by 10.182.246.8 with HTTP; Tue, 21 Feb 2012 14:01:21 -0800 (PST)
In-Reply-To: <1653112.YUnhIDHb6u@helios>
References: <cover.1329147583.git.Martin.Jansa@gmail.com>
	<CAMKF1sqMP5yyeFo8qUhjd1xPkOvV6JcpzSwRP33VNyc0wf+C_A@mail.gmail.com>
	<CAGDS+nn7+3zVFX896P-+y5tT4Xw-++bgKtizmDsFZUno5D9Y8A@mail.gmail.com>
	<1653112.YUnhIDHb6u@helios>
Date: Tue, 21 Feb 2012 14:01:21 -0800
Message-ID: <CAGDS+n=AqMkJEDs7VbB5u+MsZLUd=bZTgMSR_5DLJ3C6N-sV9w@mail.gmail.com>
From: Steve Sakoman <sakoman@gmail.com>
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	Patches and discussions about the oe-core layer
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
X-List-Received-Date: Tue, 21 Feb 2012 22:09:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 21, 2012 at 1:44 PM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Tuesday 21 February 2012 13:16:11 Steve Sakoman wrote:
>> Since Poky doesn't have x11 in DISTRO_FEATURES, cairo builds without
>> xlib support by default.
>
> If you're referring to the default configuration, I can assure you Poky does
> have x11 in DISTRO_FEATURES.

The ELC flu is affecting my ability to think :-(

I see now that Poky relies on the DISTRO_FEATURES setup in
bitbake.conf (via default-distrovars.inc via defaultsetup.conf).  I
was just looking in poky.conf and didn't see anywhere that it pulled
in either of those files.

So now I need to figure out why the quad core machine is refusing to
enable --with-x=yes for the cairo build . . .

Perhaps better to wait till tomorrow when I am feeling better.

Steve


