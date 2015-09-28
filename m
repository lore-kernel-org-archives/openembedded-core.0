Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id AD36A755F4
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 06:53:57 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 339FD20BE2;
	Mon, 28 Sep 2015 08:53:56 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>
References: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
	<1443390491-23728-2-git-send-email-dv@pseudoterminal.org>
	<CAMKF1srHAox4XZntPRCC-jzzZDwHtt46UC+ekahKE8s_YzXBpw@mail.gmail.com>
	<5608E1BA.2060301@pseudoterminal.org>
	<CAMKF1soj1rrFxCG1bQz=F7creT2KBd_SQUOQDXiRUSjq6NA7xA@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <5608E404.9040107@pseudoterminal.org>
Date: Mon, 28 Sep 2015 08:53:56 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1soj1rrFxCG1bQz=F7creT2KBd_SQUOQDXiRUSjq6NA7xA@mail.gmail.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/7] gstreamer1.0-plugins-base: upgrade to version 1.6.0
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
X-List-Received-Date: Mon, 28 Sep 2015 06:53:58 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 2015-09-28 um 08:47 schrieb Khem Raj:
> On Sun, Sep 27, 2015 at 11:44 PM, Carlos Rafael Giani
> <dv@pseudoterminal.org> wrote:
>> The other patches in the list above, however, need to be reworked to apply
>> against 1.6.
>> 0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch has been
>> rejected by upstream,
>> handle-audio-video-decoder-error.patch is under discussion.
>> taglist-not-send-to-down-stream-if-all-the-frame-cor.patch hasn't been
>> looked at yet by upstream.
>>
>> Since these no longer apply cleanly against 1.6.0, we anyway have no option
>> but to delete them and wait until the authors reworked them.
> hmmm, I would have preferred a conclusive situation where we know
> exactly what they fixed and what we dont have when we drop them
> somewhere in commit message, ideally they should be forward ported
> along with recipe upgrades but its ok if you dont feel comfortable and
> want to defer it to original submitters but then please CC the
> submitters so they know whats needed of them

Yep, I already sent them a mail about the necessary rework a month ago, 
when I was first trying out release candidates for 1.6, but I'll give 
them a status update.

As for the patch that got rejected by upstream (but that I didn't 
delete, because it can still be applied), do I delete this one as well? 
Is there a general preference in such situations? I personally would 
prefer to stick with what upstream does.

