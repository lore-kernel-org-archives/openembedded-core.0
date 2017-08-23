Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 7AA1E77E3F
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 16:19:18 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7NGJHMR023135
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK)
	for <openembedded-core@lists.openembedded.org>;
	Wed, 23 Aug 2017 09:19:19 -0700
Received: from soho-mhatle-m.local (172.25.36.227) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Wed, 23 Aug 2017 09:19:16 -0700
From: Mark Hatle <mark.hatle@windriver.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <352435b6-964b-505d-ceba-ffb5f8bd00ea@windriver.com>
Organization: Wind River Systems
Message-ID: <d82dd608-8d33-fdb0-73de-79333f80fa60@windriver.com>
Date: Wed, 23 Aug 2017 11:19:15 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <352435b6-964b-505d-ceba-ffb5f8bd00ea@windriver.com>
Subject: Re: pkgconfig vs pkgconf
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
X-List-Received-Date: Wed, 23 Aug 2017 16:19:19 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/23/17 10:46 AM, Mark Hatle wrote:
> As of this morning, I'm not getting a warning about a preferred provider being

typo.. 'I'm -NOW- getting a warning'

sorry for the confusion...

> necessary to differentiate between pkgconfig and pkgconf.
> 
> I've set the following to make it "go away".  But I assume we need to set a
> default somewhere in the system...
> 
> PREFERRED_PROVIDER_pkconfig = "pkgconfig"
> PREFERRED_PROVIDER_pkgconfig-native = "pkgconfig-native"
> 
> PREFERRED_RPROVIDER_pkgconfig = "pkgconfig"
> 


