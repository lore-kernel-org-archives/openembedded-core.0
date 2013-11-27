Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 3839A6148C
	for <openembedded-core@lists.openembedded.org>;
	Wed, 27 Nov 2013 02:00:14 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id rAR20EQF029532
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Nov 2013 18:00:14 -0800 (PST)
Received: from [128.224.162.213] (128.224.162.213) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.347.0;
	Tue, 26 Nov 2013 18:00:13 -0800
Message-ID: <5295524A.4000803@windriver.com>
Date: Wed, 27 Nov 2013 10:00:42 +0800
From: ChenQi <Qi.Chen@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130804 Thunderbird/17.0.8
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1384587416.git.Qi.Chen@windriver.com>
	<5292BE1C.2080803@windriver.com>
	<52948AF5.90709@communistcode.co.uk>
In-Reply-To: <52948AF5.90709@communistcode.co.uk>
X-Originating-IP: [128.224.162.213]
Subject: Re: [PATCH 0/1] shadow-native: allow for setting password in clear text
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
X-List-Received-Date: Wed, 27 Nov 2013 02:00:14 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/2013 07:50 PM, Jack Mitchell wrote:
> On 25/11/13 03:03, ChenQi wrote:
>> ping
>>
>> On 11/16/2013 03:37 PM, Qi.Chen@windriver.com wrote:
>>> From: Chen Qi <Qi.Chen@windriver.com>
>>>
>>> The following changes since commit
>>> ea92671d9823e3667d6ced7ac2af20f991da404d:
>>>
>>>     bitbake: cooker: replace "w" file opening mode with "a" mode
>>> (2013-11-12 17:01:37 +0000)
>>>
>>> are available in the git repository at:
>>>
>>>     git://git.pokylinux.org/poky-contrib ChenQi/cleartext-password
>>>    
>>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=ChenQi/cleartext-password
>>>
>>>
>>> Chen Qi (1):
>>>     shadow-native: allow for setting password in clear text
>>>
>>>    .../allow-for-setting-password-in-clear-text.patch |  208
>>> ++++++++++++++++++++
>>>    meta/recipes-extended/shadow/shadow.inc            |    1 +
>>>    2 files changed, 209 insertions(+)
>>>    create mode 100644
>>> meta/recipes-extended/shadow/files/allow-for-setting-password-in-clear-text.patch
>>>
>>>
> Could you provide a short example for how this is to be used? An
> additional patch to user-add in meta-skeleton perhaps?
>

OK. I'll send out a  patch for useradd example in meta-skeleton. I'll 
also modify the local.conf.sample.extended to include this information.

//Chen Qi

