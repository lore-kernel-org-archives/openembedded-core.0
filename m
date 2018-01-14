Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 142AC786B9
	for <openembedded-core@lists.openembedded.org>;
	Sun, 14 Jan 2018 13:05:13 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w0ED5Ate002083
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Sun, 14 Jan 2018 13:05:12 GMT
Message-ID: <1515935110.29722.214.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alexander.kanavin@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Date: Sun, 14 Jan 2018 13:05:10 +0000
In-Reply-To: <20180112162002.9669-1-alexander.kanavin@linux.intel.com>
References: <20180112162002.9669-1-alexander.kanavin@linux.intel.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.2 at dan
X-Virus-Status: Clean
Subject: Re: [morty][PATCH 1/2] ruby: update to 2.4.0
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
X-List-Received-Date: Sun, 14 Jan 2018 13:05:14 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Fri, 2018-01-12 at 18:20 +0200, Alexander Kanavin wrote:
> Existing version of ruby-native (2.2.5) was crashing on my machine
> (and others' too),
> yet a functional ruby is necessary to upgrade webkit to a version
> that less vulnerable
> to Spectre.
> 
> I've performed the update by copying the ruby recipe directory over
> from the current
> pyro tree; if you want to see the list of specific commits, issue
> this command:
> 
> git log 99656fecf4fa6e24ba49ecb7f26f893e733818a0 meta/recipes-
> devtools/ruby
> (up to commit e593d3aeb2ea5f08d6e0753133fe89e345b339e8)

Fails on musl:

https://autobuilder.yocto.io/builders/nightly-musl/builds/719/steps/BuildImages/logs/stdio

Not sure why ruby-native would fail on musl specifically so could be a
host issue (its on fedora26).

Cheers,

Richard


