Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1S7h2Q-0007lq-Vc
	for openembedded-core@lists.openembedded.org;
	Wed, 14 Mar 2012 06:46:19 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2E5bWhJ001942
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 13 Mar 2012 22:37:32 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Tue, 13 Mar 2012 22:37:32 -0700
Message-ID: <4F602EA3.4040202@windriver.com>
Date: Wed, 14 Mar 2012 13:37:39 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1331642569.git.xiaofeng.yan@windriver.com>
	<404febfffd308c4a39682210456761c6bdbc8edb.1331642569.git.xiaofeng.yan@windriver.com>
	<4F600901.1050108@linux.intel.com>
In-Reply-To: <4F600901.1050108@linux.intel.com>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q2E5bWhJ001942
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 6/7] local.conf.sample: Add set for archiving packages
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
X-List-Received-Date: Wed, 14 Mar 2012 05:46:19 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B403=E6=9C=8814=E6=97=A5 10:57, Saul Wold wrote:
> On 03/13/2012 05:52 AM, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> User can use these variables to get atchiving packages they want.
>>
>> [YOCTO #1977]
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>> meta-yocto/conf/local.conf.sample | 25 +++++++++++++++++++++++++
>> 1 files changed, 25 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta-yocto/conf/local.conf.sample=20
>> b/meta-yocto/conf/local.conf.sample
>> index 38507e3..6f16c9a 100644
>> --- a/meta-yocto/conf/local.conf.sample
>> +++ b/meta-yocto/conf/local.conf.sample
>> @@ -121,6 +121,31 @@ DISTRO ?=3D "poky"
>> PACKAGE_CLASSES ?=3D "package_rpm"
>>
>> #
>> +# Archiving packages configuration
>> +#
>> +# The following variables lists which files to archive and the=20
>> package type to archive.
>> +# One bbclass of them=20
>> (archive-original-source.bbclass,archive-patched-source.bbclass
>> +# and archive-configured-source.bbclass) should be inherited in a=20
>> globale bbclass, for example,
>> +# intherit archive-original-source in packages_rpm.bbclass
>> +#
>> +# SOURCE_ARCHIVE_PACKAGE_TYPE =3D {'tar','srpm'}
>> +#SOURCE_ARCHIVE_PACKAGE_TYPE ?=3D 'tar'
>> +#
>> +# SOURCE_ARCHIVE_LOG_WITH_SCRIPTS =3D {'logs_with_scripts', 'logs'}
>> +# String 'logs_with_scripts' include temp directory and .bb and .inc=20
>> files
>> +# String 'logs' only include temp
>> +#SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?=3D 'logs_with_scripts'
>> +#
>> +# PATCHES_ARCHIVE_WITH_SERIES =3D {'true', 'false'}
>> +# Strings 'true' means that patches including series files(series +=20
>> non-applying)
>> +# String 'false' means that no series and only archive applying patch=
es
>> +#PATCHES_ARCHIVE_WITH_SERIES ?=3D 'true'
>> +#
> Why the distinction? Also, you seem to translate this to all or=20
> applying, so why not just use those terms here and always include the=20
> series file?
>
I will remove this set and modify archiver.bbclass to including series=20
as the default set.
> The PATCHES_ARCHIVE_WITH_SERIES does not really make sense when=20
> non-applying is added in.
>> +# Archive packages for copyleft(GPL*,LGPL*)
>> +#COPYLEFT_COMPLIANCE ?=3D 'true'
>> +#
>> +
>> +#
>> # SDK/ADT target architecture
>> #
>> # This variable specified the architecture to build SDK/ADT items for=20
>> and means
>



