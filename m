Return-Path: <dv@pseudoterminal.org>
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id AF4BE7626C
	for <openembedded-core@lists.openembedded.org>;
	Mon, 28 Sep 2015 06:44:13 +0000 (UTC)
Received: from [192.168.178.14] (chello062178118086.5.14.vie.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id 61B3A205B2;
	Mon, 28 Sep 2015 08:44:11 +0200 (CEST)
To: Khem Raj <raj.khem@gmail.com>
References: <1443390491-23728-1-git-send-email-dv@pseudoterminal.org>
	<1443390491-23728-2-git-send-email-dv@pseudoterminal.org>
	<CAMKF1srHAox4XZntPRCC-jzzZDwHtt46UC+ekahKE8s_YzXBpw@mail.gmail.com>
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <5608E1BA.2060301@pseudoterminal.org>
Date: Mon, 28 Sep 2015 08:44:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srHAox4XZntPRCC-jzzZDwHtt46UC+ekahKE8s_YzXBpw@mail.gmail.com>
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
X-List-Received-Date: Mon, 28 Sep 2015 06:44:16 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

Am 2015-09-28 um 03:07 schrieb Khem Raj:
> On Sun, Sep 27, 2015 at 2:48 PM, Carlos Rafael Giani
> <dv@pseudoterminal.org> wrote:
>> A number of patches had to be deleted in order for the recipe to work.
>>
>> Patches which cannot be applied cleanly to 1.6.0 and are nontrivial to fix:
>> * 0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch
>> * do-not-change-eos-event-to-gap-event2.patch
>> * do-not-change-eos-event-to-gap-event3.patch
>> * do-not-change-eos-event-to-gap-event-if.patch
>> * handle-audio-video-decoder-error.patch
>> * taglist-not-send-to-down-stream-if-all-the-frame-cor.patch
>>
> has these been dropped ? if so then what do we lose.

We lose nothing that hasn't either been included already or needs to be 
reworked anyway.

There are two things I overlooked though:

* The do-not-change-eos-event-to-gap-event* patches aren't needed 
anymore, because the authors have sent in a completely different patch, 
which has been included in upstream.
* The 0002-gstplaysink-don-t-set-async-of-custom-text-sink-to-f.patch , 
which hasn't been deleted so far, has been rejected by upstream. I 
noticed there is a "denied" upstream-status available, but I would 
rather delete this patch as well, especially since the discussion in 
upstream indicates that this is more i.MX specific. Opinions?

The other patches in the list above, however, need to be reworked to 
apply against 1.6.
0001-basetextoverlay-make-memory-copy-when-video-buffer-s.patch has been 
rejected by upstream,
handle-audio-video-decoder-error.patch is under discussion.
taglist-not-send-to-down-stream-if-all-the-frame-cor.patch hasn't been 
looked at yet by upstream.

Since these no longer apply cleanly against 1.6.0, we anyway have no 
option but to delete them and wait until the authors reworked them.

