Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f174.google.com (mail-pf0-f174.google.com
	[209.85.192.174])
	by mail.openembedded.org (Postfix) with ESMTP id BDCCF766E1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 16:37:31 +0000 (UTC)
Received: by mail-pf0-f174.google.com with SMTP id y69so43232455pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 09:37:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=mXGL44+IJj3nD7R+TycqYuOIVjjj+GSCfdkKy0n1VwY=;
	b=CaJLNVGBGKBBUlRL0y4HQZrJxf+0Znjym87hZTFzLok2DK0ad2rd72xkpPAND8o53y
	uOuGmPFIQS+UWtG8U/Xbn+ULwe7stuhTsZfwql5w7rjAVnPTrrDJ660hA9tXJX16ZCL5
	A0gSb/IjDHJJImTAjnHnvSKyPNBn7jAk1o48kjEjzYs/tzrUuQCzV+2mHSR8CST28Mz6
	iFs46J7PatTY9DohPcVZOPoQq3GP+hlZKHka7yYmEDV6LzUpNRGe5Vv2UKciJaq4imlt
	5B+M2vcpN253xDQGKp5Ly1r09/AyK42ixycbxE2cOlue/V8bYg8/3x1PWv2xsoDPq01P
	yQIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=mXGL44+IJj3nD7R+TycqYuOIVjjj+GSCfdkKy0n1VwY=;
	b=CPgNPkQ+Hk55TtoquzIvHQgIKQZG8P1h6W91hk9UvMVh0de0bcAFzo5Kq10efNcoc8
	9CH7EKdZQ9nRfena0pBC4zXIhwkxlvf+/kMGYEmKGh/tmpbEFEOJUJfjGdfEpIgfvjco
	Fs00xlJzlH1+FE3NMq6J2T57h39BUd8SHZGbTNIQIzyfPGlWsHjGu/+WNNXoiJmOH1wf
	w5Wxm6v7gX1YXbd+vJfhutJbqm5TkMRJvHhdv9Ksll6+0Xz4zEmVde4cg6xJsJPDtH5F
	1wbJz0IEFLvAnewT/kKok5eKt81qmGm6cZiEnxIc+5rmFbviA/dsTbg1/GFPqTetf0Ki
	NTtw==
X-Gm-Message-State: ALyK8tJT9GfCOOCB1YshxjzJeU9PS9IJOS/SrTEW4rw5qDA35L5LB8b/DpcZaU4KuVyF9w==
X-Received: by 10.98.86.92 with SMTP id k89mr14384594pfb.76.1464367052004;
	Fri, 27 May 2016 09:37:32 -0700 (PDT)
Received: from mail-pa0-f52.google.com (mail-pa0-f52.google.com.
	[209.85.220.52]) by smtp.gmail.com with ESMTPSA id
	e184sm14933622pfe.14.2016.05.27.09.37.30
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 27 May 2016 09:37:30 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f52.google.com with SMTP id fy7so25055455pac.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 27 May 2016 09:37:30 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.6.35 with SMTP id x3mr23767727pax.135.1464367050019; Fri,
	27 May 2016 09:37:30 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Fri, 27 May 2016 09:37:29 -0700 (PDT)
In-Reply-To: <57487580.5010501@gmail.com>
References: <1464356589-7982-1-git-send-email-andrew.shadura@collabora.co.uk>
	<57487580.5010501@gmail.com>
Date: Fri, 27 May 2016 13:37:29 -0300
X-Gmail-Original-Message-ID: <CAP9ODKqD+6EWir8NKU8sHP0t1xhYyWKCOUPu8NzeznxaoqoErQ@mail.gmail.com>
Message-ID: <CAP9ODKqD+6EWir8NKU8sHP0t1xhYyWKCOUPu8NzeznxaoqoErQ@mail.gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: Andrew Shadura <andrew.shadura@collabora.co.uk>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] u-boot: Update to 2016.05 release
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
X-List-Received-Date: Fri, 27 May 2016 16:37:32 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, May 27, 2016 at 1:27 PM, akuster808 <akuster808@gmail.com> wrote:
>
>
> On 05/27/2016 06:43 AM, Andrew Shadura wrote:
>> Upgrade U-Boot to the latest upstream version.
>> Add a patch to unbreak build on some toolchains.
>
> Are this changes appropriate for Krogoth?

I don't think so.


-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

