Return-Path: <net147@gmail.com>
Received: from mail-pd0-f180.google.com (mail-pd0-f180.google.com
	[209.85.192.180])
	by mail.openembedded.org (Postfix) with ESMTP id 2952460167
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 22:18:08 +0000 (UTC)
Received: by mail-pd0-f180.google.com with SMTP id fp1so6224992pdb.39
	for <openembedded-core@lists.openembedded.org>;
	Mon, 13 Oct 2014 15:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=GWOd/nVT8bR+LTI59vWHhQhhCUni5ZEhMrt9xglASnA=;
	b=KwBqOspYP6zLCZFvmf887HKi4p90zxZW0jgNvVYnn9FCq2PnkJGR4XSuKZS1Qc45xJ
	cxeaxAz6gi7A1KDpod/5KOsNX1ffrafJSvvA5EgO9NrOOkJiTX6Lcpd5VjPe3k3Qg79A
	jVTSWPsWOHEfOEyc7dsihCCu39nddK1xRZIO5epcvtPQWR24w99XuBcBP91VD7/t6iNZ
	kquqvOEvpQtxNYAvA/Ey3WiseS2uDEA1Whbj4d+iMHR5DWXNjkxhGxurNfcUN8OMnbKv
	RN1DVgNMglIVE38LdaLPDydhr1VSIZCL/gR0XMHL9Eon+M+9cAeEhJ7exibPJuvU5937
	OrDg==
X-Received: by 10.70.63.70 with SMTP id e6mr1139644pds.27.1413238689854;
	Mon, 13 Oct 2014 15:18:09 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244]) by mx.google.com with ESMTPSA id
	ah2sm12302716pad.10.2014.10.13.15.18.07 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Oct 2014 15:18:09 -0700 (PDT)
Message-ID: <543C4F99.9070409@gmail.com>
Date: Tue, 14 Oct 2014 09:18:01 +1100
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: =?windows-1252?Q?An=EDbal_Lim=F3n?= <anibal.limon@linux.intel.com>, 
	openembedded-core@lists.openembedded.org
References: <543C4180.1050902@linux.intel.com>
In-Reply-To: <543C4180.1050902@linux.intel.com>
Subject: Re: License manifest OR handling
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
X-List-Received-Date: Mon, 13 Oct 2014 22:18:15 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 14/10/2014 8:17 AM, Aníbal Limón wrote:
> Hi everybody,
>
> I'm working in one bug [1] related to License manifest creation and i 
> have some concerns about what is
> expected in License creation more specifically in the OR's handling.
>
> I re-implemented license creation function from shell to python for 
> use oe.license module and added support
> for take into account INCOMPATIBLE_LICENSES.
>
> For example: Currently if you have LICENSE set to (MPLv2 | GPLv2.1) & 
> LGPLv3,
>     - With INCOMPATIBLE_LICENSES not set the result is: MPLv2 LGPLv3.
>     - With INCOMPATIBLE_LICENSES set to MPLv2 the result is: GPLv2.1 
> LGPLv3.
>
> This is that oe.license model eval's the OR expression and if you have 
> several OR only one is chosen, this is
> the expected behavior?, if yes i think is needed to add priorities for 
> license choose, example [2].
>
> Comments?
>
> Best regards.
>
> [1] https://bugzilla.yoctoproject.org/show_bug.cgi?id=6765
> [2] https://gist.github.com/kergoth/1590028
I think license priority is a good idea. Would you be able to set 
LICENSE_PRIORITY to a different values for specific recipes too?

Regards,
Jonathan

