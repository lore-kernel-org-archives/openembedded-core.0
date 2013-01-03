Received: from mga10.intel.com ([192.55.52.92] helo=fmsmga102.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TqlbA-000865-Og
	for openembedded-core@lists.openembedded.org;
	Thu, 03 Jan 2013 15:16:44 +0100
Received: from mail-gh0-f197.google.com ([209.85.160.197])
	by mga11.intel.com with ESMTP/TLS/RC4-SHA; 03 Jan 2013 06:01:39 -0800
Received: by mail-gh0-f197.google.com with SMTP id f15so19699612ghb.0
	for <openembedded-core@lists.openembedded.org>;
	Thu, 03 Jan 2013 06:01:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=RM7+UqRZRrwkY+YBzTibl733gQZAFmGMnZw9G4Cn8nw=;
	b=HJtmV91RtTJfx9Oj3IctE8KiJBgdt9O7ul1Hr7kpjvuP/LZtPwaTa2sNH7MYV4+K/q
	4f0FFo7BZG6zSY88yc+TMPavqpYYaDm3u4UQhx3VcOtNgiv2T4Qm40llLkNx5ne2G65g
	KEqtAQyoCNQLzyguuA+8Hu8zO2ZctJrLAH01WlVH8xqBoBK96L4utCCWwgQgYpxspS3X
	J6cW0mTqI+gPOjjTUwzfSAiiaL2Jl6JhLva4rvW0jKqLmH9x0UW+JuMASe31xQ9j1to6
	a/tehMnzpnXVoMEh+ltODgVO9zMbjcxsW5TAoyOrw1n8Hiu9vp57eAV678W2aMDoE+0S
	O8Lg==
X-Received: by 10.220.115.133 with SMTP id i5mr72779447vcq.42.1357221698145;
	Thu, 03 Jan 2013 06:01:38 -0800 (PST)
Received: by 10.220.115.133 with SMTP id i5mr72779439vcq.42.1357221698039;
	Thu, 03 Jan 2013 06:01:38 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.95.103 with HTTP; Thu, 3 Jan 2013 06:01:17 -0800 (PST)
In-Reply-To: <50E58CF8.5010702@balister.org>
References: <50E58CF8.5010702@balister.org>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Jan 2013 14:01:17 +0000
Message-ID: <CAJTo0LYrj=vM8n6e4nFYCMxamYeueEvB7k-6Whd=7WrG-s+NNA@mail.gmail.com>
To: Philip Balister <philip@balister.org>
X-Gm-Message-State: ALoCoQmZnyZCpcZUn8SbVcRMSCOB/GIPBbnuSZfqY4Jx/zDlSBtFHHOltmbH7ZKo3CzX0ztQwstvcqsjkEa57DguPdafAiyPqbBy9dCdnuR1s3OfVnJc1pvlGgL41bHezo8DQhde0I67V9oAKOWw/R7zK3S+oHRVifBh03tBobPiXOWAVyMGjdwf1ZcqOzjJiOeJpD7yYnit
Cc: openembedded-core <openembedded-core@lists.openembedded.org>
Subject: Re: Using simple-agent on oe-core built image
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
X-List-Received-Date: Thu, 03 Jan 2013 14:16:45 -0000
Content-Type: text/plain; charset=UTF-8

On 3 January 2013 13:51, Philip Balister <philip@balister.org> wrote:
> from gi.repository import GObject

Ah, they've ported from gtk2 to gtk3, as that's the
gobject-introspection import.  We've not packaged up g-i yet so you'll
want to dig into the history and find a revision of simple-agent that
does "import gtk" or "import gobject" instead.

Ross


