Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 55CF9601F5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 21 Oct 2014 00:53:03 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.9/8.14.5) with ESMTP id s9L0qxud010482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 20 Oct 2014 17:52:59 -0700 (PDT)
Received: from [128.224.162.141] (128.224.162.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 20 Oct 2014 17:52:59 -0700
Message-ID: <5445AE6D.3000203@windriver.com>
Date: Tue, 21 Oct 2014 08:53:01 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1413424950-14820-1-git-send-email-rongqing.li@windriver.com>
	<CAJTo0LZvOGjzLdM_itgf=dFMvPCe=bS=+L0Fc_o6HbddY9Gtbw@mail.gmail.com>
In-Reply-To: <CAJTo0LZvOGjzLdM_itgf=dFMvPCe=bS=+L0Fc_o6HbddY9Gtbw@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] rpm: rpm needs gnupg to do signature
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
X-List-Received-Date: Tue, 21 Oct 2014 00:53:17 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/20/2014 07:01 PM, Burton, Ross wrote:
> On 16 October 2014 03:02,  <rongqing.li@windriver.com> wrote:
>> +RRECOMMENDS_${PN}_class-target = "gnupg"
>
> Recommends means pulled into images unless you use BAD_RECOMMENDATIONS
> to remove it.  As signing isn't a key part of RPM, maybe this should
> be RSUGGESTS?
>
> Ross
>

I think gpg is a common and often used packages, installing it into
image is harmless.

-Roy

-- 
Best Reagrds,
Roy | RongQing Li

