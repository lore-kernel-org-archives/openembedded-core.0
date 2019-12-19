Return-Path: <raj.khem@gmail.com>
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
	[209.85.216.66])
	by mail.openembedded.org (Postfix) with ESMTP id 41DF07FD3C
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 16:41:57 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id t101so2793880pjb.4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 19 Dec 2019 08:41:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:user-agent:mime-version:content-transfer-encoding;
	bh=cB7aek4YVPzr1fWecpEPoX0A4clk2BvTUz93+ZH8YO8=;
	b=a4JfrNSO5NCT/75fIgcrPKHSILOB0HSDzWoPQNtR88z3Xdr/DpIt6/9QGh5l8czdGD
	ZNw3cNEjyj0Wi8CYjC+qiVTEbzUOXdtOchVoI4hrbefl1/c2fRDSfIYzkXqmiO9Ssfmx
	Lzx4rdsbSi791tk4wlW6FKiTiS7B0/lXZeMcpB+aqn2p+U5DzpEl7t6c52qb+3fS0E3A
	4xVWNVFw8kFSxv0nBcnFIaIchkbZkHxsoS8e5pecsoCZ9GFTfmyuONHtSw91nauWVwcd
	m3lES78Yd17SKuNPPxnnh0IhEUt7hL79Jaz/m/rcaVYiOOz8f5QnbjRldX8HbZLw4ood
	DWfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:user-agent:mime-version
	:content-transfer-encoding;
	bh=cB7aek4YVPzr1fWecpEPoX0A4clk2BvTUz93+ZH8YO8=;
	b=giYxM51mUlmjdBQBMO1ent4TR3GOYqXAd7K6PwTleJ02sxVcGzt20vsu9/35Cg0+6Q
	9Xt6c3AQcXPh0Kczb89euCJ/LB/ujVHtphO6DkC7S3F1f3chi0nRWKmGzRcgr84g6Y2d
	4t2dJHQw/H+HbnLagXovvSX1WfC3OW0qN8Er+YpPeO0wTqvyiMVOqjoUzKI9vAdxsH4d
	iW2Nj28EUtFOYTl8/40dzrTxDYHTW5hFjKLS8bcaaf/uo5aEEzmf7Wom3w+aElJlxIUG
	saxqQzHkHJz6Ypm99X1qiMGlerm/8eweI2v9u4wySTgCu8D41EaLko9ymh1nXrXfUNJQ
	UrfQ==
X-Gm-Message-State: APjAAAWOhdKJ7f0bKhH6bvO+r+I+6Lu9MIbQiIbihGAWgGujQUdo86wq
	1POJhiPa/nJB3XS63KhFNXL9nL3Qqi0=
X-Google-Smtp-Source: APXvYqzdrrBnCfyCWJV8cn5eXgqL7VzgbwCQtMe2TnhzBVXQR3wCHc08r31WvOdgMfhTq8EMoKH8AA==
X-Received: by 2002:a17:902:7102:: with SMTP id
	a2mr9885876pll.301.1576773717782; 
	Thu, 19 Dec 2019 08:41:57 -0800 (PST)
Received: from tyche ([2601:646:9200:4e0::c389])
	by smtp.gmail.com with ESMTPSA id
	a13sm8890399pfc.40.2019.12.19.08.41.57
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 19 Dec 2019 08:41:57 -0800 (PST)
Message-ID: <05183ee09ad2c6ae6ae1e37079626b83e9afb313.camel@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Ross Burton <ross.burton@intel.com>, 
	openembedded-core@lists.openembedded.org
Date: Thu, 19 Dec 2019 08:41:56 -0800
In-Reply-To: <302d5b9a-4e74-593f-1e10-fec9452d5116@intel.com>
References: <20191218233928.696037-1-raj.khem@gmail.com>
	<679f8a273b8e113fadace659a84c35b1338ddbff.camel@andred.net>
	<302d5b9a-4e74-593f-1e10-fec9452d5116@intel.com>
Organization: HIMVIS LLC
User-Agent: Evolution 3.34.2 
MIME-Version: 1.0
Subject: Re: [PATCH] cmake: Displace VERBOSE setting
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
X-List-Received-Date: Thu, 19 Dec 2019 16:41:57 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Thu, 2019-12-19 at 12:01 +0000, Ross Burton wrote:
> On 19/12/2019 08:52, André Draszik wrote:
> > Hi Khem,
> > 
> > On Wed, 2019-12-18 at 15:39 -0800, Khem Raj wrote:
> > > Setting VERBOSE always, while is fine on one hand for debugging,
> > > its
> > > coming at an expense of creating lots and lots of logs, e.g.
> > > qtwebkit
> > > compile logs alone with VERBOSE is 163MB, there are many other
> > > large
> > > packages which use cmake e.g. WPE, webkitgtk etc which are in
> > > same range
> > > with out this option on, the logs reduce to 861K and also speeds
> > > up
> > > build a notch
> > > 
> > > If user needs to enable this logs for targetted debugging
> > > debugging that
> > > could be added via
> > > 
> > > EXTRA_OECMAKE_BUILD += "--verbose"
> > > 
> > > in recipe
> > > 
> > > Signed-off-by: Khem Raj <raj.khem@gmail.com>
> > > Cc: Ross Burton <ross.burton@intel.com>
> > 
> > I don't agree with the reasoning to always disable this by default.
> > - it's
> > way too useful in general. I can't count the number of times it was
> > enough
> > to look at the log.do_compile to figure out something is wrong.
> > 
> > Now you have to recompile everything with this merged, and
> > something that
> > took 5 minutes to debug becomes an arduous task.
> > 
> > If the Webkit build is too verbose, you should make that specific
> > recipe
> > less verbose. E.g. you could always set
> > EXTRA_OECMAKE_BUILD, and just clear
> > it out in the webkit recipe.
> > 
> > Otherwise, based on the same reasoning, you should disable all
> > logs, not just
> > cmake logs: kernel, make output in general, bitbake logs. They all
> > take up space.
> > 
> > Seriously, those logs are useful, keeping in mind that often logs
> > are
> > collected on build-machines, and having easy access is a huge time-
> > saver.
> 
> Personally I agree with André.  We have verbose logs for autotools
> and 
> meson, so why is cmake special.  As this is a webkit-specific issue
> for 
> you, the neater fix would be to override this in webkit.
> 

perhaps there should be a global production mode and curb these logs
too. Since now we are citing webkit as an example solving it just for
webkit does'nt seem right option.

> Stepping back though, why are 163MB log files a problem?  Are you 
> archiving every log maybe?  If so then there's an argument to be
> made 
> for a global "logs should be verbose" toggle, that defaults to on
> but 
> you can set to off.  That way the kernel, autotools, etc can also
> follow 
> the same logic and *all* logs can be smaller.

I agree on this point. Although I wonder if 80% problems can be solved
by fixing cmake verbosity then that not a bad start. After this patch
one could infact enable it globally too by setting it in config
metadata, so we are just toggling defaults. 

> 
> Ross
> 


