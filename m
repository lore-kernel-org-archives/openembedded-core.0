Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa08-08.prod.phx3.secureserver.net
	(p3plsmtpa08-08.prod.phx3.secureserver.net [173.201.193.109])
	by mail.openembedded.org (Postfix) with ESMTP id CE4626017E
	for <openembedded-core@lists.openembedded.org>;
	Wed,  1 Oct 2014 13:12:48 +0000 (UTC)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa08-08.prod.phx3.secureserver.net with 
	id xpCl1o0010BVjqb01pClTF; Wed, 01 Oct 2014 06:12:49 -0700
Message-ID: <542BFDCC.6000301@pabigot.com>
Date: Wed, 01 Oct 2014 08:12:44 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.2
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <1411647477-12992-1-git-send-email-sledz@dresearch-fe.de>
	<20141001005520.GO2480@denix.org>
In-Reply-To: <20141001005520.GO2480@denix.org>
Subject: Re: [daisy][PATCH 1/3] layer.conf: Add in useradd dependencies as ABISAFE dependencies
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
X-List-Received-Date: Wed, 01 Oct 2014 13:13:01 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/30/2014 07:55 PM, Denys Dmytriyenko wrote:
> On Thu, Sep 25, 2014 at 02:17:55PM +0200, Steffen Sledz wrote:
>> Currently allarch recipes using useradd rebuild each time MACHINE
>> changes which is not desireable. Adding the useradd dependencies
>> to this list ensures they do not change under these circumstances.
>>
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> Signed-off-by: Steffen Sledz <sledz@dresearch-fe.de>
>> ---
>>   meta/conf/layer.conf | 4 ++++
>>   1 file changed, 4 insertions(+)
>>
>> diff --git a/meta/conf/layer.conf b/meta/conf/layer.conf
>> index 18609dd..a764ee0 100644
>> --- a/meta/conf/layer.conf
>> +++ b/meta/conf/layer.conf
>> @@ -30,4 +30,8 @@ SIGGEN_EXCLUDERECIPES_ABISAFE += " \
>>     udev-extraconf \
>>     packagegroup-x11-xserver \
>>     systemd-serialgetty \
>> +  initscripts \
> This line above ^^^^ has a very long trail of whitespaces and it got commited
> that way, unfortunately :(

If OE developers and patch submitters do:

   cd .git/hooks
   mv pre-commit.sample pre-commit

in each layer, such errors will be detected at commit time. Wouldn't fix 
issues with whitespace in pulled material or git am but it could reduce 
introducing the problem.

Peter


