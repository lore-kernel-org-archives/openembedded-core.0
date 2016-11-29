Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 20F7B71AFB
	for <openembedded-core@lists.openembedded.org>;
	Tue, 29 Nov 2016 10:27:40 +0000 (UTC)
To: openembedded-core@lists.openembedded.org
References: <cover.1479809328.git.Qi.Chen@windriver.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <f82a874a-0c75-d341-31f9-8dbeba5a4235@embed.me.uk>
Date: Tue, 29 Nov 2016 10:28:56 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.5.0
MIME-Version: 1.0
In-Reply-To: <cover.1479809328.git.Qi.Chen@windriver.com>
Subject: Re: [PATCH 0/4] Persistent /var/log support
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
X-List-Received-Date: Tue, 29 Nov 2016 10:27:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 22/11/16 10:10, Chen Qi wrote:
> The following changes since commit a675b2c89e477af088faee9b3be96eae19a85f0b:
>
>   sanity.bbclass: fix logging of an error (2016-11-15 15:18:50 +0000)
>
> are available in the git repository at:
>
>   git://git.openembedded.org/openembedded-core-contrib ChenQi/persistent-var-log
>   http://cgit.openembedded.org/cgit.cgi/openembedded-core-contrib/log/?h=ChenQi/persistent-var-log
>
> Chen Qi (4):
>   bitbake.conf: add VOLATILE_LOG_DIR variable
>   base-files: respect VOLATILE_LOG_DIR
>   initscripts: support persistent /var/log
>   package.bbclass: support persistent /var/log
>
>  meta/classes/package.bbclass                       |  2 +-
>  meta/conf/bitbake.conf                             |  3 +
>  meta/files/fs-perms-persistent-log.txt             | 69 ++++++++++++++++++++++
>  meta/recipes-core/base-files/base-files_3.0.14.bb  |  4 +-
>  .../initscripts/initscripts-1.0/volatiles          |  1 -
>  meta/recipes-core/initscripts/initscripts_1.0.bb   |  3 +
>  6 files changed, 78 insertions(+), 4 deletions(-)
>  create mode 100644 meta/files/fs-perms-persistent-log.txt
>

Ack from me, I don't know if this is the best way to do it, but it is 
way way way too hard to get persistent logging in OE. I've had to 
implement it in numerous ways, multiple times over the past few years 
and it shouldn't be that hard.

