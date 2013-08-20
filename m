Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BE65461883
	for <openembedded-core@lists.openembedded.org>;
	Tue, 20 Aug 2013 10:54:39 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r7KAsb06011633
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 20 Aug 2013 03:54:37 -0700 (PDT)
Received: from [128.224.162.211] (128.224.162.211) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 20 Aug 2013 03:54:37 -0700
Message-ID: <52134AEB.1030102@windriver.com>
Date: Tue, 20 Aug 2013 18:54:35 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1376928709.git.sgw@linux.intel.com>
	<CAJTo0Lb67rHK3_woWxgopJ7b+mA1GOJFYL9F0D8qfcw=bg+iwg@mail.gmail.com>
In-Reply-To: <CAJTo0Lb67rHK3_woWxgopJ7b+mA1GOJFYL9F0D8qfcw=bg+iwg@mail.gmail.com>
Cc: paul.eggleton@linux.intel.com, clarson@kergoth.com,
	openembedded-core@lists.openembedded.org
Subject: Re: [CONSOLIDATED PULL 00/25] Review and ACK
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
X-List-Received-Date: Tue, 20 Aug 2013 10:54:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 8/20/2013 5:53 PM, Burton, Ross wrote:
> On 19 August 2013 17:19, Saul Wold <sgw@linux.intel.com> wrote:
>> Jackie Huang (1):
>>    texinfo: handle correctly @enumerate specification greater than 10
>
> The patch is missing a signed-off, but then again the patch header
> does have Jackie's email in.

Sorry for missing the signed-off, I added and replied the patch with the 
update.

Thanks,
Jackie

>
>> Joe Slater (2):
>>    coreutils: add PACKAGECONFIG info for acl support
>>    coreutils: allow for acl support
>
> I don't like the comment describing the packageconfig format, but that
> can be removed later.
>
>> Khem Raj (3):
>>    qemuppc: Change default tune to 74xx
>>    tune-ppc7400.inc: Add tune file
>
> The ordering of these two in the branch is backwards, which could hurt
> someone doing bisects.  Richard, can you fix the ordering when
> merging?
>
> Apart from that, Acked-By: Ross Burton <ross.burton@intel.com>.
>
> Ross
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745

