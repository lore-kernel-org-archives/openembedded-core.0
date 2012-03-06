Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S4sVw-0001Mz-QT
	for openembedded-core@lists.openembedded.org;
	Tue, 06 Mar 2012 12:25:09 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q26BGLfR012416
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 6 Mar 2012 03:16:21 -0800 (PST)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 6 Mar 2012 03:16:21 -0800
Message-ID: <4F55F208.2020803@windriver.com>
Date: Tue, 6 Mar 2012 19:16:24 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1330771239.git.xiaofeng.yan@windriver.com>
	<4F553E04.3040306@linux.intel.com>
In-Reply-To: <4F553E04.3040306@linux.intel.com>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q26BGLfR012416
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/3] Realize archiver.bbclass
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 06 Mar 2012 11:25:09 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B403=E6=9C=8806=E6=97=A5 06:28, Saul Wold wrote:
> On 03/03/2012 02:53 AM, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> archiver.bbclass is for archiving sources , patches and logs=20
>> including .bb and .inc files by configuring=20
>> archiver_configure.bbclass which control what a archiving package=20
>> should include.
>> For archiving a source rpm package, I add some functions to=20
>> package_rpm.bbclass.
>> I also merge source_pkg.bbclass to archiver.bbclass due to their=20
>> similar functions.
>>
> Are you going to deprecate/remove the other classes sourcepkg.bbclass,=20
> src_distribute.bbclass, src_distribute_local.bbclass and=20
> copyleft_compliance.bbclass
>
sourcepkg.bbclass has been merged into archiver.bbclass. others can't be=20
merged into archiver.bbclass.

I will merge them to archiver.bbclass in V2 and remove tem.
> I am still reviewing this and would like to get ACKs from Chris and Mar=
k.
>
> This is going to require some review and testing. I also sent and=20
> email about the archiver_configure class.
>
> Can you please let us know how you tested, this is an important change=20
> and we would like to get it close to correct the first time through.
>
inherit archiver_configure.bbclass in a global bbclass file, for example=20
package_rpm.bbclass and then run "bitbake core-image-sato" or "bitbake=20
package_name".

archiving package should be deployed in tmp/deploy/sources/ when=20
finishing this building.

> Thanks for your effort on this.
>
> Sau!
>
>> Pull URL: git://git.pokylinux.org/poky-contrib.git
>> Branch: xiaofeng/1977
>> Browse:=20
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dxiaofeng/1977
>>
>> Thanks,
>> Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>>
>>
>> Xiaofeng Yan (3):
>> package_rpm.bbclass: Add srpm function
>> archiver.bbclass: archive sources, patches,logs to tarball
>> archiver_configure.bbclass: configure the content for archiving
>> package
>>
>> meta/classes/archiver.bbclass | 393 +++++++++++++++++++++++++++++++
>> meta/classes/archiver_configure.bbclass | 35 +++
>> meta/classes/package_rpm.bbclass | 54 ++++-
>> 3 files changed, 479 insertions(+), 3 deletions(-)
>> create mode 100644 meta/classes/archiver.bbclass
>> create mode 100644 meta/classes/archiver_configure.bbclass
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>>
>



