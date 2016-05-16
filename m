Return-Path: <otavio.salvador@ossystems.com.br>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id B1E2A62132
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 10:43:02 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id g132so15327073pfb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 03:43:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ossystems-com-br.20150623.gappssmtp.com; s=20150623;
	h=from:mime-version:in-reply-to:references:date:message-id:subject:to
	:cc; bh=JQ4ywgAIEo6CT3/gMDWTUvRIeNeyafU3gVr268LLmuk=;
	b=IVKBehOw+iplLmVt4MptiiwJG5pvSDfEeUPL6AAHcRBY7ldUsthEfLiDqg+0bFwEP5
	a+O466zPKIsvugVhEKXNSahhGJN/lU6IprkEK2ebm4pMjvGmWPwSrF1AIKycb6NM9Wod
	ZH5bUU05GCVcX/F36zN4NEivlNqdTZyBKqYm3IvowmFX2Gc6FJJJ7w//fpj0E1ou/i0Q
	gWDvS1x+SHZ4nSclNZxwXw43WKmzfXvd0TkptEjRd5gWRT0EXk63MXWPQ+AMcSjhEZx2
	chKeQm1anOjUSm5Jo7LQ1M8igxaG8QgJHeQMIwpujrp7jd9d4JL+f+PoRyiZ/2K79alV
	cOUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:mime-version:in-reply-to:references:date
	:message-id:subject:to:cc;
	bh=JQ4ywgAIEo6CT3/gMDWTUvRIeNeyafU3gVr268LLmuk=;
	b=Zl+WAyD2Uqa/cZrWz/1hJpFIoSAoNrwHlx3M5R5NZ9rBh3d+XrqsrTIBFxOReGZ/ay
	Eh6tqI2V4dbbnOlsCMPXwkz9xNOq/QKfJeoQOL4V3doZ1JdPG7lyd5LIVsIt9k/wVdbM
	6T52JfTIh38gpeCv5bewDMjast62NlQR4nIgmZy0uMvvGoE+upvxUt10cxSTFxQC1RRf
	8H3unDvcFBcJJqIdBPHbOf19Jdq/seuGcXE/f0NQXk0sRfuAdwKUpbqMqIMeZNHKBM3X
	oidASe02F5RS8puKQt8dIPGIdTozjnDL8QaEf+mK06Yn3j3DQtJmm3xP+hhnUJVCB2+z
	BgRw==
X-Gm-Message-State: AOPr4FU04MlALLwMQ1qu9fk+K8wY5DuUadoFHYYFmMgz3GpyzSSGhlx61btsEc1pl0V8wQ==
X-Received: by 10.98.17.153 with SMTP id 25mr44248231pfr.105.1463395383590;
	Mon, 16 May 2016 03:43:03 -0700 (PDT)
Received: from mail-pa0-f49.google.com (mail-pa0-f49.google.com.
	[209.85.220.49]) by smtp.gmail.com with ESMTPSA id
	e7sm46438709pfa.28.2016.05.16.03.43.02
	for <openembedded-core@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 16 May 2016 03:43:02 -0700 (PDT)
From: Otavio Salvador <otavio.salvador@ossystems.com.br>
X-Google-Original-From: Otavio Salvador <otavio@ossystems.com.br>
Received: by mail-pa0-f49.google.com with SMTP id qo8so21457230pab.1
	for <openembedded-core@lists.openembedded.org>;
	Mon, 16 May 2016 03:43:02 -0700 (PDT)
MIME-Version: 1.0
X-Received: by 10.66.172.165 with SMTP id bd5mr44780642pac.128.1463395381701; 
	Mon, 16 May 2016 03:43:01 -0700 (PDT)
Received: by 10.66.231.37 with HTTP; Mon, 16 May 2016 03:43:01 -0700 (PDT)
In-Reply-To: <CAHiDW_FQJuwT=JPtvCMPM3bcQozTqyEDFq8LjziNe=NHT+HPMw@mail.gmail.com>
References: <cover.1463035854.git.jussi.kukkonen@intel.com>
	<93f1600d7ce782dbafb1ab32da9416dc29d432c2.1463035854.git.jussi.kukkonen@intel.com>
	<6a0ed7998e66eedbf58fdb54db111b281a2b81bb.1463035854.git.jussi.kukkonen@intel.com>
	<CAP9ODKpbMyzEkKh1WhwnNkRrgXCeBQzTeSrVP89Ngx5CwMO_5w@mail.gmail.com>
	<CAHiDW_FQJuwT=JPtvCMPM3bcQozTqyEDFq8LjziNe=NHT+HPMw@mail.gmail.com>
Date: Mon, 16 May 2016 07:43:01 -0300
X-Gmail-Original-Message-ID: <CAP9ODKoNnq0ufH=XF8oPqTQKW_o0NehzUXCvanzLkJMEHXAdFQ@mail.gmail.com>
Message-ID: <CAP9ODKoNnq0ufH=XF8oPqTQKW_o0NehzUXCvanzLkJMEHXAdFQ@mail.gmail.com>
To: Jussi Kukkonen <jussi.kukkonen@intel.com>
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
X-List-Received-Date: Mon, 16 May 2016 10:43:05 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, May 16, 2016 at 5:18 AM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> On 13 May 2016 at 23:15, Otavio Salvador
> <otavio.salvador@ossystems.com.br> wrote:
>> On Thu, May 12, 2016 at 4:20 AM, Jussi Kukkonen
>> <jussi.kukkonen@intel.com> wrote:
>>> Support for multiple new protocols, many new features:
>>> https://lists.freedesktop.org/archives/wayland-devel/2016-February/027039.html
>>>
>>> Weston now depends on wayland-protocols (which is protocol
>>> collection split off from weston).
>>>
>>> Remove upstreamed patches, add a patch to fix the wayland-protocols
>>> path used during build.
>>>
>>> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
>>
>> I am working on rework the weston recipes and it seems Weston 1.11 is
>> close of release. I think instead of adding 1.10 we could use 1.10.91
>> and upgrade it to 1.11.0 when it is out (end of May). This avoids
>> another cycle of rebase of patches during 2.2 development cycle.
>>
>> What do you think?
>
> I don't have a burning need to get 1.10 in at all (I almost didn't
> send these in the first place because of 1.11 being just two weeks
> away). If you'd rather avoid the churn I'm fine with doing other
> things and looking at this again after 1.11 release. I'm also totally
> happy to keep my paws off this completely if your rework is going to
> include the 1.9 -> 1.11 upgrade in it.
>
> Here's my current 1.10 branch in case it's useful (the important
> change is the WAYLAND_PROTOCOLS_SYSROOT_DIR hack to get multilib
> working with allarch wayland-protocols):
>   git://git.yoctoproject.org/poky-contrib jku/wayland-1.10
>   http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=jku/wayland-1.10
>
> Just to be clear: Based on this discussion I don't currently plan to
> send a V2 to list unless there's demand for it.

As I said, I would work on 1.10.91 as it is close of 1.11 and easy the
upgrade. But all my patches are based on 1.10 now so it is fine with
me as well so please send the v2.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

