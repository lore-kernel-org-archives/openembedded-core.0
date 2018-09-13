Return-Path: <ross.burton@intel.com>
Received: from mail-oi0-f48.google.com (mail-oi0-f48.google.com
	[209.85.218.48])
	by mail.openembedded.org (Postfix) with ESMTP id 3362579491
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 23:49:41 +0000 (UTC)
Received: by mail-oi0-f48.google.com with SMTP id 13-v6so11211458ois.1
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Sep 2018 16:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=B8uRwqTRRVzsbLUrQgQ7PYjEn6s6I1VhZziJoWX2G1Q=;
	b=n0X2n5jZe0wy+c4KOpo2R/29HSU9V/ImvwfqTPs5PmkL4l/V3ljz1FOx/PgYygrW3e
	/3/nrSV1/rLDOdBLTMdjGzf7c8sU2N3Bx93CQRi8yKKzExPt6fpawMkDpsmsQygxuIbv
	1tSPwe9ivqp5BZKOBGtBOWz/1ly0fVmTAiIIT6p6LulsBmrxFjtNAmIwyHegalZxOfht
	EAtTsP/rzqVe7unSmy1O+FCCI1ERyyat5FfMA5gJbKz/B/JkpLipmyF6DySWX/jyPJ9Y
	I4YzMB/iqO6zqtX7P3tZEg5Y1ZfM6CM37N5FLH64ie3jdaMdxmTv17S0jNPib5bXfrgV
	QiuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=B8uRwqTRRVzsbLUrQgQ7PYjEn6s6I1VhZziJoWX2G1Q=;
	b=QoB/4yv+oaGPaiAJ1QOUp/8dBylRRdeIIaQwg8r+nJaHuXXuFQ+0DyydODS7iONL4P
	Bp0hVkgMzSugwUCfy0WUhPWiizr/BcaMF15rEADfm1o9YOA/OGz2qxAA/SQSPQ1YfPAb
	smt2mK5R01j/ub+Xc4ro2haPO3gRGKrKJHmAAmf6Ih0OXTo+9pBu89I/eFytGk00shn1
	0I8KqxesAgX2wVZKvdmJD2O42/h0MseKf4x8zD3CDZBGZ/E4a/IquKD7ldUsVH61uKqn
	N8/grwiyW2XD3HdzwaTuSk/CthWTFBBD5RK7oS41A+d23BWtrEkbtb67MnHIP2vzXp09
	IaWw==
X-Gm-Message-State: APzg51B5sGbcbOgwkjpZvoRS8OrkXKdW3BxM21ayfogEh4qu2ZxFdyRo
	bPteEpufeKWNEzecLm/IpZUugr1ApH5ZBS8DK1fgTg==
X-Google-Smtp-Source: ANB0VdalIpvmugW45oXYk7s2IDIykBis59B54tQFbrWLX1xehaRZ7lrEhugUQ0Cr6R0lQ55mJ9onsVZ78MdXL6bl8TA=
X-Received: by 2002:aca:6cd5:: with SMTP id
	h204-v6mr7678985oic.140.1536882582149; 
	Thu, 13 Sep 2018 16:49:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:5756:0:0:0:0:0 with HTTP; Thu, 13 Sep 2018 16:49:21
	-0700 (PDT)
In-Reply-To: <CAJTo0Lb8EDKyH16i5JcpyTQuLG1vPZaxes=B3hUM3=zn0_chsw@mail.gmail.com>
References: <1536868179-5111-1-git-send-email-geissonator@gmail.com>
	<CAJTo0Lb8EDKyH16i5JcpyTQuLG1vPZaxes=B3hUM3=zn0_chsw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 14 Sep 2018 00:49:21 +0100
Message-ID: <CAJTo0LZoPhfR4Ahd_CqXeouPfHoH8+zth_3qr6__rd2xCg2Y9A@mail.gmail.com>
To: Andrew Geissler <geissonator@gmail.com>
Cc: Alejandro Enedino Hernandez Samaniego
	<alejandro.enedino.hernandez-samaniego@xilinx.com>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] python/python3: Move test files to test package
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
X-List-Received-Date: Thu, 13 Sep 2018 23:49:41 -0000
Content-Type: text/plain; charset="UTF-8"

On 14 September 2018 at 00:30, Burton, Ross <ross.burton@intel.com> wrote:
> I suspect simply adding python3.5/*/test/ will catch the bulk of this
> now and in the future.

Gave this a go and annoyingly the manifest generation must sort the
list because the glob works for everything apart from packages after
tests alphabetically, so the tkinter and unittest tests don't get
moved.

I guess we could change the manifest to put the tests package at the
top of the list, and be sure to respect the order when generating the
lists.

Ross

