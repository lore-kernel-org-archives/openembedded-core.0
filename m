Return-Path: <Florin.Sarbu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 0C8B06F8AD
	for <openembedded-core@lists.openembedded.org>;
	Tue,  1 Apr 2014 14:24:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s31EOqQr001315
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 1 Apr 2014 07:24:52 -0700 (PDT)
Received: from [128.224.170.220] (128.224.170.220) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Tue, 1 Apr 2014 07:24:52 -0700
Message-ID: <533ACC35.9050900@windriver.com>
Date: Tue, 1 Apr 2014 17:24:53 +0300
From: Florin Sarbu <florin.sarbu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.4.0
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <1396346945-3782-1-git-send-email-florin.sarbu@windriver.com>
	<1396349467.1432.4.camel@ted>
	<969F26A8BAB325438E7EB80D3C3134FB1CE76D4F@IRSMSX105.ger.corp.intel.com>
	<533AB0A2.1000608@windriver.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CE76E2B@IRSMSX105.ger.corp.intel.com>
	<969F26A8BAB325438E7EB80D3C3134FB1CE76E47@IRSMSX105.ger.corp.intel.com>
	<533AC1EF.7090600@windriver.com>
	<CAJTo0La=GF4A5vzO86pqJj2HLjAeKdLYEUN=Q-0+5qpCn4LH4A@mail.gmail.com>
In-Reply-To: <CAJTo0La=GF4A5vzO86pqJj2HLjAeKdLYEUN=Q-0+5qpCn4LH4A@mail.gmail.com>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] connman.inc: Add PACKAGECONFIG support for bluez5
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
X-List-Received-Date: Tue, 01 Apr 2014 14:24:53 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/01/2014 05:16 PM, Burton, Ross wrote:
> On 1 April 2014 14:41, Florin Sarbu <florin.sarbu@windriver.com> wrote:
>> Well, as far as I see it, these 2 packages (connman and libpcap) are aware
>> only of bluez4 at the moment.
> ConnMan supports both, and libpcap uses the libbluetooth API so that
> should link fine against either as that API didn't change much.
Sorry, I meant the recipes are only bluez4 aware.

Florin
> Ross


