Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>)
	id 1T2Br4-0002pc-Qb; Fri, 17 Aug 2012 04:00:07 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q7H1m6Pc024482
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 16 Aug 2012 18:48:07 -0700 (PDT)
Received: from [128.224.162.200] (128.224.162.200) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Thu, 16 Aug 2012 18:48:06 -0700
Message-ID: <502DA2D4.7030302@windriver.com>
Date: Fri, 17 Aug 2012 09:48:04 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:14.0) Gecko/20120713 Thunderbird/14.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, "Hatle, Mark"
	<mark.hatle@windriver.com>
References: <20120815133202.50B6D10218@opal>
	<20120816103308.GA32088@jama.jama.net>
	<20120816124239.GC32088@jama.jama.net>
	<1B858668EC6A94408DCA5225FDFA85AA576F7B28@ALA-MBA.corp.ad.wrs.com>
	<20120816143559.GD32088@jama.jama.net>
	<1B858668EC6A94408DCA5225FDFA85AA576F7B6D@ALA-MBA.corp.ad.wrs.com>
	<20120816220251.GC3625@jama.jama.net>
In-Reply-To: <20120816220251.GC3625@jama.jama.net>
Cc: "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>, "Zhao,
	Zhenfeng" <Zhenfeng.Zhao@windriver.com>,
	"openembedded-commits@lists.openembedded.org"
	<openembedded-commits@lists.openembedded.org>
