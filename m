Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id E2F3E6BD13
	for <openembedded-core@lists.openembedded.org>;
	Mon,  2 Sep 2013 02:43:46 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r822hmYn028231
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Sun, 1 Sep 2013 19:43:49 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Sun, 1 Sep 2013 19:43:47 -0700
Message-ID: <5223FB7E.6070306@windriver.com>
Date: Mon, 2 Sep 2013 10:44:14 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <CAP9ODKqj3M+rxAK20=xU2RfJAAFO4JZyH0nWO9PVRt_exO6Q-A@mail.gmail.com>
In-Reply-To: <CAP9ODKqj3M+rxAK20=xU2RfJAAFO4JZyH0nWO9PVRt_exO6Q-A@mail.gmail.com>
X-Originating-IP: [128.224.162.233]
Subject: Re: Failure
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
X-List-Received-Date: Mon, 02 Sep 2013 02:43:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2013 10:08 AM, Otavio Salvador wrote:
> Hello,
>
> I got this build failure today; I am about to leave so I removed the
> tmpdir and will let it running during night. I post more info if/when
> I reproduce it again:
>
> Patch redhat-portability.diff does not apply (enforce with -f)
> ERROR: Function failed: patch_do_patch
> ERROR: Logfile of failure stored in:
> /home/otavio/hacking/freescale/fsl-community-bsp-mx6/build/tmp/work/x86_64-linux/elfutils-native/0.155-r0/temp/log.do_patch.20173
> ERROR: Task 662
> (virtual:native:/home/otavio/hacking/freescale/fsl-community-bsp-mx6/sources/poky/meta/recipes-devtools/elfutils/elfutils_0.155.bb,
> do_patch) failed with exit code '1'
>
> Regards,
>

I got the same error now and then when building native-elfutils. Every 
time the error appears, I have to clean the sstate cache for elfutils.

Regards,
Chen Qi

