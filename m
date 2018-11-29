Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 299C36D686
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Nov 2018 14:06:35 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	wATE6WMp019414
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 29 Nov 2018 14:06:33 GMT
Message-ID: <70743b99abf1bf4f41da716a698433013ea92780.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 29 Nov 2018 14:06:32 +0000
In-Reply-To: <20181129092115.28502-1-paul.eggleton@linux.intel.com>
References: <20181128215407.13237-1-paul.eggleton@linux.intel.com>
	<20181129092115.28502-1-paul.eggleton@linux.intel.com>
User-Agent: Evolution 3.30.1-1build1 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.2 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH v3 4/4] oe-selftest: add some tests for recipeutils module
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
X-List-Received-Date: Thu, 29 Nov 2018 14:06:36 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-11-29 at 22:21 +1300, Paul Eggleton wrote:
> Add some tests for functions in meta/lib/oe/recipeutils.py, in
> particular for a few issues I've just fixed. I haven't added tests
> for
> all of the functions - some of them are already being tested via
> devtool
> in any case.

Hate to say it but this still isn't working:

https://autobuilder.yoctoproject.org/typhoon/#/builders/79/builds/28/steps/7/logs/step2d

probably due to it not working with the -j option :/

Cheers,

Richard


