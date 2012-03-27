Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Xiaofeng.Yan@windriver.com>) id 1SCMG0-0003Zf-Pr
	for openembedded-core@lists.openembedded.org;
	Tue, 27 Mar 2012 04:35:37 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.3/8.14.3) with ESMTP id q2R2QZ8f018401
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 26 Mar 2012 19:26:35 -0700 (PDT)
Received: from [128.224.162.223] (128.224.162.223) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Mon, 26 Mar 2012 19:26:36 -0700
Message-ID: <4F712557.8020100@windriver.com>
Date: Tue, 27 Mar 2012 10:26:31 +0800
From: Xiaofeng Yan <xiaofeng.yan@windriver.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.23) Gecko/20110921 Thunderbird/3.1.15
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1332758293.git.xiaofeng.yan@windriver.com>	<0767284de75acd14db1ef05cabdbccc2946f7936.1332758293.git.xiaofeng.yan@windriver.com>
	<1332781483.28414.131.camel@ted>
In-Reply-To: <1332781483.28414.131.camel@ted>
X-Originating-IP: [128.224.162.223]
X-MIME-Autoconverted: from 8bit to quoted-printable by mail.windriver.com id
	q2R2QZ8f018401
Subject: Re: [PATCH 9/9] local.conf.sample: Add set for archiving packages
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
X-List-Received-Date: Tue, 27 Mar 2012 02:35:37 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012=E5=B9=B403=E6=9C=8827=E6=97=A5 01:04, Richard Purdie wrote:
> On Mon, 2012-03-26 at 18:49 +0800, Xiaofeng Yan wrote:
>> From: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>>
>> User can use these variables to get atchiving packages they want.
>>
>> [YOCTO #1977]
>>
>> Signed-off-by: Xiaofeng Yan<xiaofeng.yan@windriver.com>
>> ---
>>   meta-yocto/conf/local.conf.sample |   33 +++++++++++++++++++++++++++=
++++++
>>   1 files changed, 33 insertions(+), 0 deletions(-)
>>
>> diff --git a/meta-yocto/conf/local.conf.sample b/meta-yocto/conf/local=
.conf.sample
>> index 38507e3..4327e89 100644
>> --- a/meta-yocto/conf/local.conf.sample
>> +++ b/meta-yocto/conf/local.conf.sample
>> @@ -121,6 +121,39 @@ DISTRO ?=3D "poky"
>>   PACKAGE_CLASSES ?=3D "package_rpm"
> Please add this information to local.conf.sample.extended.
>
> local.conf.sample is meant to be kept simple and only contain things ne=
w
> users need to care about.
>
Thanks, I has changed these variables to local.conf.sample.extend and=20
summited patches again.
> Cheers,
>
> Richard
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



