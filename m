Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TkZjZ-0007fk-TA
	for openembedded-core@lists.openembedded.org;
	Mon, 17 Dec 2012 13:23:51 +0100
Received: by mail-pb0-f47.google.com with SMTP id un1so3464085pbc.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 17 Dec 2012 04:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=5CiuHHmvh6QpQ6xmGQNjWTIkH9OBWJUstEfzicUC9jc=;
	b=ZLQavCRHwpEuAIFAjKr9gHez3m6PCiPhkUY7wrjJ+Q+27ejXB7r9obP/MPfG/eW1LV
	lX3QZtxEU/Zx/TKCa0dDNfeAOLYoonansn5PMpsMTNoDsL/Dqg4S2+IMBvWwaX/z4gmc
	AZetoTrLciiXZQfxX3Mfu3D4iCq9EqyNv5mwbUTTjoboNruArE/hYB+auX2KlPry+KUd
	mwWn62Dwj9dpgl+INB+bDstUITDBAHynU8AlFGSdYfIEiNvRTNwGT0dhNAEqxiaM5QAC
	WHHE7LlmWTVd1SqAzDUgNAIlt+Plp+UBahAgUgAHTWxcqJVsGDxs7Yj6uYSA/6kkPOyO
	DWXQ==
MIME-Version: 1.0
Received: by 10.68.189.8 with SMTP id ge8mr43679073pbc.24.1355746148372; Mon,
	17 Dec 2012 04:09:08 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.51.193 with HTTP; Mon, 17 Dec 2012 04:09:08 -0800 (PST)
In-Reply-To: <1355743753-12947-1-git-send-email-alexandru.damian@intel.com>
References: <1355743753-12947-1-git-send-email-alexandru.damian@intel.com>
Date: Mon, 17 Dec 2012 10:09:08 -0200
X-Google-Sender-Auth: 8hE_Sp3vJuBwL7Yjxk6L4Uwp_dM
Message-ID: <CAP9ODKpP9z+SfHdLP3StfgNEwrn_uNJw54YZxpNEj06GUphbKQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Alex DAMIAN <alexandru.damian@intel.com>
Cc: Darren Hart <dvhart@linux.intel.com>, damien.lespiau@intel.com,
	Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] init-live: default to initrd shell if image isn't found
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
X-List-Received-Date: Mon, 17 Dec 2012 12:23:51 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Dec 17, 2012 at 9:29 AM, Alex DAMIAN <alexandru.damian@intel.com> wrote:
> From: Alexandru DAMIAN <alexandru.damian@intel.com>
>
> If the init live fails to find and mount a root-fs image,
> we should dump to a shell so that the developer can figure
> what's wrong.
>
> Prior art in Ubuntu. Also, leaving a system stale isn't good form.
>
> Signed-off-by: Alexandru DAMIAN <alexandru.damian@intel.com>

I don't like to get a shell at users as he might be an end user and
don't know what to do so I'd prefer to have a proper error message and
support the shell as fallback depending on a boot param or so (so it
can be used during development).

Another issue is the amount of time waiting ... I have hardware that
takes up to 8s to be ready so 3s is too short and the amount of time.
The time to wait should be configurable by bootparam too (and
documented in commitlog).

Regards,

--
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


