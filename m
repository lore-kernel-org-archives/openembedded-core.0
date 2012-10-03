Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TJLvD-00044u-CN
	for openembedded-core@lists.openembedded.org;
	Wed, 03 Oct 2012 12:11:19 +0200
Received: from mail-oa0-f47.google.com ([209.85.219.47])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 03 Oct 2012 02:58:01 -0700
Received: by oagh1 with SMTP id h1so6818768oag.6
	for <openembedded-core@lists.openembedded.org>;
	Wed, 03 Oct 2012 02:58:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=TpuPDhGC7tMBLqgqizTgW38xvP4+lPB+p3sFeYvEIT4=;
	b=if0XrBtxiUw3rvhe1UAxkF/ehNjltxXKat+lS8vE2KqR2s6gxltSJfs6HIJpx4eDX1
	DpsO1KGur5S+zFahNgs20B3fqGp9DwhNK5MGcIYv3592fgR1uSUDWQGMHvM5jZSdH9sZ
	SvHO+eSAe1A02vAxQBg2Xjz2/eJKwuerz4mle+S1j1GBZa3auhW+JxaBU31fxw0sKuP+
	4dx1srMOYGDMTbTgi/aTlXMqlFrTIxKI494eItD9Ku6iEnNccvQeusoLl3lZ1kZ+HhLG
	h/tJLwc31g6sbCVcMSWsJBA/yozN3qzjFUFM+FFij+WBxUZGUUsUd/seLwC0SVvcuZhq
	e7xA==
Received: by 10.182.45.42 with SMTP id j10mr1049876obm.60.1349258297763; Wed,
	03 Oct 2012 02:58:17 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.70.6 with HTTP; Wed, 3 Oct 2012 02:57:57 -0700 (PDT)
In-Reply-To: <CAJTo0LbGDt_dKSgL+Ms0M9QAB7d+nBVCuV0-WuNKuGDy-t19fQ@mail.gmail.com>
References: <1349086731-2818-1-git-send-email-ross.burton@intel.com>
	<1349255253.18301.23.camel@ted>
	<CAJTo0LbGDt_dKSgL+Ms0M9QAB7d+nBVCuV0-WuNKuGDy-t19fQ@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 3 Oct 2012 10:57:57 +0100
Message-ID: <CAJTo0LYh7yqpN5gyfvfpNxoBVOP_jG0cjm8UHcYRT874=8B7yg@mail.gmail.com>
To: Richard Purdie <richard.purdie@linuxfoundation.org>
X-Gm-Message-State: ALoCoQnVyxDzBu4m/RA0eXmvRTxJVukL5Rz9Ik9VBRkB36d/n1Nb6VWw1otW1w5wpQFVcd98q/gb
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] xf86-video-intel: drop libxvmc dependency
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Oct 2012 10:11:19 -0000
Content-Type: text/plain; charset=UTF-8

On 3 October 2012 10:39, Burton, Ross <ross.burton@intel.com> wrote:
> On 3 October 2012 10:07, Richard Purdie
> <richard.purdie@linuxfoundation.org> wrote:
>> On Mon, 2012-10-01 at 11:18 +0100, Ross Burton wrote:
>>> xvmc is explicitly disabled, so remove the dependency.
>>
>> and also add some new dependencies. I'm left wondering if that was
>> intentional?
>
> No, that's fallout from cherry-picking.  I'll re-send.

Actually I mis-read the diff - there is no delta apart from the removal of xvmc.

Ross


