Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 84A3960118
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 14:21:36 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id r187so7782303pfr.2
	for <openembedded-core@lists.openembedded.org>;
	Thu, 12 May 2016 07:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=PFGdJ2bstbsewsw5fFj2KLscODEKQDzyD+qC+ABf9SI=;
	b=WNXGCTlIqEDhu8d9Tf1ZfPmp9dKWJbM8E2Djo/4M4HWDjSQqC8jmyGXaBHn19f7+rj
	LkTmmorO1ZiA53jdRYrP+fHpVYu9pl4YgK/q5PJuDL3qYSfdgdklt8xOkcwcjX4Ypp/t
	7y0PikF6ETfgJiuWgRXlDyNTrm07STlbGtcM0HE4JVrbcJBpYopy5ZAlSYBIAmmytle6
	ciqJj/XHXBwteE5RFSKV9QHX4lT4Wlno3RHraAGMz1H8++OaxWCqMbpJ3Yit934JLqmj
	UZ0LnNU/Ng0+1WuBiVfqRSBMDKM6+wgI5eyoA2TmF72QRsZgXttWKPN/RUMdFjs+YgAr
	wWDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=PFGdJ2bstbsewsw5fFj2KLscODEKQDzyD+qC+ABf9SI=;
	b=KkRfCYY0i/vufn62paWUXw18xTQuG2b6+Det+q/oLuj3uBPgIWe8JppMD1mg2JGi9Z
	MdXcSj1vo0Cs2RPFEbDf9DpZwrHVxrBZ5J+T/ItlIc5EV3UWT+BqnagAL9umkoT0KwxZ
	AvYg0UR6d7nk+ILm3Q1dXmoM8jK0h7YMRztOHUo28ox5xCedCsXV7t8q/hyvdbc53FyD
	LS6QGZiOFLjKzhL9taVUVXQcMVY8COww6iGihrU9DtVQIF2T4ErYSJOoKaayfj/N47f1
	aQgLFuggb/mf85+BS2E0cd49OBWaQLlB3AF8VtA/yg4cS7JnIwFPIDX6uiVBn2GKfJbA
	iPIA==
X-Gm-Message-State: AOPr4FWuAikxeQb7hFXMkZtfznzQzgvq3OWCa/tMXrtFp0cUEgHynzoSXTO+TUXBdDtVZhUBdvZI9YoZy8VzBA==
X-Received: by 10.140.30.246 with SMTP id d109mr9475097qgd.25.1463062897326;
	Thu, 12 May 2016 07:21:37 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.55.130.196 with HTTP; Thu, 12 May 2016 07:21:07 -0700 (PDT)
In-Reply-To: <CADkTA4MXrL5Z+TwOU=O9dJseT-mFWKBNka1D2Gvb+740zQ+jYg@mail.gmail.com>
References: <cover.1462987863.git.raj.khem@gmail.com>
	<2e51e9b5fb3911436afc1becd5feb9351b896fa4.1462987863.git.raj.khem@gmail.com>
	<1d16314288f1f93b21bacd0016d23abcab52b501.1462987863.git.raj.khem@gmail.com>
	<CADkTA4P6hCQBMgNXZZY80OTSH2vuxjw0h27fgNvN8p22u8riAQ@mail.gmail.com>
	<CAMKF1srqdFXR4jD12MFL1rwco2aCyKYwh7dwKnNbC6xnu6ON0Q@mail.gmail.com>
	<CADkTA4O+yfpCXFzpqWcE1sC0TKD6TH2Xfbt7xiA3ncxBkYikTg@mail.gmail.com>
	<CAMKF1sonno53gN+P8=Sdxems6pZnDEGqMCMNzObJsqByPjda7A@mail.gmail.com>
	<CADkTA4M3S=rRWD8+-j+qo0jCJ1AmSJjNEDOy61+AXMLJwRmv8w@mail.gmail.com>
	<CADkTA4MXrL5Z+TwOU=O9dJseT-mFWKBNka1D2Gvb+740zQ+jYg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 12 May 2016 07:21:07 -0700
Message-ID: <CAMKF1sq8GmdowYQf6cyVJZxmXWzi7y+usAe-wpTVq2kjztXEQA@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 22/42] linux-yocto: Fix build on ppc with gcc-6
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
X-List-Received-Date: Thu, 12 May 2016 14:21:40 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, May 12, 2016 at 6:28 AM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> The patches are not integrated into linux-yocto-4.4 and I added the patch
> I've
> attached o my zedd/kernel poky-contrib branch:

Nice, is this branch already proposed for merge ?

