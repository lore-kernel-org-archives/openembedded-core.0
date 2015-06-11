Return-Path: <stefan@herbrechtsmeier.net>
X-Greylist: delayed 583 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 11 Jun 2015 17:24:04 UTC
Received: from dd5638.kasserver.com (dd5638.kasserver.com [85.13.130.155])
	by mail.openembedded.org (Postfix) with ESMTP id 00C02757C4
	for <openembedded-core@lists.openembedded.org>;
	Thu, 11 Jun 2015 17:24:04 +0000 (UTC)
Received: from [192.168.1.100] (unknown [176.0.85.151])
	by dd5638.kasserver.com (Postfix) with ESMTPSA id 02DED5600081;
	Thu, 11 Jun 2015 19:14:19 +0200 (CEST)
Message-ID: <5579C1E5.7030307@herbrechtsmeier.net>
Date: Thu, 11 Jun 2015 19:14:13 +0200
From: Stefan Herbrechtsmeier <stefan@herbrechtsmeier.net>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: Moritz Blume <moritz.blume@bmw-carit.de>, 
	openembedded-core@lists.openembedded.org
References: <1433921778-1835-1-git-send-email-moritz.blume@bmw-carit.de>
	<1433921778-1835-2-git-send-email-moritz.blume@bmw-carit.de>
In-Reply-To: <1433921778-1835-2-git-send-email-moritz.blume@bmw-carit.de>
Subject: Re: [PATCH v3 2/2] cmake: Upgrade 2.8.12.2 -> 3.2.2
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
X-List-Received-Date: Thu, 11 Jun 2015 17:24:07 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

Am 10.06.2015 um 09:36 schrieb Moritz Blume:
> Patches "qt4-fail-silent.patch" and "support-oe-qt4-tools-names.patch"
> were adapted in order to fit to CMake 3.2.2 (refer to the commit
> message in the respective patch for details).
> Patch "cmake-2.8.11.2-FindFreetype.patch" was dropped since it was
> rejected upstream and its functionality otherwise implemented in the
> meantime.
>
> Note that CMake 3 needs to have the full compiler path in the toolchain
> file (see cmake.bbclass).
Have you try the new CMake 3 toolchain file variables CMAKE_SYSROOT [1] 
and CMAKE_STAGING_PREFIX [2]?

[1] http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_SYSROOT.html
[2] http://www.cmake.org/cmake/help/v3.2/variable/CMAKE_STAGING_PREFIX.html


