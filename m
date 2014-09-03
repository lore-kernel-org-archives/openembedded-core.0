Return-Path: <Qi.Chen@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9DAE86AC7B
	for <openembedded-core@lists.openembedded.org>;
	Wed,  3 Sep 2014 02:38:22 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s832cN00011513
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 2 Sep 2014 19:38:23 -0700 (PDT)
Received: from [128.224.162.187] (128.224.162.187) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Tue, 2 Sep 2014 19:38:22 -0700
Message-ID: <54067F28.7060707@windriver.com>
Date: Wed, 3 Sep 2014 10:38:32 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1409655125.git.Qi.Chen@windriver.com>
	<09976ba7b8afef4bca4ac35d9a66f08bfa98a047.1409655125.git.Qi.Chen@windriver.com>
	<CAJTo0La+ffRiR5btGaJyUa1N3pFfPdBqdXDMAFoei0z5dxWCzw@mail.gmail.com>
In-Reply-To: <CAJTo0La+ffRiR5btGaJyUa1N3pFfPdBqdXDMAFoei0z5dxWCzw@mail.gmail.com>
X-Originating-IP: [128.224.162.187]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 09/26] systemd: add support for executing scripts under /etc/rcS.d
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
X-List-Received-Date: Wed, 03 Sep 2014 02:38:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2014 11:00 PM, Burton, Ross wrote:
> On 2 September 2014 11:53, Chen Qi <Qi.Chen@windriver.com> wrote:
>> This patch adds support for systemd to execute scripts under /etc/rcS.d.
> Did this patch come from the Debian package?  If so please state this
> and include a link so we can keep in sync with their patch.
>
> Ross
>
>

Hi Ross,

The patch is different from that from Debian.
The difference mainly comes from the fact that Debian init scripts all 
have proper LSB header while
a lot of our init scripts do not.

Below is a link to Debian's patch to systemd.
http://sources.debian.net/src/systemd/204-5/debian/patches/debian-changes/?hl=1391#L1391

Best Regards,
Chen Qi

