Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1SrTLm-0002qB-1U
	for openembedded-core@lists.openembedded.org;
	Wed, 18 Jul 2012 14:27:31 +0200
Received: from mail-qc0-f180.google.com ([209.85.216.180])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 18 Jul 2012 05:15:54 -0700
Received: by qcmv28 with SMTP id v28so797451qcm.25
	for <openembedded-core@lists.openembedded.org>;
	Wed, 18 Jul 2012 05:15:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=acXEQ8sKMBYdbz5LpXI36Ez4CHv28J16OxTv5gSol8U=;
	b=AE9x9g2cW6pJOCGyCqSJ8jvZD76vdANfVPooQT1Eij7Sfy2eOHVj/SU0ZU+aJY4yeu
	4yVbUYAO5kDkDnQ0D+3QDJ+j7H7c2FcGxn3WAxYxIyq8baeIi1XViQVnU5xUqAE+XFWR
	aftTbzLfLVT0U9tR5nFzQRbnKkkJImOT9TLTJWhot3PaTU9KCnOp6oC/V6GCIT0P6x8l
	FZohyJ2k+4et+6vaBb6eRtlh/8Lv/1wchINPIY7lDtPb2ffACAv7OYXEJM7pz7j8+QGA
	TmROMKkET/MhXAGRTIG4kPBEz478Uxi6oj2fq22abyAB6y3LXtXnEFOesdT5d1m1WBju
	1o0g==
Received: by 10.224.177.1 with SMTP id bg1mr5467906qab.68.1342613754077; Wed,
	18 Jul 2012 05:15:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.229.82.74 with HTTP; Wed, 18 Jul 2012 05:15:33 -0700 (PDT)
In-Reply-To: <CAJTo0LYn58DZcjxDnR_iLHd8pF+Km9+5ph8Y2s7vnpqE-+hTkg@mail.gmail.com>
References: <CAJTo0LY9WbxAW35NS-C1M4_rpDDD6SCXcRPw7OtdoR5WkFZirA@mail.gmail.com>
	<20120718112359.GC29030@mi.fu-berlin.de>
	<CAJTo0LYO9xT3sfBR_cQw6=76HqEaYaOzktG861_QXaVwsV5c0Q@mail.gmail.com>
	<CAJTo0LYn58DZcjxDnR_iLHd8pF+Km9+5ph8Y2s7vnpqE-+hTkg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 18 Jul 2012 13:15:33 +0100
Message-ID: <CAJTo0LaXvBNHKmSjU8JgrjA-2SB3Uu1S6XnzXugbBxgVYGXvLw@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
X-Gm-Message-State: ALoCoQmYkCDDWjQ7LpDa1aVmGBAwZsDGFbHWywmyklodnWKXCmM1+qeNXiex8chZKUzHJ2Dg05Qs
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
X-List-Received-Date: Wed, 18 Jul 2012 12:27:31 -0000
Content-Type: text/plain; charset=UTF-8

On 18 July 2012 13:10, Burton, Ross <ross.burton@intel.com> wrote:
> So I reverted to GNU Make 3.82 (debian experimental) to 3.81 (debian
> unstable), and eglibc-initial builds.

*from* 3.82 *to* 3.81, whoops.

Ross


