Return-Path: <richard.purdie@linuxfoundation.org>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 7B62F79AB9
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 09:00:01 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id 61-v6so20319069wrb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 15 Oct 2018 02:00:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linuxfoundation.org; s=google;
	h=message-id:subject:from:to:date:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=dh8i1PXePpwOvnwvA2UCDpvZ2M5DOoW3Ct22HnmRIpU=;
	b=eg7pm+GTTZJ6G129c7AWBoiW6HDZNS2scBo6WeCmIH6/AnkOAN1F9NQVo/jRJax2lW
	sH9ru/xwFDs82gUp5uj9eAY+a6Yp8UhIF5R7qPtYxghdRvkENQTGEOgGLEsxPp2tS/J0
	uu1N3SOmlO/F0P4oXruXmqqu5YnC3d3J6YO3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=dh8i1PXePpwOvnwvA2UCDpvZ2M5DOoW3Ct22HnmRIpU=;
	b=sLoGMYZr/TvG6Aae6ostk4xQrmWmM3EyvQ1OjXyV44ypnqanxbrJLv38kFTvHHL+t0
	aZe1PYloBSc1DbzLNSTCxrorXkIE1w1eVqXLwayZ3gQg2bTsmyq9jgNwU4SBAq+bvH+c
	ivKrMQNmtM+6TKj9s3U33/9JQVimBknArqftwhbNm5UqtiYmIt5qxmWXRASg23kM4QP7
	uE1bJP0Vi92bizbBWAnD1/EoCtJM5XBpZ/GjOCtv5GRXWjsjJplMaFIfPnxBc+ErycLh
	OKUh1zHbU4BIC2+OIDCo/JxrUFyI7AJ8FzwWlZ4DUCPB1SXjObXMmtBzmkEXIyvWcwYO
	SAzA==
X-Gm-Message-State: ABuFfohFmE4Mr7A//GbHg4nUvmkBjwLRk/Yh+fShxc3ACT0MiLAUWC+e
	BME8oeDraGD+oVmNm2/R9HkzpA==
X-Google-Smtp-Source: ACcGV612yhDackw3Ex4DXLeg7Bmk2lJLgwhstusCfzBgcmKVE5g6JTWN76wsPr93LFh2W6TJa1k2Gg==
X-Received: by 2002:adf:f681:: with SMTP id
	v1-v6mr14547776wrp.201.1539594001957; 
	Mon, 15 Oct 2018 02:00:01 -0700 (PDT)
Received: from hex (5751f4a1.skybroadband.com. [87.81.244.161])
	by smtp.gmail.com with ESMTPSA id
	s7-v6sm16910140wmd.0.2018.10.15.02.00.00
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 15 Oct 2018 02:00:01 -0700 (PDT)
Message-ID: <b3886f4b8368d523f999a2706e18cd36b257d084.camel@linuxfoundation.org>
From: richard.purdie@linuxfoundation.org
To: "Yeoh, Ee Peng" <ee.peng.yeoh@intel.com>, 
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Date: Mon, 15 Oct 2018 09:59:59 +0100
In-Reply-To: <9DDD2658D1FE414E99172D2DB1E4D04335ECB1EB@KMSMSX155.gar.corp.intel.com>
References: <1539325990-89780-1-git-send-email-ee.peng.yeoh@intel.com>
	<42cf8bddb48f276864dab5f7f71f2a3ae7eb670f.camel@linuxfoundation.org>
	<9DDD2658D1FE414E99172D2DB1E4D04335ECB1EB@KMSMSX155.gar.corp.intel.com>
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Subject: Re: [PATCH 1/4] oeqa/core/runner: write testresult to json files
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
X-List-Received-Date: Mon, 15 Oct 2018 09:00:01 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hi Ee Peng,

On Mon, 2018-10-15 at 08:42 +0000, Yeoh, Ee Peng wrote:
> Thank you very much for your inputs!
> I had completed making most of the enhancements following your
> inputs, except the 1 input to put test result logs alongside the test
> result data in the json file. 
> The concerns I have over putting test result logs into test result
> json file:
> 1. Test result logs will be arbitrary long depending on the type of
> failure/error and tetecase. With test result logs adding to the test
> result json file, it will potentially making it hard to read the json
> file, where the test logs will potentially span over multiple lines. 
> 2. By having test logs per each test case in separate file, it will
> allow quick and easy regression of test logs per specific test
> case.  By putting all the test logs into the one testresult json
> file, I am worry that it will make regression on test logs per
> specific test case harder. 
> 
> I hope the concerns above justify keeping test logs separate from
> testresult json file. Please let me know your thoughts and inputs. 

The log data and the test results are connected and belong together.
The intent here is to make files which capture the results information
and direct user readability is a secondary issue, these files are not
intended to be directly read by humans.

If we need a clean readable output, I'm imagining we'd have a simple
processing tool which could for example just filter out the test
results.

Having a single results file also makes it easier for the automated
systems to collect up the results files from different autobuilders and
also makes it easier to potentially merge results together.

One piece I suspect may also be missing is that we may need to record
some extra information into these files too, such as the MACHINE,
DISTRO, hostname of the builder that ran them and the revision of the
codebase (layers) used to run the test. There is probably other
information we need to record in order to make these results useful in
the wider context of the project but I do believe it can and should be
recorded in a single file.

Does that help explain why I'm asking for this?

Cheers,

Richard




