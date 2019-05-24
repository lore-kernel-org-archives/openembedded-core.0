Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id BC2E26BA9D
	for <openembedded-core@lists.openembedded.org>;
	Fri, 24 May 2019 10:34:04 +0000 (UTC)
Received: from [172.16.1.14] (62-178-50-190.cable.dynamic.surfer.at
	[62.178.50.190]) by ptmx.org (Postfix) with ESMTPSA id 027F2C5515;
	Fri, 24 May 2019 12:34:04 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>, "openembedded-core@lists.openembedded.org"
	<openembedded-core@lists.openembedded.org>
References: <3fbd04e5-296a-ad1c-6456-a33b7273dc66@pseudoterminal.org>
	<086150b5-5a68-b4ee-1fd2-69b51dcb426c@gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <636d4762-34a0-ce0b-14c6-e00b5b377764@pseudoterminal.org>
Date: Fri, 24 May 2019 12:34:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <086150b5-5a68-b4ee-1fd2-69b51dcb426c@gmail.com>
Subject: Re: Switching GStreamer recipes from autotools to meson
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
X-List-Received-Date: Fri, 24 May 2019 10:34:05 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Yes, I am preparing recipes for that, based on the work from Philippe 
Normand <philn@igalia.com>.

On 20.05.19 19:49, Khem Raj wrote:
>
>
> On 5/14/19 1:19 AM, Carlos Rafael Giani wrote:
>>  From what I have seen, meson support is stable now.
>>
>> Also, in GStreamer, autotools is now considered a legacy build 
>> system, and will be removed in future released. From 
>> https://gstreamer.freedesktop.org/releases/1.16/ :
>>
>>  > The Meson build system build is now feature-complete (*) and it is 
>> now the recommended build system on all platforms and also used by 
>> Cerbero to build GStreamer on all platforms. The Autotools build is 
>> scheduled to be removed in the next cycle. Developers who currently 
>> use gst-uninstalled should move to gst-build. The build option naming 
>> has been cleaned up and made consistent and there are now feature 
>> options to enable/disable plugins and various other features on a 
>> case-by-case basis. (*) with the exception of plugin docs which will 
>> be handled differently in future
>>
>> GStreamer recipe upgrades to 1.16.0 have been sent in as a pull 
>> request to meta-gstreamer1.0 . Once these are in, I'm considering to 
>> switch the recipes to meson. Are there any potential issues with 
>> that? For example, anything special about meson and GObject 
>> introspection I should know about?
>>
>
> are you doing the 1.16 upgrade to OE-Core as well ?

