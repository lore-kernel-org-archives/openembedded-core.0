Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SGDBe-0001B1-0W
	for openembedded-core@lists.openembedded.org;
	Fri, 06 Apr 2012 19:43:02 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q36HXmNJ011557
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Fri, 6 Apr 2012 10:33:48 -0700 (PDT)
Received: from msp-dhcp16.wrs.com (172.25.34.16) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Fri, 6 Apr 2012 10:33:48 -0700
Message-ID: <4F7F28FB.20600@windriver.com>
Date: Fri, 6 Apr 2012 12:33:47 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1333481624.git.mark.hatle@windriver.com>
	<c1765e7544603baa60bec27185a947aeee404bee.1333481624.git.mark.hatle@windriver.com>
	<4F7CC6E6.6020006@opendreambox.org>
	<CAMKF1soi+==bbEKMD+FLdk+8BvWNK3Nj24EJVhoyT5e=_5MvDw@mail.gmail.com>
In-Reply-To: <CAMKF1soi+==bbEKMD+FLdk+8BvWNK3Nj24EJVhoyT5e=_5MvDw@mail.gmail.com>
Subject: Re: [PATCH 3/7] conf/machine/include: Cleanup MIPS tunings to match README
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
X-List-Received-Date: Fri, 06 Apr 2012 17:43:02 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 4/4/12 11:17 PM, Khem Raj wrote:
> On Wed, Apr 4, 2012 at 3:10 PM, Andreas Oberritter<obi@opendreambox.org>  wrote:
>>
>> What was mipsel-oe-linux before now became mips32el-oe-linux, i.e.
>> tmp/work/mipsel-oe-linux now is tmp/work/mips32el-oe-linux. I'm not sure
>> what else broke.
>>
>> Was this intentional?
>
> I dont think so. mips-*-* in general indicates 32bit BE mips and
> mipsel-*-* indicates
> 32bit LE mips so devicing mips32 and mips32el may be more explicit but
> is not widely
> used norm

If that has changed it was certainly not intentional.  As Khem said the expected 
GNU canonical archs are:

mips-*-*
mipsel-*-*
mips64-*-*
mips64el-*-*

mips32 should work, but it was not expected to have changed.

Looking through, the GNU canonical arch should only match the above.  The 
namings in the tmp/work directory are strictly following the -package arch- 
namings, which don't affect system configuration.

I checked the logs from my test builds, and the mips32* reused the mips* builds 
because the canonical arch of the configuration and such were the same.

(Looked at config.log in a couple of packages...)  if you see mips32-* in the 
config.log, let me know.

--Mark

> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



