Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 0D6A06A5A2
	for <openembedded-core@lists.openembedded.org>;
	Mon,  8 Jul 2013 17:15:41 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r68HFgHO004138
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 8 Jul 2013 10:15:42 -0700 (PDT)
Received: from msp-dhcp27.wrs.com (172.25.34.27) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 8 Jul 2013 10:15:42 -0700
Message-ID: <51DAF3BC.60107@windriver.com>
Date: Mon, 8 Jul 2013 12:15:40 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1373003615.git.Qi.Chen@windriver.com>
	<341a64b50c13dec0bf01feb5c74d5b32815a7191.1373003615.git.Qi.Chen@windriver.com>
	<20130705083905.GD3259@jama>
In-Reply-To: <20130705083905.GD3259@jama>
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
X-List-Received-Date: Mon, 08 Jul 2013 17:15:41 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 7/5/13 3:39 AM, Martin Jansa wrote:
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
>
> Why not use extra package just with user?
>
> See "[PATCH v3 0/5] Allow xuser to shutdown (cover letter only)"

The issue is that the users don't want extra (empty) packages to just add 
standard users/groups.  What they want is a post image-generation 
"configuration" mechanism.

Adding users/groups is one of the basic items that they want/need.  This really 
has to be considered to be an administrative activity vs a distribution 
activity.  (I.e. difference between creating a package and performing some kind 
of post-image action.)

The other issue with a package based approach is it then mandates changes occur 
by having to rebuild/reinstall packages.  This is onerous in my experience, for 
something basic like this.  It's really outside of the package manager's control.

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


