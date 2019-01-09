Return-Path: <Qi.Chen@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 31F0E60596
	for <openembedded-core@lists.openembedded.org>;
	Wed,  9 Jan 2019 01:39:48 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id x091dhgr019279
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 8 Jan 2019 17:39:43 -0800 (PST)
Received: from [128.224.163.141] (128.224.163.141) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.408.0;
	Tue, 8 Jan 2019 17:39:43 -0800
To: "Burton, Ross" <ross.burton@intel.com>, "Purdie, Richard"
	<richard.purdie@linuxfoundation.org>
References: <cover.1546938633.git.Qi.Chen@windriver.com>
	<11e2fba7bd1e165047915f5a77cb85ba96410da4.1546938633.git.Qi.Chen@windriver.com>
	<CAJTo0La-LVLk8OPabGePojhGMYvA6RRY-8DakEHecVUq_amELA@mail.gmail.com>
	<7e7292a7d955db6ae138a10af3c5894dedbd6c29.camel@linuxfoundation.org>
	<CAJTo0Lbj10QLG-AH6YYOua1NtZfcPGKi0swnKR444bPjBrJZEQ@mail.gmail.com>
	<6af27248c02eb709ad45c6cbfbe7e464b80cd2db.camel@linuxfoundation.org>
	<CAJTo0LYtBhi3irqWJuTCsT9tw5zvXDfjN=Pt+QJ9UXzP1LhGag@mail.gmail.com>
From: ChenQi <Qi.Chen@windriver.com>
Message-ID: <9bc4ea0c-32f9-f054-47c5-f0041d85cfba@windriver.com>
Date: Wed, 9 Jan 2019 09:47:56 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LYtBhi3irqWJuTCsT9tw5zvXDfjN=Pt+QJ9UXzP1LhGag@mail.gmail.com>
X-Originating-IP: [128.224.163.141]
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 1/1] netbase/base-files: move /etc/hosts from netbase to base-files
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
X-List-Received-Date: Wed, 09 Jan 2019 01:39:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/08/2019 09:00 PM, Burton, Ross wrote:
> On Tue, 8 Jan 2019 at 12:47, <richard.purdie@linuxfoundation.org> wrote:
>>>> Not so good if hostname isn't set?
>>> hostname = "${MACHINE}"
>>>
>>> Hostname is always set. :)
>> Its the kind of thing people likely bbappend and change, or set from
>> overrides. Which was one of the reasons I'm nervous about moving hosts
>> to a different package in the first place...
> In all those situation the hostname will be set, right?  Is anyone
> actually going to bbappend/override the value to ""?
>
> Ross
>

We did so maybe two or three years ago, via a distro configuration file. 
We later removed this override.
Also, the original codes in base-files are:
         if [ "${hostname}" ]; then
                 echo ${hostname} > ${D}${sysconfdir}/hostname
         fi
So I just put the line in the check.

Best Regards,
Chen Qi

