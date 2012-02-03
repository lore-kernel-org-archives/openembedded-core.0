Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ken.werner@linaro.org>) id 1RtLh3-00078P-Fj
	for openembedded-core@lists.openembedded.org;
	Fri, 03 Feb 2012 17:09:13 +0100
Received: by bke17 with SMTP id 17so3364405bke.6
	for <openembedded-core@lists.openembedded.org>;
	Fri, 03 Feb 2012 08:01:00 -0800 (PST)
Received: by 10.204.141.14 with SMTP id k14mr3616247bku.67.1328284858407;
	Fri, 03 Feb 2012 08:00:58 -0800 (PST)
Received: from [9.152.213.70] (deibp9eh1--blueice3n2.emea.ibm.com.
	[195.212.29.180])
	by mx.google.com with ESMTPS id cz3sm17918791bkb.3.2012.02.03.08.00.56
	(version=SSLv3 cipher=OTHER); Fri, 03 Feb 2012 08:00:56 -0800 (PST)
Message-ID: <4F2C04B6.3070808@linaro.org>
Date: Fri, 03 Feb 2012 17:00:54 +0100
From: Ken Werner <ken.werner@linaro.org>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:9.0) Gecko/20111229 Thunderbird/9.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <cover.1327684024.git.chris_larson@mentor.com>
In-Reply-To: <cover.1327684024.git.chris_larson@mentor.com>
Cc: Christopher Larson <chris_larson@mentor.com>
Subject: Re: [PATCH 00/10] external-csl-toolchain fixes and improvements
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 03 Feb 2012 16:09:24 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/27/2012 06:13 PM, Christopher Larson wrote:
> From: Christopher Larson<chris_larson@mentor.com>
>
> - Fixes the external-csl-toolchain and corresponding tcmode to be compatible
>    with current metadata (e.g. uses current providers), and ensures it works again
> - Kills the arch and version specific bits, making it work fine with a number
>    of different versions of the CodeSourcery arm, mips, ppc, and ia32 toolchains
> - Makes the packaging match up with the packaging of the internal toolchain by
>    leveraging the eglibc packaging .inc and ensuring our other packages are
>    named correctly
> - Extracts versioning information for both the recipe and emitted packages
>    from the external toolchain at ConfigParsed time. This code is not pretty,
>    largely kept as is from the Mentor internal external toolchain, but it does
>    work. A future commit or commits will clean that up.
>
> I've tested with with the fall 2010, spring 2011, and fall 2011 releases, for
> the qemux86, qemuarm, qemumips, and qemuppc machines. I used buildhistory to
> compare the packages and image content between internal and external, ensuring
> that they match up with almost no differences.
>
> The following changes since commit fba0459da7f274ae284d36b7fdbf2f9d10a52610:
>
>    distro_tracking_fields: fix the typos in the field of maintainer. (2012-01-27 09:52:00 +0000)
>
> are available in the git repository at:
>    git://github.com/kergoth/oe-core external-toolchain

Hi,

Good work!

I just switched to this branch and configured OE-core to compile for 
qemuarm using the external CSL 2011.03 toolchain. When attempting to 
build the sato image bitbake aborts when compiling libproxy_0.4.7.bb. 
I've changed the cmake.bbclass to have cmake find the binaries of the 
external toolchain as posted here:
http://lists.linuxtogo.org/pipermail/openembedded-core/2011-December/014432.html

With this patch applied the build of the core-image-sate and 
qt4e-demo-image finished successfully. Both images are booting fine 
using QEMU.

Regards,
Ken


