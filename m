Received: from mail-ve0-f175.google.com ([209.85.128.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UUyXZ-0001k2-IJ
	for openembedded-core@lists.openembedded.org;
	Wed, 24 Apr 2013 14:11:21 +0200
Received: by mail-ve0-f175.google.com with SMTP id m1so678764ves.34
	for <openembedded-core@lists.openembedded.org>;
	Wed, 24 Apr 2013 04:53:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=eNzWMLI0FuwKJrCvh6t/3IAOxIEc+vshzULMqdwNSJ8=;
	b=LT5Ycb6E4l8GQYumaBzUvcMHAeJYKfVvoF7NyHaGMmsOHHgVEeK3XDEse98VTNaPBn
	ykAo0nnEQ7Am+m5rc3Gvc6jExAtkKbs/YbHLYcue9pIUDjItgRtDuUjI0fqcktMK5gP6
	MxonIsTxgDFpoWBvRN6ogojgE2GSa+S7OFp2bm0kw82aVJaC0EmDQN644sbCce4aGEgY
	VKPkGE10fiemEGWAOLpPwwD1RrnPS7Dqe3DiSLLzUGYvYIVzW2vTFytUgy+a4c01ed3R
	46NMnZkIp3Dh+6qf6V50pxDr2MmSCI8rFq3SpH6I5wpiH9uYeuOMgybPtQYNN1Fn7xfc
	S5UQ==
X-Received: by 10.52.165.99 with SMTP id yx3mr7703939vdb.34.1366804411388;
	Wed, 24 Apr 2013 04:53:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.100.68 with HTTP; Wed, 24 Apr 2013 04:53:11 -0700 (PDT)
In-Reply-To: <1366803441-18633-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
References: <1366803441-18633-1-git-send-email-enrico.scholz@sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 24 Apr 2013 12:53:11 +0100
Message-ID: <CAJTo0LamREL0U6CgeYcQjvfDVdu6Fa4tfioVO21ArakywKeMgg@mail.gmail.com>
To: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Gm-Message-State: ALoCoQnwqGKObw8lUx9XWLqNnQIKBln4ELm1VcCUw0JzPgWekZKhaGS3MgV9+CMAkYP8IgSBsonV
Cc: Paul Eggleton <paul.eggleton@linux.intel.com>,
	openembedded-core@lists.openembedded.org
Subject: Re: [PATCH] systemd-systemctl: parse unit files more correctly
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
X-List-Received-Date: Wed, 24 Apr 2013 12:11:24 -0000
Content-Type: text/plain; charset=UTF-8

On 24 April 2013 12:37, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
> Old script failed to parse unit files containing comments like
>
> | #Alias=some-alias
>
> or whitespaces like
>
> | WantedBy = foo
>
> correctly.  Patch changes script to interpret keywords only when they
> are at the beginning of a line and ignores whitespaces before the '='.
>
> Signed-off-by: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>

Acked-by: Ross Burton <ross.burton@intel.com>

CC'ing Paul so this ends up in the Dylan branch too.

Ross


