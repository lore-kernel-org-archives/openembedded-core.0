Return-Path: <ross.burton@intel.com>
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
	[209.85.167.66])
	by mail.openembedded.org (Postfix) with ESMTP id BDAF16B30D
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 12:22:58 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id b20so1168855lfa.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 20 Dec 2018 04:23:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=7sKn7ZCHHffXniLy6KmsWgDQ5IksoZfbC7oL8TJQdHA=;
	b=O4bNXXoh/vYr6fE+9hEwoGp1ZMcBPWzZWFqjSOv8puL8Bbz6CYrHECDuQSdz7Ei0/7
	lAmsH/yHh4WaYcsBn4ReJ++CbZvfxg9wHaVAXpWwrjuMVrVBF0k/9Y9r7G/5ham/JIdj
	fyxnRm8hZy54SC75Ifoslbq8BEaw3v0lfy9lFJ40M3bi41XUuN6Ej25GcOiMYrl9R6vn
	hRaX1bE86kTtR6lJDiKLDWZMmJbyWb0B6e44ebc8xL9cmfvaZ/LPhGxm1/etbNISkFeQ
	b0a3k00G6R8cwqAstIx9zY1dCyRgpF4iz8AJPRRTeGICu6o5QYmXPASRRORSfBaOgqJm
	JnNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=7sKn7ZCHHffXniLy6KmsWgDQ5IksoZfbC7oL8TJQdHA=;
	b=PSqMmf0Ti9yufO59jOlENzf6iDznvUkB4RvOkDinPzcVp10EbJBExf7bk4NvoEKSA7
	g4cxLfg5XEq+yHtIUHS9SwIIJeuZAmGa2KpIqeAsgI94ywhFc/m5VgR6xbvW811Yqhb3
	KJfW9FAWcKNTaXXM2YerSmpHUKWrW+udD1hbGIeQtXHc5A4377Z2tHRZZEUG6YE2lAfd
	jIW9RzqgwBtfnhpZb15kNePwLcey8XMGSaxt8Fq0/BdzTWygtCXg8vdf3UTJDmTyQf6N
	SoUJx+PU/X/Xja5/voZjB9Dz1JdmyWOiZFei7cVWY7C4rv1LECf5xTdRFdj2McRX9znB
	Ucog==
X-Gm-Message-State: AA+aEWY8KWDms9Xk9PAwnpwYSUB+ND4ow4ppfDtfNHSuUZAUni2HeUP3
	aC9OEL5ZxeBIZ9dG67qVseSpdjdAGDTl8YS0Pm1HTA==
X-Google-Smtp-Source: AFSGD/V9eEm6RrGmhQM+atvXTJ7pMw8jVtAhCyjo5vp3h5tr49jib0++hDbgi+vU6pUjwchSsV95Zz60tL9pkEra6HU=
X-Received: by 2002:a19:f20:: with SMTP id e32mr15648361lfi.51.1545308579152; 
	Thu, 20 Dec 2018 04:22:59 -0800 (PST)
MIME-Version: 1.0
References: <cover.1545202218.git.liezhi.yang@windriver.com>
	<f8c21c17d3ad2ca31c4b26b23b74ab0bdefd2c77.1545202218.git.liezhi.yang@windriver.com>
	<CAJTo0LZOd5hFgFWqvYL2ucusTLCNymf9Jo__yf5Hd1SGeCytrA@mail.gmail.com>
	<9bc35e55-7246-76eb-8726-bb717ad5979c@windriver.com>
	<CAJTo0La6Cbc1ANFPkYoDXQEs-LOCHgZpESt1pL=7=M=2-t7E4w@mail.gmail.com>
In-Reply-To: <CAJTo0La6Cbc1ANFPkYoDXQEs-LOCHgZpESt1pL=7=M=2-t7E4w@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 20 Dec 2018 12:22:46 +0000
Message-ID: <CAJTo0LZxM6anK9wge8Y0vEUPB6jeiiKkR_btQ1ezCibxAzhzwg@mail.gmail.com>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] cmake-native: Set --parallel for configure
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
X-List-Received-Date: Thu, 20 Dec 2018 12:22:59 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 20 Dec 2018 at 12:16, Burton, Ross <ross.burton@intel.com> wrote:
> I see similar wins here, walltime for cmake-native's build goes from
> five minutes to one minute.

For anyone playing along at home, this is what I did:

Cleaned tmp, applied patch to the mut branch.

$ git checkout HEAD^; bitbake cmake-native -C unpack
$ git checkout mut ; bitbake cmake-native -C unpack

Force a full build of cmake-native for both commits.

Then use buildstats-diff to compare the runs:

$ buildstats-diff /data/poky-tmp/master/buildstats/*
  PKG             TASK          ABSDIFF  RELDIFF  CPUTIME1 -> CPUTIME2
  cmake-native    do_configure    29.1s   +11.0%    265.7s -> 294.8s

Cumulative cputime:
  18.0s    +2.2%    13:41.4 (821.4s) -> 13:59.3 (839.3s)

Oh, that's odd: it took *more* time to run.  But the output from my
bitbake clearly showed bitbake taking five minutes before and one
minute after.

Oh, *walltime* not *cputime*.

$ buildstats-diff /data/poky-tmp/master/buildstats/* --diff-attr walltime
  PKG             TASK          ABSDIFF  RELDIFF  WALLTIME1 -> WALLTIME2
  cmake-native    do_configure  -214.6s   -82.4%     260.4s -> 45.8s

Cumulative walltime:
  -218.4s    -72.3%    05:02.1 (302.1s) -> 01:23.7 (83.7s)

cputime is generally a more useful metric during a build, but for
isolated tests like this walltime is also relevant. This is
demonstrating that the same work is happening, but in parallel.

Ross

