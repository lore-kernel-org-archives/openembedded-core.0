Return-Path: <raj.khem@gmail.com>
Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com
	[209.85.210.195])
	by mail.openembedded.org (Postfix) with ESMTP id 7C9436198A
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 18:00:02 +0000 (UTC)
Received: by mail-pf1-f195.google.com with SMTP id i19so2098032pfa.2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 28 Feb 2020 10:00:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=j2AlWBQ5nBBurto0uVF4Fh/+oSHDOCdGQdeyrd4f3w8=;
	b=BoBFaeLIaTHFihjqpy5IcPDgTXjcKuDwHICI73LZoRsNVDQWzBzcOWll0pKmV0fS6k
	op0OivfZXqaIEDneoW7EkovCLRHLijmj1cH2I0fSODw/cIvn412gkOQKgVYRhCPdkNZI
	Mr8q8wrJU/VqQNTOAzXbfjVwLpnTwbKwBsGyPvUJRmg7URB2cXwMaaBiI9z+EYOKtptj
	HAURf7D0I7KMTA4RbmJHfebFPwe1l8dZcw1E2yLbrEVPyd7FCiiCgx3yItutBp06gTh1
	BLUU/YdQoPYPBMSzM/5gEU5UF5uloyy8g4wNKNIdlY/k4nR38e+RR8QJJ9tkH/yuU4cp
	Z2VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=j2AlWBQ5nBBurto0uVF4Fh/+oSHDOCdGQdeyrd4f3w8=;
	b=awfW7u3G4wUp3HC0RSy1BAuT3Vw4q8w+cAVdItMWZTGWWKAR7BSXbdvDGl2nBVtWyt
	A2EIqLsoyf1iPaFoVeGMZyZYo24XsT2AUeDE/KjoBqWnRMrSweYUU3Z0NOCZl5Ptfjdo
	RV+fU0SfYZCe/t+SLlDr8Nx5o5Dm+GpBkzmq8lJvyVsxdcO9uD742yGjFncFTVZuPlHu
	Z6h8nxtBKreTUfBlWaEP2ZAkSIHBGnO9hpJNp/v+HXHcQScc+Io1j+GDVARwjXdfNlZI
	Y6Ou3U+QvyzsSnhrtXMtQDoKn8BlzJKIhJzw5EhQGw6Tfbv0+yEtU2cR+VjLoMpRn4k3
	HTog==
X-Gm-Message-State: APjAAAVGfsD/qVGOyYoAtJK35IFRZVayLrJ/ke3+OsDaWr8OjWiB1mKM
	JZbYtSPF/fWh9P3BXtbwaVQ=
X-Google-Smtp-Source: APXvYqyurSBQ36lCjbLPS//puEtUThbzYpXR9xcHgfQFpHws+UO5EmvCdV3ubQ7zna2Em91VLIkrqg==
X-Received: by 2002:a63:82c6:: with SMTP id w189mr5575781pgd.357.1582912803470;
	Fri, 28 Feb 2020 10:00:03 -0800 (PST)
Received: from ?IPv6:2601:646:9200:4e0:98ae:deb2:aaad:7898?
	([2601:646:9200:4e0:98ae:deb2:aaad:7898])
	by smtp.gmail.com with ESMTPSA id
	x197sm7916293pfc.47.2020.02.28.10.00.02
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 28 Feb 2020 10:00:02 -0800 (PST)
To: Alexander Kanavin <alex.kanavin@gmail.com>, Tim Orling <ticotimo@gmail.com>
References: <20200227000603.14252-1-timothy.t.orling@linux.intel.com>
	<20200227000603.14252-4-timothy.t.orling@linux.intel.com>
	<2c3ea5cc-29e6-0ce6-f9b3-c720e835e363@intel.com>
	<7956231e-1523-6213-b757-633b75eb2eb2@gmail.com>
	<CANx9H-CiC8xMqVKDYXzAupOrShPvGvpeu0j8r0CFjZ0OTSdsJA@mail.gmail.com>
	<CANx9H-BuKY5DONf26jnVJLseUmv9C6FqRZU_Aw2aGpBr5nswZw@mail.gmail.com>
	<CANNYZj-LiYrmK6-ihTxgtMBSCqb2Yg_HmooG7QJOQ=_MtdP9+Q@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Message-ID: <a9437810-c735-8a89-44b0-6b7837e88818@gmail.com>
Date: Fri, 28 Feb 2020 10:00:01 -0800
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <CANNYZj-LiYrmK6-ihTxgtMBSCqb2Yg_HmooG7QJOQ=_MtdP9+Q@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 3/4] at-spi2-atk: upgrade 2.32.0 -> 2.34.1
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
X-List-Received-Date: Fri, 28 Feb 2020 18:00:03 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit



On 2/28/20 1:30 AM, Alexander Kanavin wrote:
> I actually have a number of patches I have to hold because they don't 
> build or don't work on centos 7.
> Latest atk and friends included:
> http://git.yoctoproject.org/cgit/cgit.cgi/poky-contrib/log/?h=akanavin/package-version-updates-later
> 
> Something ought to be done about centos 7, I'm all for dropping it asap, 
> if the newer compiler installation turns out unfeasible.
> 

