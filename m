Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1Rle46-0006PT-U2
	for openembedded-core@lists.openembedded.org;
	Fri, 13 Jan 2012 11:08:56 +0100
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q0DA1McQ021476
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Fri, 13 Jan 2012 02:01:22 -0800 (PST)
Received: from [128.224.162.146] (128.224.162.146) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Fri, 13 Jan 2012 02:01:21 -0800
Message-ID: <4F100101.6060508@windriver.com>
Date: Fri, 13 Jan 2012 18:01:37 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: Saul Wold <sgw@linux.intel.com>
References: <cover.1326003199.git.xiaofeng.yan@windriver.com>
	<4F0F3CE6.3020707@linux.intel.com>
In-Reply-To: <4F0F3CE6.3020707@linux.intel.com>
X-Originating-IP: [128.224.162.146]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q0DA1McQ021476
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/2] Add function to package source codes tree to source rpm and tar packages
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
X-List-Received-Date: Fri, 13 Jan 2012 10:08:57 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B401=E6=9C=8813=E6=97=A5 04:04, Saul Wold wrote:
> On 01/07/2012 11:11 PM, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> Add file "tar_archive.bbclass" and modify file "package_rpm.bbclass"=20
>> for packaging source codes tree to source rpm and tar packages.
>> After adding srpm function in file "package_rpm.bbclass", user can=20
>> get source rpm packages beside rpm package.
>> User also get tar packages of source codes tree according to the=20
>> requirement from bug 1655. The final result is as follow:
>> Take qemux86 for an example:
>> Get source rpm pakcages
>> 1 Inherit tar_archive.bbclass in package_rpm.bbclass.
>> 2 Select the type of packaging source code tree in=20
>> conf/local.conf(ARCHIVE_TYPE ?=3D "SRPM")
>> 3 Run the following command
>> $ bitbake core-image-sato -c copysources
>> 4 Get source rpm packages:
>> $ tree build/tmp/deploy/sources
>> build/tmp/deploy/sources/
>> =C3=A2=E2=80=9D=E2=80=9D=C3=A2=E2=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC=
 qemux86
>> =C3=A2=E2=80=9D=C5=93=C3=A2=E2=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC =
all-poky-linux
>> =C3=A2=E2=80=9D=E2=80=9A=C3=82 =C3=82 =C3=A2=E2=80=9D=C5=93=C3=A2=E2=80=
=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC encodings-1.0.4-r2.1.src.rpm
>> ......
>> =C3=A2=E2=80=9D=C5=93=C3=A2=E2=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC =
i586-poky-linux
>> =C3=A2=E2=80=9D=E2=80=9A=C3=82 =C3=82 =C3=A2=E2=80=9D=C5=93=C3=A2=E2=80=
=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC acl-2.2.51-r2.src.rpm
>> ......
>> =C3=A2=E2=80=9D=E2=80=9D=C3=A2=E2=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC=
 qemux86-poky-linux
>> =C3=A2=E2=80=9D=C5=93=C3=A2=E2=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC =
base-files-3.0.14-r70.src.rpm
>> ......
>> Get tar packages:
>> 1 Inherit tar_archive.bbclass in an suitable position (for example,=20
>> package_rpm.bbclass).
>> 2 Select the type of packaging source code tree in=20
>> conf/local.conf(ARCHIVE_TYPE ?=3D "TARGZ")
>> 3 Run the following command
>> $ bitbake core-image-sato -c copysources
>> 4 Get tar packages:
>> $ tree build/tmp/deploy/sources
>> buildx86/tmp/deploy/sources
>> =C3=A2=E2=80=9D=E2=80=9D=C3=A2=E2=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC=
 qemux86
>> =C3=A2=E2=80=9D=C5=93=C3=A2=E2=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC =
all-poky-linux
>> =C3=A2=E2=80=9D=E2=80=9A=C3=82 =C3=82 =C3=A2=E2=80=9D=C5=93=C3=A2=E2=80=
=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC encodings-1_1.0.4-r2.1
>> =C3=A2=E2=80=9D=E2=80=9A=C3=82 =C3=82 =C3=A2=E2=80=9D=E2=80=9A=C3=82 =C3=
=82 =C3=A2=E2=80=9D=C5=93=C3=A2=E2=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC=
 encodings-1_1.0.4-r2.1.tar.gz
>> =C3=A2=E2=80=9D=E2=80=9A=C3=82 =C3=82 =C3=A2=E2=80=9D=E2=80=9A=C3=82 =C3=
=82 =C3=A2=E2=80=9D=E2=80=9D=C3=A2=E2=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=
=AC log.tar.gz
>> ......
>> =C3=A2=E2=80=9D=C5=93=C3=A2=E2=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC =
i586-poky-linux
>> =C3=A2=E2=80=9D=E2=80=9A=C3=82 =C3=82 =C3=A2=E2=80=9D=C5=93=C3=A2=E2=80=
=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC acl-2.2.51-r2
>> =C3=A2=E2=80=9D=E2=80=9A=C3=82 =C3=82 =C3=A2=E2=80=9D=E2=80=9A=C3=82 =C3=
=82 =C3=A2=E2=80=9D=C5=93=C3=A2=E2=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC=
 acl-2.2.51-r2.tar.gz
