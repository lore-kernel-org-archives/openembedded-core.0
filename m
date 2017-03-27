Return-Path: <twoerner@gmail.com>
Received: from mail-it0-f68.google.com (mail-it0-f68.google.com
	[209.85.214.68])
	by mail.openembedded.org (Postfix) with ESMTP id CC4A472F94
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 15:10:54 +0000 (UTC)
Received: by mail-it0-f68.google.com with SMTP id e75so4881265itd.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Mar 2017 08:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lZiCTUi37XeUnZ7EkKIcAl4V2VVqvAEulysTMW/zTgE=;
	b=GCN/jkoh5O3miApvujMo1YN0/GuLyxwirywYFgOQqV7ZLmXS+y4vUqGFRNfPLsarcA
	ElKNil7yjZFHXeqNnbF+AVQnbbtGkHjCqgbGQqFn9qPyaTzZ0u99B9MwS/XC49rrpbaJ
	TyPompMVZn6PqJYZqxDNw2GiQwJwmveJkWkiufHMM2cp/AEaaBMCVrhIpTOn4AIOcX2E
	3qq72ERIuFTZwxOhQKfXxLwEK7sCal2hL/Sz0iope7SGoJWbr03GflL12QQZ0FK/OLuB
	rE+XGLABIf1WlNJyMWAhGxPmwd2DHEbuoEFWK0DsxIMpO2eAIe7gDqUsv700WlZ8ZniH
	HOvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lZiCTUi37XeUnZ7EkKIcAl4V2VVqvAEulysTMW/zTgE=;
	b=fiHX3Rri3JQl1iQpC/f9xAvqS/oftCaCKDfoLstizM9a0JIUEoI87mctbA3JDCt6NX
	kbK2kIcmr23/FI6K7WopRAWbkOCASU47SS8oJtM0025YWs8lKYUReKWAR/gaT/l9n5gY
	aoeR+yKgF3OrFZD13BiYzprt9BXIpnMisNGddasdFTH3L1Gv4klux8NtU6c9pnQGHNof
	gF6oy31r6Xxq0CPG6rU9RjgX4DqUQ5G9yCtHQ2ACfctLBSMQHEm/5BWIAJcQFvn0FFwM
	2ZptHcdHPhDDtXroF8inDzg3wNu4iLgnf6N6GdrmqbPeHJHK/1fOgbREcRPu+Dffz/ih
	QKaw==
X-Gm-Message-State: AFeK/H0hagK9dOm9h0xrOO5QyLNc5VP9ODHhWN5YlBbjEnn8EkkS/7YrlD5kZPyRys3fHg==
X-Received: by 10.107.168.21 with SMTP id r21mr20389962ioe.45.1490627455755;
	Mon, 27 Mar 2017 08:10:55 -0700 (PDT)
Received: from linux-uys3 (104-247-246-30.cpe.teksavvy.com. [104.247.246.30])
	by smtp.gmail.com with ESMTPSA id
	c100sm359847itd.20.2017.03.27.08.10.54
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 27 Mar 2017 08:10:54 -0700 (PDT)
Date: Mon, 27 Mar 2017 11:10:53 -0400
From: Trevor Woerner <twoerner@gmail.com>
To: "Burton, Ross" <ross.burton@intel.com>
Message-ID: <20170327151053.GA30578@linux-uys3>
References: <20170325051947.21433-1-twoerner@gmail.com>
	<CAJTo0LZsmYeQXDKTJm0PTjwbnvaKrQzg_w=0gOQaSjfiL14aMw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAJTo0LZsmYeQXDKTJm0PTjwbnvaKrQzg_w=0gOQaSjfiL14aMw@mail.gmail.com>
User-Agent: Mutt/1.6.0 (2016-04-01)
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] xserver-nodm-init: option to remove cursor
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
X-List-Received-Date: Mon, 27 Mar 2017 15:10:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

On Mon 2017-03-27 @ 12:35:51 PM, Burton, Ross wrote:
> On 25 March 2017 at 05:19, Trevor Woerner <twoerner@gmail.com> wrote:
> 
> > Add a PACKAGECONFIG option to allow the user to disable the mouse
> > cursor/pointer in the X server. This might be useful where a
> > touchscreen is used.
> >
> 
> This is what the touchscreen variable in the formfactor recipe is for.  Is
> this not sufficient?

To be honest I hadn't noticed formfactor before I created my patch. But
looking at it now, no, I don't think it would be sufficient. I'll take a
couple stabs at it, but I don't think it'll do what I want.

What I want is to get rid of the mouse pointer completely. Formfactor has
variables that would appear to affect things like rotation and whether or not
the calibration routine gets called when X starts up. I don't see anything in
there that can disable the showing of the pointer.

