Return-Path: <Zhe.He@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AE17E7E76E
	for <openembedded-core@lists.openembedded.org>;
	Wed, 12 Jun 2019 11:12:05 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x5CBC5Vu006822
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 12 Jun 2019 04:12:05 -0700 (PDT)
Received: from [128.224.162.221] (128.224.162.221) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.439.0;
	Wed, 12 Jun 2019 04:12:05 -0700
To: <richard.purdie@linuxfoundation.org>,
	<openembedded-core@lists.openembedded.org>
References: <1560330909-164994-1-git-send-email-zhe.he@windriver.com>
	<d0b197e49ef118034631fae6f322a745b0e34932.camel@linuxfoundation.org>
	<5f8e3df5-5687-c6a2-5ee7-c3c468ef6d86@windriver.com>
	<8e3f4ca45c12db069072f5760d3f13e1b4e97cc4.camel@linuxfoundation.org>
From: He Zhe <zhe.he@windriver.com>
Message-ID: <4b2b4fcd-ef6d-2643-53df-b943970337f5@windriver.com>
Date: Wed, 12 Jun 2019 19:11:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <8e3f4ca45c12db069072f5760d3f13e1b4e97cc4.camel@linuxfoundation.org>
X-Originating-IP: [128.224.162.221]
Subject: Re: [PATCH] lttng-modules: Add git based recipe
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
X-List-Received-Date: Wed, 12 Jun 2019 11:12:05 -0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 6/12/19 6:27 PM, richard.purdie@linuxfoundation.org wrote:
> On Wed, 2019-06-12 at 18:21 +0800, He Zhe wrote:
>> On 6/12/19 5:57 PM, Richard Purdie wrote:
>>> On Wed, 2019-06-12 at 17:15 +0800, zhe.he@windriver.com wrote:
>>>> From: He Zhe <zhe.he@windriver.com>
>>>>
>>>> This is based on meta/recipes-kernel/lttng/lttng-
>>>> modules_2.10.9.bb and is for
>>>> those who want to build lttng-modules with bleeding edge kernel,
>>>> to avoid
>>>> regularly backporting patches from upstream.
>>>>
>>>> Note that PREFERRED_VERSION needs to be set to select this recipe
>>>> instead of the
>>>> tar ball one.
>>>>
>>>> Signed-off-by: He Zhe <zhe.he@windriver.com>
>>>> ---
>>>>  meta/recipes-kernel/lttng/lttng-modules_git.bb | 34
>>>> ++++++++++++++++++++++++++
>>>>  1 file changed, 34 insertions(+)
>>>>  create mode 100644 meta/recipes-kernel/lttng/lttng-
>>>> modules_git.bb
>>> Do we really want/need to duplicate the whole recipe?
>> Do you like one .inc plus two .bb s? Then I'll send v2 later.
> Yes, or just require the other .bb file and override the pieces needed.
> Not quite sure which would look best right now.
>
> Ultimately I'd like to have something like Ross' patch:
>
> http://git.yoctoproject.org/cgit.cgi/poky-contrib/commit/?h=ross/gitup
>
> and use that for cases like this. Requiring the .bb and then tweaking
> may allow migration to something like this more easily.

It's been renamed with devupstream. I'll send v3.

Thanks,
Zhe

>
> Cheers,
>
> Richard
>
>


