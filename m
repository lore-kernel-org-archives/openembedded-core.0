Return-Path: <armccurdy@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 006666011C
	for <openembedded-core@lists.openembedded.org>;
	Sun, 25 Mar 2018 02:43:40 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id z8so15582085wrh.7
	for <openembedded-core@lists.openembedded.org>;
	Sat, 24 Mar 2018 19:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kWz4aElErSHRp6iQaUiEFr5Jf8oyJfiP1Fa1gtB3doY=;
	b=dO4dFuOOTEyALF9VlCR+676bQG+lL2FF6toMcSyYPNsKiUxO4GyZsUKOVL+0VGYCXy
	mut+0JDaYIKFiDXEhlkneQeKdvt55LHuxis+bo16tXnhksTocq8SEGgEuUkBpHy1RTdI
	d1jBu2tmEC4l2NZ6rDs6Vy1dAxpugPMJKGJ/PM+cq6BT/OfWengaRzV91KjJJA5I6kq3
	4jav6bqipO3j+qJ5RSbQD1wYYTOocQ0jeKmtyOocK1A/DPiat7Km2vkv903k+T5GLvB3
	67i3eDZk4KjLgRibJxs3+10HAskFN90UfcCQYO3PNWJs6BcRQms/eN7WJ0W7jnE1HO0D
	Qgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kWz4aElErSHRp6iQaUiEFr5Jf8oyJfiP1Fa1gtB3doY=;
	b=Ys6Ky4tbkU+mnk8DM952IHQvvBXIKCJ2+AJuzqB0pf0ZqMsqKVdJge5Ssu/neudtoz
	E7sky0z5nuDXCQzQE4R6h+1vP0kmAk42+mUsDvX3T36P07iKfqKGPfhPY+Z5mgBPzbnX
	ULV+ZeaZy/gAG47BMek8LkMB7bW2mFoEJkEBSKazpoAiWjoK3x4+iEB2hV5tsV5IYjLh
	emJsSm4c6oDFVDmRuuUo5OQ12+byCsb1FFxb0MUC2F6ccELuMAoMR5GUGMFgG7BamxjH
	EbxfdFQf8MgaxsJYqkhjDeGlGxS2oSx4/GvHEd1VY3y+/ZOMQPQ/dgSTEbtr1ltrnKO4
	J8nQ==
X-Gm-Message-State: AElRT7FARxlcV6DPTg2syTp+gOvSgn4tOwRlQvL66YRCzaavLbNzp9AU
	2s5xEI77ZCp49y3kdRwHSq9v649SnqlSer2UxcA=
X-Google-Smtp-Source: AG47ELtqHDLQUQlXqclihkKwY88hNZqKWlWeIpkxoqdcEYk6e0nBMq1R1lcxAgr3gXm0BMOpOAAuWuvDGJbE7zyHbB8=
X-Received: by 10.223.182.132 with SMTP id j4mr26832626wre.66.1521945821827;
	Sat, 24 Mar 2018 19:43:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.163.65 with HTTP; Sat, 24 Mar 2018 19:43:41 -0700 (PDT)
In-Reply-To: <alpine.LRH.2.00.1803241637120.40806@sjc-ads-6991.cisco.com>
References: <lyo9jerelp.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<lyd0zurcw4.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<20180323112820.12bc94a4@seebsdell>
	<CAJTo0LYfzA2i6GwJA0mODvNse8gy+=gYBk-T9dAUbR65bAVDZA@mail.gmail.com>
	<20180323114939.218c0607@seebsdell>
	<1521848850.11431.36.camel@linuxfoundation.org>
	<20180323185655.51d96c05@seebsdell>
	<1521894988.11431.42.camel@linuxfoundation.org>
	<CAJTo0LbahOFYjBjonmfn5on78fFinG1Vk7R4kKtKX2mpmriEMA@mail.gmail.com>
	<20180324122357.668e6afc@seebsdell>
	<CAJ86T=Xcee6ivhoSc0adMR2q95ozsMXwSYL41mK7O5PN4CsWqw@mail.gmail.com>
	<20180324132246.28c2f8cd@seebsdell>
	<CAJ86T=VA6bR8v5+g6Y5e5HWQjU5r=E503gNdHCaco4PioPdW=Q@mail.gmail.com>
	<20180324142427.53da953d@seebsdell>
	<CAJ86T=U+0aG2gv6w_fJGCiN-VbO06is6-0gc+0bq+yvjBP=tNA@mail.gmail.com>
	<20180324145044.168f7e3f@seebsdell>
	<alpine.LRH.2.00.1803241306460.40806@sjc-ads-6991.cisco.com>
	<CAJTo0LbCLW+VH+hGz+D9GQZHZ5sb3NEiN6C-FmNBQHzHmddEeQ@mail.gmail.com>
	<alpine.LRH.2.00.1803241637120.40806@sjc-ads-6991.cisco.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Sat, 24 Mar 2018 19:43:41 -0700
Message-ID: <CAJ86T=VB0axF8Lc-fEGuodFOLF_=UexUoGVoHt6+A9+m3bVs4w@mail.gmail.com>
To: Victor Kamensky <kamensky@cisco.com>
Cc: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>,
	OE-core <openembedded-core@lists.openembedded.org>
Subject: Re: pseudo: host user contamination
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
X-List-Received-Date: Sun, 25 Mar 2018 02:43:41 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Mar 24, 2018 at 5:09 PM, Victor Kamensky <kamensky@cisco.com> wrote:
> On Sat, 24 Mar 2018, Burton, Ross wrote:
>> On 24 March 2018 at 20:12, Victor Kamensky <kamensky@cisco.com> wrote:
>>>
>>> Here is another crazy idea how to deal with it, just
>>> brainstorming what options are on the table: disable
>>> renameat2 with help of seccomp and force coreutils to
>>> use other calls. Something along the lines that were
>>> suggested with intercept of syscall function call, but
>>> let kernel to do interception work.
>>
>> Wow, that's impressively magic.  Does this depend on kernel options or
>> specific recent versions?

Yeah, it's impressive but perhaps overkill for this situation.

Having the kernel run a BPF script on every syscall is going to have a
much bigger performance impact than intercepting one specific libc
function in user space.

Also, AFAIK, seccomp can't be nested - so building within an
environment which has already been secured with seccomp (e.g. recent
versions of docker?) might be a problem if pseudo starts to rely on
seccomp too.

