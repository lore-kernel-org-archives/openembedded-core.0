Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2F7346D614
	for <openembedded-core@lists.openembedded.org>;
	Tue, 12 Nov 2013 01:53:16 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rAC1rHLb010950
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-core@lists.openembedded.org>;
	Mon, 11 Nov 2013 17:53:17 -0800 (PST)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Mon, 11 Nov 2013 17:53:17 -0800
Message-ID: <52818A0B.9050101@windriver.com>
Date: Tue, 12 Nov 2013 09:53:15 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130803 Thunderbird/17.0.8
MIME-Version: 1.0
To: Mark Hatle <mark.hatle@windriver.com>
References: <cover.1384164392.git.wenzong.fan@windriver.com>
	<52810032.3020608@windriver.com>
In-Reply-To: <52810032.3020608@windriver.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1] udev: remove libudev-dbg and libgudev-dbg
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
X-List-Received-Date: Tue, 12 Nov 2013 01:53:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/2013 12:05 AM, Mark Hatle wrote:
> On 11/11/13, 4:10 AM, wenzong.fan@windriver.com wrote:
>> From: Wenzong Fan <wenzong.fan@windriver.com>
>>
>> We don't support multiple -dbg packages, so just remove the libudev-dbg,
>> libgudev-dbg and put all debug stuffs to 'udev-dbg'.
>
> I'm a bit confused, we do support package that want to provide multiple
> -dbg files to generate them.
>
> This way large recipes that provide lots of different bits of
> functionality can no only segment the packages they create, but keep the
> side of the -dbg information reasonable as well.  (It's not all that
> commonly used, but it does work with the IMAGE_FEATURES 'dbg-pkgs'.)
>
> What issue was being solved by combining the two items back into one?

Hi Mark,

This is an updated patch for fixing the 'source codes <--> -dbg 
packages' (i.e. which src should be shipped to which -dbg package), 
details please refer to another thread about:

Subject: udev: ship source files to related dbg package

As Richard mentioned:

"We don't support multiple -dbg packages and this looks like an error." 
- (the udev have there -dbg packages: libudev-dbg/libgudev-dbg/udev-dbg)

If I was wrong please correct me.

Thanks
Wenzong

>
> --Mark
>
>> The following changes since commit
>> 4fdc3d77d4a875b7236536bf78849a4d1f6a7449:
>>
>>    kbd: Fix stdarg related errors on uclibc (2013-11-08 17:31:36 +0000)
>>
>> are available in the git repository at:
>>
>>    git://git.pokylinux.org/poky-contrib wenzong/udev-remove-dbg
>>
>> http://git.pokylinux.org/cgit.cgi/poky-contrib/log/?h=wenzong/udev-remove-dbg
>>
>>
>> Wenzong Fan (1):
>>    udev: remove libudev-dbg and libgudev-dbg
>>
>>   meta/recipes-core/udev/udev.inc |    6 ++----
>>   1 file changed, 2 insertions(+), 4 deletions(-)
>>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>

