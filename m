Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Hongxu.Jia@windriver.com>) id 1UVXYS-0005tG-3G
	for openembedded-core@lists.openembedded.org;
	Fri, 26 Apr 2013 03:34:28 +0200
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3Q1GgDR012493
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 25 Apr 2013 18:16:42 -0700 (PDT)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 25 Apr 2013 18:16:41 -0700
Message-ID: <5179D571.1020608@windriver.com>
Date: Fri, 26 Apr 2013 09:16:33 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130329 Thunderbird/17.0.5
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1366802026.git.hongxu.jia@windriver.com>
	<6471223fe7c0d17e2a3209b58f1b1ebdba165a9f.1366802026.git.hongxu.jia@windriver.com>
	<CAJTo0LY1H9XzeVps7MXtLLythCfzpnGzc51D_zS44Yum-KKYUg@mail.gmail.com>
In-Reply-To: <CAJTo0LY1H9XzeVps7MXtLLythCfzpnGzc51D_zS44Yum-KKYUg@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] systemd: fix do_compile failed in parallel builds with system's make 3.28
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Apr 2013 01:34:34 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/25/2013 05:54 PM, Burton, Ross wrote:
> On 25 April 2013 09:16, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> 3, Add `make-native' to systemd's `DEPENDS' to use Yocto's make rather
>> than system's to compile systemd.
> NACK.
>
> Installing make-native during a build will lead to races over the make
> binary, causing strange and non-obvious build failures.
>
> A unpatched 3.82 in certain distros (F16 is the only culprit that I'm
> aware of) is a known issue and we'll be adding to the release notes
> that if you have a broken make, run "bitbake make-native" *first*.
>
> Opensuse 12.1 has the patches required to fix this
> (https://build.opensuse.org/package/show?package=make&project=openSUSE%3A12.1%3AUpdate,
> make-parallel-build.patch, added 5 weeks ago) so please update your
> distro and this will fix itself.
>
> I'm also told that 12.1 will be EOL in 21 days from now, so you should
> consider upgrading to 12.3.
>
> Ross
Got it

Hongxu


