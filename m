Received: from mail-vc0-f173.google.com ([209.85.220.173])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1U7QOn-0007eB-GR
	for openembedded-core@lists.openembedded.org;
	Mon, 18 Feb 2013 14:05:43 +0100
Received: by mail-vc0-f173.google.com with SMTP id fy27so590943vcb.32
	for <openembedded-core@lists.openembedded.org>;
	Mon, 18 Feb 2013 04:48:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=2/WyXU3J0DHHpHjTIEGmH6JGGSRasY6lvSvkZ8fafbU=;
	b=KHPPc53M5jT9UBe9iuDBkGNK8MyH35DglIpG9eZkFU0Kdzr+JaIg00b0+FCui9OceS
	EBnnI42FSjqz5j/KbLBETMYZe+Q4oT/5fmWorr/bsBVvOFUUH+CEjhglsYAIfBUOxNxG
	fgdH8xOSS/EgC9xBLhn0KAr3U78nVrdTnOqxsg5PamuA+j4pJ7G37cJqbTxqD43vOYsL
	7WIxjIggSzTyMNPMLacU1BX0hyqqaQDs+aQWfeq1V4ZQ7Nh69D8vQqlaXyv271xAXcBS
	mfKJGR3aJQ4A7LPKdaYvLuc3s2eDgFZY65Bw6K7lYfhTOHAu/7w/NuP1mds4paj5mW6n
	ggPw==
X-Received: by 10.52.24.98 with SMTP id t2mr13328667vdf.69.1361191721373; Mon,
	18 Feb 2013 04:48:41 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.85.36 with HTTP; Mon, 18 Feb 2013 04:48:21 -0800 (PST)
In-Reply-To: <1361190308-9747-1-git-send-email-constantinx.musca@intel.com>
References: <1361190308-9747-1-git-send-email-constantinx.musca@intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 18 Feb 2013 12:48:21 +0000
Message-ID: <CAJTo0LYjk8Lkzk_VuGaqJRykWdb6fyjGcTyB8qk9p=cCmG016g@mail.gmail.com>
To: Constantin Musca <constantinx.musca@intel.com>
X-Gm-Message-State: ALoCoQnNaRj0b8HZ8uIqrRyWiIBNOpEUI51PqbjJ7DOh0vMeWGbqwNPe5hYH1WPQZ9xF+sR6RGpp
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] gdk-pixbuf: upgrade to 2.27.1
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
X-List-Received-Date: Mon, 18 Feb 2013 13:05:46 -0000
Content-Type: text/plain; charset=UTF-8

On 18 February 2013 12:25, Constantin Musca <constantinx.musca@intel.com> wrote:

NACK.

Odd-minor versions are development releases, so we should keep with
2.26 until 2.28 is ready.

(2.27.0 onwards seem to imply upgrading librsvg too, as they changed
their thread semantics)

Ross


