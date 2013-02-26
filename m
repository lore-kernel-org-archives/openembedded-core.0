Received: from mail-oa0-f51.google.com ([209.85.219.51])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1UAAUj-0001rG-UE
	for openembedded-core@lists.openembedded.org;
	Tue, 26 Feb 2013 03:42:19 +0100
Received: by mail-oa0-f51.google.com with SMTP id h2so4376227oag.10
	for <openembedded-core@lists.openembedded.org>;
	Mon, 25 Feb 2013 18:25:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:x-received:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=OusGsvUmRwn6EdzZQLhYrI6DN1CQFEFhbjyC0Fz2d7A=;
	b=FbWo0IhNLYp9egJQJO+KHjJs0BOCacA0+D5wZ4gDY3pf+Y5DIim7JRjPorXo+D+hok
	+Pu1pVwZjw+7wrmCPDVW5RMWhGgVBFFaxGSKZ7dAVzgaF4mwaoj+6PpwkI1HwlVBBy9k
	Srw7sPsfv6aTSWBLpEjkuANUanJ3uMOqTVwLAExYEHsYdF0I74HsEV25QDInu+CKAFJC
	9IiqqE81StQDkBFdhw6DsQ9eGiTnqw8wwiFeXGhzjDUfhUSNMngnur+DEmqsie8+WYtr
	TM07T/Vt+uAiUInUE2r/CkI6x7x3dibdEV80M6IPyfDczRKgxr5Wf/pJcs20XfJElyUL
	g8YA==
MIME-Version: 1.0
X-Received: by 10.60.170.44 with SMTP id aj12mr22381oec.42.1361845558677; Mon,
	25 Feb 2013 18:25:58 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.182.251.165 with HTTP; Mon, 25 Feb 2013 18:25:58 -0800 (PST)
In-Reply-To: <1361839310-1758-1-git-send-email-sgw@linux.intel.com>
References: <1361839310-1758-1-git-send-email-sgw@linux.intel.com>
Date: Mon, 25 Feb 2013 23:25:58 -0300
X-Google-Sender-Auth: K0P8sXc7t_PUZ3V3ktM1kiLAlRY
Message-ID: <CAP9ODKqN1eZhazuLVsW-0gt_wUkVQRYspS_8+Pmt1nMS9jA=LQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Saul Wold <sgw@linux.intel.com>
Cc: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCH] mini-x-session: Fix starting of x-session
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
X-List-Received-Date: Tue, 26 Feb 2013 02:42:20 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 25, 2013 at 9:41 PM, Saul Wold <sgw@linux.intel.com> wrote:
> We need to use sudo semantics since it does not start correctly
> with su.
>
> The test was constructed incorrectly.
>
> Signed-off-by: Saul Wold <sgw@linux.intel.com>

Please add a rdepends on sudo in this case.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


