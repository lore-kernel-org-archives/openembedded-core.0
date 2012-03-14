Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <scott.a.garman@intel.com>) id 1S7r9t-0008Op-Di
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 17:34:41 +0100
Received: from mail-gx0-f180.google.com ([209.85.161.180])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 14 Mar 2012 09:25:54 -0700
Received: by gglu1 with SMTP id u1so2769087ggl.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 14 Mar 2012 09:25:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding
	:x-gm-message-state;
	bh=51VwcTlr9YMcaCKsuESK21Lo14liQoaDjuUAsSyYquY=;
	b=FYWpiMDxUCBZBU03gXIh/I4sMRr1aoQYjvSo1mvcQjSBzyu2ci0BGKmAWlEfkkKpKX
	NFK2Hu1KYTWzGic3BNtNJqNP8G+miliLFxPBbKtaMD3RNomSDdJNg02+kzbgJxYMRPnY
	flzXC5D049b3+YY0zp1180bAuo/zzQk00FHv/UYOjTpP+yFw9snWQ20dcpvMgR/Z6+Ux
	SGisfy1ZbstigTtyDk24InoZ6r+HjafB9rqLEYP02+PELvxJ7wwZo1GOaVqbhZ7zlCoF
	92g7/UcLpMxgO+36oQ+O0f+YVQ8qkwKl2U1lGmZ3QaWJfZKMYOplbUjdpDt/PNiVYAyJ
	2sew==
Received: by 10.182.2.135 with SMTP id 7mr4088218obu.78.1331742353455;
	Wed, 14 Mar 2012 09:25:53 -0700 (PDT)
Received: from [192.168.1.12] (c-76-105-137-48.hsd1.or.comcast.net.
	[76.105.137.48])
	by mx.google.com with ESMTPS id n1sm5933581obm.11.2012.03.14.09.25.51
	(version=SSLv3 cipher=OTHER); Wed, 14 Mar 2012 09:25:52 -0700 (PDT)
Message-ID: <4F60C699.5050401@intel.com>
Date: Wed, 14 Mar 2012 09:26:01 -0700
From: Scott Garman <scott.a.garman@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1331684953.git.scott.a.garman@intel.com>
	<D98E48A1-026D-4995-B63D-C3B422207B9A@dominion.thruhere.net>
In-Reply-To: <D98E48A1-026D-4995-B63D-C3B422207B9A@dominion.thruhere.net>
X-Gm-Message-State: ALoCoQl8OSr/amiT2fyK5fEwUPoe9KxjNHY+p5ox5zXp3K9zRvaYfJxkMnqBsU4T/qwwSo1I36B6
Subject: Re: [PATCH 0/1] ncurses packaging fix
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
X-List-Received-Date: Wed, 14 Mar 2012 16:34:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 03/14/2012 01:22 AM, Koen Kooi wrote:
>
> Op 14 mrt. 2012, om 01:31 heeft Scott Garman het volgende geschreven:
>
>> Hello,
>>
>> This fixes the ncurses library packaging. Thanks to Andreas Oberritter
>> for pointing it out.
>>
>> Scott
>>
>> The following changes since commit 81379dc141e245307ca391a02b7490b199128991:
>>
>>   dates: Fix unpackaged files warning (2012-03-13 23:18:19 +0000)
>>
>> are available in the git repository at:
>>   git://git.pokylinux.org/poky-contrib sgarman/ncurses-pkg-fix-oe
>>   http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=sgarman/ncurses-pkg-fix-oe
>>
>> Scott Garman (1):
>>   ncurses: fix packaging of moved libraries
>
> You're missing a PR bump for the affected packages.

My patch included incrementing INC_PR, but I'm guessing you're pointing 
this out because overnight Paul Eggleton got a patch into master which 
incremented INC_PR to the same number as I did in this patch. So I'm 
going to respin the branch with another increase to INC_PR.

If I'm mistaken, please let me know.

Thanks,

Scott

-- 
Scott Garman
Embedded Linux Engineer - Yocto Project
Intel Open Source Technology Center


