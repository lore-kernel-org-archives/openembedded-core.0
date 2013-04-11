Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Wenzong.Fan@windriver.com>) id 1UQBQ8-0008FG-0Q
	for openembedded-core@lists.openembedded.org;
	Thu, 11 Apr 2013 08:56:01 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id r3B6cI5W005421
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 10 Apr 2013 23:38:18 -0700 (PDT)
Received: from [128.224.162.243] (128.224.162.243) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.342.3;
	Wed, 10 Apr 2013 23:38:18 -0700
Message-ID: <51665A56.2040805@windriver.com>
Date: Thu, 11 Apr 2013 14:38:14 +0800
From: wenzong fan <wenzong.fan@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130308 Thunderbird/17.0.4
MIME-Version: 1.0
To: "Burton, Ross" <ross.burton@intel.com>, Martin Jansa
	<martin.jansa@gmail.com>
References: <cover.1365564103.git.wenzong.fan@windriver.com>
	<1365564397-2851-1-git-send-email-wenzong.fan@windriver.com>
	<20130410080012.GA2471@jama>
	<CAJTo0LauKA1u8koLWXi=XUehoeAAahEeMvafLR7aCq580jDL0w@mail.gmail.com>
In-Reply-To: <CAJTo0LauKA1u8koLWXi=XUehoeAAahEeMvafLR7aCq580jDL0w@mail.gmail.com>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 1/1] xcursor-transparent-theme: install index.theme explicitly
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
X-List-Received-Date: Thu, 11 Apr 2013 06:56:02 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 04/10/2013 05:17 PM, Burton, Ross wrote:
> On 10 April 2013 09:00, Martin Jansa <martin.jansa@gmail.com> wrote:
>> On Wed, Apr 10, 2013 at 11:26:35AM +0800, wenzong.fan@windriver.com wrote:
>>> The xcursor-transparent-theme doesn't install index.theme by default,
>>> this might cause below command fails on target:
>>>
>>>      $ gtk-update-icon-cache -q /usr/share/icons/xcursor-transparent
>>>      Error: "gtk-update-icon-cache: No theme index file"
>>>
>>> Just install index.theme explicitly to remove those error, its content
>>> is from xcursor-transparent-theme's README file.
>>
>> Wasn't this discussed and fixed before? IIRC the conclusion was that
>> postinst should check if there is index.theme or ignore it missing, not
>> adding index.theme.
>
> NACK.
>
> Martin is right, the gtk-icon-cache class uses -t when updating the caches:
>
>         --ignore-theme-index, -t
>             Don't check for the existence of 'index.theme' in the icon theme
>             directory. Without this option, gtk-update-icon-cache refuses to
>             create an icon cache in a directory which does not appear to be the
>             toplevel directory of an icon theme.
>
> If someone is not using gtk-icon-cache.bbclass they either should, or
> have a good reason and also use -t.

Oh, I did think I missed something about the discussion of index.theme & 
gtk-update-icon-cache. I recall this patch and sorry for the noise.

I appreciate your clarifications!

Thanks
Wenzong

>
> Ross
>


