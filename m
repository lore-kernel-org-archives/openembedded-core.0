Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Liezhi.Yang@windriver.com>) id 1QtH6C-0008L9-LU
	for openembedded-core@lists.openembedded.org;
	Tue, 16 Aug 2011 12:42:21 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id p7GAbQ81015210
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 16 Aug 2011 03:37:26 -0700 (PDT)
Received: from [128.224.162.219] (128.224.162.219) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 16 Aug 2011 03:37:26 -0700
Message-ID: <4E4A4864.5020801@windriver.com>
Date: Tue, 16 Aug 2011 18:37:24 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Lightning/1.0b2 Thunderbird/3.1.11
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>
References: <4E450925.7060101@windriver.com> <1313418691.14274.591.camel@rex>
	<4E4A2CEE.9050401@windriver.com>
	<201108160956.02075.paul.eggleton@linux.intel.com>
In-Reply-To: <201108160956.02075.paul.eggleton@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [RFC] Performance Issue: Build time increases
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
X-List-Received-Date: Tue, 16 Aug 2011 10:42:21 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 08/16/2011 04:56 PM, Paul Eggleton wrote:
> On Tuesday 16 August 2011 09:40:14 Robert Yang wrote:
>> Thanks for you reply, yes, one build one restart(bitbake core-image-sato,
>> then restart the computer, and bitbake again) makes the build time stable.
>> I'm doing this now.
>
> Are you using my scripts (scripts/contrib/test_build_time.sh) ? Much of the
> initial part of the script is ensuring that caches get cleared out; thus
> rebooting should not be necessary in order to get stable results.

I'm sorry to say that I have tried it, but I don't know its principle,
and it made my git repo have too many untracked or modified files.
So I built it manually again:-)

// Robert

>
> Cheers,
> Paul
>


