Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 275E374C97
	for <openembedded-core@lists.openembedded.org>;
	Sat, 29 Sep 2018 03:28:24 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id w8T3RnCJ011740
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 28 Sep 2018 20:27:59 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Fri, 28 Sep 2018 20:27:38 -0700
To: Alexander Kanavin <alex.kanavin@gmail.com>
References: <cover.1537175252.git.kai.kang@windriver.com>
	<2a01e366-0e9d-0cc6-419b-6856173bff6f@windriver.com>
	<CANNYZj8D+iTsULmigJmWW1re_JHHHpziUEGmOwSHc8+eVs76sg@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <51e07d2e-1862-9d12-1098-c9cf131a9712@windriver.com>
Date: Sat, 29 Sep 2018 11:25:12 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <CANNYZj8D+iTsULmigJmWW1re_JHHHpziUEGmOwSHc8+eVs76sg@mail.gmail.com>
Cc: OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Fix install file conflicts of gobject-introspection when multilib is enabled
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
X-List-Received-Date: Sat, 29 Sep 2018 03:28:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

On 2018年09月28日 16:27, Alexander Kanavin wrote:
> The original patches never made it to the list, can you resend please?
> (just confirmed with oe-core archive page)

It seems something wrong with git send-email on my new build server. 
Many thanks for the reminder.

--Kai

>
> Alex
>
>
> On Thu, 27 Sep 2018 at 10:28, Kang Kai <Kai.Kang@windriver.com> wrote:
>> On 2018年09月17日 17:43, Kai Kang wrote:
>>> Some of .gir files are target related, so install .gir files to ${libdir}
>>> rather than ${datadir} to fix install file conflicts when mutlilib is enabled.
>>>
>>> The following changes since commit b78597a4e038ed64b379f11257002e5a5f24886f:
>>>
>>>     xf86-video-fbdev: update to 0.5.0 (2018-09-17 08:41:45 +0100)
>>>
>>> are available in the Git repository at:
>>>
>>>     git://git.pokylinux.org/poky-contrib kangkai/gir
>>>     http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=kangkai/gir
>>>
>>> Kai Kang (2):
>>>     gobject-introspection: fix multilib install file conflicts
>>>     vala: update vapigen-wrapper
>> Ping...
>>
>>>    meta/recipes-devtools/vala/vala.inc           |  4 +-
>>>    ...nfigure.ac-make-GIR_DIR-configurable.patch | 65 +++++++++++++++++++
>>>    .../gobject-introspection_1.58.0.bb           | 10 ++-
>>>    3 files changed, 75 insertions(+), 4 deletions(-)
>>>    create mode 100644 meta/recipes-gnome/gobject-introspection/gobject-introspection/0001-configure.ac-make-GIR_DIR-configurable.patch
>>>
>> --
>> Regards,
>> Neil | Kai Kang
>>
>> --
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-core


-- 
Regards,
Neil | Kai Kang