Subject: Re: [oe-commits] Jackie Huang : gdk-pixbuf: fix the postinstall script failure when no icon is installed
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
X-List-Received-Date: Fri, 17 Aug 2012 02:00:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 8/17/2012 6:02 AM, Martin Jansa wrote:
> On Thu, Aug 16, 2012 at 03:06:35PM +0000, Huang, Jie (Jackie) wrote:
>>>
>>> On Thu, Aug 16, 2012 at 02:30:51PM +0000, Huang, Jie (Jackie) wrote:
>>>>>
>>>>> On Thu, Aug 16, 2012 at 12:33:08PM +0200, Martin Jansa wrote:
>>>>>> On Wed, Aug 15, 2012 at 01:32:02PM +0000, git@git.openembedded.org wrote:
>>>>>>> Module: openembedded-core.git
>>>>>>> Branch: master
>>>>>>> Commit: 1d4fbe4761d3d97e3c4b6e894719ee41b21559b2
>>>>>>> URL:    http://git.openembedded.org/?p=openembedded-core.git&a=commit;h=1d4fbe4761d3d97e3c4b6e894719ee41b21559b2
>>>>>>>
>>>>>>> Author: Jackie Huang <jackie.huang@windriver.com>
>>>>>>> Date:   Thu Aug  9 10:30:30 2012 +0800
>>>>>>>
>>>>>>> gdk-pixbuf: fix the postinstall script failure when no icon is installed
>>>>>>>
>>>>>>> If gtk+ is added to core-image-minimal, postinstall script failed on boot:
>>>>>>>
>>>>>>> Running postinst /etc/rpm-postinsts/104...
>>>>>>> gtk-update-icon-cache: No theme index file.
>>>>>>> ERROR: postinst /etc/rpm-postinsts/104 failed.
>>>>>>>
>>>>>>> This patch fixed the postinstall script to check for the icon
>>>>>>> file first and not run the gtk-update-icon-cache if no icon
>>>>>>> is installed.
>>>>>>>
>>>>>>> [YOCTO #2905]
>>>>>>>
>>>>>>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>>>>>>> Signed-off-by: Saul Wold <sgw@linux.intel.com>
>>>>>>
>>>>>>
>>>>>> Even with this patch I get:
>>>>>> Configuring gdk-pixbuf-loader-png.
>>>>>> gtk-update-icon-cache: No theme index file.
>>>>>> Configuring gdk-pixbuf-loader-jpeg.
>>>>>> gtk-update-icon-cache: No theme index file.
>>>>>> Configuring gdk-pixbuf-loader-xpm.
>>>>>> gtk-update-icon-cache: No theme index file.
>>>>>> Configuring gdk-pixbuf-loader-gif.
>>>>>> gtk-update-icon-cache: No theme index file.
>>>>>> Collected errors:
>>>>>>   * pkg_run_script: package "gdk-pixbuf-loader-png" postinst script
>>>>>>   * returned status 1.
>>>>>>   * opkg_configure: gdk-pixbuf-loader-png.postinst returned 1.
>>>>>>   * pkg_run_script: package "gdk-pixbuf-loader-jpeg" postinst script
>>>>>>   * returned status 1.
>>>>>>   * opkg_configure: gdk-pixbuf-loader-jpeg.postinst returned 1.
>>>>>>   * pkg_run_script: package "gdk-pixbuf-loader-xpm" postinst script
>>>>>>   * returned status 1.
>>>>>>   * opkg_configure: gdk-pixbuf-loader-xpm.postinst returned 1.
>>>>>>   * pkg_run_script: package "gdk-pixbuf-loader-gif" postinst script
>>>>>>   * returned status 1.
>>>>>>   * opkg_configure: gdk-pixbuf-loader-gif.postinst returned 1.
>>>>>
>>>>> This problem is caused by
>>>>> openembedded-core/meta/recipes-graphics/xcursor-transparent-theme/xcursor-transparent-theme_0.1.1.bb
>>>>> which does not provide index.theme file
>>>>>
>>>>
>>>> Well, in my case, there is no icon installed so there is on ${datadir}/icons at all.
>>>
>>> So it's fine to break postinst for everyone else who has
>>
>> This fix is for the case when there is no icon/theme installed. When we found the bug,
>> the postinst was calling the gtk-update-icon-cache for the hicolor theme which is not installed.
>
> Yes, but you could also execute it only if hicolor exists or add
> hicolor-icon-theme to RDEPENDS, executing gtk-update-icon-cache for each

I had considered to add RDEPENDS, it's simple and it works but we had 
another consider that in some cases we may not need any theme. So we 
decided to change the postinst, while doing that, I thought it may not 
be a good idea to only executing gtk-update-icon-cache for hicolor since 
there maybe othere themes installed.

> subdirectory is not what I would expect from that commit message.

If it is the case, I'm fine to change it back to executing it only for 
hicolor if it exists.

>
>>> xcursor-transparent-theme or are you going to fix that?
>>
>> For xcursor-transparent-theme not providing the index.theme file, yeah it's really a problem,
>> I can fix that, but maybe we should open another bug for it?
>
> And do we need to call gtk-update-icon-cache in
> xcursor-transparent-theme or in any other directory which happens to be
> in ${datadir}/icons? Why not call it only for subdirs with index.theme?

Yeah, it would be better for the postinstall script, but for 
xcursor-transparent-theme without index.theme file, is it still a problem?

Mark, what do think about this?

Thanks,
Jackie

>
>> Thanks,
>> Jackie
>>
>>>
>>> Thanks,
>>>
>>>>
>>>> Thanks,
>>>> Jackie
>>>>
>>>>> and commit message of this change should be something like
>>>>> gdk-pixbuf: call gtk-update-icon-cache for each subdir of ${datadir}/icons
>>>>> not
>>>>> gdk-pixbuf: fix the postinstall script failure when no icon is installed
>>>>>
>>>>> Cheers,
>>>>>
>>>>>>> -test -x ${bindir}/gtk-update-icon-cache && gtk-update-icon-cache  -q ${datadir}/icons/hicolor
>>>>>>> +if [ -x ${bindir}/gtk-update-icon-cache ] && [ -d ${datadir}/icons ]; then
>>>>>>> +    for icondir in /usr/share/icons/*; do
>>>>>>> +        if [ -d ${icondir} ]; then
>>>>>>> +            gtk-update-icon-cache -q ${icondir}
>>>>>>> +        fi
>>>>>>> +    done
>>>>>>> +fi
>>>>>>>   }
>>>>>>>
>>>>>>>   PACKAGES_DYNAMIC += "gdk-pixbuf-loader-*"
>>>>>>>
>>>>>>>
>>>>>>> _______________________________________________
>>>>>>> Openembedded-commits mailing list
>>>>>>> Openembedded-commits@lists.openembedded.org
>>>>>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>>>>>>
>>>>>> --
>>>>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>>>
>>>>>
>>>>>
>>>>> --
>>>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>>>
>>>
>>> --
>>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>>
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745


