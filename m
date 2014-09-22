Return-Path: <Rongqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 2ABC860030
	for <openembedded-core@lists.openembedded.org>;
	Mon, 22 Sep 2014 00:27:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8M0RLVK028297
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 21 Sep 2014 17:27:21 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Sun, 21 Sep 2014 17:27:20 -0700
Message-ID: <541F6CF0.8050002@windriver.com>
Date: Mon, 22 Sep 2014 08:27:28 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1411109370-27814-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LbxDxYCXTo6p4YS2U7-UY1f6UVnUcO3NaeaGi0BSx2C7w@mail.gmail.com>
In-Reply-To: <CAJTo0LbxDxYCXTo6p4YS2U7-UY1f6UVnUcO3NaeaGi0BSx2C7w@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/2] pinentry: add recipes
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
X-List-Received-Date: Mon, 22 Sep 2014 00:27:21 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 09/19/2014 11:06 PM, Burton, Ross wrote:
> On 19 September 2014 07:49,  <rongqing.li@windriver.com> wrote:
>> +DEPENDS = "libcap ncurses"
>> +
>> +inherit autotools
>> +
>> +SRC_URI = "ftp://ftp.gnupg.org/gcrypt/${BPN}/${BPN}-${PV}.tar.bz2 \
>> +       "
>> +
>> +SRC_URI[md5sum] = "e2b6f94471ba1e978f6e5bf6b275189b"
>> +SRC_URI[sha256sum] = "359db3bf46cb743ba0b3aeef259f6107271ca888ba3e22c1cba525c9aca35612"
>> +
>> +EXTRA_OECONF = "--disable-pinentry-gtk\
>> +               --disable-pinentry-gtk2 \
>> +               --disable-pinentry-qt \
>> +               --disable-pinentry-qt4 \
>
> Add PACKAGECONFIG options so the distro can pick if it wants curses,
> gtk2, gtk3, qt3 or qt4 UIs.
>
> Ross

Ok, I will change them


-Roy

>
>

-- 
Best Reagrds,
Roy | RongQing Li

