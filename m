Return-Path: <otavio.salvador@gmail.com>
Received: from mail-oa0-f53.google.com (mail-oa0-f53.google.com
	[209.85.219.53])
	by mail.openembedded.org (Postfix) with ESMTP id 6BA1E6BE92
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 22:16:09 +0000 (UTC)
Received: by mail-oa0-f53.google.com with SMTP id k18so1439132oag.12
	for <openembedded-core@lists.openembedded.org>;
	Thu, 29 Aug 2013 15:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=2QBrY3ZD2oyCMqz8EMjhC10RQ6fGuFCkWzCUEUzHxj8=;
	b=KvgWsf4L4lCxklHEs3b85psX2lQJsZOFFCVlDIUmC3E4g1v+RDL3+z27VrJKVJUaMz
	McRyHD9UIJ21UQOaDLv5fMolZxgaogxN2LILY18HY72XWeFRFxQON+5iByWC+HvdWl+0
	Rm90//LpXCTxjxUADZArg6v5lkiMVohMKVplG4IG+859XFCELqqEECrxEmyA1m4nHyk6
	jMfqG1tQDYduccqJH/RtJLEffJACOvINzkAxkbG4Zif5Om0eqZAtVCGoG3i0igN/i0L2
	abriv7D51yFwaFwObq6cTfwa4x8vXrr4KIr4jY0Ls0a92DTy+ehwMzCuKQSxdELrKzVB
	2dZw==
MIME-Version: 1.0
X-Received: by 10.182.104.130 with SMTP id ge2mr4338099obb.6.1377814569548;
	Thu, 29 Aug 2013 15:16:09 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.232.166 with HTTP; Thu, 29 Aug 2013 15:16:09 -0700 (PDT)
In-Reply-To: <dbccbe87863a44d42568745cb82923ef2e1afaca.1377782855.git.tom.zanussi@linux.intel.com>
References: <cover.1377782855.git.tom.zanussi@linux.intel.com>
	<adf271c181c7618690d25cd694af75e8183575ed.1377782855.git.tom.zanussi@linux.intel.com>
	<dbccbe87863a44d42568745cb82923ef2e1afaca.1377782855.git.tom.zanussi@linux.intel.com>
Date: Thu, 29 Aug 2013 19:16:09 -0300
X-Google-Sender-Auth: 94r74lvhYEwcRkB6kokPsj5l9vE
Message-ID: <CAP9ODKqHx3tTeEfZx0ZN-_ujkZf43Vq+xFiwaJNKFf-Ugt7bEA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Tom Zanussi <tom.zanussi@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH 2/2] lttng-ust: Update to version 2.2.1
X-BeenThere: openembedded-core@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Patches and discussions about the oe-core layer
	<openembedded-core.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-core/>
List-Post: <mailto:openembedded-core@lists.openembedded.org>
List-Help: <mailto:openembedded-core-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-core>,
	<mailto:openembedded-core-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Aug 2013 22:16:09 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 29, 2013 at 10:37 AM, Tom Zanussi
<tom.zanussi@linux.intel.com> wrote:
> Update lttng-ust to version 2.2.1 to correspond to the LTTng 2.2
> "Cuda" - Tracer toolchain stable release.
>
> This also removes all the local lttng-ust patches, which are now
> upstream.
>
> Signed-off-by: Tom Zanussi <tom.zanussi@linux.intel.com>

I fully agree with the patch; I didn't try them tough.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

