Return-Path: <ross.burton@intel.com>
Received: from mga18.intel.com (mga18.intel.com [134.134.136.126])
	by mail.openembedded.org (Postfix) with ESMTP id 530A57F7CB
	for <openembedded-core@lists.openembedded.org>;
	Thu, 23 Jan 2020 11:38:48 +0000 (UTC)
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga106.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	23 Jan 2020 03:38:49 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.70,353,1574150400"; d="scan'208";a="245362640"
Received: from irsmsx105.ger.corp.intel.com ([163.33.3.28])
	by orsmga002.jf.intel.com with ESMTP; 23 Jan 2020 03:38:48 -0800
Received: from irsmsx602.ger.corp.intel.com (163.33.146.8) by
	irsmsx105.ger.corp.intel.com (163.33.3.28) with Microsoft SMTP Server
	(TLS) id 14.3.439.0; Thu, 23 Jan 2020 11:38:47 +0000
Received: from rochenix-mobl.ger.corp.intel.com (163.33.253.164) by
	irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
	(version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
	15.1.1713.5; Thu, 23 Jan 2020 11:38:47 +0000
To: <openembedded-core@lists.openembedded.org>, <jupiter.hce@gmail.com>
References: <CAA=hcWS5w_QTmUMZBBMpj-H+iyBcqc=6h3RoZwdpVYU7gpyaMw@mail.gmail.com>
From: Ross Burton <ross.burton@intel.com>
Organization: Intel Corporation (UK) Ltd. - Co. Reg. #1134945 - Pipers Way,
	Swindon SN3 1RJ
Message-ID: <c6deb6ed-c9b6-36f5-4ada-bd29bc3783ee@intel.com>
Date: Thu, 23 Jan 2020 11:38:44 +0000
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
	Gecko/20100101 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <CAA=hcWS5w_QTmUMZBBMpj-H+iyBcqc=6h3RoZwdpVYU7gpyaMw@mail.gmail.com>
X-Originating-IP: [163.33.253.164]
X-ClientProxiedBy: irsmsx601.ger.corp.intel.com (163.33.146.7) To
	irsmsx602.ger.corp.intel.com (163.33.146.8)
Subject: Re: Could oe-core be infected by virus?
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
X-List-Received-Date: Thu, 23 Jan 2020 11:38:48 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

On 21/01/2020 11:21, JH wrote:
> The wired
> thing was that image injected so many new messages, including "Welcome
> to OpenEmbedded nodistro.0!" I have never seen in previous built image
> boot.

If you've never seen that before, but now you do, then the problem is 
that you're not setting DISTRO in your build as 'nodistro' is the default.

Ross

