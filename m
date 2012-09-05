Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Kai.Kang@windriver.com>) id 1T9BRh-0000j1-2n
	for openembedded-core@lists.openembedded.org;
	Wed, 05 Sep 2012 10:58:49 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q858kNJW029076
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 5 Sep 2012 01:46:23 -0700 (PDT)
Received: from [128.224.162.164] (128.224.162.164) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.2.309.2;
	Wed, 5 Sep 2012 01:46:23 -0700
Message-ID: <5047116E.7060405@windriver.com>
Date: Wed, 5 Sep 2012 16:46:38 +0800
From: Kang Kai <Kai.Kang@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1346829716.git.kai.kang@windriver.com>
	<5005901e3eda3b6c290bf31f2b2c73dbc4ccef39.1346829716.git.kai.kang@windriver.com>
	<20120905082729.GM3372@jama.jama.net>
In-Reply-To: <20120905082729.GM3372@jama.jama.net>
X-Originating-IP: [128.224.162.164]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q858kNJW029076
Cc: openembedded-core@lists.openembedded.org, Zhenfeng.Zhao@windriver.com
Subject: Re: [PATCH 9/9] task-core-lsb.bbappend: add bbappend file
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 05 Sep 2012 08:58:49 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B409=E6=9C=8805=E6=97=A5 16:27, Martin Jansa wrote:
> On Wed, Sep 05, 2012 at 03:32:48PM +0800, Kang Kai wrote:
>> Add file task-core-lsb.bbappend. Packages added in layer meta-lsb shou=
ld
>> put in this file.
>>
>> Add package wget and perl modules.
>>
>> LSB needs wget to download packages. But wget provided by busybox does=
n't
>> support some options such as '-N'.
>>
>> LSB perl test 4.1.6-2 case all/tst_perlModPresent.pl,
>> ../lib/Class/ISA/t/00_about_verbose and
>> ../lib/Class/ISA/t/01_old_junk.t
>> fail because of lack of these modules, add them to make test pass.
>>
>> [Yocto #3030 #3031]
> This probably needs to be renamed to packagegroup already, current
> master has
> ./meta/recipes-extended/packagegroups/packagegroup-core-lsb.bb
Thanks.
Miss the update, recall this patch.

Regards,
Kai

>
>> Signed-off-by: Kang Kai<kai.kang@windriver.com>
>> ---
>>   meta-lsb/recipes-core/tasks/task-core-lsb.bbappend |   15 ++++++++++=
+++++
>>   1 files changed, 15 insertions(+), 0 deletions(-)
>>   create mode 100644 meta-lsb/recipes-core/tasks/task-core-lsb.bbappen=
d
>>
>> diff --git a/meta-lsb/recipes-core/tasks/task-core-lsb.bbappend b/meta=
-lsb/recipes-core/tasks/task-core-lsb.bbappend
>> new file mode 100644
>> index 0000000..f964481
>> --- /dev/null
>> +++ b/meta-lsb/recipes-core/tasks/task-core-lsb.bbappend
>> @@ -0,0 +1,15 @@
>> +#
>> +# Copyright (c) 2012 Wind River Systems, Inc.
>> +#
>> +
>> +RDEPENDS_task-core-lsb-command-add_append +=3D "wget"
>> +
>> +RDEPENDS_task-core-lsb-runtime-add_append +=3D "\
>> +    libclass-isa-perl \
>> +    libenv-perl \
>> +    libdumpvalue-perl \
>> +    libfile-checktree-perl \
>> +    libi18n-collate-perl \
>> +    libpod-plainer-perl"
>> +
>> +
>> --=20
>> 1.7.5.4
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core



