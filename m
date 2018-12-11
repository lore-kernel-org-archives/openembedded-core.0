Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com
	[209.85.221.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2D5026C10B
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 15:02:52 +0000 (UTC)
Received: by mail-wr1-f51.google.com with SMTP id u3so14451509wrs.3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 11 Dec 2018 07:02:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:user-agent
	:mime-version:content-transfer-encoding;
	bh=cd6Yt24RxzJLXidZ1oyY2iTe9fjWb5ryxrQGHf6JJbA=;
	b=iNEkJQdd4nebPPjQXSdzlqRDjyrqKKfBQzouluyCMeqVbJpmJ+RgTHRNu3b9wz27kl
	Wa8rbLmF6rX/SbBnHuMaZXV0reAc1YlNoZsKkgrA80+sawkwIQCF8efz3By9Mj21uyhr
	AsH2W3zKaF1rVuUE/Avv6R2ay3o/3uJhxQ3FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=cd6Yt24RxzJLXidZ1oyY2iTe9fjWb5ryxrQGHf6JJbA=;
	b=I8WXFv1E+6xG/+rrPXY4v8BYs4RqPbmfE4uaseUyXxscHV/I9lq6sBO6Qi/y/4oQqT
	08DTDS7TuovNUd+sG3CMztptTUZF4q6HBGNLmFmXqF9+vMpDF6mbKz7HgntxYJ6Qn0Bf
	JLfD/s675DsnCRW930PRYWdBke28wwBZuPMiVoIzIwOHIdBtirbhC9Bhk5A4QzYUUfJV
	QGX/lEYox2h3yRkg33QoDbadxgQfpsH50hDjho4U58rwMU/fnpXsQOI4v48yGTIzmq6O
	eJXCIVng+kjGe+Oh8e00Zy2Z9skV5HK76po3Kq4R7YAVhRCeZzVqU5oU94spxaozZMlG
	x9OA==
X-Gm-Message-State: AA+aEWbMqf3WuYBxXi2Dn8m4mPwJchJtvtIuPiWiNMzewZNdoNn4iOBf
	nNvikCht3lLkSoqV5l2VGTTHfQ==
X-Google-Smtp-Source: AFSGD/WMhH3ODO/1dddw8t+AsH+eDrCokaKBBb6ChT0Juw6k5B2Dtge7eOq7DIogWTsHGRhj5vOv1A==
X-Received: by 2002:adf:e5c4:: with SMTP id a4mr12976978wrn.157.1544540573648; 
	Tue, 11 Dec 2018 07:02:53 -0800 (PST)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	k15sm12639571wru.8.2018.12.11.07.02.52
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 11 Dec 2018 07:02:52 -0800 (PST)
Message-ID: <08a89c71b2e3e0f4380325985541c55df00b94da.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Jason Andryuk <jandryuk@gmail.com>, 
	openembedded-core@lists.openembedded.org
Date: Tue, 11 Dec 2018 15:02:51 +0000
In-Reply-To: <CAKf6xputiV+k9m9p1dyhZG1d0wMQoWG5tCiZjpsVVu+bXp1X6A@mail.gmail.com>
References: <CAKf6xputiV+k9m9p1dyhZG1d0wMQoWG5tCiZjpsVVu+bXp1X6A@mail.gmail.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
Subject: Re: Mis-generation of shell script (run.do_install)?
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
X-List-Received-Date: Tue, 11 Dec 2018 15:02:53 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Tue, 2018-12-11 at 08:42 -0500, Jason Andryuk wrote:
> Has anyone ever seen a generated shell script missing functions?
> 
> I have an OpenXT/OpenEmbedded setup where I had run many successful
> builds.  I made a change and then re-ran the build - it failed in
> binutil's do_install with autotools_do_install command not found.
> 
> core2-64-oe-linux/binutils/2.28-r0/temp/run.do_install.11776: line
> 124: autotools_do_install: command not found
> 
> Sure enough, autotools_do_install is not in run.do_install.
> 
> I had not changed binutils or any relevant variable, as far as I can
> tell.  If I run with '-e' I see the full autotools_do_install
> function in the output.  For some reason, the generated script wasn't
> including autotools_do_install.
> 
> I tried binutils -c cleansstate, but that didn't work.  I tried
> pruning the sstate-cache dir, but that didn't work.  I tried deleting
> tmp-glibc and sstate-cache, but it had the same error when I rebuilt.
> 
> Modifying binutils do_install by adding a comment and `true` lets it
> builds.
> 
> I saw something similar one other time where the generated script was
> missing a function.  I can't recall the details, but it was a
> different package and MACHINE.
> 
> Any suggestions on debugging this?

It sounds like pysh in bitbake wasn't able to see a dependency on the
function in question. Creating a small/reproducible test case would be
how I'd approach it, there are tests on the pysh code in bitbake-
selftest for example.

Once I had a test case which failed, I'd then use that to debug and see
if I could figure out a fix.

Cheers,

Richard


