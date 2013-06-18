Return-Path: <mark.hatle@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 5BD09605F3
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 14:19:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r5IEJnO8012290
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Tue, 18 Jun 2013 07:19:49 -0700 (PDT)
Received: from Marks-MacBook-Pro.local (172.25.36.227) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.342.3; Tue, 18 Jun 2013 07:19:48 -0700
Message-ID: <51C06C83.7040809@windriver.com>
Date: Tue, 18 Jun 2013 09:19:47 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/20130509 Thunderbird/17.0.6
MIME-Version: 1.0
To: <openembedded-core@lists.openembedded.org>
References: <cover.1371539741.git.rongqing.li@windriver.com>
	<b57b85f69322501fb617a01e625734cda1088b5e.1371539741.git.rongqing.li@windriver.com>
	<1371542851.5066.1.camel@pb-ThinkPad-R50e>
	<51C01D87.9080804@windriver.com>
	<1371546729.5066.7.camel@pb-ThinkPad-R50e>
In-Reply-To: <1371546729.5066.7.camel@pb-ThinkPad-R50e>
Subject: Re: [PATCH 1/1] base-files: create /usr/lib/locale dir
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
X-List-Received-Date: Tue, 18 Jun 2013 14:19:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 6/18/13 4:12 AM, Phil Blundell wrote:
> On Tue, 2013-06-18 at 16:42 +0800, Rongqing Li wrote:
>> diff --git a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> index fa1cc58..84663e3 100644
>> --- a/meta/recipes-core/base-files/base-files_3.0.14.bb
>> +++ b/meta/recipes-core/base-files/base-files_3.0.14.bb
>> @@ -139,6 +139,7 @@ do_install_append_linuxstdbase() {
>>           for d in ${dirs4775}; do
>>                    install -m 2755 -d ${D}$d
>>            done
>> +       install -m 755 -d ${D}/usr/lib/locale
>
> Thanks, that looks better.  Could you not just add it to ${dirs3755}
> though?  (Despite the confusing/misleading name, this variable appears
> to be a list of LSB directories that should be created with mode 0755,
> cf ${dirs4755} which is apparently directories to be created with mode
> 2755.)
>
> In a stylistic sense it might be better to use ${prefix}/lib/locale (or
> whatever eglibc uses), but in practice LSB requires ${prefix}=="/usr",
> and presumably lsbtest is looking for "/usr/lib/locale" specifically, so
> I don't think it will actually make any functional difference in this
> specific case.

FYI, I agree  ${prefix}/lib/locale is likely the correct directory to reference. 
  It preserves the semantics of the OE way of declaring paths, supports the move 
of prefix to somewhere else, and will still work in an LSB compliant configuration.

--Mark

> p.
>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


