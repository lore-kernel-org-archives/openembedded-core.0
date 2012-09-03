Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1T8bUU-0003U8-6D
	for openembedded-core@lists.openembedded.org;
	Mon, 03 Sep 2012 20:35:18 +0200
Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 03 Sep 2012 11:22:56 -0700
Received: by daks35 with SMTP id s35so3894749dak.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 03 Sep 2012 11:22:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=g9MXOEkYCCxyy1aDe0pcRmyUhEYLuvc7Xjft8+2AjHE=;
	b=Vj78FUE0NLND6Kt/dFikWG3YPv32zKHH337SbrQEq44k6f0QoUAGRTGUUNWrxwMmXY
	E8tLEuMdPdQ9FMS/C4Zlt/EbYlRyshIZb4rlbUQsP2SFoH6qqsCjemZ5RAoQ4YHBCRvg
	RyGTpYLUHupmioTBhQx5KpWGaG/re/fotPiqR5p/t3NQeoWTPhNwkcm/FLD8ff8z1Y5h
	A11zvAoCnwenGlrZpdBmhMdmw/CScZmNsU+w3eqCZGGptahG6hiXgrF9Jyb0YcY/mthx
	2ZUgzbdEooU6xaz/mfMmu/pgE1kuNYsDNU7QZOkVswWAwkGFsOJeZo7onSzCsT+Z1TSw
	xVpQ==
Received: by 10.68.228.1 with SMTP id se1mr39645256pbc.110.1346696575389;
	Mon, 03 Sep 2012 11:22:55 -0700 (PDT)
Received: from [10.1.10.35] (c-50-137-42-92.hsd1.or.comcast.net.
	[50.137.42.92])
	by mx.google.com with ESMTPS id wh7sm10377011pbc.33.2012.09.03.11.22.53
	(version=SSLv3 cipher=OTHER); Mon, 03 Sep 2012 11:22:54 -0700 (PDT)
Message-ID: <5044F57D.3080901@intel.com>
Date: Mon, 03 Sep 2012 11:22:53 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: Koen Kooi <koen@dominion.thruhere.net>
References: <1346136108-13062-1-git-send-email-koen@dominion.thruhere.net>
	<C405C0B3-2E8B-4B20-BD35-E3AD9F6C45FA@dominion.thruhere.net>
In-Reply-To: <C405C0B3-2E8B-4B20-BD35-E3AD9F6C45FA@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQkLbQTAKOrpXoIbl8cMXTHq3dHz5WglPGAS35+iPsuKjTUdlFMBAx0BfdWE8AOVDUiceez3
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [for-denzil][meta-oe][PATCH 01/11] xz: updated to version 5.1.1alpha
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
X-List-Received-Date: Mon, 03 Sep 2012 18:35:18 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/03/2012 09:28 AM, Koen Kooi wrote:
> Ping for all 11 patches

Hi Koen,

I will pull these into sgarman/denzil-next by mid-day tomorrow, and then 
it's a matter of how soon I can get autobuilder time before I submit the 
final pull request to denzil. Thanks for your patience - I'm scrambling 
a bit to get some lab computers set up for YPDD at ELC-E.

Scott

>
> Op 28 aug. 2012, om 08:41 heeft Koen Kooi <koen@dominion.thruhere.net> het volgende geschreven:
>
>> From: Valentin Popa <valentin.popa@intel.com>
>>
>> The licenses are the same, only some white spaces added/removed.
>>
>> Signed-off-by: Valentin Popa <valentin.popa@intel.com>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>> .../xz/{xz_5.0.3.bb => xz_5.1.1alpha.bb}           |   10 +++++-----
>> 1 files changed, 5 insertions(+), 5 deletions(-)
>> rename meta/recipes-extended/xz/{xz_5.0.3.bb => xz_5.1.1alpha.bb} (72%)
>>
>> diff --git a/meta/recipes-extended/xz/xz_5.0.3.bb b/meta/recipes-extended/xz/xz_5.1.1alpha.bb
>> similarity index 72%
>> rename from meta/recipes-extended/xz/xz_5.0.3.bb
>> rename to meta/recipes-extended/xz/xz_5.1.1alpha.bb
>> index e8f96b6..7fa7177 100644
>> --- a/meta/recipes-extended/xz/xz_5.0.3.bb
>> +++ b/meta/recipes-extended/xz/xz_5.1.1alpha.bb
>> @@ -4,17 +4,17 @@ SECTION = "base"
>>
>> LICENSE = "GPLv2+ & GPLv3+ & LGPLv2.1+"
>> LIC_FILES_CHKSUM = "file://COPYING;md5=c475b6c7dca236740ace4bba553e8e1c \
>> -                    file://COPYING.GPLv2;md5=751419260aa954499f7abaabaa882bbe \
>> +                    file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>                      file://COPYING.GPLv3;md5=d32239bcb673463ab874e80d47fae504 \
>> -                    file://COPYING.LGPLv2.1;md5=fbc093901857fcd118f065f900982c24 \
>> +                    file://COPYING.LGPLv2.1;md5=4fbd65380cdd255951079008b364516c \
>>                      file://lib/getopt.c;endline=23;md5=2069b0ee710572c03bb3114e4532cd84 "
>>
>> SRC_URI = "http://tukaani.org/xz/xz-${PV}.tar.gz"
>>
>> -SRC_URI[md5sum] = "fefe52f9ecd521de2a8ce38c21a27574"
>> -SRC_URI[sha256sum] = "10eb4df72dffb2fb14c3d2d82b450e72282ffcb9ee3908a8e5b392b8f09681bf"
>> +SRC_URI[md5sum] = "bb24436fa12780808e1c142980484104"
>> +SRC_URI[sha256sum] = "54e59a83690a4a0ec88a7d7c3bdef90c6b196c892a93463863c71c24fe87951a"
>>
>> -PR = "r1"
>> +PR = "r0"
>>
>> inherit autotools gettext
>>
>> --
>> 1.7.7.6
>>
>


-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


