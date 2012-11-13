Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TY5m0-0007Bj-Lb
	for openembedded-core@lists.openembedded.org;
	Tue, 13 Nov 2012 02:58:48 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id qAD1ik3q029710
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 12 Nov 2012 17:44:46 -0800 (PST)
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.318.4;
	Mon, 12 Nov 2012 17:44:45 -0800
Message-ID: <50A1A60C.9030204@windriver.com>
Date: Tue, 13 Nov 2012 09:44:44 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: Phil Blundell <philb@gnu.org>
References: <cover.1352690328.git.jackie.huang@windriver.com>
	<88778c5a8e868a75c53ed8e60bb80a2cda17bc8d.1352690328.git.jackie.huang@windriver.com>
	<1352713720.6869.107.camel@x121e.pbcl.net>
In-Reply-To: <1352713720.6869.107.camel@x121e.pbcl.net>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] eglibc: always compile with optimization.
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
X-List-Received-Date: Tue, 13 Nov 2012 01:58:48 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 11/12/2012 5:48 PM, Phil Blundell wrote:
> On Mon, 2012-11-12 at 11:31 +0800, jackie.huang@windriver.com wrote:
>> +# eglibc can't be built without optimization, if someone tries to compile an
>> +# entire image as -O0, we override it with -O2 here and give a note about it.
>> +def get_optimization(d):
>> +    if base_contains("SELECTED_OPTIMIZATION", "-O0", "x", "", d) == "x":
>> +        bb.note("eglibc can't be built with -O0, -O2 will be used instead.")
>> +        selected_optimization = d.getVar("SELECTED_OPTIMIZATION", True)
>> +        return selected_optimization.replace("-O0", "-O2")
>> +    return selected_optimization
>
> Did you test this patch at all?

I did test only in the cases that caused the defect but now I realized 
that it's not well tested and it doesn't work in other cases, sorry 
about that, I will re-work on it.

Thanks,
Jackie

>
> p.
>
>
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745


