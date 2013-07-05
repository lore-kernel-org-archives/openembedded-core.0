Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5D8F26AE18
	for <openembedded-core@lists.openembedded.org>;
	Fri,  5 Jul 2013 09:15:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r659FZhB017563
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 5 Jul 2013 02:15:35 -0700 (PDT)
Received: from [128.224.162.233] (128.224.162.233) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.342.3;
	Fri, 5 Jul 2013 02:15:35 -0700
Message-ID: <51D68ED5.9060800@windriver.com>
Date: Fri, 5 Jul 2013 17:16:05 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130510 Thunderbird/17.0.6
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1373003615.git.Qi.Chen@windriver.com>
	<341a64b50c13dec0bf01feb5c74d5b32815a7191.1373003615.git.Qi.Chen@windriver.com>
	<20130705083905.GD3259@jama>
In-Reply-To: <20130705083905.GD3259@jama>
X-Originating-IP: [128.224.162.233]
Cc: qingtao.cao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] image.bbclass: add a method to add/delete/modify user/group settings
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
X-List-Received-Date: Fri, 05 Jul 2013 09:15:36 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 07/05/2013 04:39 PM, Martin Jansa wrote:
> On Fri, Jul 05, 2013 at 02:07:28PM +0800, Qi.Chen@windriver.com wrote:
>> From: Chen Qi <Qi.Chen@windriver.com>
>>
>> We may want to add a user or group which does not logically belong to
>> any specific package. For example, we may want to add a user with the
>> name 'tester' to our image. Besides, we may want to delete or modify
>> user/group in our image.
>>
>> This patch adds a variable, USER_GROUP_SETTINGS, which is dedicated
>> to these tasks. The configuration format is detailed in the local.conf.
>> sample.extended file.
>>
>> This patch also adds a function, set_user_group, which happens at
>> the end of the ROOTFS_POSTPROCESS_COMMAND. It handles the settings
>> in the USER_GROUP_SETTINGS variable.
> Why not use extra package just with user?
>
> See "[PATCH v3 0/5] Allow xuser to shutdown (cover letter only)"
I considered this approach (see 
https://bugzilla.yoctoproject.org/show_bug.cgi?id=4074 for more 
details), but I finally gave it up because of the following two reasons.
1) The users may not want  to mess with bb files, as is the situation 
with our company's customers.
2) Configuring user/group through .conf file is more convenient.

I noticed Laurentiu's patch about xuser and shutdown, and I've read 
though it carefully.
The xuser is kind of special, as it's to some extend "common".

Best Regards,
Chen Qi

