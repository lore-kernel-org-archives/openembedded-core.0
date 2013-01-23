Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Qi.Chen@windriver.com>) id 1TxtjO-0002mv-Bx
	for openembedded-core@lists.openembedded.org;
	Wed, 23 Jan 2013 07:22:43 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r0N67ApP007360
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 22:07:11 -0800 (PST)
Received: from [128.224.163.154] (128.224.163.154) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.318.4;
	Tue, 22 Jan 2013 22:07:10 -0800
Message-ID: <50FF7E18.4020803@windriver.com>
Date: Wed, 23 Jan 2013 14:07:20 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1358836314.git.Qi.Chen@windriver.com>
	<3d6b90b5ad79166eda3883ad4e9d5ca1ed937f10.1358836314.git.Qi.Chen@windriver.com>
	<50FED7A0.1060200@topic.nl>
In-Reply-To: <50FED7A0.1060200@topic.nl>
X-Originating-IP: [128.224.163.154]
Subject: Re: [PATCH V8 2/6] image.bbclass: add a hook funtion to support readonly rootfs
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 23 Jan 2013 06:22:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/23/2013 02:17 AM, Mike Looijmans wrote:
> On 01/22/2013 07:36 AM, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> read_only_rootfs_hook: this funtion is invoked only if 
>> 'read-only-rootfs'
>> is in IMAGE_FEATURES. It tweaks some basic files and makes populate-
>> volatile.sh script run at rootfs time.
>
> To me, it seems running populate-volatile at rootfs is a good thing 
> for writable rootfs as well, it reduces the writing at first boot. Why 
> not ALWAYS do this?
>
Hi Mike,

The reason I didn't make it *always* run at rootfs is that it's not 
*necessary*.
Besides, I want to encapsulate all all necessary tweaks at rootfs time 
into one function -- read-only-rootfs-hook.
In this way, I can ensure that it doesn't mess up with other components.

Thanks,
Chen Qi


