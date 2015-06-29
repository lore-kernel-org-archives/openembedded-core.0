Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f182.google.com (mail-qk0-f182.google.com
	[209.85.220.182])
	by mail.openembedded.org (Postfix) with ESMTP id 398E972D64
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 11:43:23 +0000 (UTC)
Received: by qkeo142 with SMTP id o142so92860381qke.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 29 Jun 2015 04:43:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=5HPQVVmclXuGwbigl9NBWQS2y2mceIEVjXB4OEjiXVc=;
	b=d6ULsJXP9BPVj3ukVLGCVEBz2Wsm+2YBQ01WLExGbc0Q2xI8/y2AHVciJVC6McL2lz
	EryjmAqS/5qXWFezsbV/p/ZIVtgdesHIv5fvaDkSBFKU107hvgAQwsqK+k8cjV+vQQY+
	fAckLllS90OJBoVtdjcbtwA3eMfw7RYXueVDBSi0c+Bph1ACSOUZxlp9PCXsHCcur2Ba
	rkXHXyQqatFCXQHzN/pbb3vL4RzVWqdtScIlGZ/0SMA5Pmg5AutXQEaJcLarhctoQmAy
	5v7dhrwkKPC9uRsrbDY9cl+IM9QoPmPa45yQFAjUvtHFzqwzJGxnE3KXHAocCVQaoVd2
	/5+A==
X-Gm-Message-State: ALoCoQmpA4QQg4+eC1u6SIDJEJKWLZkLx7AQreYY8I1DfnPHV2YtY8AIHfzzoWQo6aHgjXDMfpRQ
X-Received: by 10.55.27.11 with SMTP id b11mr30771315qkb.105.1435578204480;
	Mon, 29 Jun 2015 04:43:24 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.102.231 with HTTP; Mon, 29 Jun 2015 04:43:04 -0700 (PDT)
In-Reply-To: <20150629111839.GB2393@jama>
References: <cover.1435297800.git.mariano.lopez@linux.intel.com>
	<e70f95d9bb6247ec0f305966894b22f681135013.1435297800.git.mariano.lopez@linux.intel.com>
	<CAJTo0LZrsr7u7a-jRhoG6nKP51vXBGCiuRsm51YoySiK_YSxsg@mail.gmail.com>
	<20150629111839.GB2393@jama>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 29 Jun 2015 12:43:04 +0100
Message-ID: <CAJTo0LZ4fC8k889WXqfgvqLxGMZgZvQoCe3RGZTEvYxaf0xjow@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] report-error.bbclass: Added file syncronization.
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
X-List-Received-Date: Mon, 29 Jun 2015 11:43:27 -0000
Content-Type: multipart/alternative; boundary=001a1147f32eecfc8f0519a69803

--001a1147f32eecfc8f0519a69803
Content-Type: text/plain; charset=UTF-8

On 29 June 2015 at 12:18, Martin Jansa <martin.jansa@gmail.com> wrote:

> This is about multiple TaskFailed events being processed at the same
> time, isn't it? So it's still part of the same report and unrelated to
> uploading to web app.
>

In which case the last task wins, as they're all writing to the same
filename right?

Ross

--001a1147f32eecfc8f0519a69803
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_extra"><br><div class=3D"gmail_quote">=
On 29 June 2015 at 12:18, Martin Jansa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:martin.jansa@gmail.com" target=3D"_blank">martin.jansa@gmail.com</a>&gt=
;</span> wrote:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 =
.8ex;border-left:1px #ccc solid;padding-left:1ex"><div id=3D":pp" class=3D"=
a3s" style=3D"overflow:hidden">This is about multiple TaskFailed events bei=
ng processed at the same<br>
time, isn&#39;t it? So it&#39;s still part of the same report and unrelated=
 to<br>
uploading to web app.</div></blockquote></div><br>In which case the last ta=
sk wins, as they&#39;re all writing to the same filename right?</div><div c=
lass=3D"gmail_extra"><br></div><div class=3D"gmail_extra">Ross</div></div>

--001a1147f32eecfc8f0519a69803--
