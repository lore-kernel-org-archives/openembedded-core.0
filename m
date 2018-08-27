Return-Path: <yang.wang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3CD7674596
	for <openembedded-core@lists.openembedded.org>;
	Mon, 27 Aug 2018 22:08:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7RM8Nge011303
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 27 Aug 2018 15:08:23 -0700 (PDT)
Received: from [128.224.56.219] (128.224.56.219) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Mon, 27 Aug 2018 15:08:22 -0700
Reply-To: <yang.wang@windriver.com>
To: Otavio Salvador <otavio.salvador@ossystems.com.br>
References: <7AA7B88A6FC2B84F9AA5EF03A8A6FCB201348A030B@ALA-MBD.corp.ad.wrs.com>
	<bebc4ced-47eb-9cb8-4df5-4716a2dd4d11@windriver.com>
	<CAP71WjxgSESvWm=FO=O0cmY+UE82OEc3L=2ioJp9K4xuhZ_hRQ@mail.gmail.com>
	<0f31c417-75ef-fdd4-925f-de320a778275@windriver.com>
	<46251E21CF6D2D45A2D672A9B36E9FF34EC18912@fmsmsx104.amr.corp.intel.com>
	<7AA7B88A6FC2B84F9AA5EF03A8A6FCB201348A4B2F@ALA-MBD.corp.ad.wrs.com>
	<CAP9ODKoiejC--zVT=rCoT02emZ687eAxb8ZhZjcvCuNa+aBkTQ@mail.gmail.com>
From: Yang Wang <yang.wang@windriver.com>
Organization: Wind River
Message-ID: <dffdb339-f835-7ad6-2d8f-a04b20237364@windriver.com>
Date: Mon, 27 Aug 2018 18:08:33 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CAP9ODKoiejC--zVT=rCoT02emZ687eAxb8ZhZjcvCuNa+aBkTQ@mail.gmail.com>
Cc: "Purdie, Richard" <richard.purdie@intel.com>,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>,
	jair.de.jesus.gonzalez.plascencia@intel.com
Subject: Re: [RFC] Yocto Project Bug 12372 - Automate the execution of pTest with LAVA
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
X-List-Received-Date: Mon, 27 Aug 2018 22:08:24 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 08/26/2018 10:04 PM, Otavio Salvador wrote:
> On Fri, Aug 24, 2018 at 11:23 AM Wang, Yang (Young)
> <yang.wang@windriver.com> wrote:
>> I see some good feedback from people mentioned they are working on similar solutions and should come out soon. We will continuously work on this ticket.
> Did you consider using labgrid? It has a lot in common in current
> infra we use in OEQA (ptest and like) and has nice capabilities to be
> used locally and remotely.
>
Quickly had a look at labgrid, looks like it is using similar method to 
control devices with using configuration files, in this case, target 
controller is common, with using different type of YAML config files, it 
can control different devices. (Please correct me if I'm wrong.)

I think the key point of this ticket is to run Ptest on hardware devices 
automatically and make it as common as possible for Yocto. So, no matter 
using LAVA or labgrid, the devices being controlled need to be publicly 
accessible and maintained well.

Do you have examples similar to this ticket can share with us?

Thanks,
Yang Wang

