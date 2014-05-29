Return-Path: <sgw@linux.intel.com>
Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	by mail.openembedded.org (Postfix) with ESMTP id 3706D6FD1A
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 May 2014 18:33:47 +0000 (UTC)
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 29 May 2014 11:33:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.98,935,1392192000"; d="scan'208";a="546893947"
Received: from unknown (HELO [10.255.12.174]) ([10.255.12.174])
	by fmsmga002.fm.intel.com with ESMTP; 29 May 2014 11:33:47 -0700
Message-ID: <53877D8B.8030603@linux.intel.com>
Date: Thu, 29 May 2014 11:33:47 -0700
From: Saul Wold <sgw@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.5.0
MIME-Version: 1.0
To: Diego Sueiro <diego.sueiro@gmail.com>
References: <CAMCfZKEnyyR9ADx1H2X7=9kdCRPU14DRHFgMuhu9gzFnHxP1ag@mail.gmail.com>
	<53875026.60107@linux.intel.com>
	<CAMCfZKGHKjGrNLbumUXCex8=mc3RmamOu-uRv3Rc2R=7Sq+r6w@mail.gmail.com>
	<5387654C.5090309@linux.intel.com>
	<CAMCfZKGm8UnqaDS38vqqqri2EGnKLhPZcQmoO1SdBWfOcurwDQ@mail.gmail.com>
	<CAMKF1sqy9DQ+zwMA_HHijYXF9Ltk-Nm6U4i0C6yDuxndfWx34w@mail.gmail.com>
	<CAMCfZKHFGk2myN0R9LXNY1ZoWFd+WQLx5r98BpnC7-0R3XrASg@mail.gmail.com>
	<538775A4.9060908@linux.intel.com>
	<CAMCfZKHPn4CVHF3cM5ONH9FBz6nrUtHNsiannyXm9OoaEuVHDQ@mail.gmail.com>
In-Reply-To: <CAMCfZKHPn4CVHF3cM5ONH9FBz6nrUtHNsiannyXm9OoaEuVHDQ@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: intltool version check errors
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
X-List-Received-Date: Thu, 29 May 2014 18:33:51 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 05/29/2014 11:22 AM, Diego Sueiro wrote:
> Sau!,
>
> On Thu, May 29, 2014 at 3:00 PM, Saul Wold <sgw@linux.intel.com> wrote:
>
>> On 05/29/2014 10:50 AM, Diego Sueiro wrote:
>>
>>> Khem,
>>>
>>> On Thu, May 29, 2014 at 2:48 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>>
>>>   On Thu, May 29, 2014 at 10:23 AM, Diego Sueiro <diego.sueiro@gmail.com>
>>>> wrote:
>>>>
>>>>> For now these are the recipes:
>>>>>
>>>>> shared-mime-info_1.2.bb
>>>>> gconf_3.2.6.bb
>>>>> libsoup-2.4_2.45.3.bb
>>>>> gconf_3.2.6.bb
>>>>> avahi_0.6.31.bb
>>>>> xkeyboard-config_2.11.bb
>>>>> libfm_1.1.2.2.bb
>>>>> glib-networking_2.38.0.bb
>>>>> connman-gnome_0.7.bb
>>>>>
>>>>>
>>>>> Find attached the config.log for shared-mime-info-native.
>>>>>
>>>>> I had recently update my Ubuntu from 12.10 to 14.04. Do you think it can
>>>>> cause this error?
>>>>>
>>>>>
>>>> Do you have intltool-update binary on your host ? outside sys root ?
>>>>
>>>> and if yes then whats the version of it.
>>>>
>>>
>>>
>>> $ intltool-update --version
>>> intltool-update (intltool) 0.50.2
>>> Written by Kenneth Christiansen, Maciej Stachowiak, and Darin Adler.
>>>
>>> Copyright (C) 2000-2003 Free Software Foundation, Inc.
>>> This is free software; see the source for copying conditions.  There is NO
>>> warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR
>>> PURPOSE.
>>>
>>>
>>>   Looking at the log file, seems to have some output about the nativeperl,
>> I missed the output of this initially:
>>
>> /<snip>/tmp/sysroots/x86_64-linux/usr/bin/nativeperl found
>>
>> seems you have some additional output that is confusing things
>>
>> If you run bitbake shared-mime-info -c devshell and then within the
>> devshell run intltool-update --version, what happens?  It seems that the
>> nativeperl is getting getting printed out.
>>
>> any chance you are available on IRC freenode #yocto, I am sgw_ there,
>> maybe we can work this realtime
>>
>> Sau!
>>
>
> I've cleaned perl-native and everything seems to be working now.
>
Interesting, I wonder what caused that in the first place.

Did that resolve the other bugs that you filed also?  I am also trying 
to work on those python issues.

Sau!

> Thanks for the support.
>
> Regards,
>
> --
> *dS
> Diego Sueiro
>
> Administrador do Embarcados
> www.embarcados.com.br<http://www.embarcados.com.br/?utm_source=assinatura_diego&utm_medium=e-mail&utm_campaign=Assinatura%20Email%20Diego>
>
> /*long live rock 'n roll*/
>

