Received: from mail-pb0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Sletu-0006j3-MO
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 13:34:42 +0200
Received: by pbbrq2 with SMTP id rq2so7294209pbb.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2012 04:23:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=aUGnbrKH47zXwoSDGbPYxiEs8P6JxLf6b8PLhHgZY4Y=;
	b=Eqs0oPh3agAM5k5VYdm3weMOtFLrzyr6ZO9oYInfKrdWU2Nrfa8KWaLXwdHYS8dTR/
	izbw6lCw/UvfPmA/W+Hg2BpEZ5cJWo7s0cBt3sD7UPtuc4vmIEIor3IDkTUIN/QSXW8K
	4ApT+rXiWPLwAhJCIHI+Z5SHAebc9jbmxwd+679FpmKT1zBEYjU1swT4Rf7zABkUY48d
	URb6cnp2FC7+lkJ0Iba/6ew27b+VVBHFNnUdu6olrFjWYE8xvklvZ4xK/K4ZIus8vWAw
	1BgxcDySzNW9ldTGTDzZ5/N2IXUcPeTO07waHSZT0L0twhB+8dWy3e6sxEEDWmMN5UT4
	UI+Q==
MIME-Version: 1.0
Received: by 10.68.225.42 with SMTP id rh10mr30124870pbc.116.1341228221166;
	Mon, 02 Jul 2012 04:23:41 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.129.129 with HTTP; Mon, 2 Jul 2012 04:23:41 -0700 (PDT)
In-Reply-To: <1341207885-9463-2-git-send-email-paul.gortmaker@windriver.com>
References: <4FF0C930.4000104@linux.intel.com>
	<1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
	<1341207885-9463-2-git-send-email-paul.gortmaker@windriver.com>
Date: Mon, 2 Jul 2012 08:23:41 -0300
X-Google-Sender-Auth: RuxuhzkMsGqzcfvESzIIIT5r3Zw
Message-ID: <CAP9ODKq55GLnTpQBJa+1PD7E+BkOrB8qxqiPj8n7KswhiV1b_w@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 1/3] u-boot: Don't make the -Os removal part of global settings.
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
X-List-Received-Date: Mon, 02 Jul 2012 11:34:42 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 2, 2012 at 2:44 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> We don't want to force everyone to be stripping the -Os
> flags from their u-boot builds.  Remove it, since it pertains
> to an old toolchain issue that is no longer relevant, and it
> breaks the powerpc mpc8315.
>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


