Return-Path: <richard.purdie@linuxfoundation.org>
Received: from dan.rpsys.net (5751f4a1.skybroadband.com [87.81.244.161])
	by mail.openembedded.org (Postfix) with ESMTP id B53CB796B9
	for <openembedded-core@lists.openembedded.org>;
	Thu,  6 Sep 2018 14:19:08 +0000 (UTC)
Received: from hex ([192.168.3.34]) (authenticated bits=0)
	by dan.rpsys.net (8.15.2/8.15.2/Debian-10) with ESMTPSA id
	w86EJ65t000926
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT); Thu, 6 Sep 2018 15:19:08 +0100
Message-ID: <0644f3e102aafc66473159dd1ebe8123a778792f.camel@linuxfoundation.org>
From: Richard Purdie <richard.purdie@linuxfoundation.org>
To: Alexander Kanavin <alex.kanavin@gmail.com>,
	openembedded-core@lists.openembedded.org
Date: Thu, 06 Sep 2018 15:19:06 +0100
In-Reply-To: <1536230436-30342-18-git-send-email-alex.kanavin@gmail.com>
References: <1536230436-30342-1-git-send-email-alex.kanavin@gmail.com>
	<1536230436-30342-18-git-send-email-alex.kanavin@gmail.com>
X-Mailer: Evolution 3.28.1-2 
Mime-Version: 1.0
X-Virus-Scanned: clamav-milter 0.100.1 at dan
X-Virus-Status: Clean
Subject: Re: [PATCHv2 18/21] meson: update to 0.47.2
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
X-List-Received-Date: Thu, 06 Sep 2018 14:19:09 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Thu, 2018-09-06 at 12:40 +0200, Alexander Kanavin wrote:
> Drop backported patches, refresh the rest.
> 
> Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>

nativesdk-meson-0.46.1-r0 do_fetch: Fetcher failure for URL: 'https://github.com/mesonbuild/meson/releases/download/0.46.1/meson-0.46.1.tar.gz'. Checksum mismatch!
File: '/home/pokybuild/yocto-worker/build-appliance/build/build/downloads/meson-0.46.1.tar.gz' has md5 checksum 1698f6526574839de5dcdc45e3f7d582 when 31bda3519d8c0eb3438267268a78085e was expected
File: '/home/pokybuild/yocto-worker/build-appliance/build/build/downloads/meson-0.46.1.tar.gz' has sha256 checksum 19497a03e7e5b303d8d11f98789a79aba59b5ad4a81bd00f4d099be0212cee78 when 92d8afd921751261e36151643464efd3394162f69efbe8cd53e0a66b1cf395eb was expected
If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
SRC_URI[md5sum] = "1698f6526574839de5dcdc45e3f7d582"
SRC_URI[sha256sum] = "19497a03e7e5b303d8d11f98789a79aba59b5ad4a81bd00f4d099be0212cee78"
Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.

This is because there is a nativesdk-meson recipe sitting alongside the
one you updated...

Cheers,

Richard

