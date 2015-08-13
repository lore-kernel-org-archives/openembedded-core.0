Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 753C1766C7
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 19:31:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.1/8.15.1) with ESMTPS id t7DJVrs0000614
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 13 Aug 2015 12:31:53 -0700 (PDT)
Received: from Marks-MacBook-Pro-2.local (172.25.36.231) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.235.1; Thu, 13 Aug 2015 12:31:52 -0700
To: <openembedded-core@lists.openembedded.org>
References: <cover.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<757e0230b801d19350e30523d62ac9b963c542bf.1439456090.git.leonardo.sandoval.gonzalez@linux.intel.com>
	<CAJTo0LbpYSNWZ39Vik4U8eT-+B+tg4-RpY+0nsDphLA5a-wOQA@mail.gmail.com>
	<CAMKF1sqHK5q-Xq9Gv4wae4MZdSw57e_OVyc_kdFkWgeAKd8v+g@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <55CCF0A8.4010409@windriver.com>
Date: Thu, 13 Aug 2015 14:31:52 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.10; rv:38.0)
	Gecko/20100101 Thunderbird/38.1.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqHK5q-Xq9Gv4wae4MZdSw57e_OVyc_kdFkWgeAKd8v+g@mail.gmail.com>
Subject: Re: [PATCH 2/2] package_deb.bbclass: Handle exception when encoding non-ASCII characters
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
X-List-Received-Date: Thu, 13 Aug 2015 19:31:57 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit

On 8/13/15 2:21 PM, Khem Raj wrote:
> On Thu, Aug 13, 2015 at 12:05 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> Debian control files are defined to be UTF-8, so the use of an ASCII
>> encoding method is wrong
>> (https://www.debian.org/doc/debian-policy/ch-controlfields.html).
>>
>> (RPM appears to assume UTF-8 too)
> 
> but check it still fine isnt it.
> 

RPM isn't really utf-8.. it's more single 8-bit characters...  UTF-8 (1 byte
characters) work fine.. multibyte are not promised to work.

If you need special encoding (more then 8-bit characters) then you should be
using 'po' style files to translate the 8-bit chars to localized versions...

So checking (and fixing) the strings for various things is a good idea for RPM
at least.

--Mark

