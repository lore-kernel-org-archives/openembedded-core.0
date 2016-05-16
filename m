Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pa0-f66.google.com (mail-pa0-f66.google.com
	[209.85.220.66])
	by mail.openembedded.org (Postfix) with ESMTP id 2D66076A51
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 16:22:27 +0000 (UTC)
Received: by mail-pa0-f66.google.com with SMTP id gh9so14909533pac.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 09:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=MRQPSGTCVUFi/lgkVt9vcmlzrD64o3OsOAag4t8hliU=;
	b=Z9ecwR2ixOZi4k3xcVdEgaTq/t4rU1ucWS+pI9Us4GG5bvqFmQtjR7XWWd2lhJ2o2v
	YWMgCTWwZXe+egLP5YEwVI3hoO+KQ747khplEfC/Q4qZfJONDPkQePZ5nRFIHmIdaJmU
	Ef7IO5PjTza5aGcpBI1hmsYSp4diG2snsdhWvgO6IQ4OuDttSsdb3KgnHDdbaiLTOuOB
	TW0UvFaPkQ8sPf5Rzo+J2gS7BP9OId2DuyZ30r15mzZ6pcjWfpBDXmXjZtC/Qfrh/swL
	d0nTKJMyemXnqI2rUk02pLdgcuJ0m4qbSRU8gPrt9SY7rY6nHyAuEISVPAAMUbmXvVdb
	tt0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=MRQPSGTCVUFi/lgkVt9vcmlzrD64o3OsOAag4t8hliU=;
	b=U7xn1z617O1CcZTjQEybP7lH8A6fNU4vBihoUUVy55QBpfjuJNWYPMtqRqABECtz02
	7Pne5d3hT7077tABaP5kylmUbJvuz550BgTHAjW2FHBngY7V27STKuJfLJCSmYzQ32yD
	tcIKHu+G1Z+Ed0v37dP/YX53rget74d6bttw1sqH/YLC9p9CdI22GPN2x5sThnoCGilD
	WrMNjpSCF2SshwKBQcte5mWvpLA6CplJ8+zun6+McsESsoaRHAGpfBYZjltyUcXtiQfR
	pAJfFCYdCR+n3oN5pnIiKb8eBjdpQbLK1oTxIwFjh/1UFKjMeWiLk5lVqCQUCAoLrSBu
	1opg==
X-Gm-Message-State: AOPr4FXLvQg2244BlmMpA2Iw651Uz+d3EoPBnFqazMuyNbNKnAjM9zqkb0UIZ6OEV3zzSQ==
X-Received: by 10.66.189.135 with SMTP id gi7mr46979262pac.158.1463415748649; 
	Mon, 16 May 2016 09:22:28 -0700 (PDT)
Received: from mail-pf0-f175.google.com (mail-pf0-f175.google.com.
	[209.85.192.175]) by smtp.gmail.com with ESMTPSA id
	f125sm2867288pfa.26.2016.05.16.09.22.26
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 09:22:26 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pf0-f175.google.com with SMTP id y69so68559581pfb.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 09:22:26 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.98.104.133 with SMTP id d127mr46646127pfc.112.1463415746256; 
	Mon, 16 May 2016 09:22:26 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Mon, 16 May 2016 09:22:26 -0700 (PDT)
In-Reply-To: <314BCBC6-07F6-4B6E-89E6-FA6D86C682B0@gmail.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
	<6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
	<CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
	<CAHiDW_FQJuwT=JPtvCMPM3bcQozTqyEDFq8LjziNe=NHT+HPMw@mail.gmail.com>
	<CAP9ODKoNnq0ufH=XF8oPqTQKW_o0NehzUXCvanzLkJMEHXAdFQ@mail.gmail.com>
	<314BCBC6-07F6-4B6E-89E6-FA6D86C682B0@gmail.com>
Date: Mon, 16 May 2016 13:22:26 -0300
X-Gmail-Original-Message-ID: <CAP9ODKrCppUA76B=96cnUVM0==mb8a_oDB6XOgoTNLT-oV0EBg@mail.gmail.com>
Message-ID: <CAP9ODKrCppUA76B=96cnUVM0==mb8a_oDB6XOgoTNLT-oV0EBg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 13/13] weston: Upgrade 1.9.0 -> 1.10.0
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
X-List-Received-Date: Mon, 16 May 2016 16:22:28 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 16, 2016 at 12:50 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On May 16, 2016, at 3:43 AM, Otavio Salvador <otavio.salvador@ossystems.com.br> wrote:
>>
>> On Mon, May 16, 2016 at 5:18 AM, Jussi Kukkonen
>> <jussi.kukkonen@intel.com> wrote:
>>> On 13 May 2016 at 23:15, Otavio Salvador
>>> <otavio.salvador@ossystems.com.br> wrote:
>>>> On Thu, May 12, 2016 at 4:20 AM, Jussi Kukkonen
>>>> <jussi.kukkonen@intel.com> wrote:
>>>>> Support for multiple new protocols, many new features:
>>>>> https://lists.freedesktop.org/archives/wayland-devel/2016-February/027039.html
>>>>>
>>>>> Weston now depends on wayland-protocols (which is protocol
>>>>> collection split off from weston).
>>>>>
>>>>> Remove upstreamed patches, add a patch to fix the wayland-protocols
>>>>> path used during build.
>>>>>
>>>>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>>>
>>>> I am working on rework the weston recipes and it seems Weston 1.11 is
>>>> close of release. I think instead of adding 1.10 we could use 1.10.91
>>>> and upgrade it to 1.11.0 when it is out (end of May). This avoids
>>>> another cycle of rebase of patches during 2.2 development cycle.
>>>>
>>>> What do you think?
>>>
>>> I don't have a burning need to get 1.10 in at all (I almost didn't
>>> send these in the first place because of 1.11 being just two weeks
>>> away). If you'd rather avoid the churn I'm fine with doing other
>>> things and looking at this again after 1.11 release. I'm also totally
>>> happy to keep my paws off this completely if your rework is going to
>>> include the 1.9 -> 1.11 upgrade in it.
>>>
>>> Here's my current 1.10 branch in case it's useful (the important
>>> change is the WAYLAND_PROTOCOLS_SYSROOT_DIR hack to get multilib
>>> working with allarch wayland-protocols):
>>>  git://git.yoctoproject.org/poky-contrib jku/wayland-1.10
>>>  http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/wayland-1.10
>>>
>>> Just to be clear: Based on this discussion I don't currently plan to
>>> send a V2 to list unless there's demand for it.
>>
>> As I said, I would work on 1.10.91 as it is close of 1.11 and easy the
>> upgrade. But all my patches are based on 1.10 now so it is fine with
>> me as well so please send the v2.
>
> If 1.11 is around the corner then why not work on 1.11 ( pre-release ) itself

This was my proposal; to get the 1.10.91 merged.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

