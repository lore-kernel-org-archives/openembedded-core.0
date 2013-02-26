Received: from mail-oa0-f43.google.com ([209.85.219.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UAO4i-0000Yw-KV
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 18:12:21 +0100
Received: by mail-oa0-f43.google.com with SMTP id l10so5640127oag.16
	for <openembedded-core@lists.openembedded.org>;
	Tue, 26 Feb 2013 08:56:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=xOtVbiaZN7mK5GcHbyNwWsDEfbKzMcBVlwNuRrHoPi8=;
	b=tegAsqBgq4vkBK+f9hO343JbY4Oayo5GAHfi/79lcliv8hhOOu+lOhRawJ01x2XjTw
	Y2CRfvibbs3KB1zSbumi4cT0vI7i8WnKg0RbgMm5tE6yHgGsKJVJV1cS7yzshLrmadGr
	dyicZW/SPh5xBNWWscid1+2URQPgaN7wRdmjPxTpIHdJqrA3hoNlfFDWLyJWZOJL6Y5Q
	NI/yW1q6oKKpSCnVmdldAs5860n8Unl0OFuhJkCDSz6Ox0/XXhlzPhkV3ChZWlfR3QLX
	tSO/mIalE3L01mZ/0htsEICirmV+IDQUIiJNl1dKuCrBoBjGaZmVyWRMUWTaXgrTSUcx
	TvkQ==
MIME-Version: 1.0
X-Received: by 10.60.8.40 with SMTP id o8mr2067671oea.112.1361897760731; Tue,
	26 Feb 2013 08:56:00 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.251.165 with HTTP; Tue, 26 Feb 2013 08:56:00 -0800 (PST)
In-Reply-To: <1361891080-5035-1-git-send-email-constantinx.musca@intel.com>
References: <1361891080-5035-1-git-send-email-constantinx.musca@intel.com>
Date: Tue, 26 Feb 2013 13:56:00 -0300
X-Google-Sender-Auth: 3KrUBC0HVQU_LQs95ZEZK80D3qY
Message-ID: <CAP9ODKqfv-8=MG=ffQQG_DSTxj9=059Z_W4mPznQiwsKKaYM-w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Constantin Musca <constantinx.musca@intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH v2] log_srcrev.bbclass: add a bbclass for logging SRCREVs
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
X-List-Received-Date: Tue, 26 Feb 2013 17:12:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 26, 2013 at 12:04 PM, Constantin Musca
<constantinx.musca@intel.com> wrote:
> - add a task which creates a file for each package with the following
> format:
>
> ${BB_FILENAME},${SRC_URI},${SRCREV},${FROM_AUTOREV}
>
> [YOCTO #3041]
>
> Signed-off-by: Constantin Musca <constantinx.musca@intel.com>

What is the use-case for this?

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


