Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5A888786EE
	for <openembedded-core@lists.openembedded.org>;
	Wed,  6 Dec 2017 08:27:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id vB68R8KP002871
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 6 Dec 2017 00:27:08 -0800 (PST)
Received: from localhost.corp.ad.wrs.com (128.224.162.229) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.361.1; Wed, 6 Dec 2017 00:27:07 -0800
To: "GUAN Ben (ST-FIR/ENG1-Zhu)" <Ben.Guan@cn.bosch.com>,
	"openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <86cb51797fed46e7a8fc40606f317a2c@SGPMBX1024.APAC.bosch.com>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <8cf29333-cb70-d1a4-01ec-13a092beff3c@windriver.com>
Date: Wed, 6 Dec 2017 16:26:42 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.0
MIME-Version: 1.0
In-Reply-To: <86cb51797fed46e7a8fc40606f317a2c@SGPMBX1024.APAC.bosch.com>
Cc: "Jonas Mark \(ST-FIR/ENG1\)" <Mark.Jonas@de.bosch.com>
Subject: Re: How to add group for multiple recipes
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
X-List-Received-Date: Wed, 06 Dec 2017 08:27:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Ben,

On 12/06/2017 04:12 PM, GUAN Ben (ST-FIR/ENG1-Zhu) wrote:
> Hello,
> 
> In oe-core, there are some default groups provided by recipe "base-passwd". Any other recipes could refer to these groups when they want to create a new user.
> 
> Now we have a requirement: there are several recipes which create their own users, and they shall belongs to a common group. How could we add this group? It seems that groups or users created in a recipe are only visible to the same recipe. Other recipes cannot refer to them (e.g. using chown/chgrp).
> 
> We already tried to add a recipe which only generates the group and added this to DEPENDS of the other recipes. But it seem as if the group was not generated in time. When the other recipes ran, the group was not there. But the final image contained the group.

What's the error, please ? Where did you check the group ? If you have added the
the recipe to another's DEPENDS, then the group should be in another recipe's
recipe-sysroot.

// Robert

> 
> Best regards
> 
> Ben GUAN
> ST-FIR/ENG1-Zhu
> 

