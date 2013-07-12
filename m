Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 9B3F76AEA2
	for <openembedded-core@lists.openembedded.org>;
	Fri, 12 Jul 2013 12:45:59 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r6CCjwpE027665
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 12 Jul 2013 05:45:58 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCB.corp.ad.wrs.com
	(147.11.189.41) with Microsoft SMTP Server id 14.2.342.3;
	Fri, 12 Jul 2013 05:45:57 -0700
Message-ID: <51DFFA83.10003@windriver.com>
Date: Fri, 12 Jul 2013 20:45:55 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1373443071.git.hongxu.jia@windriver.com>
	<fb33ec7730da4eec3aeb2a73295a851ed15af941.1373443071.git.hongxu.jia@windriver.com>
	<CAJTo0Lbm2aLC9fV1hwO4yQPsDpr-5GSc+-K7Y6BnHFHEX+1Z1A@mail.gmail.com>
In-Reply-To: <CAJTo0Lbm2aLC9fV1hwO4yQPsDpr-5GSc+-K7Y6BnHFHEX+1Z1A@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/5] nss: create checksum files for the nss libraries
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
X-List-Received-Date: Fri, 12 Jul 2013 12:45:59 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/12/2013 08:39 PM, Burton, Ross wrote:
> On 10 July 2013 09:03, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> Add checksum files required for the NSS softoken to operate in FIPS 140 mode.
>> The shlibsign is invoked to sign the libraries, and it is built for the target
>> architecture and doesn't support cross-compiling so far.
>>
>> Invoke shlibsign at target's first boot time to generate checksum files.
> As NSS depends on nss-native, can't you use that?  The bug you link to
> implies that's what someone else has done when building NSS for iOS.
Yes, invoke 'certutil' to create a blank certificate at build time.

//Hongxu
>
> Ross


