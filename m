Received: from mail-vb0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1SwwjJ-0002oG-V2
	for openembedded-core@lists.openembedded.org;
	Thu, 02 Aug 2012 16:50:26 +0200
Received: by vbbfr13 with SMTP id fr13so7846835vbb.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 02 Aug 2012 07:38:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:content-type;
	bh=TJ11Bl4lRneMtRIiBmL2hwJ6788ty+Ess69RGVYSBT0=;
	b=RtvBFbQq1Egk+sGy2QKPIkBrMaxTEQNEqpVx9JnJwKzPETBp/vqGv3VstEVpmEfm25
	R7/JOAKIrTH4pWcmWJRcQAwrT5zo4Ik5Rf0mdFjrFiryq65AMX5SKx8H62YP7+aIdcTX
	Clb64dmhjXRPw8I9O/g7OyxiiC64Cznm0s+kfjczIMYlLsB50iQJJRCSjt2IHWIvQMO9
	tKYycdbzFE31wNMc2GCDUpj1bZ61IS5SilWQzcoMouEpQSxkILva8FzjS/kjc1xvnwBb
	QcwKryqIln8/n5jSJY68s9Qo25w5iVZCzcMMpnnkInndQ/KsZnekynH8Tjf/ld9xXi/U
	XdrA==
MIME-Version: 1.0
Received: by 10.220.220.78 with SMTP id hx14mr20204600vcb.23.1343918325822;
	Thu, 02 Aug 2012 07:38:45 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.220.90.203 with HTTP; Thu, 2 Aug 2012 07:38:45 -0700 (PDT)
In-Reply-To: <20120802143705.GT16306@jama.jama.net>
References: <20120801065021.GC15199@jama.jama.net>
	<20120801065401.GD15199@jama.jama.net>
	<8071B2D8-3431-4B9B-A810-0F01D4837779@gmail.com>
	<20120802115012.GO16306@jama.jama.net>
	<C496D1D2-DB12-4B52-9D3A-5BB5E663FBC3@gmail.com>
	<20120802143705.GT16306@jama.jama.net>
Date: Thu, 2 Aug 2012 11:38:45 -0300
X-Google-Sender-Auth: gcqbw70JvKLpT9J39NoN5f1qOtI
Message-ID: <CAP9ODKpi6AYUJjDsO93CaMNV6jk1vjfJWRoS48vUUAobi8oDjw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Patches and discussions about the oe-core layer
	<openembedded-core@lists.openembedded.org>
Subject: Re: u-boot do_compile should be reentrant even with ld-is-gold
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
X-List-Received-Date: Thu, 02 Aug 2012 14:50:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Aug 2, 2012 at 11:37 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> One character change in that regexp fixed all use-cases I can think of,
> so looks like best solution to me..

+1

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


