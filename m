Return-Path: <ross.burton@intel.com>
Received: from mail-qg0-f43.google.com (mail-qg0-f43.google.com
	[209.85.192.43])
	by mail.openembedded.org (Postfix) with ESMTP id 9DDC360702
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 09:40:50 +0000 (UTC)
Received: by mail-qg0-f43.google.com with SMTP id j107so3200732qga.30
	for <openembedded-core@lists.openembedded.org>;
	Mon, 20 Oct 2014 02:40:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=LeSc28ZS/rmb6pgGSlEuJmFKacxph9Duo9PTrNFtctk=;
	b=lM+Q+ePB16jn/lZDXdpDky0rif0ng1B8qg90PJBO0t5fyysYp0TV+Hi1r3PGftTjlR
	RAEhetHnskdU0SQ5JMbbwf9ZGR1sAbTNifnuxfHX3zrATe0akyjS7t9c6BAoAf6znSVh
	H+9dhSJvFV4uNezO/iL9tykJR7I4TpW/FbaobvmZ79ZTMs/kr+2CJZ3biwzPLzuF8M15
	N2ciZTmrTNEIAFJzY839D7/JOMs4NQHg33RAQ6p1ue1/R7gMrxTdee9fTOgY2x7ZcenO
	/buICaOoSbRPbX67FE7+hUb36VXgxonIbn5Hz5d43K6WFMRxdLKku6H6K01plw4jYvxe
	1EJQ==
X-Gm-Message-State: ALoCoQnFB0NxRy5rEV99a+I0+Snn1BnwtmXu2SlrsGQRotUpPHcVPKmiXhYmPgdZ21cZDRNzCUY/
X-Received: by 10.224.2.135 with SMTP id 7mr34822149qaj.64.1413798050872; Mon,
	20 Oct 2014 02:40:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.93.65 with HTTP; Mon, 20 Oct 2014 02:40:30 -0700 (PDT)
In-Reply-To: <544404D7.9030905@gmail.com>
References: <544404D7.9030905@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 Oct 2014 10:40:30 +0100
Message-ID: <CAJTo0Lb_tRj9ROyQ5D6ZSca-FoeY_wDt-2qOY9Fe53PFLnspeQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: Poky X11
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 Oct 2014 09:40:53 -0000
Content-Type: text/plain; charset=UTF-8

On 19 October 2014 19:37, akuster808 <akuster808@gmail.com> wrote:
> When I build 'core-image-x11' on Poky, X on wont start. I am using the
> standard Poky clone with no added layers. When I manually start x I get the
> following error:
>
> startx
> /etc/X11/xinit/xinitrc: line 95: twm : command not found
> /etc/X11/xinit/xinitrc: line 96: xclock : command not found
> /etc/X11/xinit/xinitrc: line 97: xterm : command not found
> /etc/X11/xinit/xinitrc: line 98: xterm : command not found
> /etc/X11/xinit/xinitrc: line 99: exec : command not found

Did you at some point do a build with meta-oe enabled, and then not
enabled?  There's a known bad interaction between oe-core and
meta-oe's X init scripts which results in problems like this.  The
quick fix is to wipe your tmp and rebuild (using sstate this should
take just a few minutes).

Ross

