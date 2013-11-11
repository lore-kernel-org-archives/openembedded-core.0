Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id ED8B96D757
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 11:23:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id rABBN62J024055
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 11 Nov 2013 03:23:06 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Mon, 11 Nov 2013 03:23:05 -0800
Message-ID: <5280BE1D.2040303@windriver.com>
Date: Mon, 11 Nov 2013 19:23:09 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1383974819.git.Qi.Chen@windriver.com>
	<CAJTo0Lb8h=UYNCk8X5dL6XMRQrZSsC5OYA+iDVFOAX=95Vg6bg@mail.gmail.com>
In-Reply-To: <CAJTo0Lb8h=UYNCk8X5dL6XMRQrZSsC5OYA+iDVFOAX=95Vg6bg@mail.gmail.com>
X-Originating-IP: [128.224.162.213]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/8] Fixes about unsafe-references QA warnings
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
X-List-Received-Date: Mon, 11 Nov 2013 11:23:06 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/11/2013 07:12 PM, Burton, Ross wrote:
> On 9 November 2013 05:28,  <Qi.Chen@windriver.com> wrote:
>> This solution is based on the following two principles.
>> 1. With /usr on a seperate partition, system should still boot without any error.
>> 2. Without /usr, system should be able to boot into single user mode with error.
> Presumably this is with sysvinit.  Have you tested systemd with these
> principles?
>
> Ross
>
>

Not yet ...
I can do such testing in a day or two.
I'll then file a bug and make patches if needed.

Best Regards,
Chen Qi

