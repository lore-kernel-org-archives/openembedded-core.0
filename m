Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <saul.wold@intel.com>) id 1RElhZ-0004CQ-1a
	for openembedded-core@lists.openembedded.org;
	Fri, 14 Oct 2011 19:37:45 +0200
Received: from mail-wy0-f180.google.com ([74.125.82.180])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 14 Oct 2011 10:31:58 -0700
Received: by wyh11 with SMTP id 11so3249266wyh.25
	for <openembedded-core@lists.openembedded.org>;
	Fri, 14 Oct 2011 10:31:57 -0700 (PDT)
Received: by 10.216.138.210 with SMTP id a60mr254920wej.41.1318613514301;
	Fri, 14 Oct 2011 10:31:54 -0700 (PDT)
Received: from [10.6.18.230] (c-71-193-189-117.hsd1.wa.comcast.net.
	[71.193.189.117])
	by mx.google.com with ESMTPS id i29sm15342566wbp.22.2011.10.14.10.31.52
	(version=SSLv3 cipher=OTHER); Fri, 14 Oct 2011 10:31:53 -0700 (PDT)
Message-ID: <4E987206.8060300@intel.com>
Date: Fri, 14 Oct 2011 10:31:50 -0700
From: Saul Wold <saul.wold@intel.com>
Organization: Intel
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:7.0) Gecko/20110927 Thunderbird/7.0
MIME-Version: 1.0
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
References: <f63c9c5991312f05bffee750086a0c7398770f8a>
	<1316787194-17442-1-git-send-email-dima_ch@emcraft.com>
	<4E810B74.7010001@linux.intel.com>
	<1318605488.23340.580.camel@vladimir.emcraft.com>
	<4E986233.8020505@linux.intel.com>
	<3C978CB0-754A-4835-9A02-DC29A5AC882B@dominion.thruhere.net>
In-Reply-To: <3C978CB0-754A-4835-9A02-DC29A5AC882B@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: [PATCH] qt4: Added support for QtMobility 1.2
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
X-List-Received-Date: Fri, 14 Oct 2011 17:37:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/14/2011 09:28 AM, Koen Kooi wrote:
>
> Op 14 okt. 2011, om 18:24 heeft Saul Wold het volgende geschreven:
>
>> On 10/14/2011 08:18 AM, Dmitry Cherukhin wrote:
>>> On Mon, 2011-09-26 at 16:32 -0700, Saul Wold wrote:
>>>> On 09/23/2011 07:13 AM, Dmitry Cherukhin wrote:
>>>>> This patch is indented to add new functionality,
>>>>> specifically, the patch adds support for
>>>>> the QtMobility 1.2 package.
>>>>>
>>>>> Added two recipes:
>>>>> 1) qt-mobility-x11 builds the QtMobility 1.2 package
>>>>>      on the basis of qt4-x11-free;
>>>>> 2) qt-mobility-embedded builds the QtMobility 1.2 package
>>>>>      on the basis of qt4-embedded.
>>>>>
>>>>> Signed-off-by: Dmitry Cherukhin<dima_ch@emcraft.com>
>>>>> ---
>>>>>    meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch |   28 +++++++++++
>>>>>    meta/recipes-qt/qt4/files/qtme_gstreamer_pro.patch |   16 ++++++
>>>>>    meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb  |   13 +++++
>>>>>    meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb       |   11 ++++
>>>>>    meta/recipes-qt/qt4/qt-mobility_1.2.0.inc          |   51 ++++++++++++++++++++
>>>>>    5 files changed, 119 insertions(+), 0 deletions(-)
>>>>>    create mode 100644 meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch
>>>>>    create mode 100644 meta/recipes-qt/qt4/files/qtme_gstreamer_pro.patch
>>>>>    create mode 100644 meta/recipes-qt/qt4/qt-mobility-embedded_1.2.0.bb
>>>>>    create mode 100644 meta/recipes-qt/qt4/qt-mobility-x11_1.2.0.bb
>>>>>    create mode 100644 meta/recipes-qt/qt4/qt-mobility_1.2.0.inc
>>>>>
>>>>> diff --git a/meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch b/meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch
>>>>> new file mode 100644
>>>>> index 0000000..689c224
>>>>> --- /dev/null
>>>>> +++ b/meta/recipes-qt/qt4/files/qtm_qtmobility_pro.patch
>>>>> @@ -0,0 +1,28 @@
>>>>> +This patch fixes the following issue at the configure stage:
>>>>> +   Project ERROR: Qt Mobility requires Qt 4.6 or higher. Qt was found.
>>>>> +The version of Qt is already 4.7.3, so this is misconfiguration problem.
>>>>> +
>>>>> +The origin of this patch is:
>>>>> +   http://neophysis.git.sourceforge.net/git/gitweb.cgi?p=neophysis/openembedded;
>>>>> +   a=blob;f=recipes/neophysis/qt-mobility-1.0.0/qtmobility_pro.patch;
>>>>> +   h=fc5e1691aed47bc50d87e5c33497354182cacda4;hb=refs/heads/neophysis-testing-0.3
>>>>> +Upstream-Status: not-appropriate
>>>>
>>>> Please refer to wiki page on www.openembedded.org for the corrcet
>>>> formating of the Upstream-Status field.  You are also missing a
>>>> Signed-off-by: line for each patch file.
>>>>
>>>> (I would give the exact page, but the site appears to be having problems)
>>>>
>>>
>>> Thanks!
>>> I removed all .patch files, new version of the patch is here:
>>> http://thread.gmane.org/gmane.comp.handhelds.openembedded.core/8708
>>>
>> That's great, but that reader seems to mangle emails in a way that I can't use them for patching, it would be great if you could just send the v2 to this mailing list.
>
> The reader is just a view into the mail archive, so if you scroll back 8 days in your oe-core folder, you should see the patch :)
>
My bad, I was not seeing it because it had been tagged incorrectly in my 
folder, found it now!

Sau!

>
>
> _______________________________________________
> Openembedded-core mailing list
> Openembedded-core@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core
>



