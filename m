Received: from mga09.intel.com ([134.134.136.24])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrTGH-0002g8-63
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 14:21:49 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga09.intel.com with ESMTP/TLS/RC4-SHA; 18 Jul 2012 05:10:27 -0700
Received: by mail-qc0-f180.google.com with SMTP id v28so795578qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 05:10:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=9LfotO3XD/yhdo2QS6iJxlCvtnCN1ELCG3HhcTJ7iT0=;
	b=ECPv6T/EUuCM/ZsV4Itq/0ljJFF8FiHRPzkorw65dobYFIlOXdBrMmJEh6AdUnjL14
	cQUkwcTNtt0AqON+BiwQUllkcUKN83M0qzih7tuy3Wzyds6jxMCs7iTEEdUedO9kEo5p
	3n3g9dR1PAaio4pRsSBVusfWRgbilQIxqRmbRy1dqp1KwwSErrBrWmwLSz/ns198whVA
	OHHoGr9n6BiBdOg+/53+RR3benf9KGS8rI+/2RBuja9Wjke9q0DUhCsAgRKGuSEQSF7v
	/75QFgmOhwHg3JtGmazry9i/JUcrBQNHwHW0f36Y/1VylxKOro+NsxI/G4YB9LR1Spcx
	vamA==
Received: by 10.229.135.67 with SMTP id m3mr1378865qct.26.1342613427311; Wed,
	18 Jul 2012 05:10:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.82.74 with HTTP; Wed, 18 Jul 2012 05:10:07 -0700 (PDT)
In-Reply-To: <CAJTo0LYO9xT3sfBR_cQw6=76HqEaYaOzktG861_QXaVwsV5c0Q@mail.gmail.com>
References: <CAJTo0LY9WbxAW35NS-C1M4_rpDDD6SCXcRPw7OtdoR5WkFZirA@mail.gmail.com>
	<20120718112359.GC29030@mi.fu-berlin.de>
	<CAJTo0LYO9xT3sfBR_cQw6=76HqEaYaOzktG861_QXaVwsV5c0Q@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Jul 2012 13:10:07 +0100
Message-ID: <CAJTo0LYn58DZcjxDnR_iLHd8pF+Km9+5ph8Y2s7vnpqE-+hTkg@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQll5GXefhkuOYILs/vwlmSGdpjxsDlNaHxt7jdQpow2f32AK5/ADIK31Z4qsx+FVkxUQ0q2
Subject: Re: eglibc-initial trying to remove files in /usr
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-core>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Jul 2012 12:21:49 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2012 12:40, Burton, Ross <ross.burton@intel.com> wrote:
> On 18 July 2012 12:23, Henning Heinold <heinold@inf.fu-berlin.de> wrote:
>> NOTE: make PARALLELMFLAGS=-j 8 cross-compiling=yes prefix=/usr
>>
>> So it tries to install eglibc to the host dirs which is of course failing.
>
> The mechanics of building eglibc is beyond me -- yesterday's clean
> build worked fine so something in the last day must have broken it.
> Any ideas?

So I reverted to GNU Make 3.82 (debian experimental) to 3.81 (debian
unstable), and eglibc-initial builds.

I'm just going to pretend this never happened. :)

Ross


