Return-Path: <lpapp@archlinux.us>
Received: from mail-pb0-f47.google.com (mail-pb0-f47.google.com
	[209.85.160.47])
	by mail.openembedded.org (Postfix) with ESMTP id 65D4E6F6E0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 10:49:20 +0000 (UTC)
Received: by mail-pb0-f47.google.com with SMTP id up15so7078456pbc.34
	for <openembedded-core@lists.openembedded.org>;
	Mon, 10 Mar 2014 03:49:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=FfKXyEyiKXSsUaIQwfHSbeJp71WYpu2HEn3VgjtQB+U=;
	b=F5xow8ZdTK0mHdlK9jikb56vUtxEXZx6jdBPSVzLS59NWjD7BqepL61/aQ5nKL567c
	5P1eSryPcrCyG978jf7vLLTEVlU8EsyvE+g2sAAILc1BvZ0yWbAbv9tCsFM6Dxh7SXQ6
	OiVXDDsEZAUVTXml1hTbpN8keBIVe8WnoxC6FAYBe5Uymz7DPJn8SCq3Q9VsHQQPe95a
	xI3CirhnGuTYqC0Kff6+xNCg2WGG1fK45ZmOA/dSS6sXLBjF94nagXsnIB2MaQbQ8btJ
	Nf7eYc/1U9G7Ev3n4iED25sfYwAHxxfp5yX2RSZrX0aLr4oojUDY2MGd+eyGFZ3zMOVt
	JUmw==
X-Gm-Message-State: ALoCoQnYuQ3MnTwx65GfVNmliofeTuuesMTxQEkUhHpKDjpCdRP73rjVZR6bz0+eoFhHA9DdJCMw
MIME-Version: 1.0
X-Received: by 10.66.121.195 with SMTP id lm3mr903411pab.154.1394448562062;
	Mon, 10 Mar 2014 03:49:22 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.26.195 with HTTP; Mon, 10 Mar 2014 03:49:21 -0700 (PDT)
In-Reply-To: <20140225072200.GA2985@ad.chargestorm.se>
References: <CAOMwXhOmoLP_8+mv_c_4Eg8YG_T1JD-ao+P1S9FDKvityy_3mA@mail.gmail.com>
	<CAJTo0LY6hsYxR2=aeRodKhZ+5VBEUh+q+7nRYU0E6XYc+Pn-NQ@mail.gmail.com>
	<CAOMwXhN+D+kGw70ijEs_Zd9aNiLsmuts0B6SHf9QXkytgaQCPA@mail.gmail.com>
	<20140224135848.GA26295@ad.chargestorm.se>
	<CAOMwXhMsjQ2v40hM5UCx1R_NHnop2G2z_kTDVCqV4dWPwXW9EQ@mail.gmail.com>
	<20140224145117.GB26295@ad.chargestorm.se>
	<CAOMwXhOOghbcYwYyn__0=RxgipM_mFz-d6vwmqtebCpiW8_R3Q@mail.gmail.com>
	<20140225072200.GA2985@ad.chargestorm.se>
Date: Mon, 10 Mar 2014 10:49:21 +0000
X-Google-Sender-Auth: Qw8HJzf4L_LY2ahSbp98sw25rWI
Message-ID: <CAOMwXhOQiR-WxYcJsA8iEFUtW-UA7miAXHxHZ7xHo63mJTrU3w@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: Laszlo Papp <lpapp@kde.org>, "Burton, Ross" <ross.burton@intel.com>, 
	openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: No versioning for existing images
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
X-List-Received-Date: Mon, 10 Mar 2014 10:49:23 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 25, 2014 at 7:22 AM, Anders Darander <anders@chargestorm.se> wrote:
> Well, if you set it as a variable, you can always use it in e.g. the
> IMAGE_PREPROCESS_COMMAND, to store it to a suitable file in the image.
> Just as I'm storing the output from git describe.

This makes me think that it would be nice to have a dedicated variable
for this version that automatically populates a "standard place", e.g.
/etc/version. That could standardize this process across projects,
although it could be made customizable on top of the default if one
wishes to do it differently. So, how about an IMAGE_VERSION variable
which would be put into the image name if specified, and the string
would also be put into some place on the target, like "/etc/version"?

> If you plan on keeping multiple image versions (which you should do at
> least for released images), you likely should then append your version
> number to the image names (and possibly some more info), or at least
> store them in a versioned tree/repository for easy retrieval.

Yes, I agree that version numbers should be put into the image name.
Yes, a "versioned tree" makes sense, which I think we can call a
mirror for instance. I think that is enough for binaries, and perhaps
it is better than a separate versioned repository on top of the
already existing tags.