centos7 is just showing the problem that other distros are not.
This problem seems to be due to missing header includes
Can we try to add

#include <time.h>

in tests/atk_test_util.h and perhaps this should fix it.


> Alex
> 
> On Fri, 28 Feb 2020 at 05:35, Tim Orling <ticotimo@gmail.com 
> <mailto:ticotimo@gmail.com>> wrote:
> 
>     All those build failures are on CentOS-7.
>     Grumble grumble.
> 
>     On Thu, Feb 27, 2020 at 8:32 PM Tim Orling <ticotimo@gmail.com
>     <mailto:ticotimo@gmail.com>> wrote:
> 
>         Strange. I built it in new environment, tip of master, on
>         Debian-10 and no problems. I’ll look into it tomorrow.
> 
>         Thank you for the information.
> 
>         On Thu, Feb 27, 2020 at 8:28 PM Khem Raj <raj.khem@gmail.com
>         <mailto:raj.khem@gmail.com>> wrote:
> 
> 
> 
>             On 2/27/20 7:54 PM, Anuj Mittal wrote:
>              > Hi Tim,
>              >
>              > On 27-Feb-20 08:06 AM, Tim Orling wrote:
>              >> Release notes:
>              >>
>             https://gitlab.gnome.org/GNOME/at-spi2-atk/-/raw/043b793de2161a0548835424f4d087ac90d1172d/NEWS
> 
>              >>
>              >>
>              >> License-Update: Changed to LGPL-2.1+
>              >>
>              >> Signed-off-by: Tim Orling
>             <timothy.t.orling@linux.intel.com
>             <mailto:timothy.t.orling@linux.intel.com>>
>              >> ---
>              >>   .../atk/{at-spi2-atk_2.32.0.bb
>             <http://at-spi2-atk_2.32.0.bb> => at-spi2-atk_2.34.1.bb
>             <http://at-spi2-atk_2.34.1.bb>}  | 8 ++++----
>              >>   1 file changed, 4 insertions(+), 4 deletions(-)
>              >>   rename meta/recipes-support/atk/{at-spi2-atk_2.32.0.bb
>             <http://at-spi2-atk_2.32.0.bb> =>
>              >> at-spi2-atk_2.34.1.bb <http://at-spi2-atk_2.34.1.bb>} (66%)
>              >
>              > This is failing on musl-qemu86:
>              >
>              >
>             https://autobuilder.yoctoproject.org/typhoon/#/builders/64/builds/1623
>              >
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error:
>             unknown field
>              > ‘tv_sec’ specified in initializer
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10:
>             warning: excess
>              > elements in struct initializer [enabled by default]
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10:
>             warning: (near
>              > initialization for ‘timeout’) [enabled by default]
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10: error:
>             unknown field
>              > ‘tv_nsec’ specified in initializer
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10:
>             warning: excess
>              > elements in struct initializer [enabled by default]
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:10:
>             warning: (near
>              > initialization for ‘timeout’) [enabled by default]
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:75:19: error:
>             storage size
>              > of ‘timeout’ isn’t known
>              >     struct timespec timeout = { .tv_sec = 0, .tv_nsec =
>             10 * 1000000 };
>              >                     ^
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:90:5:
>             warning: implicit
>              > declaration of function ‘nanosleep’
>             [-Wimplicit-function-declaration]
>              >       nanosleep(&timeout, NULL);
>              >       ^
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c: In function
>             ‘terminate_app’:
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:
>             error: variable
>              > ‘timeout’ has initializer but incomplete type
>              >     struct timespec timeout = { .tv_sec = 0, .tv_nsec =
>             10 * 1000000 };
>              >            ^
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:
>             error: unknown field
>              > ‘tv_sec’ specified in initializer
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:
>             warning: excess
>              > elements in struct initializer [enabled by default]
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:
>             warning: (near
>              > initialization for ‘timeout’) [enabled by default]
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:
>             error: unknown field
>              > ‘tv_nsec’ specified in initializer
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:
>             warning: excess
>              > elements in struct initializer [enabled by default]
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:10:
>             warning: (near
>              > initialization for ‘timeout’) [enabled by default]
>              > ../at-spi2-atk-2.34.1/tests/atk_test_util.c:108:19:
>             error: storage size
>              > of ‘timeout’ isn’t known
>              >     struct timespec timeout = { .tv_sec = 0, .tv_nsec =
>             10 * 1000000 };
>              >
> 
>             yeah this is exposing a bug in use if time_t struct in this
>             component.
>             there are several patches done to address that, we will
>             perhaps need one
>             of these patches here.
> 
>             -- 
>             _______________________________________________
>             Openembedded-core mailing list
>             Openembedded-core@lists.openembedded.org
>             <mailto:Openembedded-core@lists.openembedded.org>
>             http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 
>     -- 
>     _______________________________________________
>     Openembedded-core mailing list
>     Openembedded-core@lists.openembedded.org
>     <mailto:Openembedded-core@lists.openembedded.org>
>     http://lists.openembedded.org/mailman/listinfo/openembedded-core
> 

