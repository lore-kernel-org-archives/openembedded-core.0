Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <elizabeth.flanagan@intel.com>) id 1Spobf-0004Zq-IL
	for openembedded-core@lists.openembedded.org;
	Sat, 14 Jul 2012 00:45:05 +0200
Received: from mail-lb0-f180.google.com ([209.85.217.180])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 13 Jul 2012 15:33:46 -0700
Received: by lbbgj3 with SMTP id gj3so4734750lbb.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 13 Jul 2012 15:33:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:x-gm-message-state;
	bh=MbVzFWzHquSKvdxofW5HbK5l4ez4HVRBinuTiE7PUKQ=;
	b=h3fAfq4g5bq8s+lkzkv898LuwywMR28FiI9rKW2X8vijzBfhKNAxp1lXO7L9UPQMH6
	7piywaP6MWhihhmWq5r2ghPva5VFa6RPa9C0LmXngMSh3aZ68mjsEIzNitVoM0hbbItF
	G6KaBbhSDGAeWkZaIva+bp4rLguiPdppzfwaT9QOA1OO6AnUe1ODnIKGdg7UWwnX+T8E
	gx/N7GFJw8eRJ4c1Wd0dx3HNkM2cT1F3HqvCa4iAsR2aaRjcdu4MPZkQnTts16eb3tpL
	EfsBZpTNYBku2uI7rrDnL7zD+mmgeAloZFusDtKC0se+dxaAaYniTPrRhzgHeK9z6DGC
	65yw==
MIME-Version: 1.0
Received: by 10.112.36.163 with SMTP id r3mr1600343lbj.87.1342218824719; Fri,
	13 Jul 2012 15:33:44 -0700 (PDT)
Received: by 10.112.1.227 with HTTP; Fri, 13 Jul 2012 15:33:44 -0700 (PDT)
In-Reply-To: <CAK18fxHURg0pSngghV9OO-V6OFa3UwK8XH1RJHA56z8-W=QuFA@mail.gmail.com>
References: <CAK18fxFBi0=eFEPPrr=O0FXNnivTSUvPe04pnqxpOKDSvT2ehw@mail.gmail.com>
	<30507362.5flLOTLR4H@helios>
	<CAK18fxHURg0pSngghV9OO-V6OFa3UwK8XH1RJHA56z8-W=QuFA@mail.gmail.com>
Date: Fri, 13 Jul 2012 15:33:44 -0700
Message-ID: <CAPhnLPD3Ni=CgFW51TiiAdB9NBv+rdPTKnwKcO3hTO+H-pb7LA@mail.gmail.com>
From: "Flanagan, Elizabeth" <elizabeth.flanagan@intel.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmvDWL2MMZk1EqhRIZqy0COZpHhTYmQG+JRhpBuBKCTGCM4o5Femv/BNNjkMZpctYJfiPEo
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: http://xorg.freedesktop.org/ down
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
X-List-Received-Date: Fri, 13 Jul 2012 22:45:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Fri, Jul 13, 2012 at 2:35 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> On Sat, Jul 14, 2012 at 12:03 AM, Paul Eggleton
> <paul.eggleton@linux.intel.com> wrote:
>>
>> On Friday 13 July 2012 21:52:24 Andrei Gherzan wrote:
>> > http://xorg.freedesktop.org/ is down so libx11-trim will fail at fetch.
>> >
>> > Use
>> > http://ftp.x.org/pub/individual/lib/
>> > temporary.
>>
>> Isn't this why we have source mirrors? Are they not helping for this
>> recipe?
>>
> Not working for this.
>

Yes, it wouldn't as it doesn't seem to be a package fetched during a
universe fetch.

-b

> ag
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



-- 
Elizabeth Flanagan
Yocto Project
Build and Release


