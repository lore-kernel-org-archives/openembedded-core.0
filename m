Received: from mga05.intel.com ([192.55.52.89] helo=fmsmga101.fm.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TkaEO-0008IY-3z
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 13:55:40 +0100
Received: from mail-yh0-f69.google.com ([209.85.213.69])
	by mga01.intel.com with ESMTP/TLS/RC4-SHA; 17 Dec 2012 04:40:58 -0800
Received: by mail-yh0-f69.google.com with SMTP id 3so7835911yhp.0
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 04:40:57 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:x-gm-message-state;
	bh=6wIN/DBydYkXm5C2EX2+d24VVhjwNIWcN9xtUt5bFcI=;
	b=eEZhvks0xp+yBhw5OBar01sw7yjnoaR26Oko2y/zaLKscB3Sp9RkHDiWt+RzclxTK5
	3BNs49QfjXDsVIQmi9eMP9prJF1dCPFv4pWPXUwkOOJGNh/Bn9UtbJ1HIyU+TY/Zf7hM
	0mZfWvseDSHVnfFdrPU8VFVeUT/6+4H3zUzZTq5likkCshAOrwyP9PrIhQeZhUlEQEbD
	u+CYecrbkvI3Qc0XWuJaSx9YBdlr6mukfHIe+pF0Pu5KLIvjSXOwQ/g3oCl/Hve8BRgC
	gQc3Hq3J38w6GwwYNV6TuBJ8/dhE4a2ifh3V4lCYg6Wxkh5gvQW4HkRXz4OJX0rBr/g1
	3owA==
Received: by 10.52.37.9 with SMTP id u9mr19919562vdj.83.1355748057608;
	Mon, 17 Dec 2012 04:40:57 -0800 (PST)
Received: by 10.52.37.9 with SMTP id u9mr19919554vdj.83.1355748057490; Mon, 17
	Dec 2012 04:40:57 -0800 (PST)
MIME-Version: 1.0
Received: by 10.58.178.244 with HTTP; Mon, 17 Dec 2012 04:40:37 -0800 (PST)
In-Reply-To: <cover.1355526236.git.dvhart@linux.intel.com>
References: <cover.1355526236.git.dvhart@linux.intel.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 17 Dec 2012 12:40:37 +0000
Message-ID: <CAJTo0LZuVEBhvA4bbvuMftNnnbbTMFYcthqHfjY3i0S-swb7GA@mail.gmail.com>
To: Darren Hart <dvhart@linux.intel.com>
X-Gm-Message-State: ALoCoQkqISnJOjfKi8Q0OPQb/IN6rgnezb9/xZjYDVcNGlZnp0p/+8nhrGpP0cOLKmT613PG5CKw0CpHgCN7+I08Jh98bmD/DY9AImw7fCa1TgUi30Ck40ku3E2MppHFe0G7Ctm/hVQqusgL3LXKFlWfVzmg5VY4y7eooguPp+s4/XVAu7XLzSPW+8elr2t7jXlt8yFueo/J
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 0/1][for-danny]bootimg: Use FAT 32 for images larger than 512MB
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
X-List-Received-Date: Mon, 17 Dec 2012 12:55:40 -0000
Content-Type: text/plain; charset=UTF-8

Hi Darren,.

On 14 December 2012 23:06, Darren Hart <dvhart@linux.intel.com> wrote:
> Please apply to danny (already in master).
>
> The following changes since commit f609bf5525450bfdb8e0864d44c41cce7f9319c9:
>
>   gdbm: Resolve host contamination issue (2012-10-10 22:44:51 +0100)
>
> are available in the git repository at:
>
>   git://git.infradead.org/users/dvhart/oe-core.git dvhart/danny/fixes
>   http://git.infradead.org/users/dvhart/oe-core.git/shortlog/refs/heads/dvhart/danny/fixes
>
> Darren Hart (1):
>   bootimg: Use FAT 32 for images larger than 512MB
>
>  meta/classes/bootimg.bbclass | 9 ++++++++-
>  1 file changed, 8 insertions(+), 1 deletion(-)

Merged to ross/danny-next.

Thanks,
Ross


