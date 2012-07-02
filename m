Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1Slevj-0006oG-HR
	for openembedded-core@lists.openembedded.org;
	Mon, 02 Jul 2012 13:36:35 +0200
Received: by dalh21 with SMTP id h21so7134934dal.6
	for <openembedded-core@lists.openembedded.org>;
	Mon, 02 Jul 2012 04:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=0mfzSyjDWdMNJCgAzjl21JXOuqbn3w8+49T2lV8gQqA=;
	b=myJVn7HSjOkes+OwPou90duV0hGO5LC1vCaG5KjitZTHW3Dx0aaBv/k+l8xkoHIJ0F
	RLaPoMkopKP2EfSjH9kPLAU0Z7EegmXJvktbA9cgkeI2ZPgJWWiNkotmKLY1KMMtIOwy
	jlnSxyNfgWkuQd5XdHF6zn5M//bH9P4EO4fNgrat41BMWVETBt/G1NIUOuSnxuaogMih
	fN6YP8ylz2rPxXnfuztB3OMb7qlhbyrrF1vV9F4va6fTuFuY2BTyMBA9fK6bUC5o2DI1
	WDzzl/RI89UzrDl7zMeAC9O0ZhDTyTf/Ozql2X4d6KiL+F+C1Um2/NW27Y264o66s3V0
	4zmQ==
MIME-Version: 1.0
Received: by 10.68.232.232 with SMTP id tr8mr28975267pbc.73.1341228334333;
	Mon, 02 Jul 2012 04:25:34 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.68.129.129 with HTTP; Mon, 2 Jul 2012 04:25:34 -0700 (PDT)
In-Reply-To: <1341207885-9463-4-git-send-email-paul.gortmaker@windriver.com>
References: <4FF0C930.4000104@linux.intel.com>
	<1341207885-9463-1-git-send-email-paul.gortmaker@windriver.com>
	<1341207885-9463-4-git-send-email-paul.gortmaker@windriver.com>
Date: Mon, 2 Jul 2012 08:25:34 -0300
X-Google-Sender-Auth: YlWBCroa2SBZSeFF4sCRHPRT1VI
Message-ID: <CAP9ODKrvnLPo=E7GEwocVa9LwjdFAuycg2U9bVi+3XQzxmhXiw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: [PATCHv2 3/3] u-boot: do not clobber PARALLEL_MAKE setting
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
X-List-Received-Date: Mon, 02 Jul 2012 11:36:35 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Jul 2, 2012 at 2:44 AM, Paul Gortmaker
<paul.gortmaker@windriver.com> wrote:
> The u-boot tree is fully capable of parallel builds, so this
> setting should not exist as a blanket setting for all of the
> recipes.  Going forward, if there is a parallelism issue
> in u-boot, it needs to be reported and fixed there, and not
> with the "make -j1" band-aid approach.
>
> Signed-off-by: Paul Gortmaker <paul.gortmaker@windriver.com>

Acked-by: Otavio Salvador <otavio@ossystems.com.br>

I've been building it with -j12 for long time, it does work :-)

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


