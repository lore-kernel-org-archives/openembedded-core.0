Received: from atl4mhfb02.myregisteredsite.com ([209.17.115.56])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mike.looijmans@topic.nl>) id 1Txifw-0000M3-MB
	for openembedded-core@lists.openembedded.org;
	Tue, 22 Jan 2013 19:34:56 +0100
Received: from atl4mhob08.myregisteredsite.com
	(atl4mhob08.myregisteredsite.com [209.17.115.46])
	by atl4mhfb02.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r0MIH78Z015373 for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 13:17:08 -0500
Received: from mailpod.hostingplatform.com (mail.networksolutionsemail.com
	[205.178.146.50])
	by atl4mhob08.myregisteredsite.com (8.14.4/8.14.4) with ESMTP id
	r0MIH5X5011252 for <openembedded-core@lists.openembedded.org>;
	Tue, 22 Jan 2013 13:17:05 -0500
Received: (qmail 29539 invoked by uid 0); 22 Jan 2013 18:17:05 -0000
Received: from unknown (HELO ?10.0.0.14?)
	(mike@milosoftware.com@85.150.144.104)
	by 0 with ESMTPA; 22 Jan 2013 18:17:05 -0000
Message-ID: <50FED7A0.1060200@topic.nl>
Date: Tue, 22 Jan 2013 19:17:04 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130106 Thunderbird/17.0.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1358836314.git.Qi.Chen@windriver.com>
	<3d6b90b5ad79166eda3883ad4e9d5ca1ed937f10.1358836314.git.Qi.Chen@windriver.com>
In-Reply-To: <3d6b90b5ad79166eda3883ad4e9d5ca1ed937f10.1358836314.git.Qi.Chen@windriver.com>
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
X-List-Received-Date: Tue, 22 Jan 2013 18:34:56 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/22/2013 07:36 AM, Qi.Chen@windriver.com wrote:
> From: Chen Qi <Qi.Chen@windriver.com>
>
> read_only_rootfs_hook: this funtion is invoked only if 'read-only-rootfs'
> is in IMAGE_FEATURES. It tweaks some basic files and makes populate-
> volatile.sh script run at rootfs time.

To me, it seems running populate-volatile at rootfs is a good thing for 
writable rootfs as well, it reduces the writing at first boot. Why not 
ALWAYS do this?

-- 
Mike Looijmans - Topic Automation


