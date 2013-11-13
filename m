Return-Path: <mark.hatle@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 04A776D354
	for <openembedded-core@lists.openembedded.org>;
	Wed, 13 Nov 2013 03:42:52 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id rAD3gsSx003276
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 12 Nov 2013 19:42:54 -0800 (PST)
Received: from Marks-MacBook-Pro.local (172.25.36.228) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.2.347.0; Tue, 12 Nov 2013 19:42:54 -0800
Message-ID: <5282F53D.8050001@windriver.com>
Date: Tue, 12 Nov 2013 21:42:53 -0600
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.9;
	rv:24.0) Gecko/20100101 Thunderbird/24.1.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>
References: <cover.1384305535.git.mark.hatle@windriver.com>	<CAP9ODKqR+nGjF0DbkddY26gOxKU1=-ps9rYSNzW4EjZNkZg9eA@mail.gmail.com>
	<5282DD70.3040705@windriver.com>
In-Reply-To: <5282DD70.3040705@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 0/6] Misc changes relating to toolchain and image gen
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
X-List-Received-Date: Wed, 13 Nov 2013 03:42:53 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 11/12/13, 8:01 PM, Mark Hatle wrote:
> On 11/12/13, 7:33 PM, Otavio Salvador wrote:
>> On Tue, Nov 12, 2013 at 11:23 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>>> A few misc fixes relating to toolchain and image generation.
>>>
>>> The first two in the set simply updated gcc to remove the -symlinks package
>>> in favor of update-alternatives.
>>>
>>> The next fixes an issue w/ the previous binutils patch and upgrades.
>>>
>>> Next 2 update packagegroups to make revise and use the
>>> packagegroup-core-buildessentials.
>>>
>>> The final patch fixes an issue w/ the image generatation.  If the
>>> IMAGE_INSTALL contains a dependency instead of a package name, the system
>>> was not able to translate it into a package.  This now works properly.
>>>
>>> Note, there is a case where an unresolvable set could be determined (rare,
>>> but it is possible), in this case the user would need to add whatever is
>>> required to fix it to the IMAGE_INSTALL.  (This could happen when 2 or more
>>> conflicting packages all have the same provide, but none of them are in
>>> the IMAGE_INSTALL line.  The system will attempt to determine which to
>>> use, by checking if any of them are already in the IMAGE_INSTALL -- otherwise
>>> it chooses the first entry.  If something else implied by a packagegroup
>>> chooses a different version, a conflict would be generated.)
>>
>> Which package backends has been tested  with those changes?
>>
>
> 6/6 only affects RPM.  So only RPM back end.
>
> The other changes are generic and follow the existing models.  However, I only
> tested the RPM backend.

BTW I just verified that the 1-5/6 work properly with an opkg backend as well.

--Mark

> (Note v2 of 5/6 and 6/6 has been sent.  I accidentally sent a version prior to
> two minor revisions.)
>
> --Mark
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-core
>


