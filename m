Received: from mail-da0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1TbUO4-0001AW-4T
	for openembedded-core@lists.openembedded.org;
	Thu, 22 Nov 2012 11:52:04 +0100
Received: by mail-da0-f47.google.com with SMTP id s35so337339dak.6
	for <openembedded-core@lists.openembedded.org>;
	Thu, 22 Nov 2012 02:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=OuJQgRVfKAJW6FAmhehTWoZVH7bGyR8afZETIdGe7Fc=;
	b=nvf4hEo0DmCfuoQkcDXo8y0DzC8fi0gq7JQH76klqv9yRGnfIjUz7ESfsfoSAi0YJr
	J5O80pmdwlv1KBSrxkHCBYWTu5fTVA5Nxl5Af2mmOe4Xyo6HbJzFyb/2uKoPJVUzX1NK
	jgdC94tvfHo3BX26aqgEkAols9F3nAcnqiImxKKQ8+OlnAvwHtx6G/HqA3PUUDQUTdyN
	ElaggSZfo4sFrCBijq6KrId1Rtq8HeJsHSXJCJR5HDj19Hq5WvSgJmRSuzoGALyX8QjM
	s/qqWCmm2RowlO01zrpnAG2tafR4qFj/IzUoZGPEtUBCrxVORMRPA13PKIjG/QeQRIzx
	Punw==
MIME-Version: 1.0
Received: by 10.68.132.196 with SMTP id ow4mr3738289pbb.49.1353580677368; Thu,
	22 Nov 2012 02:37:57 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.68.16.225 with HTTP; Thu, 22 Nov 2012 02:37:57 -0800 (PST)
In-Reply-To: <109a6ebf14ab5d312954f371eaf3bbfbcb6fb2d0.1353553774.git.kai.kang@windriver.com>
References: <cover.1353553772.git.kai.kang@windriver.com>
	<109a6ebf14ab5d312954f371eaf3bbfbcb6fb2d0.1353553774.git.kai.kang@windriver.com>
Date: Thu, 22 Nov 2012 08:37:57 -0200
X-Google-Sender-Auth: 1cKT6OGZrdqstI28x8vobtgt2iU
Message-ID: <CAP9ODKpd5BQDEn8tigirfCkA0ejfW6-Sd4HdWnwDe8Vrj5s4nQ@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Kang Kai <kai.kang@windriver.com>
Cc: Zhenfeng.Zhao@windriver.com, openembedded-core@lists.openembedded.org
Subject: Re: [PATCH 3/3] lsb: move links from lsbsetup to here
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
X-List-Received-Date: Thu, 22 Nov 2012 10:52:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Thu, Nov 22, 2012 at 1:25 AM, Kang Kai <kai.kang@windriver.com> wrote:
> Because package lsbsetup is dropped, move the links created for LSB test
> to package lsb.
>
> Signed-off-by: Kang Kai <kai.kang@windriver.com>

This ought to be done before of dropping lsbsetup too.

-- 
Otavio Salvador                             O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854              http://projetos.ossystems.com.br


