Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 320 seconds by postgrey-1.34 at layers.openembedded.org;
	Sat, 27 Dec 2014 14:06:19 UTC
Received: from smtp01.online.nl (smtp01.online.nl [194.134.41.31])
	by mail.openembedded.org (Postfix) with ESMTP id 62F46725F4
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Dec 2014 14:06:19 +0000 (UTC)
Received: from smtp01.online.nl (localhost [127.0.0.1])
	by smtp01.online.nl (Postfix) with ESMTP id 3C7428E11C
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Dec 2014 15:00:56 +0100 (CET)
Received: from [192.168.1.4] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp01.online.nl (Postfix) with ESMTP
	for <openembedded-core@lists.openembedded.org>;
	Sat, 27 Dec 2014 15:00:56 +0100 (CET)
Message-ID: <549EBB98.2090006@topic.nl>
Date: Sat, 27 Dec 2014 15:00:56 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1419471695.git.hongxu.jia@windriver.com>	<883cc974857e6896b33eb4be4f5c326840bb90ad.1419471695.git.hongxu.jia@windriver.com>
	<CAP9ODKqYTffL5+7uY9VTbR9nM1bMU9nA5rb0-C0FXm3GmX3POQ@mail.gmail.com>
In-Reply-To: <CAP9ODKqYTffL5+7uY9VTbR9nM1bMU9nA5rb0-C0FXm3GmX3POQ@mail.gmail.com>
X-Online-Scanned: by Cloudmark authority (on smtp01.online.nl)
Subject: Re: [PATCH 4/4] busybox.inc: fix QA package-missing warnings
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
X-List-Received-Date: Sat, 27 Dec 2014 14:06:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 12/26/2014 02:59 PM, Otavio Salvador wrote:
> On Wed, Dec 24, 2014 at 11:48 PM, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> While building busybox with QA package-missing checking enabled,
>> there was warning:
>> ...
>> WARNING: QA Issue: package busybox-mdev not generated, but listed in PACKAGES
>> WARNING: QA Issue: package busybox-httpd not generated, but listed in PACKAGES
>> ...
>>
>> The config in ${B}/.config decides to generate busybox-mdev,
>> busybox-httpd or not. Files are copied if the packages generated.
>> So set PACKAGES in do_package according to the existance of files.
>>
>> Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
>
> Shouldn't we "invert" the logic here? This patch 'removes' httpd and
> mdev when those are not enabled. Why we don't /add/ those when they
> are enabled?

maybe the answer is in a question:
What would happen then if someone typed "bitbake busybox-mdev"?


-- 
Mike Looijmans

