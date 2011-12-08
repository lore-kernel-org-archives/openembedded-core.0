Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1RYgGw-0007s4-S3
	for openembedded-core@lists.openembedded.org;
	Thu, 08 Dec 2011 16:52:35 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id pB8Fji8W018761
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Thu, 8 Dec 2011 07:45:44 -0800 (PST)
Received: from Macintosh-5.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Thu, 8 Dec 2011 07:45:43 -0800
Message-ID: <4EE0DBA7.6050303@windriver.com>
Date: Thu, 8 Dec 2011 09:45:43 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1323327959.git.xiaofeng.yan@windriver.com>
	<03a910e12b1619fc40345c2cfa31afb428bd777f.1323327959.git.xiaofeng.yan@windriver.com>
	<CAGiJk9f3t11NUCXeekteMe_V2O0R36b3pdzhJOGX3Dvq1nm9YA@mail.gmail.com>
In-Reply-To: <CAGiJk9f3t11NUCXeekteMe_V2O0R36b3pdzhJOGX3Dvq1nm9YA@mail.gmail.com>
Subject: POKY_BASE_INSTALL was Re: [PATCH 10/10] core-image-gtk-directfb.bb: add an image for gtk over directfb
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 08 Dec 2011 15:52:35 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 12/8/11 7:22 AM, Samuel Stirtzel wrote:
> Hi,
>
> 2011/12/8 Xiaofeng Yan<xiaofeng.yan@windriver.com>:
> [snip]
>> +IMAGE_INSTALL += "\
>> +       ${POKY_BASE_INSTALL} \
>
> I'm just curious, is this a legitimate OE-Core variable?
>
>

Yes it is, I ran into this yesterday and did some investigation.


POKY_BASE_INSTALL = '\
     task-core-boot \
     task-base-extended \
     \
     ${@base_contains("IMAGE_FEATURES", "package-management", "", 
"${ROOTFS_PKGMANAGE_BOOTSTRAP}",d)} \
     \
     ${POKY_EXTRA_INSTALL} \
     '


This is defined in core-image.bbclass.

I thought when we made the transition to oe-core that we had caught all of these 
names, but apparently we missed some.

This is simply a cosmetic bug, it is unintended.

--Mark


