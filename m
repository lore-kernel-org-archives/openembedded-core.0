Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f182.google.com (mail-yk0-f182.google.com
	[209.85.160.182])
	by mail.openembedded.org (Postfix) with ESMTP id ED0196FCA3
	for <openembedded-core@lists.openembedded.org>;
	Tue,  2 Sep 2014 12:36:02 +0000 (UTC)
Received: by mail-yk0-f182.google.com with SMTP id 19so4011177ykq.13
	for <openembedded-core@lists.openembedded.org>;
	Tue, 02 Sep 2014 05:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=CBwTDW7KrQ1BNt0atcJQpfTVC9qngxfHxX/HQcZS6kQ=;
	b=RV6/zAwB3Ha4len4g4J/kh37p9/b2jJomM1FOaEZR24WOewv6sc9SSp33UrwH5aujD
	FWIjiBnPe2zUcodE/c2/D7N2aRS1yKO3CyOVCJUu2nJkbYyTKUr9UQUDJSJKDvJTgROa
	RSrRlIfrJMaHfoxPdBwglD6W+I8cEGRqh9cJCOF58YHeeiQVW+5J6nwvoogd3uiq9KkQ
	yzveMvHoL9Rxw4zpgh2ILUSWDfVtH0CQBdabJL4JQhuIkJ4eDxuETK2iqDwEic34Ifhx
	Pq7sKEVKDEZSnp46XDCkssnne18h9dwsd3DbEgSfw5dLMDtUHM/nmaOfES3kTcspSyY4
	MiWg==
MIME-Version: 1.0
X-Received: by 10.236.130.210 with SMTP id k58mr13158255yhi.102.1409661363401; 
	Tue, 02 Sep 2014 05:36:03 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Tue, 2 Sep 2014 05:36:03 -0700 (PDT)
In-Reply-To: <540568FB.4040006@windriver.com>
References: <CAP9ODKpWHy4XW6OVs34=-p+GRK6iOLvgsAqr22obSAaj9_2SDQ@mail.gmail.com>
	<540530B8.8040107@windriver.com>
	<CAP9ODKrxFsbVs7xNQ1tOW2xmrQ4-omTZCTVQ04aO8ms--Lu9Qw@mail.gmail.com>
	<540539E6.2030508@windriver.com>
	<CAP9ODKr_p-1z-nRLuM_nMVpei3A4Z2CuDh9wzEEpZW9jSEoL-w@mail.gmail.com>
	<540568FB.4040006@windriver.com>
Date: Tue, 2 Sep 2014 09:36:03 -0300
X-Google-Sender-Auth: mZWyaS6UtSuSbjrTTmN57p4d9sM
Message-ID: <CAP9ODKqfNwXn_dEUu-WT6zLoUM_MDDtgPRp2WfUU238UcpuKJw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Robert Yang <liezhi.yang@windriver.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: Error while building qemu without X11 support.
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
X-List-Received-Date: Tue, 02 Sep 2014 12:36:05 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Sep 2, 2014 at 3:51 AM, Robert Yang <liezhi.yang@windriver.com> wrote:
> On 09/02/2014 11:33 AM, Otavio Salvador wrote:
>> On Tue, Sep 2, 2014 at 12:30 AM, Robert Yang <liezhi.yang@windriver.com>
>> wrote:
>>> On 09/02/2014 11:17 AM, Otavio Salvador wrote:
>>>>
>>>>
>>>> On Mon, Sep 1, 2014 at 11:51 PM, Robert Yang <liezhi.yang@windriver.com>
>>>> wrote:
>>>>>
>>>>>
>>>>>
>>>>> On 09/02/2014 10:30 AM, Otavio Salvador wrote:
>>>>>>
>>>>>>
>>>>>>
>>>>>> Hello,
>>>>>>
>>>>>> During our regression tests we found the following error:
>>>>>>
>>>>>> directfb fsl-image-machine-test@imx6qsabresd (1/4) consider defining a
>>>>>> PREFERRED_PROVIDER entry to match jpeg
>>>>>> directfb fsl-image-machine-test@imx6qsabresd (1/4) ERROR: Nothing
>>>>>> PROVIDES 'libxext-native' (but
>>>>>
>>>>>
>>>>>
>>>>>
>>>>> Did you use meta/recipes-graphics/xorg-lib/libxext_git.bb ? This one
>>>>> doesn't provide native, but libxext_1.3.2.bb does.
>>>>>
>>>>> Seems that we need remove the git version since it is older:
>>>>>
>>>>> PV = "1.0.99.1+gitr${SRCPV}"
>>>>>
>>>>> And doesn't see a license issue.
>>>>
>>>>
>>>>
>>>> This has been reproduced in our autobuilder.
>>>>
>>>> It removes:
>>>>
>>>> x11 and wayland
>
>
> Hi Otavio,
>
> How about only remove the x11 for target ?
>
> DISTRO_FEATURES_remove_class-target = "x11"

This is a workaround. Few days ago it built fine so a clear regression.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

