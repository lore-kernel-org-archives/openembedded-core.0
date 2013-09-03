Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by mail.openembedded.org (Postfix) with ESMTP id 7211D6BD56
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 11:39:07 +0000 (UTC)
Received: from [192.168.0.2] (host86-137-81-79.range86-137.btcentralplus.com
	[86.137.81.79]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 6FB129571
	for <openembedded-core@lists.openembedded.org>;
	Tue,  3 Sep 2013 12:39:06 +0100 (BST)
Message-ID: <5225CA59.50307@r-finger.com>
Date: Tue, 03 Sep 2013 12:39:05 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130630 Icedove/17.0.7
MIME-Version: 1.0
To: openembedded-core@lists.openembedded.org
References: <cover.1378194734.git.liezhi.yang@windriver.com>
	<f6faba2e39ab7055392521e8324ca08f2afa4c03.1378194734.git.liezhi.yang@windriver.com>
	<CAJTo0LYOgNNfeAHWaCYU-QvE+pEKfOmxU0U13iLu5FLKXfewnw@mail.gmail.com>
	<5225C515.9010804@windriver.com>
In-Reply-To: <5225C515.9010804@windriver.com>
Subject: Re: [PATCH 1/1] glib-2.0: fix a host contamination issue
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
X-List-Received-Date: Tue, 03 Sep 2013 11:39:08 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/09/13 12:16, Robert Yang wrote:
> 
> 
> On 09/03/2013 05:51 PM, Burton, Ross wrote:
>> On 3 September 2013 08:52, Robert Yang <liezhi.yang@windriver.com> wrote:
>>> +    sed -i -e 's/^\(ABS_GLIB_RUNTIME_LIBDIR=.*readlink\) -f/\1 -m/'
>>> ${S}/configure.ac
>>
>> Please do this as a patch instead of a sed.
> 
> It seems that sed command is preferred ? For example, we don't have to
> port the
> patch once we upgrade glib-2.0.

Having to port a patch when it fails to apply ensures we are still doing
the right thing. In contrast, these sed snippets don't generate errors
when they fail, and they remain in recipes for years when no longer
working/needed.

Tomas


