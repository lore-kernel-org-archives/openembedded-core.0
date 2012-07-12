Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Randy.MacLeod@windriver.com>) id 1SpObX-0005L4-Om
	for openembedded-core@lists.openembedded.org;
	Thu, 12 Jul 2012 20:59:12 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q6CIlqrr016522
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 12 Jul 2012 11:47:52 -0700 (PDT)
Received: from [128.224.146.239] (128.224.146.239) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 12 Jul 2012 11:47:51 -0700
Message-ID: <4FFF1BD6.6080804@windriver.com>
Date: Thu, 12 Jul 2012 14:47:50 -0400
From: Randy MacLeod <randy.macleod@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <CAJ2CSBuJYeUMYEa8RycpMzZA551xoR0Fe5QJi8GgBg7f=C1PLA@mail.gmail.com>
	<CAJ2CSBt+NSLH0_WhdDfMN8GUw5epy_u31aeESaZxT=7rQ90WfQ@mail.gmail.com>
	<1901411.bouqtbEZ1W@helios>
	<CAJ2CSBvTn+QVaUwLPtnExaD6RtCapiJsiFTgTKxbT0tm-HqojA@mail.gmail.com>
In-Reply-To: <CAJ2CSBvTn+QVaUwLPtnExaD6RtCapiJsiFTgTKxbT0tm-HqojA@mail.gmail.com>
X-Originating-IP: [128.224.146.239]
Cc: Morgan Little <morgan.little@windriver.com>,
	Paul Eggleton <paul.eggleton@linux.intel.com>
Subject: Re: python error when building various packages
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
X-List-Received-Date: Thu, 12 Jul 2012 18:59:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 12-07-12 09:47 AM, Damian, Alexandru wrote:
> Done https://bugzilla.yoctoproject.org/show_bug.cgi?id=2752
>
> Alex
>
> On Thu, Jul 12, 2012 at 12:34 PM, Paul Eggleton
> <paul.eggleton@linux.intel.com <mailto:paul.eggleton@linux.intel.com>>
> wrote:
>
>     On Thursday 12 July 2012 11:56:16 Damian, Alexandru wrote:
>      > Solved by do_clean on the packages.
>      >
>      > Still Alex doesn't know what triggers the error.

This might be related to the installation of python-native.
We (Wind River) have a fix for that problem that we're testing now
and will post to oe-core for review soon. It follows the:
    meta/classes/perlnative.bbclass
fix as RP suggested.

---

Btw, I added the text above to the bugzilla logs.

// Randy

>
>     I'm not sure either, but would you mind filing a bug for this?
>
>     Cheers,
>     Paul
>
>     --
>
>     Paul Eggleton
>     Intel Open Source Technology Centre
>
>
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>


-- 
# Randy MacLeod. MTS, Linux, Wind River
Direct: 613.963.1350




