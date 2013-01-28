Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TzfhA-0006nB-Ir
	for openembedded-core@lists.openembedded.org;
	Mon, 28 Jan 2013 04:47:44 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0S3W5rU029065
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 27 Jan 2013 19:32:06 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.328.9;
	Sun, 27 Jan 2013 19:32:04 -0800
Message-ID: <5105F146.7010009@windriver.com>
Date: Mon, 28 Jan 2013 11:32:22 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1359014474.git.Qi.Chen@windriver.com>
	<c60b41bd635d38aa01ffdd5c6221fd1a9c34b68f.1359014474.git.Qi.Chen@windriver.com>
	<20130124103150.GA3012@jama> <1359027432.3616.7.camel@ted>
	<CAJTo0LY9sXyoe9=rgGtstf3umrA+XeLJ1bDbJkM9S9bsqpA=HQ@mail.gmail.com>
	<5102491B.20603@windriver.com>
	<CAJTo0La_6JU4zLkKYmKT2oe+0CMX6nTr7nxkDT5tb=ZMr9EQzA@mail.gmail.com>
In-Reply-To: <CAJTo0La_6JU4zLkKYmKT2oe+0CMX6nTr7nxkDT5tb=ZMr9EQzA@mail.gmail.com>
X-Originating-IP: [128.224.163.154]
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 05/12] volatiles.bbclass: add recipe
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
X-List-Received-Date: Mon, 28 Jan 2013 03:47:44 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/25/2013 10:05 PM, Burton, Ross wrote:
> On 25 January 2013 08:58, ChenQi <Qi.Chen@windriver.com> wrote:
>> It seems that the backfill happens *before* this expression is parsed.
> Yes, because of these two patches that I reviewed and submitted yesterday:
>
> commit 4db8a3daafdedf39e081f4f6130f6cdcde03ed62
> Author: Richard Purdie <richard.purdie@linuxfoundation.org>
> Date:   Thu Jan 24 17:52:56 2013 +0000
>
>      base: make feature backfilling happen earlier
>
> commit c98363450fc4ccab82b34a37a95bd172cf6e115f
> Author: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Date:   Thu Jan 24 17:52:55 2013 +0000
>
>      bitbake.conf: unbreak all builds with custom DISTRO_FEATURES
>
> Ross
>
>
Ah... Yes.

Thanks for making things clear for me :)

Best Regards,
Chen Qi



