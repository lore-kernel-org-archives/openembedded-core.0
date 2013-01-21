Received: from mga07.intel.com ([143.182.124.22] helo=azsmga101.ch.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TxDoL-0005kK-5T
	for openembedded-core@lists.openembedded.org;
	Mon, 21 Jan 2013 10:37:06 +0100
Received: from mail-vc0-f200.google.com ([209.85.220.200])
	by mga03.intel.com with ESMTP/TLS/RC4-SHA; 21 Jan 2013 01:21:31 -0800
Received: by mail-vc0-f200.google.com with SMTP id gb23so9605553vcb.3
	for <openembedded-core@lists.openembedded.org>;
	Mon, 21 Jan 2013 01:21:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:x-received:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:x-gm-message-state;
	bh=MSogTgKT9m1kKZx34cOXuiv0H38S1aqzI4d0TjMfBDg=;
	b=XyxxAG3wm+W33NRd064omxbNAB/Fj675mrq7XEY8knXLtnqw7SepigOfz42Qv8a14P
	Mo9dZTtLOE5plTXiNddsJVcCZNimqD+YdLBHmps+Lgb655AlumzYFv8w3YLfXH+Igsta
	Q5XFLVkrRXh/2HfnSJPhPYWVHAdE2btHIISOKu176q5IiqE674Zpd3MSEmletMoEfhxB
	A4f4UJ7nz5UaL1GWje61i+BTAI8oA38PxgdFMZPxMzVQjgpz7T9jA22tEkI4EJ6VYGwH
	sE+dAZy/AFB8vUYRkLeIRy59d24shj0bbu40+eQfKpg1l6fMeZ/oVya8CfbLT61q01u6
	r7ng==
X-Received: by 10.52.72.137 with SMTP id d9mr2570485vdv.105.1358760089278;
	Mon, 21 Jan 2013 01:21:29 -0800 (PST)
X-Received: by 10.52.72.137 with SMTP id d9mr2570482vdv.105.1358760089218;
	Mon, 21 Jan 2013 01:21:29 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.152.232 with HTTP; Mon, 21 Jan 2013 01:21:08 -0800 (PST)
In-Reply-To: <20130121085928.GL29386@jama.palm1.palmone.com>
References: <cover.1358635193.git.ross.burton@intel.com>
	<50FC3899.5000202@linux.intel.com>
	<CAJTo0LaL3vCw52_h-Ab3J9oBHwZwxn_WjUj3D8iivundKypfHQ@mail.gmail.com>
	<20130121085928.GL29386@jama.palm1.palmone.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 21 Jan 2013 09:21:08 +0000
Message-ID: <CAJTo0LbNAFtsgo=au6PKGSqCMV+1Wc8PA7TF33zk+z+0OnwETw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Gm-Message-State: ALoCoQmaRf10wUEzNYppGpjiPXUTHYaxnYMHZpKwg8a9ieyvCe4LyJec/5HDn0FPG0MIygGVIUWHpmIw82MX+g69qIcu+v26ortcssnveYIgUKRMhaXQTmPlgrlmwwBdgcz/7Wx114q6zHiYwVXhRkpE7UMhSULdovB2TkwC4zZUL7phXfM0IZ/l9hzOdHnAZj9jf6M0kh+N
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 00/10] Initial systemd integration
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
X-List-Received-Date: Mon, 21 Jan 2013 09:37:08 -0000
Content-Type: text/plain; charset=UTF-8

On 21 January 2013 08:59, Martin Jansa <martin.jansa@gmail.com> wrote:
> Why weren't changes from
> meta-systemd/oe-core/recipes-connectivity/connman/connman_1.10.bbappend
> merged to oe-core?

Because I'm 90% sure connman isn't the only package that does runtime
detection of systemd.  As I said in the original mail, the goal of
this series was to merge the core support, not all of the services.
Mainly, I want to understand systemd.bbclass before submitting it.

Ross


