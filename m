Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f65.google.com (mail-wm0-f65.google.com [74.125.82.65])
	by mail.openembedded.org (Postfix) with ESMTP id 72037778BC
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 17:59:36 +0000 (UTC)
Received: by mail-wm0-f65.google.com with SMTP id q124so26257073wmb.5
	for <openembedded-core@lists.openembedded.org>;
	Tue, 10 Oct 2017 10:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=aaAXIVMrgJAYQIfzYAgcq5d/h0fnynUoKiHpsC9LOac=;
	b=szUX+DZqX+DSvRtb0gXkSUT2VMwrCGwLY6cLcHKZUy/jK01k9rqNGQ/Z1jE9+0Mh0l
	dXfZ6VTUtRabxcaSoBhmCqYH2IumW4kaENvkT9vlhFh9vdnz1o8hKDukcrTdvcMPjv6N
	Vs7FyDwvuCgO66fvoFHseIhgXHlQQejIUmYUz9D/FFBxVTWfTx2CS9JpgxGdgE5yV+Sx
	kEr5ROTVhqZJ1CsPYJmm5K0iZWyoK58LSGKFJvQN7daHsTHWUfpAEl5GBALUhSGqARTr
	LeaH9ktOtKeQL4HEYkwWBemsXPVVkowp52KPhqN4pTmqB3F5vBnqfOYdK0CDWWy1isiT
	IpCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=aaAXIVMrgJAYQIfzYAgcq5d/h0fnynUoKiHpsC9LOac=;
	b=sJQT+Vq5whdAT6q9xZLH//pp9PiMBzER0MBj7iVi55d9mRDaVXj/H1mLkxz0BIuWJJ
	mcYZM3zLGBpHNmGPabHvmoyWo+7n4l9Kbd93GWEqNlXCiJZa77kTM30xl06XfYGCSHsa
	KwUSADjJqXrO87wNBu3LQzKhG74NadS5pQ+S+XQK2HgyD85DST9VyOoLQooAgUMz+rXX
	YuBat7IQ+b5ZY487PiC6ehhyy1JdJztFBBbldgl0HLXHagzLoBDdTqx2oV5KdPwGLpux
	hbx/1c6eNnuW9YReOTqgqQQ4eNIpZUFCQi1htK+tvaanX0XdJKD+QxPqvZ9pXw5XAanL
	8sAw==
X-Gm-Message-State: AMCzsaWzdorMwNwpMtD/N1+nUi6D+AAFLs1O9s15ffcjFmNeWvKsprkc
	Gj88Ld5/oO48rsBhjKZqfETQvAkEYnM6rAdHz1E=
X-Google-Smtp-Source: AOwi7QDV0+dBD6ZhgVCMrmdzbSgoE1i8QWacHKJoZ7dYW9q06ilxXZt/E4h7RXexB8myNGavK2+AdufTzHmMmbYZOXc=
X-Received: by 10.223.146.197 with SMTP id 63mr12582781wrn.180.1507658378026; 
	Tue, 10 Oct 2017 10:59:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.166.19 with HTTP; Tue, 10 Oct 2017 10:59:37 -0700 (PDT)
In-Reply-To: <20171007172923.36429-1-raj.khem@gmail.com>
References: <20171007172923.36429-1-raj.khem@gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Tue, 10 Oct 2017 10:59:37 -0700
Message-ID: <CAJ86T=X78ockUQ_9tVizxo4JZwbDQu9s0B2dG2ud50Xg6q=28A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
Cc: OE Core mailing list <openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gcc-6.3: Backport patch to fix ICE on ARM
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
X-List-Received-Date: Tue, 10 Oct 2017 17:59:37 -0000
Content-Type: text/plain; charset="UTF-8"

On Sat, Oct 7, 2017 at 10:29 AM, Khem Raj <raj.khem@gmail.com> wrote:
> Fixes
> internal compiler error: Max. number of generated reload insns per insn is achieved (90)

Is there a plan to update gcc 6.3 -> 6.4 in OE 2.5?

> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---

