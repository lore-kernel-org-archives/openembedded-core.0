Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SoMrJ-0006FE-0s
	for openembedded-core@lists.openembedded.org;
	Tue, 10 Jul 2012 00:55:13 +0200
Received: by eaal1 with SMTP id l1so4231085eaa.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 09 Jul 2012 15:44:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=VVn+x8vfcYgKiFM9U8HRWo6C8E7IlWsBFrrpJMA/SJk=;
	b=AOIwdB+UcNQENLEYNCH90k98+xYECrD1gEkP1y0olUzGeg2gQr3P8Wtb1aWwGqvULm
	Qj7mSpEBdowQ6buZMkYye7Bl9eyofTb1vXZ+BcW7jNLRvjDXV67Q7jKVXv1Pe1tRsdT3
	YLG+Fli7NZzN9MCm3ZI+sCD+R/ManZK8DW/EnSH1291UBn9iduLKP9uxShXybsYWpT70
	E7gOcJzLCHGlQIsYm4Sh/DlXDq7JX8uIYHOSrE0Ey3o/bs2yfdlHx/R3ftRqUXfVQIHd
	0SbnZhXji23TQqFsnMV7J0Ti9uzA6lLrT6R62PyAL9WOYH+6Meo78YNjPEc9N43U2OBt
	Yfzw==
Received: by 10.14.99.201 with SMTP id x49mr8319880eef.142.1341873843376; Mon,
	09 Jul 2012 15:44:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.210.199 with HTTP; Mon, 9 Jul 2012 15:43:33 -0700 (PDT)
In-Reply-To: <1341871474-8719-1-git-send-email-sgw@linux.intel.com>
References: <1341871474-8719-1-git-send-email-sgw@linux.intel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 9 Jul 2012 15:43:33 -0700
Message-ID: <CAMKF1sowgGneDRp61GaL10-rbsCT7ucUq_ri_GNhm4+--idKww@mail.gmail.com>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] gnupg: ensure deterministic build by disabling libcurl
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
X-List-Received-Date: Mon, 09 Jul 2012 22:55:13 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Jul 9, 2012 at 3:04 PM, Saul Wold <sgw@linux.intel.com> wrote:
> gnupg has it's own fake curl, since we use gnupg with zypper, there does not
> seem to be a strong reason to add curl to the depends list.

what does disabling curl has to do with gnupg being used with zypper ?


