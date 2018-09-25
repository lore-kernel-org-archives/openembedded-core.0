Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 17D0860079
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 15:19:41 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id 206-v6so5977650wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 25 Sep 2018 08:19:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=r6Jxico72GiWLf36V2x2MiczNoXeFFjwsk5QzSO0j1E=;
	b=UGxxHaH8reE0JBOgxkVvUrnaFawe+X8DAx1OR59sSE7G3BdjjScBdYjjDgG1Xn0X6M
	6mc3ORxDXOkMUtvUZSXtoK/eYM2T54Or+EWdKLy1WzIB+dieQdz6PbSHI8vAcJjOw30L
	FwSrGXTt+RtQ6/aTpSggdkV0sm/LKvtyNAX0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=r6Jxico72GiWLf36V2x2MiczNoXeFFjwsk5QzSO0j1E=;
	b=ELfqvN6h6IF1k2M8No2sqzHhYmqAqPl5pk4FX4aKkz8gX206nj8FFnHB4EwYzybWjR
	e6Pnux9Y3/G7eElvEvQdXhEa0HmHdxA7cbrRjalHerNjgxDPnrJAHeScuqVQGdVhXC0t
	G+ow+M1OHKLuwvnLB7GBAkSVZq9BLS4RNoQhdFifTrw4xFRJICPAqVl9VMNCkPCDsx2N
	Cm805EXh9oytTidhG1RpCGrbgzfP4LpQ4jHnqRrB3KjkFGZDYi2EofI9YNaExo4W2uZx
	hOAtXCRWDpjpOtz6QWBuaaWvgZd31y42ehfqPv2Dh/kgIU+DSTqS1bqT28yws4PcLY0e
	+fgw==
X-Gm-Message-State: ABuFfoiZ98bHjQAiZNx50p+hbN/Sk4ULNBzrqb8mTY9DwtNqjF4no4Y8
	3MagGE5YOv6LhhWl9eIw+L37ew==
X-Google-Smtp-Source: ACcGV62+0/gotb5om6qu5c6RA/m0sIRq5ClwjH+5IopeCXfo2yjP/ApulcYochjmn6IzUQA0aJOHTw==
X-Received: by 2002:a1c:4857:: with SMTP id v84-v6mr1166238wma.8.1537888781732;
	Tue, 25 Sep 2018 08:19:41 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	y1-v6sm1387222wmi.46.2018.09.25.08.19.40
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 25 Sep 2018 08:19:40 -0700 (PDT)
Message-ID: <4d8f4e7d3c76db6acca576b8b31c5fbe9832b285.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: Mikko.Rapeli@bmw.de
Date: Tue, 25 Sep 2018 16:19:39 +0100
In-Reply-To: <20180925112117.GQ9430@hiutale>
References: <1537871293-32494-1-git-send-email-mikko.rapeli@bmw.de>
	<20180925104443.GP9430@hiutale>
	<576c5e5174123059cfa49e8cf647716497a35610.camel@linuxfoundation.org>
	<20180925112117.GQ9430@hiutale>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH RFC] insane.bbclass: add buildpaths_cmake and buildpaths_pkgconfig checks
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
X-List-Received-Date: Tue, 25 Sep 2018 15:19:41 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-09-25 at 11:21 +0000, Mikko.Rapeli@bmw.de wrote:
> On Tue, Sep 25, 2018 at 12:08:24PM +0100, Richard Purdie wrote:
> > I suspect we need to talk to cmake upstream about fixing this
> > properly
> > but adding something in the class may be an option until a better
> > upstream solution can be found.
> > 
> > I am puzzled by the need to add a .pc file path check since I
> > thought
> > there was already a test for that in insane.bbclass?
> > 
> > package_qa_check_staged maybe? "Check staged la and pc files for
> > common
> > problems like references to the work directory."
> 
> That check is not enabled by default. At least bash is producing a
> broken
> bash.pc (and several other files like Makefile.in and bashbug) in
> sumo
> with embedded absolute paths to build sysroot.

I still felt I was missing something:

ERROR_QA ?= "dev-so debug-deps dev-deps debug-files arch pkgconfig la 

which sets "pkgconfig" and "la". package_qa_check_staged calls
package_qa_handle_error("la",...) and
package_qa_handle_error("pkgconfig"...).

do_qa_staging calls package_qa_check_staged() and is triggered by:

do_populate_sysroot[postfuncs] += "do_qa_staging "

which is set for everything and should be running on master?

I had a look at bash.pc in a random local build and there is no
hardcoded path in it for master. I then found a sumo build and looked
at bash.pc there and also no hardcoded paths.

The issues would have appeared to have been fixed by:

http://git.yoctoproject.org/cgit.cgi/poky/commit/?id=dabbfe23de0615a958fac31b83684ade024cf17d 
which should be in sumo.

What may be the real issue is that sanity checker is quite specific
about what its looking for and does do:

file_content = file_content.replace(recipesysroot, "")

which may make sense for .la files but perhaps not .pc files, I'd guess
its to stop compiler flags triggering errors. 

So the real fix here may be to remove that line from the .pc check, at
least in the target case (native case it would make sense)?

Cheers,

Richard


