Received: from mga12.intel.com ([143.182.124.36] helo=azsmga102.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1Tfrck-0005gg-8Q
	for openembedded-core@lists.openembedded.org;
	Tue, 04 Dec 2012 13:29:21 +0100
Received: from mail-oa0-f69.google.com ([209.85.219.69])
	by mga14.intel.com with ESMTP/TLS/RC4-SHA; 04 Dec 2012 04:14:54 -0800
Received: by mail-oa0-f69.google.com with SMTP id j6so17925438oag.0
	for <openembedded-core@lists.openembedded.org>;
	Tue, 04 Dec 2012 04:14:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=hJkhBzhnOf5kkHPA93LyZkf5UTLfhpX81mRd60hsu2I=;
	b=kGMh9bKtDOKqna9HeZsiAfHcJ2JJFLr3M0+g8wWjIjxpqk/p/RPbApp3Es1NxX9Ok+
	ML9hnBVPKTvXDOHzhk9faO5DkxeII1SNCXKkA40bx1YTqsDgvpFH94Ir0+/Q0l3AK3JH
	cGCBHIWBq2tD6dnlhiITuhncQKLb9nykafFwQ5uF54B2urq+uQhtZ4jq1iV/Kp8BO8O+
	kSMRtpwn5tCazxAIXJ/WjDOV9x64nMvRfL23kZoB/lID5CLw/zEcO4xUsR/MaDrcf3Dc
	WTiq0ukyuY+4IPg0nN0zvEUGHXGm/FOI1V2X5b7IFG6+QHnE/ps2/ox6f7wj6VA867t0
	Fvmg==
Received: by 10.60.170.10 with SMTP id ai10mr11517573oec.72.1354623293494;
	Tue, 04 Dec 2012 04:14:53 -0800 (PST)
Received: by 10.60.170.10 with SMTP id ai10mr11517568oec.72.1354623293417;
	Tue, 04 Dec 2012 04:14:53 -0800 (PST)
MIME-Version: 1.0
Received: by 10.76.132.198 with HTTP; Tue, 4 Dec 2012 04:14:33 -0800 (PST)
In-Reply-To: <CAGiJk9dStPRuWzJVMQhVziNt+EW4ShNm3CkqCJBaTuYgrbSaog@mail.gmail.com>
References: <CAGiJk9c_5nDZbTwTo1DvHXMEtOXgO=4-YvbsDoD-ZXqY=cTi8g@mail.gmail.com>
	<CAJTo0LahtxpX1G5BKkYxCaN7hyJkkS9riXF0btP8XMWFJzzxfQ@mail.gmail.com>
	<CAGiJk9dStPRuWzJVMQhVziNt+EW4ShNm3CkqCJBaTuYgrbSaog@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Tue, 4 Dec 2012 12:14:33 +0000
Message-ID: <CAJTo0LZKGRT=hn0uT9hM34EYpg-MwDFWaQuxOWmohwJVvT+s9Q@mail.gmail.com>
To: Samuel Stirtzel <s.stirtzel@googlemail.com>
X-Gm-Message-State: ALoCoQlOVIE2kmRKKCBj8m0eLIE6ipbt2Rviw8DVzOnQWoo+r7nbXKxBVENAWy8oNfeOxq4Z0wEcoU6SQaopQPjrtOpAgUu59IsQFdRK9yP9trBJMPzaLNuRO3Mv81TjBqQ/p3EU32SHk2VfMEOw4E4HuqyxqnFDm9H64VIQdii6KneeaAy8z2Hlqrb1nHbRLHLFWaohzYgd
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: EGL / GLES issues (mesa)
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
X-List-Received-Date: Tue, 04 Dec 2012 12:29:21 -0000
Content-Type: text/plain; charset=UTF-8

On 4 December 2012 12:10, Samuel Stirtzel <s.stirtzel@googlemail.com> wrote:
> root@overo:~# ls -l /usr/lib/libEGL.so*
> lrwxrwxrwx    1 root     root            21 Dec  4  2012
> /usr/lib/libEGL.so -> libEGL.so.1.6.16.4117
> lrwxrwxrwx    1 root     root            21 Dec  4  2012
> /usr/lib/libEGL.so.1 -> libEGL.so.1.6.16.4117
> lrwxrwxrwx    1 root     root            21 Dec  4  2012
> /usr/lib/libEGL.so.1.6 -> libEGL.so.1.6.16.4117
> -rwxr-xr-x    1 root     avahi-au         0 Dec  3  2012
> /usr/lib/libEGL.so.1.6.16.4117

Have you tried recreating an image?  The different group ownership and
timestamp is odd.  Who does opkg think provided each of those files,
not just the versioned .so.?

Ross


