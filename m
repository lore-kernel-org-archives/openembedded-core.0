Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 474 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 04 Mar 2016 10:25:27 UTC
Received: from smtp02.mail.online.nl (smtp02.mail.online.nl [194.134.25.72])
	by mail.openembedded.org (Postfix) with ESMTP id 1E12A7320F
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 10:25:27 +0000 (UTC)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp02.mail.online.nl (Postfix) with ESMTP id 49B661A03A8
	for <openembedded-core@lists.openembedded.org>;
	Fri,  4 Mar 2016 11:17:32 +0100 (CET)
To: openembedded-core@lists.openembedded.org
References: <1456227383-9212-1-git-send-email-markus.lehtonen@linux.intel.com>
	<1456227383-9212-2-git-send-email-markus.lehtonen@linux.intel.com>
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
Message-ID: <56D960BC.5070800@topic.nl>
Date: Fri, 4 Mar 2016 11:17:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1456227383-9212-2-git-send-email-markus.lehtonen@linux.intel.com>
Subject: Re: [PATCH] base.bbclass wipe ${S} before unpacking source
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
X-List-Received-Date: Fri, 04 Mar 2016 10:25:29 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

You might want to assure that S is a child of WORKDIR before wiping it. 
Strange things would happen if someone tried setting S=$HOME in a recipe 
(by mistake or just for experimenting).


On 23-02-16 12:36, Markus Lehtonen wrote:
> Make sure that we have a pristine source tree after do_unpack.
>
> [YOCTO #9064]
>
> Signed-off-by: Markus Lehtonen <markus.lehtonen@linux.intel.com>
> ---
>   meta/classes/base.bbclass | 8 +++-----
>   1 file changed, 3 insertions(+), 5 deletions(-)

...

-- 
Mike Looijmans

