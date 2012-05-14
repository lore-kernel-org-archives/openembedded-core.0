Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1STqHL-0005VL-Te
	for openembedded-core@lists.openembedded.org;
	Mon, 14 May 2012 10:05:16 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q4E7tGXU029514
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 14 May 2012 00:55:16 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 14 May 2012 00:55:15 -0700
Message-ID: <4FB0BA45.5060008@windriver.com>
Date: Mon, 14 May 2012 15:54:45 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1336727342.git.xiaofeng.yan@windriver.com>
	<cc7ee9609296b3a90147287817a0043da45b0c64.1336727342.git.xiaofeng.yan@windriver.com>
	<CABcZANkNAkmLA72kaa=Dv0YExnji__tOJ16moRhDGRmfi0NaVw@mail.gmail.com>
In-Reply-To: <CABcZANkNAkmLA72kaa=Dv0YExnji__tOJ16moRhDGRmfi0NaVw@mail.gmail.com>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.windriver.com id
	q4E7tGXU029514
Subject: Re: [PATCH 1/1] archiver.bbclass: Add default set
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
X-List-Received-Date: Mon, 14 May 2012 08:05:16 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B405=E6=9C=8811=E6=97=A5 22:14, Chris Larson wrote:
> On Fri, May 11, 2012 at 3:13 AM,<xiaofeng.yan@windriver.com>  wrote:
>> diff --git a/meta/classes/archiver.bbclass b/meta/classes/archiver.bbc=
lass
>> index 59b58f4..a720db2 100644
>> --- a/meta/classes/archiver.bbclass
>> +++ b/meta/classes/archiver.bbclass
>> @@ -6,6 +6,10 @@ ARCHIVE_EXCLUDE_FROM ?=3D ".pc autom4te.cache"
>>   ARCHIVE_TYPE ?=3D "TAR SRPM"
>>   DISTRO ?=3D "poky"
>>   PATCHES_ARCHIVE_WITH_SERIES =3D 'TRUE'
>> +SOURCE_ARCHIVE_LOG_WITH_SCRIPTS ?=3D 'logs_with_scripts'
>> +SOURCE_ARCHIVE_PACKAGE_TYPE ?=3D 'tar'
>> +export SOURCE_ARCHIVE_LOG_WITH_SCRIPTS
>> +export SOURCE_ARCHIVE_PACKAGE_TYPE
> I don't think you understand what 'export' does or why it exists.
> Please fix that, and remove these lines. Thanks.
Hi Chris Larson,
      Thanks for your review. I am testing this according to your=20
suggestion and put it to OE-core after test.

Thanks
Yan


