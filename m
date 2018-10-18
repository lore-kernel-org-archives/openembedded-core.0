Return-Path: <ross.burton@intel.com>
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
	[209.85.210.65])
	by mail.openembedded.org (Postfix) with ESMTP id 8BC4E79B85
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 09:22:36 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id c32so29082095otb.8
	for <openembedded-core@lists.openembedded.org>;
	Thu, 18 Oct 2018 02:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=bERD/011OCDcehgHLQg7VqOmXP797EicRwBlA15UQuM=;
	b=sU6QiRfDSH4Y/UB/lBYb+Ga82en9gTcNKh7RI4V4lVEDRLAiZF9FuxMifudmOYFUeo
	+JDgy/z/LyigzTZcP+BiY8WUYtIBMfa2R86bEPUPGnPZbMjOs8jTCv4r5JALvxAlwp8e
	d4OiCTRFIFbxJmIaGVSW3Wzp00b4/P/IL/S3lqrcEinM31qNs6bsNsX16UWyDhWqVIdu
	qIm5CRGDHdMKxj4Oa4TMgezUMUU66nDEdmjZpBhO9uSJFGZa7HtCSio07R/yMWCtNCUg
	vuSvw+3Cc3ltEfBNJBgbxtGdpTocFkVac4oeYmXRGsbT7GChRhX5iU2CZs4GnECOpCVU
	HUgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=bERD/011OCDcehgHLQg7VqOmXP797EicRwBlA15UQuM=;
	b=L839ug2QOGvUmnb9/5PBDJYbOaD8lMKfcytNxR3RZR29Vv1JE5t5khric4+xppRwlN
	PTfn+MM4ERcHxUDGoeg6TQ1Iqmf5v6Mo5t/yCsGiYJ3Nouv8EKph8Bkfj95/1RLtXU/d
	o11/5S9ini5q/bSzsuv9fRAlUB3wNfz+VWjnzT+QfRuN4PvHBtSb1OtSgU3h4z/xK0jK
	lz5x0O2o2b03/EYDuSoQsBnsqF+n5z+NRE6RvAsb9qXKx88K4VnOJL9Re6NJr89zUOrl
	zSqmZeWbti6eZNqs/Z49LEWZNy2bvrG6P2jOkXbFK1ZVifsuUKrjqfNGvBwBgMdyQx4S
	E9pQ==
X-Gm-Message-State: ABuFfogGomFp0aeqesFCYsW1RkaWdBsMYciVliwchYHedFFMsguUCTOS
	3dJfykFoHHmZXHpkBxEMtVvTjOK7nPRcRXm/3ILmiw==
X-Google-Smtp-Source: ACcGV62trA7krQWw33XAxBfkh5irB2T9FhIqXEPH5vv3vtnnguCUNEZ9Vzwl36qvYdceWA8SfWD+mOXeNlEiLA70REY=
X-Received: by 2002:a9d:3e50:: with SMTP id h16mr17159448otg.8.1539854557545; 
	Thu, 18 Oct 2018 02:22:37 -0700 (PDT)
MIME-Version: 1.0
References: <20181016090054.122374-1-mingli.yu@windriver.com>
	<fb67373823b7952f1acf022bed6bd40611c74754.camel@linuxfoundation.org>
	<CAJTo0LbbgiiPQSanVFuibf2PpYmVr9t1vebxZD6OT7DF+BdhDw@mail.gmail.com>
	<CAJTo0LZT1ytnsBoKkfdwv8GThzsOCjoQtLdbe9dtFPMaPupMxw@mail.gmail.com>
	<CAJTo0LY79q4La-mTQwG552XAkwJ8UTLp9yztVCd4g7m-pogpKw@mail.gmail.com>
	<5BC6CCD3.4050003@windriver.com>
	<CAJTo0LaYemE+q9=n0LTET2DzsQgGQPWSH+bmaM0k4ifa9oRM+A@mail.gmail.com>
	<5BC7EFBC.9070105@windriver.com>
In-Reply-To: <5BC7EFBC.9070105@windriver.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 18 Oct 2018 10:22:26 +0100
Message-ID: <CAJTo0LYBVLU90K5+693FiPgQUUSKRtX30WtsHntbhfsCPCxDgA@mail.gmail.com>
To: Mingli Yu <mingli.yu@windriver.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] boost.inc: make libboost_python3.so available
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
X-List-Received-Date: Thu, 18 Oct 2018 09:22:36 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 18 Oct 2018 at 03:29, Yu, Mingli <mingli.yu@windriver.com> wrote:
> Many thanks for Ross's clarification!
> If we need to fix the packages one by one, but not add the hack at boost
> side, then https://bugzilla.yoctoproject.org/show_bug.cgi?id=12833
> should be invalid.

Agreed, done!

Ross

