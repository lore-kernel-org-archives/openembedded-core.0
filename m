Return-Path: <rpurdie@rpsys.net>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 648EC71974
	for <openembedded-core@lists.openembedded.org>;
	Thu,  5 Apr 2018 16:44:31 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-3) with ESMTPSA id
	w35GiU4T020284
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128
	verify=NOT); Thu, 5 Apr 2018 17:44:31 +0100
Message-ID: <1522946670.11431.428.camel@rpsys.net>
From: Richard Purdie <rpurdie@rpsys.net>
To: Armin Kuster <akuster808@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 05 Apr 2018 17:44:30 +0100
In-Reply-To: <cover.1522806183.git.akuster808@gmail.com>
References: <cover.1522806183.git.akuster808@gmail.com>
X-Mailer: Evolution 3.18.5.2-0ubuntu3.2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.99.3 at dan
X-Virus-Status: Clean
Subject: Re: [PATCH 00/21] Package updates for Master
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
X-List-Received-Date: Thu, 05 Apr 2018 16:44:32 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

On Tue, 2018-04-03 at 18:48 -0700, Armin Kuster wrote:
> Please concider these changes for master next. 
> The X11 changes should not go in sumo. These changes will affect
> meta-oe
> and possible others
> 
> The following changes since commit
> 4cedddb83623c79980b354642dfeaf78218ca4b7:
> 
>   libpcre-ptest: skip locale test (2018-03-30 09:40:34 +0100)
> 
> are available in the git repository at:
> 
>   git://git.openembedded.org/openembedded-core-contrib
> akuster/master-updates
>   http://cgit.openembedded.org/openembedded-core-contrib/log/?h=akust
> er/master-updates

https://autobuilder.yocto.io/builders/nightly-musl-x86-64/builds/389/steps/BuildImages/logs/stdio

I think we may need to remove libxcalibrate, its probably obsolete now
anyway?

Cheers,

Richard


