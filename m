Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 22F027D43F
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Apr 2019 02:12:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x382C7c7021091
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 7 Apr 2019 19:12:08 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Sun, 7 Apr 2019 19:12:06 -0700
To: Adrian Bunk <bunk@stusta.de>
References: <1554196113-200535-1-git-send-email-changqing.li@windriver.com>
	<20190402113135.GA27866@localhost>
	<3381bfd6-b3ed-da15-69dc-394fc1a9643b@windriver.com>
	<20190403095811.GB8376@localhost>
	<c232147c-1fe0-e983-277e-ad3ee1049abb@windriver.com>
	<20190404081128.GB13624@localhost>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <f044d899-2ad8-459c-cecc-1324a4cbc9d8@windriver.com>
Date: Mon, 8 Apr 2019 10:12:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20190404081128.GB13624@localhost>
X-Originating-IP: [128.224.162.228]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] cogl: fix compile error with -Werror=maybe-uninitialized
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
X-List-Received-Date: Mon, 08 Apr 2019 02:12:12 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US


On 4/4/19 4:11 PM, Adrian Bunk wrote:
> On Thu, Apr 04, 2019 at 10:06:44AM +0800, Changqing Li wrote:
>> ...
>> And also upstream have use same way to fix under
>> cogl/driver/gl/gl/cogl-driver-gl.c
>>
>> https://gitlab.gnome.org/GNOME/cogl/commit/ca5226513eb64bceb38ca01994799c4e7cd9f5fa
> Have they?
>
> This looks like a 4 year old commit that was never merged.

Seems it merged to 1.22 branch,  I can see it switch to tag 1.22.2, but 
indeed,  it  not merge to master.

and this change also include in 
http://ftp.gnome.org/pub/GNOME/sources/cogl/1.22/cogl-1.22.2.tar.xz.

>
>> so I think we can fix same way under this
>> cogl/driver/gl/gles/cogl-driver-gles.c
> cu
> Adrian
>
-- 
BRs

Sandy(Li Changqing)