>> =C3=A2=E2=80=9D=E2=80=9D=C3=A2=E2=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC=
 log.tar.gz
>> ......
>> =C3=A2=E2=80=9D=E2=80=9D=C3=A2=E2=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC=
 qemux86-poky-linux
>> =C3=A2=E2=80=9D=C5=93=C3=A2=E2=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC =
core-image-sato-1.0-r0
>> =C3=A2=E2=80=9D=C5=93=C3=A2=E2=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC =
libzypp-0.0-git1+15b6c52260bbc52b3d8e585e271b67e10cc7c433-r17
>> =C3=A2=E2=80=9D=E2=80=9A=C3=82 =C3=82 =C3=A2=E2=80=9D=C5=93=C3=A2=E2=80=
=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC=20
>> libzypp-0.0-git1+15b6c52260bbc52b3d8e585e271b67e10cc7c433-r17.tar.gz
>> =C3=A2=E2=80=9D=E2=80=9A=C3=82 =C3=82 =C3=A2=E2=80=9D=E2=80=9D=C3=A2=E2=
=80=9D=E2=82=AC=C3=A2=E2=80=9D=E2=82=AC log.tar.gz
>> ......
>>
>> if inheriting tar_archive.bbclass in one bb file, then only package=20
>> source codes tree of this file.
>> Take zlib for an example:
>> Get source rpm pakcage of zlib
>> 1 Inherit tar_archive.bbclass in zlib_1.2.5.bb.
>> 2 Select the type of packaging source code tree in=20
>> conf/local.conf(ARCHIVE_TYPE ?=3D "SRPM")
>> 3 Run the following command
>> $ bitbake zlib
>> 4 Get source rpm package:
>> $ ls build/tmp/work/i586-poky-linux/zlib-1.2.5-r3/deploy-srpm/i586/
>> zlib-1.2.5-r3.src.rpm
>>
>>
>> Get tar package of zlib
>> 1 Inherit tar_archive.bbclass in zlib_1.2.5.bb.
>> 2 Select the type of packaging source code tree in=20
>> conf/local.conf(ARCHIVE_TYPE ?=3D "TARGZ")
>> 3 Run the following command
>> $ bitbake zlib
>> 4 Get tar package:
>> $ ls build/tmp/work/i586-poky-linux/zlib-1.2.5-r3/
>> zlib-1.2.5-r3.tar.gz log.tar.gz ......
>>
>>
>> Pull URL: git://git.pokylinux.org/poky-contrib.git
>> Branch: xiaofeng/1655
>> Browse:=20
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=3Dxiaofeng/1655
>>
>> Thanks,
>> Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>>
>>
>> Xiaofeng Yan (2):
>> package_rpm.bbclass: add srpm function in spec file
>> tar_archive.bbclass: Package source codes and log files to tar
>> package
>>
>> meta/classes/package_rpm.bbclass | 65 ++++++++++--
>> meta/classes/tar_archive.bbclass | 216=20
>> ++++++++++++++++++++++++++++++++++++++
>> 2 files changed, 271 insertions(+), 10 deletions(-)
>> create mode 100644 meta/classes/tar_archive.bbclass
>>
>>
> Xiaofeng, Wenzong:
>
> We are going to put a hold on both this patchset and Wenzong's patch=20
> set, due to the similarity of what is trying to be done. Both of these=20
> patches are creating tar archives of source and temp directories.=20
> While it is being done differently, we need to consolidate these change=
s.
>
> The SRPM work can use the consolidated version. As I mentioned in a=20
> prior email to Wenzong, there are also other classes such as=20
> copyleft_complaince.bbclass and src_distrbute.bbclass that we should=20
> look at and determine if they can be modified or extended.
>
> Wenzong pointed out that copyleft does license checking, it can work=20
> for all sources depending on the settings of the INCLUDE/EXCLUDE=20
> variables, so it can be reused, it creates a source + patchset director=
y.
>
> The sourcepgk.bbclass seems to be doing something different in=20
> creating a diff file (among other) of a given package between the=20
> unpack and post-patch, including the python functions and environmnet=20
> variables.
>
> I (with Mark's help) will craft and updated document to address what=20
> we are want to accomplish, which is simplifing what we currently have=20
> with the goal to meet the commercial vendor's needs of supplying the=20
> source either patched or with a patchset that can be applied along=20
> with the configuration and build scripts for various license compliance.
>
> Thanks for your initial work in this area, but we need to find a=20
> better overall approach without duplicating code/effort.
>
> Sau!
>
>
I reviewed sourcepkg.bbclass(some cases can't be considered and we need=20
modify this file according to requirement). It is similar with=20
tar_archive.bbclass in some functions. I agree with Saul's suggestion=20
about combining two or more files into one file.

Yan
Thanks
>>
>>
>> _______________________________________________
>> Openembedded-core mailing list
>> Openembedded-core@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



