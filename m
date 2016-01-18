Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 30489731D5
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Jan 2016 01:33:57 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id u0I1Xvou030701
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 17 Jan 2016 17:33:57 -0800
Received: from [128.224.162.155] (128.224.162.155) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.248.2;
	Sun, 17 Jan 2016 17:33:57 -0800
To: Mike Looijmans <mike.looijmans@topic.nl>,
	<openembedded-core@lists.openembedded.org>
References: <cover.1452824908.git.liezhi.yang@windriver.com>
	<06cd5b4b25da645fae5767a44b2e5d63550cdb52.1452824908.git.liezhi.yang@windriver.com>
	<56989142.2050800@topic.nl> <569893BA.80608@windriver.com>
	<569A20CA.2040201@topic.nl>
From: Robert Yang <liezhi.yang@windriver.com>
Message-ID: <569C4103.1070400@windriver.com>
Date: Mon, 18 Jan 2016 09:33:55 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <569A20CA.2040201@topic.nl>
Subject: Re: [PATCH 1/8] bitbake.conf: set CONFFILES by default
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
X-List-Received-Date: Mon, 18 Jan 2016 01:33:59 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/16/2016 06:51 PM, Mike Looijmans wrote:
> On 15-01-16 07:37, Robert Yang wrote:
>>
>>
>> On 01/15/2016 02:27 PM, Mike Looijmans wrote:
>>> How about /etc/init.d and /etc/rcS.d? Are these now suddenly CONFFILES
>>> too?
>>
>> For /etc/init.d/*, yes, and I think that they should be CONFFILES.
>
> Startup scripts are config files? Wow that's news to me.

Yes, debian treats startup scripts as config files.

>
> They all include /etc/defaults/something for a good reason: So you don't have to
> hack the script.
>
>> For /etc/rcS.d/*, they are symlinks which are not owned by pkg,
>> but created by update-rc.d.
>
> Only if the recipe happens to use update-rc. Quite some packages don't use it
> and just create the symlinks themselves.
>
>
> As I recall, this suggestion has been made before and was rejected then. Nothing
> really changed since.

I had sent this patch before, but I didn't see any rejected emails.

// Robert

>
>

