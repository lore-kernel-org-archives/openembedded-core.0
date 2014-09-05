Return-Path: <ross.burton@intel.com>
Received: from mail-qa0-f51.google.com (mail-qa0-f51.google.com
	[209.85.216.51])
	by mail.openembedded.org (Postfix) with ESMTP id 679BA71412
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Sep 2014 10:00:54 +0000 (UTC)
Received: by mail-qa0-f51.google.com with SMTP id j7so10574762qaq.24
	for <openembedded-core@lists.openembedded.org>;
	Fri, 05 Sep 2014 03:00:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=1vmEugizDFujlXyzvhA7Sxbk6xnPFnU+UP3TZeVlw9Q=;
	b=eEMwJMJavI3eS/pv9gqjP/ZQn/rBhnh9V+MYJNzABYKJCR1Tvc0+J9gfSitWfMMJqm
	DOT+8CdgA15OHu0FNB4/AfVbiPUOzLFXd3Iju8Du4CCKvh0ZZfWofdycJPUNawvH1xUD
	HSCOnISJIvDmG0TBIcn+X7TQeX/jF3vcP4yHONar1GzKiyhGym2mXs0p4W3I56jSXFq3
	NyTPa1yK7EC2hEiKfyfcofLwHRWFQwOmlLM5AMm19uqHWUtRq4UEksxnFJy5Z+SMrmzU
	rEvTDCAFH4uQ8hpWthfnXxQndalThlvX0B/5ez+f+MH/pHXrIUN0gkKLywQncjHV++M1
	EW/Q==
X-Gm-Message-State: ALoCoQnK+yzoIe1W2CFmsk24Kfpatexi7Ns6AsyzBEdsylRTb5/vDXB29iBhJe0Knt9N4bjS2Oh1
X-Received: by 10.140.27.173 with SMTP id 42mr15708349qgx.59.1409911256039;
	Fri, 05 Sep 2014 03:00:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.29.183 with HTTP; Fri, 5 Sep 2014 03:00:35 -0700 (PDT)
In-Reply-To: <1408514703-6424-1-git-send-email-akuster808@gmail.com>
References: <1408514703-6424-1-git-send-email-akuster808@gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 5 Sep 2014 11:00:35 +0100
Message-ID: <CAJTo0LZpP9z_cMfdfT3M8mD1K19oDGPq--xiYB2N7maJtx9AaQ@mail.gmail.com>
To: Armin Kuster <akuster808@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [[PATCH] python: add webbrowser module
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
X-List-Received-Date: Fri, 05 Sep 2014 10:00:55 -0000
Content-Type: text/plain; charset=UTF-8

On 20 August 2014 07:05, Armin Kuster <akuster808@gmail.com> wrote:
>  meta/recipes-devtools/python/python-2.7-manifest.inc | 2 +-

As the comment at the top of that file says, this is a generated file.
Please patch scripts/contrib/python/generate-manifest-2.7.py and then
re-execute the script to update the manifest.inc.

Ross

