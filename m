Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SV9qY-0008Cw-U5
	for openembedded-core@lists.openembedded.org;
	Fri, 18 May 2012 01:11:03 +0200
Received: by ggnp4 with SMTP id p4so2420269ggn.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 17 May 2012 16:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=BQ5Zk8EM+mmVVwNcnqgWnDkRs19w68h6b3thxgBw+g8=;
	b=PXFcP8hvd+zDn+j1xNNjf/WAU4XHTiqnzQcRe2gotfEDZDcfNLPf1X/kSFsc1LnMGF
	hulKzadJkJU8EMd2BHELE4cT5i2rVmNAynlPV+liquCmzE1Tb2wIECuN7DFIuiFXvSH1
	3++GbmyqE0PTsmC68buLI1hYNXB+UiyqErwcNrpssuOUoFMFlLNw7lDalOWI7imkt+ls
	NQe6zYT0fi+DBkRgc2APVSe+lSzDAziuSLaA4pZo4QnHaAmrbFRqlMk/aNS95u2vI9if
	JU9sVytQ98QhvK+iq/GRZpFU6AyWT6g2KFkm66YFaUyZz7qdUdO3iNqhKHRugGB9pjMF
	eUpA==
MIME-Version: 1.0
Received: by 10.50.207.36 with SMTP id lt4mr7267391igc.5.1337295659099; Thu,
	17 May 2012 16:00:59 -0700 (PDT)
Received: by 10.42.170.195 with HTTP; Thu, 17 May 2012 16:00:59 -0700 (PDT)
In-Reply-To: <CAMKF1spc=LG+_MqOPXvwg5tSpipfTaFm8ME+Mvp_vjJFdZb=WQ@mail.gmail.com>
References: <1337074341-12708-1-git-send-email-koen@dominion.thruhere.net>
	<1337288563.7473.24.camel@ted>
	<20120517211637.GD23562@bill-the-cat> <2398024.EpgDMcMvMx@helios>
	<CAP9ODKqc5eubLWKrbPowvunHaUX0Fhbk-XLFgH=b+pr8m+tGcQ@mail.gmail.com>
	<CAMKF1spc=LG+_MqOPXvwg5tSpipfTaFm8ME+Mvp_vjJFdZb=WQ@mail.gmail.com>
Date: Fri, 18 May 2012 01:00:59 +0200
Message-ID: <CALbNGRSKPFG3qKLCjCOWADPYykAY0VBbHfLGWZ70gW+eR4YpdA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
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
X-List-Received-Date: Thu, 17 May 2012 23:11:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, May 18, 2012 at 12:50 AM, Khem Raj <raj.khem@gmail.com> wrote:
> On Thu, May 17, 2012 at 2:51 PM, Otavio Salvador
> <otavio@ossystems.com.br> wrote:
>>
>> From time to time it is easier to avoid to work in OE-Core and work in
>> meta-oe or another layer; udev is no different. It has been update in
>> meta-oe long time ago and many people use and depends on it.
>
> if udev has been in meta-oe for long enough and verdict is that its
> tested well enough now lets move it to OE-Core.
>
To make meta-oe less 'frightening' - what are the culprits. Up to now we heard:

* systemd: a layer was born and will be filled (at least by trolls :)
* udev: suggestion above

What else?

Andreas


