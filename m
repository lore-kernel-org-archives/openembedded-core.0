Received: from mail-pa0-f47.google.com ([209.85.220.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TPuyd-0000HU-4A
	for openembedded-core@lists.openembedded.org;
	Sun, 21 Oct 2012 14:49:59 +0200
Received: by mail-pa0-f47.google.com with SMTP id fa11so1148673pad.6
	for <openembedded-core@lists.openembedded.org>;
	Sun, 21 Oct 2012 05:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=zbPhjyW+RLhWzDQpLSo+rGD9CtMMMfAS29j/dA2ZMb0=;
	b=G+4wneNG88j26Va0e+ZT7BURpwwNs1M1s7GSvhXsJIbQsJmys20h9V7Br9F3xsZHZ2
	mrKSxdqPmOqYmr3VpDOIAnMnggJNJkPGLrdb9bf938vODCdlDeLdRYlVf4m0bX9vt7Ax
	dAiXNHNnxVHSuzTmggd5Z5vQWHyflGYvUy+p6mIUScq1DkWwrxyxDarxPOFBniesT5Xw
	74lo6YkKZhDIV48/q+Qrl3MpE2XBZ3vLGY31Yx7MrjzMiYker62ct0Qup8k3tD9IuPR1
	EjGF+ZhGG2Mwj9k52qPLNABIMyWkP0Rgc8OD9aVU06F4jvQJTBL9n4/izdS0Ph1kIFs/
	6mLw==
MIME-Version: 1.0
Received: by 10.66.78.198 with SMTP id d6mr18279081pax.61.1350822994835; Sun,
	21 Oct 2012 05:36:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.40.201 with HTTP; Sun, 21 Oct 2012 05:36:34 -0700 (PDT)
In-Reply-To: <dce705cf201278411e230dd004688af5f3a8e7f1.1350769062.git.andrei@gherzan.ro>
References: <cover.1350769062.git.andrei@gherzan.ro>
	<4cebbf1aaeda065954bf8cb6989254f7cce85b7d.1350769062.git.andrei@gherzan.ro>
	<dce705cf201278411e230dd004688af5f3a8e7f1.1350769062.git.andrei@gherzan.ro>
Date: Sun, 21 Oct 2012 10:36:34 -0200
X-Google-Sender-Auth: ohbJu-hRyIwQ4reUafXAo_Pt44o
Message-ID: <CAP9ODKrvab5mUVtsACZSGfzcDx_Qz-F+KnYTAF1B16Zb0MLZ5A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Andrei Gherzan <andrei@gherzan.ro>
Cc: openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 4/4] rootfs_ipk.bbclass: Don't duplicate remove_packaging_data_files code
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
X-List-Received-Date: Sun, 21 Oct 2012 12:49:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sat, Oct 20, 2012 at 6:44 PM, Andrei Gherzan <andrei@gherzan.ro> wrote:
> While removing packaging data files in rootfs_ipk_do_rootfs use the
> remove_packaging_data_files function. By using this function we ensure
> that /var/lib/opkg directory is created. opkg needs this directory to
> create lock files.
> Some extra spaces / tabs were removed / formated.
>
> Signed-off-by: Andrei Gherzan <andrei@gherzan.ro>

I'd prefer if you could split the formating changes to another patch.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


