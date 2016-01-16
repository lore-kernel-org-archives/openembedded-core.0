Return-Path: <mike.looijmans@topic.nl>
Received: from smtp02.mail.online.nl (smtp02.mail.online.nl [194.134.25.72])
	by mail.openembedded.org (Postfix) with ESMTP id 03F71731CB
	for <openembedded-core@lists.openembedded.org>;
	Sat, 16 Jan 2016 10:51:56 +0000 (UTC)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp02.mail.online.nl (Postfix) with ESMTP id BB0141A0019;
	Sat, 16 Jan 2016 11:51:54 +0100 (CET)
To: Robert Yang <liezhi.yang@windriver.com>,
	openembedded-core@lists.openembedded.org
References: <cover.1452824908.git.liezhi.yang@windriver.com>
	<06cd5b4b25da645fae5767a44b2e5d63550cdb52.1452824908.git.liezhi.yang@windriver.com>
	<56989142.2050800@topic.nl> <569893BA.80608@windriver.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <569A20CA.2040201@topic.nl>
Date: Sat, 16 Jan 2016 11:51:54 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.4.0
MIME-Version: 1.0
In-Reply-To: <569893BA.80608@windriver.com>
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
X-List-Received-Date: Sat, 16 Jan 2016 10:51:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 15-01-16 07:37, Robert Yang wrote:
>
>
> On 01/15/2016 02:27 PM, Mike Looijmans wrote:
>> How about /etc/init.d and /etc/rcS.d? Are these now suddenly CONFFILES
>> too?
>
> For /etc/init.d/*, yes, and I think that they should be CONFFILES.

Startup scripts are config files? Wow that's news to me.

They all include /etc/defaults/something for a good reason: So you don't 
have to hack the script.

> For /etc/rcS.d/*, they are symlinks which are not owned by pkg,
> but created by update-rc.d.

Only if the recipe happens to use update-rc. Quite some packages don't 
use it and just create the symlinks themselves.


As I recall, this suggestion has been made before and was rejected then. 
Nothing really changed since.


-- 
Mike Looijmans

