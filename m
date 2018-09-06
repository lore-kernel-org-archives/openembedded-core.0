Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id 7DAE8747EC
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 22:10:04 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w86M9wFc006866
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 6 Sep 2018 23:09:59 +0100
Message-ID: <c80953d2f382acbad05588fbbd9817ec83b7b8ef.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 06 Sep 2018 23:09:58 +0100
In-Reply-To: <1536230436-30342-2-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
	<1536230436-30342-2-git-send-email-alex.kanavin@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Cc: Alexander Kanavin <alexander.kanavin@linux.intel.com>
Subject: Re: [PATCHv2 02/21] sysprof: update to 3.30.0
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
X-List-Received-Date: Thu, 06 Sep 2018 22:10:05 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-09-06 at 12:40 +0200, Alexander Kanavin wrote:
> From: Alexander Kanavin <alexander.kanavin@linux.intel.com>
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

Fails to build on musl:

https://typhoon.yocto.io/#/builders/11/builds/43/steps/7/logs/step1b

Cheers,

Richard

