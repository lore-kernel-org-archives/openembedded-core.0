Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
	[209.85.221.45])
	by mail.openembedded.org (Postfix) with ESMTP id 95C6D7DA96
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 13:43:08 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id k16so4538443wrn.5
	for <openembedded-core@lists.openembedded.org>;
	Fri, 26 Apr 2019 06:43:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:cc:date:in-reply-to:references
	:user-agent:mime-version:content-transfer-encoding;
	bh=1o88k+6SAQdU8vLGqUvDWyk6QMcDTBax5LIM6y9IIC0=;
	b=PUzymX0v19bBvcOFzXz+m6McUX5SaXGLxMNoELK3XqFGIdwOxmdsfIylauFimNnhXI
	b2WszzDdlRQQacE8Yl9dFWPp3bK9WnmT7I46Xo0QxspDRNUTN3u1ExjQjNQ31xg92TYz
	nTR3hXKOHPdmimK+rt08skgfZ1ad1fAYCw4SQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
	:references:user-agent:mime-version:content-transfer-encoding;
	bh=1o88k+6SAQdU8vLGqUvDWyk6QMcDTBax5LIM6y9IIC0=;
	b=h+7WbNQVgD4l4/rIulMX3JNGHWfb3JyGwuNK8YE+TaDDcUSb16cPmX/rlT1ncY0Vz3
	c5MwxKhC+UaYr80b2pN5dvUP9z8VVHQQFm8m6NVR62PxIq6dPwA9wREUuhrvIXV8nYhE
	mJPUZ0Z5I+5jHYyh1lK7RGKKkVr8hGBjaPK7ZSBoirGCkReSYfrfFaWC+LsK6elHDG3d
	iAzgNcNHshqvh0NZy0QquHvKVot8nYcXwPtogEmD4nZgWPrODwcBEQ+DW6AhGTSjpiHD
	/YLy3tTmzc3BNQqBiYKJpTk7qrw+jYe9ReNE4Xd5xBrZCeLEXhKwttg22sTQNu3BCmhP
	GqhQ==
X-Gm-Message-State: APjAAAWR6qeut1cHLuerQyYW+c59Vd5GJ18+qJhat1dPd+UJHxvmth9a
	CVJS9H2SaFlPAE+hOKEiEIBPoQ==
X-Google-Smtp-Source: APXvYqx+Hy6+Tuh66t8V9TpJmuEkwcZ3TTWoxxLh9C2etRuS0zpnQeOC/pkLeRdqbthDFBnomKFSiA==
X-Received: by 2002:a5d:400e:: with SMTP id n14mr24490414wrp.317.1556286189381;
	Fri, 26 Apr 2019 06:43:09 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	c63sm9337001wma.29.2019.04.26.06.43.08
	(version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
	Fri, 26 Apr 2019 06:43:08 -0700 (PDT)
Message-ID: <9c11e5fa0dd254f99ee1f20d0ab0bfdea0aaad6d.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Jain, Sangeeta" <sangeeta.jain@intel.com>, "'yocto@yoctoproject.org'"
	<yocto@yoctoproject.org>, "Eggleton, Paul" <paul.eggleton@intel.com>, 
	'Michael Halstead' <mhalstead@linuxfoundation.org>, "Erway, Tracey M"
	<tracey.m.erway@intel.com>,  "'sjolley.yp.pm@gmail.com'"
	<sjolley.yp.pm@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Fri, 26 Apr 2019 14:43:07 +0100
In-Reply-To: <015AB11D45F2C442929CB2765DAE738634DDE72D@PGSMSX110.gar.corp.intel.com>
References: <015AB11D45F2C442929CB2765DAE738634DDE72D@PGSMSX110.gar.corp.intel.com>
User-Agent: Evolution 3.32.1-2 
MIME-Version: 1.0
Subject: Re: QA cycle report for 2.7 RC2
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
X-List-Received-Date: Fri, 26 Apr 2019 13:43:08 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Fri, 2019-04-26 at 06:27 +0000, Jain, Sangeeta wrote:
>  
> QA cycle report for 2.7 RC2:
>  
> No high milestone defects. 
> Test results are available at following location:
> ·        For results of all automated tests, please refer to results
> at public AB [1].
> ·        For other test results, refer to attachment [2].
> ·        For test report for test cases run by Intel and WR team,
> refer attachment [3]
> ·        For full test report, refer attachment [4]
> No new defects are found in this cycle.
> No existing issues observed in this release
> No ptests are failing in this release which were passing in previous
> release. No timeout issues.
>  
> QA Hint: One failure was observed on public AB:
>  
> testseries | result_id : qemuppc | oeselftest_centos-
> 7_qemuppc_20190414221329
> runqemu.QemuTest.test_qemu_can_shutdown
>  
> No bug filed for this issue, as it appears to be an intermittent
> failure and worked on rc1 test run.

Thanks for the testing!

FWIW it should have and does have a bug:
https://bugzilla.yoctoproject.org/show_bug.cgi?id=13309
also, 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=12991
is still present in the release according to that bug.

I've asked the TSC for a go/nogo decision on the release.

Cheers,

Richard





