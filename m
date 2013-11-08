Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9CD186AA18
	for <openembedded-core@lists.openembedded.org>;
	Fri,  8 Nov 2013 08:10:24 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rA88APix018687
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 8 Nov 2013 00:10:25 -0800 (PST)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.347.0;
	Fri, 8 Nov 2013 00:10:24 -0800
Message-ID: <527C9C6F.4050509@windriver.com>
Date: Fri, 8 Nov 2013 16:10:23 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1383821844.git.wenzong.fan@windriver.com>
	<CAJTo0LZHwv3jbAP_utqA-RUALdE_R7OtpUQnzaWU67qup47fHQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZHwv3jbAP_utqA-RUALdE_R7OtpUQnzaWU67qup47fHQ@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/1] udev: ship source files to related dbg package
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
X-List-Received-Date: Fri, 08 Nov 2013 08:10:26 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/07/2013 07:12 PM, Burton, Ross wrote:
> On 7 November 2013 11:03,  <wenzong.fan@windriver.com> wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> Just ship these sources to their own dbg packages instead of udev-dbg:
>>
>>      libudev* -> libudev-dbg
>>      gudev*   -> libgudev-dbg
>>      others   -> udev-dbg
>
> Why do this?  Multiple -dbg packages could make sense in a recipe
> which builds a multi-gigabyte -dbg package (such as webkit) but what's
> the rationale for doing this in udev?

Actually I don't know clear about why it needs three -dbg packages, 
looks they have been there since very early commits of udev. I suspect 
that udev/libudev/libgudev are independent each other, so they are 
shipped into different packages (base/-dev/-dbg). This patch only ships 
their source code to -dbg packages accordingly.

Thanks
Wenzong

>
> Ross
>
>

