Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 4BE5D65D59
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Sep 2014 15:08:54 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s8OF8pZo005829
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 24 Sep 2014 08:08:52 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 24 Sep 2014 08:08:51 -0700
Message-ID: <5422DE7A.2020607@windriver.com>
Date: Wed, 24 Sep 2014 23:08:42 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.1.1
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>
References: <cover.1411558039.git.hongxu.jia@windriver.com>
	<1ae0b3a4ea4c5fff1bd7a785b3d05d2ac6a0e394.1411558039.git.hongxu.jia@windriver.com>
	<CAJTo0LaVEuz9H=0bYy11myRee806eohDE5uqOyVUcTfTe1yYag@mail.gmail.com>
In-Reply-To: <CAJTo0LaVEuz9H=0bYy11myRee806eohDE5uqOyVUcTfTe1yYag@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/4] scripts/postinst-intercepts: add update_info_dir
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
X-List-Received-Date: Wed, 24 Sep 2014 15:09:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 09/24/2014 10:52 PM, Burton, Ross wrote:
> On 24 September 2014 12:38, Hongxu Jia <hongxu.jia@windriver.com> wrote:
>> +# since user's environment is taken over into root account when sudo-ing
>> +# we don't want that one's user LANGUAGE setting changes the messages in
>> +# the dir file. Unset LANGUAGE and reload /etc/environment to get
>> +# the system wide settings. See bug #536476
>> +unset LANGUAGE
>> +unset LANG
>> +if [ -r /etc/environment ] ; then
>> +  . /etc/environment
>> +fi
>> +if [ -r /etc/default/locale ] ; then
>> +  . /etc/default/locale
>> +fi
> Isn't this Debian-specific, and also pushing the build host's
> environment settings onto the target?  We should use whatever default
> locale is configured for the image, or easier just force it to C.

Okay, I will just force it to C.

//Hongxu

> Ross


