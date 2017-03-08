Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f193.google.com (mail-pf0-f193.google.com
	[209.85.192.193])
	by mail.openembedded.org (Postfix) with ESMTP id 95473775E8;
	Wed,  8 Mar 2017 02:34:47 +0000 (UTC)
Received: by mail-pf0-f193.google.com with SMTP id 67so2011220pfg.2;
	Tue, 07 Mar 2017 18:34:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=J/+ljbFNwjr0AtDxjNVmIPlJ2qwrkJouIi3A5w5zZH0=;
	b=W+pwhO8+THE4P5erZXDDeSmTeRRVLCFxUABEhDqk2Ln9R8sKWgTAk8YByj2mqcq2c1
	R1oBS4LLEirTqYl3lmVknyugoMS7arKOewlyqMZ3hLNYe94bKXVXP2/BtrdbXoUHc6Bo
	iFAEwRocgNRbeR2RyyNvIkDwD9RM5/x8vXjEYcV0YkyBNmHu0YOpJlkFhDagO0PPMtpE
	Ub1GQNshUsimn3v0KS4e6UN325MYoanzw5KxeV88oQa4a9MvE3B02JujMxa9mTs/BZv5
	OPHyrYGkpHVphC50vCCYIopCI2cyMkREu0JinESLdHXATERm0lNLvLIK6O9/VO9C+Lk+
	P96Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=J/+ljbFNwjr0AtDxjNVmIPlJ2qwrkJouIi3A5w5zZH0=;
	b=V77bgVFxBOhxwCgfJ9JmKleYtPFTcyWP1020wfJLvWKN69oBPnAkWlkp+7DOgpZrQ6
	bnS99EwOqzj1NrTc0oaf5LLeOXu6QxHI6QIBn9+MqwnBbMge8VA1iiZkTxLwzHlTmsZa
	6rE8z2ZBnmif2FyKpfZ/X9XDR9M03lu4LnKATIKmsy/bCJS/2jFsP2j1a73YtTteM6oT
	P+eB/5CDPOOF4IPJtMCpCdGOpciFCtwV0XmEPr+w8qLC9tj54+/ujpQzDg6Dcg18DW2F
	FhDkFUk8nPBOJqOoIkeaWQJBlWi/c2a6oc78bp+a9YRUx5D8XFXf+pcRtOeQhYXToNuL
	21wA==
X-Gm-Message-State: AMke39navofbEuWOZuUyhgBDYtW3EP5vSlnrDbDIZ30UlGV7p77pcyaTvV1nYA0ci85x7w==
X-Received: by 10.84.248.4 with SMTP id p4mr5058910pll.72.1488940488684;
	Tue, 07 Mar 2017 18:34:48 -0800 (PST)
Received: from haswell (c-76-102-32-192.hsd1.ca.comcast.net. [76.102.32.192])
	by smtp.gmail.com with ESMTPSA id
	s26sm2203107pge.33.2017.03.07.18.34.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 07 Mar 2017 18:34:48 -0800 (PST)
Date: Tue, 7 Mar 2017 18:34:42 -0800
From: Khem Raj <raj.khem@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170308023441.GA28127@haswell>
References: <1488862727-25152-1-git-send-email-armccurdy@gmail.com>
	<CAJTo0LaNUQW=Qsyxm7eC9hFduzVMy5v+1Sy9aBMfgNoBgAqoow@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LaNUQW=Qsyxm7eC9hFduzVMy5v+1Sy9aBMfgNoBgAqoow@mail.gmail.com>
User-Agent: Mutt/1.8.0 (2017-02-23)
Cc: openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [Openembedded-architecture] [PATCH] meta: start to ignore the largefile distro feature
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
X-List-Received-Date: Wed, 08 Mar 2017 02:34:49 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On 17-03-07 10:35:58, Burton, Ross wrote:
> CCing openembedded-architecture to open the field for comments.
> 
> On 7 March 2017 at 04:58, Andre McCurdy <armccurdy@gmail.com> wrote:
> 
> > The largefile distro feature has been enabled by default in oe-core
> > for a long time and, more recently, also in poky-tiny. Building
> > without the largefile distro feature receives little or no testing.
> > Many packages now enable LFS without exposing a configure option, so
> > there should be very little expectation that disabling the distro
> > feature will result in a distro which globally disables LFS.
> >
> 
> So I've had a bug for this for some time but have never got around to it.
> 
> If we're going to assert "LFS by default" do we want a sanity check to
> verify it was used?
> 
> Do we want to put -D_LARGEFILE_SOURCE -D_FILE_OFFSET_BITS=64 in the default
> CFLAGS?

I think this is fine to assert, however, there might be applications which
still want to use --enable/--disable autoconf stuff, and ignore/override the
env settings we might pass, so we need to watch
out for those. Otherwise, this seems a step in right direction.

> 
> I'm not aware of any good reason to not use LFS, but now is the time for
> anyone else to speak up if you have a good reason to keep it as an option!

me neither, we should just make it default settings.

> 
> Ross

> _______________________________________________
> Openembedded-architecture mailing list
> Openembedded-architecture@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-architecture


