Return-Path: <Liezhi.Yang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 767696B50C
	for <openembedded-core@lists.openembedded.org>;
	Tue, 14 Jan 2014 02:13:06 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s0E2D2sq011000
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 13 Jan 2014 18:13:02 -0800 (PST)
Received: from [128.224.162.226] (128.224.162.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 13 Jan 2014 18:13:02 -0800
Message-ID: <52D49D2C.6020904@windriver.com>
Date: Tue, 14 Jan 2014 10:13:00 +0800
From: Robert Yang <liezhi.yang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, Henning Heinold
	<heinold@inf.fu-berlin.de>
References: <cover.1389629682.git.liezhi.yang@windriver.com>	<20140113102147.GK16995@jama>
	<52D3C44B.20403@windriver.com>	<20140113115249.GA22825@mail.zedat.fu-berlin.de>
	<20140113115856.GL16995@jama>
In-Reply-To: <20140113115856.GL16995@jama>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/5] refactor the archive*.bbcalss
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
X-List-Received-Date: Tue, 14 Jan 2014 02:13:06 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 01/13/2014 07:58 PM, Martin Jansa wrote:
> On Mon, Jan 13, 2014 at 12:52:49PM +0100, Henning Heinold wrote:
>> On Mon, Jan 13, 2014 at 06:47:39PM +0800, Robert Yang wrote:
>>>
>>> On 01/13/2014 06:21 PM, Martin Jansa wrote:
>>>> On Tue, Jan 14, 2014 at 12:20:14AM +0800, Robert Yang wrote:
>>>>> * The archive*.bbclass didn't work, and there were a few problems, for
>>>>>    example:
>>>>>    1) There were a few duplicated code
>>>>>    2) There was no src_dir.org (or orig), but the diff command still use
>>>>>       it, and it is not easy to fix this issue if we don't change a lot
>>>>>       of the code.
>>>>>    3) It didn't archive the source for the native or gcc
>>>>>    4) The work flow is not very well
>>>>>    5) The "subprocess.call('fakeroot cp xxxx'" should be removed
>>>>>    6) And others ...
>>>>>
>>>>> * So that we have to refactor it, the benefits are:
>>>>>    1) Fix the problems and make it work well.
>>>>>    2) Reduce more than 400 lines in total.
>>>>>    3) Make it easy to use.
>>>>
>>>> Have you seen
>>>> http://lists.openembedded.org/pipermail/openembedded-core/2013-December/087729.html
>>>> ?
>>>>
>>>> Could you review it/integrate changes from it?
>>>
>>> I've looked at it just now, I think the problems that you mentioned have been
>>> fixed during the refactor. It won't install/remove the files manually any more,
>>> they will be installed/removed by the sstate. And the usage become easier, just
>>> this would be OK by default:
>>>
>>> INHERIT += "archiver"
>>>
>>> And we can easily add other functions when needed.
>>>
>>> // Robert
>>>
>>
>> Hi Robert,
>>
>> does the whole thread means it is broken in dora too? Are there plans to backport the patches?
>
> AFAIK it's broken everywhere, I would like to have it backported to
> dylan as well (after testing that it indeed fixes source files being
> removed)
>

Yes, Martin is right, but I'm not sure whether we should backport them
since we have change a lot of the code, and there should be bugs, usually,
though, I've done as many testing as I can.

BTW., I've updated the code a little in the PULL:

Use "1" or "0" rather than "yes" or "no", which seems more popular in oe,
for example:

ARCHIVER_MODE[dumpdata] = "1" (it was "yes" before).

// Robert


>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

